# Changelog — company-os

## [1.3.0] — 2026-04-10

### Added
- **`.env.example`** — canonical credential template covering all 17 credentials across all agents. Organized by category (GitHub, X/Twitter, Web Search, Social Research, Solo Founder finance/content/product). Each entry has a tier label (CORE / RECOMMENDED / OPTIONAL) and inline comment explaining where to get it.
- **`credentials/README.md`** — full credential guide: credential map table, tier definitions, step-by-step setup guide per credential with exact scope requirements, per-agent breakdown, security practices (minimum scopes, rotation schedule, breach response).
- **`credentials/check.sh`** — preflight validation script. Loads `.env`, checks every credential, reports what's configured (✓), what's missing but recommended (⚠), what's missing but optional (○), and what's missing and required (✗). Supports `--agent [name]` filter and `--json` machine-readable output. Exits with code 1 if any CORE credential is missing.
- **`.gitignore`** — excludes `.env`, `.env.local`, OS artifacts, editor files. Prevents accidental credential commits.

### Changed
- **`.paperclip.yaml`** — added formal `inputs.env` blocks to `research-analyst`, `release-engineer`, and `solo-founder` agents. Every credential is now declared with `kind` (secret/value), `requirement` (core/recommended/optional), and a `docs` pointer to the relevant section of `credentials/README.md`.

### Design Decisions
- **`.env.example` as the single source of truth.** One file to copy, one file to fill in. No credential is described only in a skill doc buried 3 levels deep.
- **Three tiers, not just required/optional.** CORE (agent won't function), RECOMMENDED (works but degraded), OPTIONAL (specific integrations). Founders setting up for the first time know exactly where to start.
- **`check.sh` over docs alone.** Static docs go stale. A script that reads your actual `.env` and reports live status doesn't. First-time setup + ongoing rotation both use the same tool.
- **X/Twitter via any of three methods.** Not everyone has an xAI API key. `check.sh` recognizes `XAI_API_KEY`, `FROM_BROWSER=auto`, or `X_AUTH_TOKEN+X_CT0` — whichever is set, it passes.
- **Minimum scopes documented per credential.** Security principle of least privilege built into the setup guide, not left as an afterthought.

---

## [1.2.0] — 2026-04-10

### Added
- **16 solo-founder skills** — complete 0-to-18-month founder skill stack organized in 3 tiers:
  - **Tier 1 (Month 1-3, Critical):** `user-interview`, `pmf-pulse`, `pitch-deck`, `investor-update`, `runway`
  - **Tier 2 (Month 3-9, Growth):** `launch-strategy`, `sales-playbook`, `pricing-strategy`, `growth-experiment`, `legal-basics`
  - **Tier 3 (Month 6-18, Scale):** `cap-table`, `first-hire`, `content-machine`, `demo-script`, `decision-journal`, `founder-rhythm`
- **`solo-founder` agent** — new `claude-opus-4.6` agent in `.paperclip.yaml`. The founder's co-pilot: customer discovery, PMF measurement, fundraising, financial modeling, legal scaffolding, hiring, growth, and weekly/monthly operating cadence. Owns all 16 solo-founder skills plus cross-functional skills (`write-brief`, `brainstorming`, `frame-problem`, `synthesize-research`, `x-research`, `last30days-nux`).
- **`skills/` directory** — 16 subdirectories each with `SKILL.md` defining full workflows, output formats, and chains-with references.
- **Solo Founder routing in `CLAUDE.md`** — 20 new trigger patterns across 3 routing groups (Customer Discovery & PMF, Fundraising & Finance, Team & Scale).

### Changed
- **`SKILLS.md`** — Added sections XII (Tier 1, 5 skills), XIII (Tier 2, 5 skills), XIV (Tier 3, 6 skills). Total: 57 → 73 skills.
- **`AGENTS.md`** — Added `solo-founder` to agent roster, 16 new entries in skill-to-agent matrix, and two new coordination protocols (Solo Founder Weekly Cadence, 0-to-1 Discovery Flow).
- **`README.md`** — Updated skill count (57 → 73), agent count (11 → 12), added solo-founder to team org chart, added 3 new skill sections, updated repo structure to show `skills/` directory.
- **`.paperclip.yaml`** — Added `solo-founder` agent block with `skills_path: ./skills` pointing to the local skills directory.

### Design Decisions
- **Tier structure** mirrors startup chronology, not priority. Founders don't need a cap table on day 1 — they need PMF signal. Skills are tiered so the operator knows where to start.
- **opus-4.6 for solo-founder** — same as `chief-of-staff` and `cto`. Business-building decisions (hire vs. not, raise vs. not, pivot vs. persist) carry irreversible consequences. Opus-class reasoning is warranted.
- **`skills_path: ./skills`** — local skills directory enables customization per fork. Teams can add domain-specific variants without touching the gstack installation.
- **Cross-functional skills included** — `write-brief`, `brainstorming`, `x-research` are re-used from other agents. Solo founders don't have specialists — they need the full surface.

---

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
