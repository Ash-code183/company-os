# company-os

> A generic, forkable AI company operating system.
> Built on [Paperclip](https://github.com/paperclipai/paperclip) (multi-agent orchestration) + [gstack](https://github.com/garrytan/gstack) (per-agent skill depth) + a 3-layer memory system.

Fork this. Replace the mission. Customize agent context for your domain. Ship.

---

## What This Is

company-os gives you a fully-staffed AI company for any project — 12 specialized agents, 73 skills, coordinated by Paperclip, sharpened by gstack, and learning from every session through a persistent memory layer.

It's not a chatbot setup. It's an operating system for building products with AI.

```
Paperclip          ← coordinates the fleet (dashboard, inbox, budgets, audit trail)
  └── gstack       ← sharpens each agent (23 core + 34 extended skills)
       └── memory  ← persists learning across sessions (MEMORY.md + learnings.jsonl)
```

---

## The Stack

| Layer | What It Does | Why It Matters |
|-------|-------------|----------------|
| **Paperclip** | Parallel agent execution, mission control dashboard, human inbox, per-agent budget controls, full audit trail | Agents coordinate without stepping on each other. You see everything. |
| **gstack** | 73 skills — slash commands that make each Claude Code session operate like a specialized professional | `/ship` doesn't just git push. It merges base, runs tests, reviews diff, bumps VERSION, writes CHANGELOG, creates PR. |
| **Memory** | MEMORY.md auto-loads into every session. learnings.jsonl stores operational patterns. Checkpoints save mid-session state. | Agents remember. Each session builds on the last. |

---

## The Team

```
Chief of Staff (claude-opus-4.6)
├── Product Team
│   ├── Product Manager     — 0-to-1, PRDs, jobs-to-be-done, specs
│   └── Research Analyst    — X/web research, competitive intel, synthesis
├── Engineering Team
│   ├── CTO                 — architecture, code quality, cross-team decisions
│   ├── Frontend Engineer   — UI, components, design system enforcement
│   ├── Backend Engineer    — API, data models, business logic
│   ├── Release Engineer    — git, ship, deploy, CHANGELOG, retros
│   └── QA Engineer         — browser testing, visual QA, performance, canary
├── Creative Team
│   ├── Design Consultant   — brand, design system (DESIGN.md), visual direction
│   └── Content Writer      — copy, policy docs, brand voice
├── Security Officer        — CSO audits, guardrails, threat modeling
└── Solo Founder            — customer discovery, PMF, fundraising, hiring, operating cadence
```

**Models:** Chief of Staff, CTO, and Solo Founder run on `claude-opus-4.6`. All other agents run on `claude-sonnet-4.6`.

---

## Skill Coverage — 73 Skills Across 14 Categories

Every skill is a slash command in Claude Code. Each is wired to the right agent in `.paperclip.yaml`.

### Strategy & Product (8 skills)

| Skill | What It Does |
|-------|-------------|
| `/plan-ceo-review` | CEO/founder plan review — rethinks problem, finds 10-star product, challenges premises |
| `/office-hours` | YC-style forcing questions: demand reality, desperate specificity, narrowest wedge |
| `/plan-strategy` | Strategic planning — north star, quarterly priorities, OKRs |
| `/frame-problem` | Structured problem framing before jumping to solutions |
| `/discover-product` | Jobs-to-be-done, problem validation, early PRD for 0-to-1 |
| `/brainstorming` | Turn ideas into designs through collaborative dialogue + 2-3 approach proposals |
| `/write-brief` | 1-pagers, decision memos, exec summaries, investor updates |
| `/evaluating` | Multi-dimension artifact evaluation with concrete upgrade paths to 10/10 |

### Research & Intelligence (5 skills)

| Skill | What It Does |
|-------|-------------|
| `/x-research` | Agentic X/Twitter research — decompose questions, follow threads, synthesize |
| `/last30days-nux` | Multi-platform social research across Reddit, X, YouTube, TikTok, HN, Polymarket |
| `/researching-web` | Web research — docs, blogs, news, technical solutions |
| `/researching-codebase` | Codebase investigation — patterns, implementations, file discovery |
| `/synthesize-research` | Turn raw research into structured synthesis with key findings |

### Planning & Documentation (3 skills)

| Skill | What It Does |
|-------|-------------|
| `/writing-plans` | Detailed implementation plans with phases, tasks, checks — living document for multi-session work |
| `/writing-documentation` | Markdown docs in `.thoughts/` with frontmatter and naming conventions |
| `/write-policy` | Policy docs, SOPs, team handbooks, compliance documentation |

### Engineering & Architecture (9 skills)

| Skill | What It Does |
|-------|-------------|
| `/plan-eng-review` | Eng manager plan review — architecture, data flow, edge cases, test coverage |
| `/implementing` | Execute implementation plans with mandatory phase checkpoints |
| `/investigate` | Systematic debugging — 4 phases: investigate, analyze, hypothesize, implement |
| `/codex` | OpenAI Codex second opinion — code review, adversarial challenge, consult |
| `/health` | Code quality dashboard — type checker, linter, test runner, dead code, trend tracking |
| `/review` | Pre-landing code review — SQL safety, LLM trust boundary, structural issues |
| `/ralph-wiggum` | Researcher → Coder → Verifier → Reviewer agent sequence |
| `/devex-review` | Live DX audit — tests docs, times TTHW, screenshots error messages |
| `/plan-devex-review` | DX review for plans before implementation |

### Design & Frontend (7 skills)

| Skill | What It Does |
|-------|-------------|
| `/design-consultation` | Complete design system — typography, color, spacing, motion → `DESIGN.md` |
| `/frontend-design` | Distinctive, production-grade frontend — avoids AI aesthetics |
| `/design-html` | Production-quality Pretext-native HTML/CSS from approved designs |
| `/design-review` | Designer's eye QA — spacing, hierarchy, AI slop patterns → fixes in source |
| `/design-shotgun` | Generate multiple AI design variants, comparison board, iterate with feedback |
| `/plan-design-review` | Designer's eye plan review — rates each dimension 0-10 before building |
| `/brand-voice-enforcement` | Apply brand guidelines to any content — tone, voice, style enforcement |

### Quality & Testing (7 skills)

| Skill | What It Does |
|-------|-------------|
| `/qa` | Systematic browser QA + iterative fixes — test → fix → verify loop |
| `/qa-only` | QA report only — health score, screenshots, repro steps, no fixes |
| `/benchmark` | Performance regression detection — baselines, before/after comparison |
| `/canary` | Post-deploy canary monitoring — console errors, regressions, anomalies |
| `/browse` | Fast headless browser — navigate, interact, screenshot, diff, assert |
| `/setup-browser-cookies` | Import real browser cookies into headless session for auth testing |
| `/open-gstack-browser` | Launch headed Chromium with AI sidebar extension |

### Shipping & Deployment (6 skills)

| Skill | What It Does |
|-------|-------------|
| `/ship` | Full ship workflow — merge base, tests, diff review, VERSION bump, CHANGELOG, PR |
| `/land-and-deploy` | Merge PR, wait for CI, verify prod health via canary |
| `/github` | Git/GitHub — draft PRs, squash merging, Graphite-style dev |
| `/document-release` | Post-ship docs update — README, ARCHITECTURE, CHANGELOG voice |
| `/retro` | Weekly engineering retro — commit history, patterns, per-person breakdowns |
| `/autoplan` | Auto-runs CEO, design, eng, and DX reviews sequentially |

### Safety & Guardrails (5 skills)

| Skill | What It Does |
|-------|-------------|
| `/careful` | Warns before `rm -rf`, `DROP TABLE`, force-push, `reset --hard` |
| `/guard` | Full safety — combines `/careful` + `/freeze` |
| `/freeze` | Restrict file edits to a specific directory for the session |
| `/unfreeze` | Clear the freeze boundary |
| `/cso` | Infrastructure security audit — secrets, supply chain, CI/CD, LLM security, OWASP |

### State & Memory (3 skills)

| Skill | What It Does |
|-------|-------------|
| `/checkpoint` | Save working state — git state, decisions, remaining work → resume across resets |
| `/learn` | Manage project learnings — review, search, prune, export |
| `/last30days-nux` | Research briefings persisted to `~/Documents/Last30Days/` |

### Third-Party Plugins (2 skills)

| Skill | Source | What It Does |
|-------|--------|-------------|
| `ui-ux-pro-max` | NextLevelBuilder | 67 UI styles, 161 palettes, 57 font pairings, 99 UX guidelines, 25 chart types |
| `openclaw` | thedotmack | OpenClaw agent framework integration |

### Meta (2 skills)

| Skill | What It Does |
|-------|-------------|
| `/gstack-upgrade` | Upgrade gstack to latest version |
| `/setup-deploy` | Configure deployment settings for `/land-and-deploy` |

### Solo Founder — Tier 1: Critical Month 1-3 (5 skills)

| Skill | What It Does |
|-------|-------------|
| `/user-interview` | Screener → interview script → synthesis → pattern aggregation using JTBD format |
| `/pmf-pulse` | Sean Ellis survey + retention curve + churn pattern analysis → PMF score report |
| `/pitch-deck` | Narrative-first pitch deck: 10-slide structure, each slide answers one investor question |
| `/investor-update` | 250-word monthly update template — metrics table, highlights, lowlights, specific ask |
| `/runway` | Burn rate + 3 runway scenarios + fundraising trigger date + default alive check |

### Solo Founder — Tier 2: Growth Month 3-9 (5 skills)

| Skill | What It Does |
|-------|-------------|
| `/launch-strategy` | Full launch plan: channel selection, pre-launch checklist, day-of playbook by channel |
| `/sales-playbook` | ICP definition, cold outreach templates, demo flow, objection handling, pipeline tracker |
| `/pricing-strategy` | Competitor research, value-based pricing calc, 3-tier page copy, validation experiment |
| `/growth-experiment` | Hypothesis → ICE prioritization → run → results → patterns across AARRR funnel |
| `/legal-basics` | Incorporation checklist, IP assignment, contractor agreements, SAFE vs priced round |

### Solo Founder — Tier 3: Scale Month 6-18 (6 skills)

| Skill | What It Does |
|-------|-------------|
| `/cap-table` | Founder equity, round dilution modeling, SAFE conversion math, option pool planning |
| `/first-hire` | Role definition, sourcing strategy, interview rubric, equity offer, 30-day onboarding |
| `/content-machine` | Pillar → derivatives → social → SEO cluster → content calendar → build-in-public templates |
| `/demo-script` | Hook → aha moment → proof → CTA for 5-min demos, sales calls, or launch videos |
| `/decision-journal` | Log decisions with alternatives + reasoning → monthly review → quarterly pattern analysis |
| `/founder-rhythm` | Weekly (Mon plan / Fri retro) + monthly (metrics + investor update) + quarterly direction check |

---

## Skill-to-Agent Matrix

| Skill | Primary Agent | Secondary |
|-------|--------------|-----------|
| `plan-ceo-review`, `office-hours`, `plan-strategy`, `frame-problem`, `write-brief`, `evaluating`, `autoplan` | chief-of-staff | — |
| `discover-product`, `brainstorming`, `writing-plans`, `synthesize-research` | product-manager | chief-of-staff |
| `x-research`, `last30days-nux`, `researching-web`, `researching-codebase`, `writing-documentation` | research-analyst | — |
| `plan-eng-review`, `codex`, `health`, `investigate`, `review`, `devex-review` | cto | — |
| `frontend-design`, `design-html`, `design-review`, `design-shotgun`, `qa`, `benchmark` | frontend-engineer | — |
| `implementing`, `careful`, `writing-plans`, `researching-codebase` | backend-engineer | — |
| `ship`, `land-and-deploy`, `github`, `document-release`, `retro`, `checkpoint` | release-engineer | — |
| `qa`, `qa-only`, `benchmark`, `canary`, `browse`, `setup-browser-cookies` | qa-engineer | — |
| `design-consultation`, `design-shotgun`, `brand-voice-enforcement`, `plan-design-review` | design-consultant | — |
| `cso`, `guard`, `freeze`, `unfreeze` | security-officer | cto |
| `brand-voice-enforcement`, `write-policy`, `write-brief`, `writing-documentation` | content-writer | — |

---

## Coordination Protocols

### Feature Request → Ship

```
User
 └── Chief of Staff  /office-hours, /plan-ceo-review
      └── Product Manager  /discover-product, /writing-plans
           └── CTO  /plan-eng-review
                ├── Frontend Engineer  [parallel]
                └── Backend Engineer  [parallel]
                     └── QA Engineer  /qa
                          └── Release Engineer  /ship → /land-and-deploy
                               └── Content Writer  /document-release
```

### Bug Fix

```
QA  /qa-only (report)
 └── Frontend or Backend  /investigate + fix
      └── QA  /qa (verify)
           └── Release  /ship
```

### Research → Decision

```
Research Analyst  /x-research or /last30days-nux
 └── /synthesize-research
      └── Chief of Staff  /write-brief
           └── Product Manager  (update spec)
```

### Security Incident

```
Any agent flags issue
 └── Security Officer  /cso or /investigate
      └── Report with severity + remediation plan
           └── Chief of Staff  approves priority
                └── Backend/Frontend  implements fix
                     └── Security Officer  verifies
```

---

## Memory Layer

Three tiers. Each builds on the last.

### Tier 1 — MEMORY.md (Session Context)

Auto-loaded into every Claude Code session via system prompt injection.

```
~/.claude/projects/[project-slug]/memory/MEMORY.md
```

- Max 200 lines (lines beyond are truncated)
- Store: stable patterns, user preferences, key file paths, architectural decisions
- Updated by agents during sessions when stable patterns are confirmed

### Tier 2 — learnings.jsonl (Operational Learning)

Per-project log of what gstack agents have discovered.

```
~/.gstack/projects/[project-slug]/learnings.jsonl
```

- Written by agents via `gstack-learnings-log`
- Searched at session start via `gstack-learnings-search --limit 3`
- Types: `pattern`, `pitfall`, `preference`, `architecture`, `tool`, `operational`

### Tier 3 — Checkpoints (Session State)

Mid-session state saves for long-running work.

```bash
/checkpoint  # save current state
/checkpoint resume  # pick up where you left off
```

Captures: git state, decisions made, remaining tasks, context summary.

### Tier 4 — claude-mem (Compressed Tool Output History)

Captures tool outputs from every session, compresses them to ~50-token semantic observations, and injects the most relevant ~500 tokens into future sessions via FTS5 semantic search.

```bash
# Start the worker once (add to ~/.zshrc for auto-start)
node ~/.claude/plugins/cache/thedotmack/claude-mem/10.0.6/scripts/worker-cli.js start

# Wire into agent heartbeat (Step 2 of each agent's checklist)
node ~/.claude/plugins/cache/thedotmack/claude-mem/10.0.6/scripts/context-generator.cjs \
  --project-path "$(pwd)" --query "[agent-name] [current-task]"
```

~10x token efficiency vs repeating raw tool output in every heartbeat. See `memory/claude-mem-setup.md`.

### Tier 5 — Auto Dream (Nightly MEMORY.md Consolidation)

Nightly script that promotes high-confidence learnings (≥8/10) from `learnings.jsonl` into `MEMORY.md`, keeping the file under the 200-line limit.

```bash
./memory/auto-dream.sh --dry-run   # preview
./memory/auto-dream.sh             # run

# Cron: nightly at 2am
(crontab -l 2>/dev/null; echo "0 2 * * * $(pwd)/memory/auto-dream.sh") | crontab -
```

### Token Budget Summary

| Layer | Cost | Frequency |
|-------|------|-----------|
| MEMORY.md | ~1,500 tokens | Every session |
| learnings.jsonl (top 3) | ~300 tokens | Every gstack skill |
| claude-mem context | ~500 tokens | Every heartbeat |
| Checkpoints | 2K-5K tokens | Explicit `/checkpoint` |

**Total heartbeat overhead: ~2,300 tokens** — ~77% less than unoptimized Paperclip.

See `memory/README.md` for full documentation.

---

## Human-in-the-Loop Gates

Agents pause and wait for human approval before:

| Action | Agent | Gate |
|--------|-------|------|
| Create + merge PR | release-engineer | Approval in Paperclip inbox |
| Deploy to production | release-engineer | Explicit confirm |
| DB migration on prod | backend-engineer | `/careful` prompt |
| Security remediation | security-officer | Severity ≥ High |
| Major scope change | chief-of-staff | User confirmation |
| Publish marketing copy | content-writer | Content review |

Configure additional gates in `.paperclip.yaml` under `agents.[name].approval_required`.

---

## Getting Started

### Prerequisites

- [Claude Code](https://claude.ai/code) installed
- [gstack](https://github.com/garrytan/gstack) installed (`npm install -g gstack` or see gstack docs)
- [Paperclip](https://github.com/paperclipai/paperclip) installed (`npm install -g paperclipai`)

### Quickstart

```bash
# 1. Clone this repo
gh repo clone Ash-code183/company-os my-company
cd my-company

# 2. Set your mission
# Edit .paperclip.yaml — change company.name and company.mission
# Edit COMPANY.md — describe what you're building

# 3. Customize agents for your domain (optional but recommended)
# Edit agents/*.md — add domain context, key files, project conventions

# 4. Create your design system (if building a UI)
# Run /design-consultation in Claude Code — generates DESIGN.md

# 5. Set your P0 test flow (optional)
# Edit agents/qa-engineer.md — add the critical user flows to test

# 6. Configure deployment (optional)
# Run /setup-deploy in Claude Code

# 7. Start your first agent session
npx paperclipai run --agent chief-of-staff --task "Review our product strategy"
```

---

## Repository Structure

```
company-os/
├── .paperclip.yaml          ← company config: agents, models, skills, memory, teams
├── CLAUDE.md                ← gstack skill routing (40+ routes for Claude Code)
├── COMPANY.md               ← product overview, stack explanation, getting started
├── AGENTS.md                ← full agent roster, skill matrix, coordination protocols
├── SKILLS.md                ← complete 73-skill catalog with descriptions
├── CHANGELOG.md
│
├── agents/
│   ├── chief-of-staff.md    ← strategy, 10-star thinking, mission context
│   ├── product-manager.md   ← discovery, PRDs, jobs-to-be-done
│   ├── research-analyst.md  ← research protocols, synthesis patterns
│   ├── cto.md               ← architecture standards, quality gates
│   ├── frontend-engineer.md ← design system enforcement, DESIGN.md tokens
│   ├── backend-engineer.md  ← data model invariants, safety gates
│   ├── release-engineer.md  ← branch strategy, ship checklist, CHANGELOG voice
│   ├── qa-engineer.md       ← P0/P1/P2 test flows, visual QA checklist
│   ├── design-consultant.md ← brand principles, design system ownership
│   ├── security-officer.md  ← threat model, guardrail triggers
│   └── content-writer.md    ← brand voice rules, tone by context
│
├── teams/
│   ├── product/README.md    ← product team workflow + weekly cadence
│   ├── engineering/README.md← engineering workflow, standards, branch conventions
│   └── creative/README.md   ← design + content workflow, DESIGN.md as source of truth
│
├── skills/
│   ├── user-interview/      ← JTBD customer discovery workflow
│   ├── pmf-pulse/           ← PMF measurement (Sean Ellis + retention)
│   ├── pitch-deck/          ← 10-slide narrative pitch deck builder
│   ├── investor-update/     ← 250-word monthly update template
│   ├── runway/              ← burn rate + 3 scenarios + fundraising trigger
│   ├── launch-strategy/     ← channel playbooks (PH, HN, X, email)
│   ├── sales-playbook/      ← ICP → outreach → demo → close
│   ├── pricing-strategy/    ← value-based pricing + 3-tier page copy
│   ├── growth-experiment/   ← ICE scoring + AARRR experiment log
│   ├── legal-basics/        ← incorporation checklist + SAFE guide
│   ├── cap-table/           ← dilution modeling + SAFE conversion
│   ├── first-hire/          ← role rubric + equity offer + onboarding
│   ├── content-machine/     ← pillar → social → SEO + build-in-public
│   ├── demo-script/         ← hook → aha moment → proof → CTA
│   ├── decision-journal/    ← decision log + monthly review + bias audit
│   └── founder-rhythm/      ← weekly/monthly/quarterly operating cadence
│
└── memory/
    ├── README.md            ← 5-layer memory system documentation
    ├── heartbeat.md         ← heartbeat checklist template for all 12 agents
    ├── claude-mem-setup.md  ← claude-mem Paperclip integration guide
    └── auto-dream.sh        ← nightly MEMORY.md consolidation script
```

---

## Forking This Template

### Option 1 — Fork on GitHub

```bash
gh repo fork Ash-code183/company-os my-company
cd my-company
```

### Option 2 — Clone Directly

```bash
gh repo clone Ash-code183/company-os my-company
cd my-company
git remote set-url origin https://github.com/YOUR-ORG/my-company.git
```

### Customization Checklist

1. **Replace mission** — `company.name` and `company.mission` in `.paperclip.yaml`, and `COMPANY.md`
2. **Add domain context** — each `agents/*.md` has a section for project-specific context. Fill it in.
3. **Create DESIGN.md** — run `/design-consultation` in Claude Code. Required before any UI work.
4. **Set P0 test flows** — edit `agents/qa-engineer.md` with the critical user paths for your product
5. **Configure deploy** — run `/setup-deploy` to configure `/land-and-deploy` for your platform
6. **Initialize memory** — create `~/.claude/projects/[your-slug]/memory/MEMORY.md` with key project facts

---

## Why Paperclip + gstack Together

They solve different problems at different layers.

**gstack** makes a single Claude Code session operate like a senior professional. `/investigate` doesn't just look at the error — it runs four phases: locate, analyze, hypothesize, fix with root cause verified. `/ship` doesn't just `git push` — it checks tests, reviews the diff, bumps version, writes CHANGELOG, creates PR.

**Paperclip** coordinates multiple Claude Code sessions in parallel. It's why you can run Frontend Engineer and Backend Engineer simultaneously on the same feature, with a shared inbox for approvals, a dashboard showing every agent's state, and budget controls so nothing goes off the rails.

The evidence they're complementary: the official `paperclipai/companies` registry has a `gstack/` directory. They're designed to work together.

---

## Credits

- [Paperclip](https://github.com/paperclipai/paperclip) — multi-agent orchestration for zero-human companies
- [gstack](https://github.com/garrytan/gstack) — Garry Tan's Claude Code skill framework
- [last30days](https://github.com/last30days/last30days-nux) — multi-platform social research
- [ui-ux-pro-max](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill) — design intelligence plugin by NextLevelBuilder
