# Changelog — company-os

## [1.1.0] — 2026-04-10

### Added
- **`memory/heartbeat.md`** — The Polaroid template. Every Paperclip agent re-reads this at each heartbeat to recover identity and context. Includes 6-step checklist (Identity → Context → Assignments → Execute → Store → Report) and per-agent customizations for all 11 agents. Solves the "Memento Man" problem of agents waking up fresh with zero memory each cycle.
- **`memory/claude-mem-setup.md`** — Integration guide for `thedotmack/claude-mem` (21.5K stars) with Paperclip agents. Covers: worker service setup, heartbeat wiring, `.paperclip.yaml` memory config, auto-start snippet for `~/.zshrc`, and alignment with Paperclip issue #1183 (context window optimization). ~10x token efficiency vs raw tool output.
- **`memory/auto-dream.sh`** — Nightly MEMORY.md consolidation script. Reads `learnings.jsonl`, promotes high-confidence entries (≥8/10) to `MEMORY.md`, enforces 190-line soft limit, prunes promoted entries from `learnings.jsonl`, and logs each dream session. Wires to cron. Named after REM sleep memory consolidation.
- **Memory config in `.paperclip.yaml`** — All 11 agents now have a `memory:` block with `claude_mem: true`, `max_context_tokens` (400-800 by role), and `inject_on_heartbeat: true`.

### Changed
- **`memory/README.md`** — Expanded from 3-tier to 5-tier memory system documentation. Added: claude-mem (Tier 4), auto-dream (Tier 5), token efficiency table (~2,300 tokens total heartbeat overhead, ~77% reduction vs baseline), and updated memory hierarchy diagram.
- **`README.md`** — Added Memory Layer section with all 5 tiers, token budget table, and updated repo structure to show new `memory/` files.
- **`.paperclip.yaml`** — Added `memory:` config block to all 11 agents with role-appropriate token budgets.

### Background
This release addresses Paperclip issue #1183 ("context window management and token optimization") by implementing: instruction caching (heartbeat.md), tool output truncation (claude-mem), rolling context window (claude-mem progressive disclosure), and metadata stripping (auto-dream pruning). Combined token reduction: ~70-80% per heartbeat vs baseline.

---

## [1.0.0] — 2026-04-10

### Added
- **11 agent definitions** across 3 teams (Product, Engineering, Creative):
  chief-of-staff, product-manager, research-analyst, cto, frontend-engineer,
  backend-engineer, release-engineer, qa-engineer, design-consultant,
  security-officer, content-writer
- **`.paperclip.yaml`** — complete Paperclip company config with all agents, models, skills, and team structure
- **`SKILLS.md`** — complete catalog of 57 installed skills across 11 categories
- **`AGENTS.md`** — agent roster, skill-to-agent matrix, coordination protocols, budget defaults, memory integration
- **`CLAUDE.md`** — gstack skill routing (40+ routes covering all skill categories)
- **`COMPANY.md`** — product overview, stack explanation, org chart, getting started guide
- **`memory/README.md`** — full documentation of the 3-layer memory system (MEMORY.md, learnings.jsonl, checkpoints)
- **Team READMEs** — workflows, standards, cadences for product, engineering, and creative teams
- Paperclip + gstack stack explanation in COMPANY.md
- Human-in-the-loop gate documentation in AGENTS.md
- Per-agent budget config documentation
