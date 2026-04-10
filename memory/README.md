# Memory Layer — company-os

The memory layer ensures agents accumulate knowledge across sessions rather than starting fresh every time. Three persistence mechanisms work together.

---

## 1. MEMORY.md — Auto-loaded System Context

**Path:** `~/.claude/projects/[project-slug]/memory/MEMORY.md`

**What it is:** A markdown file that Claude Code auto-injects into every session's system prompt. Think of it as the agent's "always-on" working memory.

**What to store:**
- Stable project patterns and conventions confirmed across multiple sessions
- Key architectural decisions and important file paths
- User workflow preferences (tools, communication style, shortcuts)
- Solutions to recurring problems

**What NOT to store:**
- Session-specific context (current task, in-progress state)
- Information that might be incomplete or unverified
- Anything that duplicates CLAUDE.md instructions
- Speculative conclusions from reading a single file

**Size limit:** Lines after 200 are truncated. Keep entries concise. Link to detail files.

**How to update:** The agent writes directly to this file using Edit/Write tools when it notices a pattern worth preserving.

**Example entry:**
```markdown
## Project Patterns
- API routes live in src/routes/, models in src/models/
- All DB migrations require /careful guard before running
- User prefers squash-merge via /ship for all PRs
```

---

## 2. learnings.jsonl — Operational Learning Log

**Path:** `~/.gstack/projects/[slug]/learnings.jsonl`

**What it is:** A JSONL file where gstack agents log non-obvious operational discoveries. Each line is a JSON object.

**Schema:**
```json
{
  "skill": "ship",
  "type": "operational",
  "key": "ci-timeout-workaround",
  "insight": "CI takes 8+ minutes on this repo — land-and-deploy needs --timeout 600000",
  "confidence": 8,
  "source": "observed",
  "files": ["package.json", ".github/workflows/ci.yml"],
  "ts": "2026-04-10T12:00:00Z"
}
```

**Types:** `pattern` | `pitfall` | `preference` | `architecture` | `tool` | `operational`

**Confidence:** 1-10. Observed in code = 8-9. User-stated = 10. Inferred = 4-6.

**The `/learn` skill manages this:** search, prune stale entries, export.

**How agents use it:** On session start (via gstack preamble), the agent runs `gstack-learnings-search --limit 3` to load the 3 most relevant learnings into context.

---

## 3. Checkpoint Files — Session State

**Path:** `~/.gstack/projects/[slug]/checkpoints/[date]-[description].md`

**What it is:** Mid-session state snapshots created by the `/checkpoint` skill. Captures:
- Current git branch and commit
- Decisions made in this session
- Remaining work (checklist)
- Context that would be lost on reset

**When to use `/checkpoint`:**
- Before a long implementation that may hit context limits
- After a major decision, before the next phase
- When switching between branches or tasks
- End of day — resume tomorrow without re-explaining context

**Example checkpoint:**
```markdown
---
date: 2026-04-10
branch: feature/worker-earnings-animation
session: abc123
---

## What We Decided
- Using CSS counter-based animation (not JS) for earnings ticker
- JetBrains Mono confirmed for all monetary values

## What's Done
- [x] Dashboard HTML updated with earnings counter
- [x] Animation CSS written
- [ ] Mobile viewport test at 375px
- [ ] QA on task submission → counter tick

## Context to Restore
Working on worker dashboard earnings display. DESIGN.md is the source of truth.
The earnings counter should animate from previous value to new value on task completion.
```

---

## 4. claude-mem — Compressed Tool Output History

**Path:** `~/.claude-mem/claude-mem.db` (SQLite with FTS5 search)

**What it is:** A Claude Code plugin that captures tool outputs (read_file, bash commands, etc.), compresses them to ~50-token semantic observations, and injects the most relevant ones into future sessions. ~10x more token-efficient than repeating raw tool output.

**Installed at:** `~/.claude/plugins/cache/thedotmack/claude-mem/10.0.6/`

