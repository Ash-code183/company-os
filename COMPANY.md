# company-os

> A generic, forkable AI company operating system.
> Built on **Paperclip** (multi-agent orchestration) + **gstack** (per-agent skill depth).

## What This Is

company-os is a template that lets you spin up a fully-staffed AI company for any project in minutes.

**Fork it. Replace the mission. Customize agent context. Ship.**

It maps every installed skill (gstack core + extended + third-party plugins) to the right agent role, documents the memory layer, and gives you a working Paperclip company structure out of the box.

## The Stack

```
Paperclip          ← coordinates the fleet (dashboard, inbox, budgets, audit trail)
  └── gstack       ← sharpens each agent (23 core + 30+ extended skills)
       └── memory  ← persists learning across sessions (MEMORY.md + learnings.jsonl)
```

**What each layer adds:**

| Layer | Adds |
|-------|------|
| **gstack** | 55 skills that make a single Claude Code session ship at team speed |
| **Paperclip** | Parallel agent execution, mission control dashboard, human inbox, budget controls, audit trail |
| **Memory** | Cross-session learning — agents remember project patterns, user preferences, prior decisions |

## Org Chart

```
Chief of Staff (opus-4.6) — strategy, scope, 10-star thinking
├── Product Team
│   ├── Product Manager    — discovery, PRDs, 0-to-1
│   └── Research Analyst   — X/web research, synthesis
├── Engineering Team
│   ├── CTO                — architecture, quality, codex
│   ├── Frontend Engineer  — UI, design system, components
│   ├── Backend Engineer   — API, data, business logic
│   └── Release Engineer   — git, ship, deploy, CHANGELOG
├── QA                     — browser testing, visual QA, canary
├── Creative Team
│   ├── Design Consultant  — brand, design system, visual direction
│   └── Content Writer     — copy, policy, docs
└── Security Officer       — CSO, guardrails, threat modeling
```

## Skill Coverage by Agent

See `SKILLS.md` for the complete skill catalog with descriptions.

Quick map:

| Agent | Key Skills |
|-------|-----------|
| Chief of Staff | plan-ceo-review, office-hours, plan-strategy, frame-problem, write-brief, evaluating |
| Product Manager | discover-product, brainstorming, writing-plans, synthesize-research |
| Research Analyst | x-research, last30days-nux, researching-web, synthesize-research |
| CTO | plan-eng-review, codex, health, investigate, review, cso |
| Frontend Engineer | frontend-design, design-html, design-review, design-shotgun, qa |
| Backend Engineer | implementing, investigate, health, careful, writing-plans |
| Release Engineer | ship, land-and-deploy, github, review, document-release, retro |
| QA Engineer | qa, qa-only, benchmark, canary, browse, setup-browser-cookies |
| Design Consultant | design-consultation, design-shotgun, brand-voice-enforcement, plan-design-review |
| Security Officer | cso, guard, careful, freeze, review |
| Content Writer | brand-voice-enforcement, write-policy, write-brief, writing-documentation |

## Memory Layer

See `memory/README.md` for full documentation.

Short version:
- `~/.claude/projects/[project]/memory/MEMORY.md` — auto-loaded into every session
- `~/.gstack/projects/[slug]/learnings.jsonl` — per-project operational learnings
- `/checkpoint` skill — save session state mid-work, resume across context resets

## Getting Started

```bash
# 1. Fork / clone this repo
gh repo clone Ash-code183/company-os my-company
cd my-company

# 2. Replace mission in .paperclip.yaml and COMPANY.md

# 3. Customize agent context in agents/*.md for your domain

# 4. Install Paperclip
npm install -g paperclipai

# 5. Onboard
npx paperclipai onboard --yes

# 6. Start your first agent
npx paperclipai run --agent chief-of-staff --task "Review our product strategy"
```

## Forking This Template

```bash
# Import from companies registry (if published)
npx companies.sh add Ash-code183/company-os

# Or clone directly
gh repo clone Ash-code183/company-os
```

---

*Made with Paperclip + gstack. See AGENTS.md for full agent definitions, SKILLS.md for the complete skill catalog.*
