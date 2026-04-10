# claude-mem Integration — company-os

claude-mem is a Claude Code plugin that captures tool outputs, compresses them into
~500-token semantic observations, and injects relevant context back into future sessions.

For company-os, it's the **tool output compression layer** — solving the token explosion
that happens when Paperclip agents include full `read_file`, `ls -R`, or shell command
outputs in every heartbeat.

**Repository:** thedotmack/claude-mem (21.5K stars)
**Installed at:** `~/.claude/plugins/cache/thedotmack/claude-mem/10.0.6/`
**Storage:** `~/.claude-mem/claude-mem.db` (SQLite with FTS5 search)

---

## How It Works

```
Session starts
  └── context-generator.cjs runs
        └── Searches DB for observations relevant to current session
              └── Injects <claude-mem-context> block into system prompt
                    (~500 tokens vs 5K-10K raw tool outputs)

Session runs
  └── Agent uses tools (read_file, shell commands, etc.)
        └── Outputs captured as "observations"
              └── Each observation compressed to ~50-token summary

Session ends
  └── worker-service.cjs processes queue
        └── Observations stored in SQLite
              └── Available for future sessions via FTS5 search
```

**Token efficiency:** ~10x reduction vs manual context management.
Progressive disclosure: only observations relevant to the current session are injected.

---

## Setup for Paperclip Agents

### Step 1 — Verify Installation

```bash
ls ~/.claude/plugins/cache/thedotmack/claude-mem/
# Should show version folder e.g. 10.0.6

# Check if worker service is running
node ~/.claude/plugins/cache/thedotmack/claude-mem/10.0.6/scripts/worker-cli.js status
```

### Step 2 — Start the Worker Service

The worker service must be running to capture and compress observations.

```bash
# Start the worker (runs in background)
node ~/.claude/plugins/cache/thedotmack/claude-mem/10.0.6/scripts/worker-cli.js start

# Verify it's running
node ~/.claude/plugins/cache/thedotmack/claude-mem/10.0.6/scripts/worker-cli.js status
```

Add to your shell startup (`~/.zshrc` or `~/.bashrc`) for auto-start:

```bash
# Auto-start claude-mem worker on shell init
CLAUDE_MEM_CLI="$HOME/.claude/plugins/cache/thedotmack/claude-mem/10.0.6/scripts/worker-cli.js"
if [ -f "$CLAUDE_MEM_CLI" ]; then
  node "$CLAUDE_MEM_CLI" start --silent 2>/dev/null &
fi
```

### Step 3 — Wire into Paperclip Heartbeat

For each Paperclip agent, add a memory-check step to the heartbeat that uses
the context-generator to pull relevant observations:

```bash
# Add this to each agent's Step 2 (Load Current Context):
node ~/.claude/plugins/cache/thedotmack/claude-mem/10.0.6/scripts/context-generator.cjs \
  --project-path "$(pwd)" \
  --query "[agent-name] [current-task-keyword]"
```

This outputs a `<claude-mem-context>` block with the most relevant prior observations.
Paste this into the agent's context before executing the task.

### Step 4 — Configure Token Budget

In `.paperclip.yaml`, set a memory budget per agent to prevent context bloat:

```yaml
agents:
  chief-of-staff:
    memory:
      claude_mem: true
      max_context_tokens: 500    # claude-mem context block ceiling
      inject_on_heartbeat: true

  backend-engineer:
    memory:
      claude_mem: true
      max_context_tokens: 800    # Engineers benefit from more code context
      inject_on_heartbeat: true
```

---

## What claude-mem Captures

claude-mem captures and compresses:
- Tool outputs from `read_file`, `write_file`, `bash` commands
- Error messages and their resolutions
- File structure snapshots (from `ls`, `find` commands)
- Build and test outputs
- API responses

**What it does NOT capture:**
- Secrets, API keys, or credentials
- Content explicitly marked as sensitive
- Raw file contents (only compressed summaries)

---

## Integration with gstack Memory Layer

claude-mem works alongside, not instead of, gstack's native memory:

```
MEMORY.md          ← stable patterns (auto-loaded, 200 line limit)
learnings.jsonl    ← operational insights (searched, not injected)
claude-mem DB      ← compressed tool output history (FTS5 searched, ~500 tokens injected)
checkpoint files   ← full session state snapshots
```

**Rule of thumb:**
- **MEMORY.md** = what your project is and how it works (stable, curated)
- **learnings.jsonl** = what you discovered operationally (searchable, auto-pruned)
- **claude-mem DB** = what tools told you in prior sessions (compressed, auto-relevant)
- **checkpoint** = where you left off (full state, explicit save)

---

## Viewing claude-mem History

```bash
# Open the visual viewer
open ~/.claude/plugins/cache/thedotmack/claude-mem/10.0.6/ui/viewer.html

# Or query the DB directly
node ~/.claude/plugins/cache/thedotmack/claude-mem/10.0.6/scripts/worker-cli.js search "keyword"
```

---

## Paperclip Issue #1183 Alignment

This setup directly addresses Paperclip's open issue #1183 ("context window management
and token optimization, inspired by OpenClaw") by implementing:

| Issue #1183 Proposal | This Implementation |
|---------------------|---------------------|
| Instruction Caching | MEMORY.md + heartbeat.md (read once per session) |
| Tool Output Truncation | claude-mem compression (~500 tokens vs 5K-10K) |
| Rolling Context Window | claude-mem progressive disclosure |
| Metadata Stripping | learnings.jsonl (only relevant 3 entries injected) |

Combined token reduction per heartbeat: ~70-80% vs baseline Paperclip runtime.

---

## Troubleshooting

**Worker not starting:**
```bash
# Check if port conflict
node ~/.claude/plugins/cache/thedotmack/claude-mem/10.0.6/scripts/worker-cli.js restart
```

**No context being injected:**
```bash
# Check if DB has any observations
node ~/.claude/plugins/cache/thedotmack/claude-mem/10.0.6/scripts/worker-cli.js status
# Run a session first — DB populates as Claude Code is used
```

**Context too large (>500 tokens):**
- Increase specificity in the `--query` flag to narrow relevant observations
- Or lower `max_context_tokens` in `.paperclip.yaml`