**Start the worker (required):**
```bash
node ~/.claude/plugins/cache/thedotmack/claude-mem/10.0.6/scripts/worker-cli.js start
```

**Wire into Paperclip heartbeat (Step 2 of each agent's checklist):**
```bash
node ~/.claude/plugins/cache/thedotmack/claude-mem/10.0.6/scripts/context-generator.cjs \
  --project-path "$(pwd)" \
  --query "[agent-name] [current-task-keyword]"
```

**Token budget in `.paperclip.yaml`:**
```yaml
memory:
  claude_mem: true
  max_context_tokens: 500
  inject_on_heartbeat: true
```

**Full setup guide:** `memory/claude-mem-setup.md`

---

## 5. Auto Dream — Nightly MEMORY.md Consolidation

**Path:** `memory/auto-dream.sh`

**What it is:** A nightly script that searches `learnings.jsonl` for high-confidence entries (≥8/10) and promotes them to `MEMORY.md`, keeping the file under the 200-line limit. Named after REM sleep memory consolidation.

**Run manually:**
```bash
./memory/auto-dream.sh --dry-run   # preview changes
./memory/auto-dream.sh             # run consolidation
```

**Wire to cron (nightly at 2am):**
```bash
(crontab -l 2>/dev/null; echo "0 2 * * * /path/to/company-os/memory/auto-dream.sh") | crontab -
```

**What it does:**
1. Reads all learnings from `learnings.jsonl`
2. Groups by type: patterns, pitfalls, architecture, operational
3. Appends high-confidence entries (≥8/10) to `MEMORY.md`
4. Enforces 190-line soft limit (with buffer before 200-line truncation)
5. Removes promoted entries from `learnings.jsonl` to avoid duplication
6. Logs each dream session to `memory/dream-log.jsonl`

---

## 6. Research Briefings — Last30Days Archive

**Path:** `~/Documents/Last30Days/[topic]-raw-v3.md`

**What it is:** Raw + synthesized research from `/last30days-nux` runs. Persisted for future sessions.

**When agents use it:** Research Analyst reads previous briefings before starting new research to avoid duplication and build on prior findings.

---

## Memory Hierarchy

```
Always active (every session):
  MEMORY.md                   ← 200-line system prompt injection

On gstack skill start:
  learnings.jsonl             ← top 3 relevant learnings searched

On Paperclip heartbeat:
  claude-mem DB               ← ~500 tokens of compressed tool output history
                                 (context-generator.cjs via FTS5 search)

On explicit resume:
  checkpoint/*.md             ← full session state from /checkpoint

Nightly (cron):
  auto-dream.sh               ← promotes high-confidence learnings to MEMORY.md

On research tasks:
  ~/Documents/Last30Days/     ← prior research briefings
```

## Token Efficiency by Layer

| Layer | What It Stores | Token Cost |
|-------|---------------|-----------|
| MEMORY.md | Stable patterns, project conventions | ~1,500 tokens (200 lines) |
| learnings.jsonl (top 3) | Session-relevant operational patterns | ~300 tokens |
| claude-mem (heartbeat) | Compressed tool output history | ~500 tokens (vs 5K-10K raw) |
| checkpoint | Full session state | 2K-5K tokens (explicit use only) |

**Total heartbeat overhead:** ~2,300 tokens vs 10K+ without the memory layer.
**Reduction: ~77%** compared to baseline Paperclip without memory optimization.

---

## How to Populate Memory for a New Project

```bash
# 1. Create memory file
mkdir -p ~/.claude/projects/[slug]/memory/
touch ~/.claude/projects/[slug]/memory/MEMORY.md

# 2. Add initial project context
cat >> ~/.claude/projects/[slug]/memory/MEMORY.md << 'EOF'
## Project: [Name]
- Tech stack: [stack]
- Key paths: src/[main dirs]
- Deploy: [platform + command]
- Test command: [command]
- Key constraints: [any special rules]
EOF

# 3. First session: run /checkpoint after orienting
# This creates a learnings baseline for future sessions
```
