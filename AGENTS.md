# AGENTS.md — company-os

Complete reference for all agents, their skill assignments, and coordination protocols.

---

## The Stack Explained

```
Paperclip                    ← company-level orchestration
  ├── Mission control dashboard (all agents, active tasks, activity feed)
  ├── Human-in-the-loop inbox (approvals before deploy, ship, publish)
  ├── Per-agent budget controls
  ├── Audit trail of all decisions and actions
  └── Parallel execution (Frontend + Backend + Content all at once)
        │
        └── gstack skills (per-agent)
              ├── 23 core gstack skills (CEO review, design, QA, ship, etc.)
              ├── 30+ extended skills (research, strategy, policy, evaluation)
              └── 2 third-party plugins (ui-ux-pro-max, openclaw)
                    │
                    └── Memory layer
                          ├── MEMORY.md (auto-loaded, 200 lines max)
                          ├── learnings.jsonl (per-project operational learnings)
                          └── checkpoint files (mid-session state saves)
```

---

## Agent Roster

| Agent | Model | Team | Role |
|-------|-------|------|------|
| `chief-of-staff` | opus-4.6 | Strategy | Vision, scope, 10-star product thinking |
| `product-manager` | sonnet-4.6 | Product | 0-to-1, PRDs, jobs-to-be-done |
| `research-analyst` | sonnet-4.6 | Product | X/web research, competitive intel, synthesis |
| `cto` | opus-4.6 | Engineering | Architecture, quality, cross-team tech decisions |
| `frontend-engineer` | sonnet-4.6 | Engineering | UI, design system, components |
| `backend-engineer` | sonnet-4.6 | Engineering | API, data, business logic |
| `release-engineer` | sonnet-4.6 | Engineering | Git, ship, deploy, CHANGELOG |
| `qa-engineer` | sonnet-4.6 | Engineering | Browser testing, visual QA, canary |
| `design-consultant` | sonnet-4.6 | Creative | Design system, brand, visual direction |
| `security-officer` | sonnet-4.6 | Engineering | CSO audits, guardrails, threat modeling |
| `content-writer` | sonnet-4.6 | Creative | Copy, policy docs, brand voice |
| `solo-founder` | opus-4.6 | Founder | Customer discovery, PMF, fundraising, legal, hiring, operating cadence |

---

## Skill-to-Agent Matrix

| Skill | Primary Agent | Secondary Agent |
|-------|--------------|----------------|
| `plan-ceo-review` | chief-of-staff | — |
| `office-hours` | chief-of-staff | product-manager |
| `plan-strategy` | chief-of-staff | — |
| `frame-problem` | chief-of-staff | product-manager |
| `write-brief` | chief-of-staff | content-writer |
| `evaluating` | chief-of-staff | product-manager |
| `brainstorming` | product-manager | chief-of-staff |
| `discover-product` | product-manager | — |
| `writing-plans` | product-manager | backend-engineer |
| `synthesize-research` | research-analyst | product-manager |
| `x-research` | research-analyst | — |
| `last30days-nux` | research-analyst | — |
| `researching-web` | research-analyst | — |
| `researching-codebase` | research-analyst | backend-engineer |
| `plan-eng-review` | cto | — |
| `codex` | cto | — |
| `health` | cto | backend-engineer |
| `investigate` | cto | backend-engineer |
| `review` | cto | release-engineer |
| `devex-review` | cto | — |
| `cso` | security-officer | cto |
| `frontend-design` | frontend-engineer | — |
| `design-html` | frontend-engineer | design-consultant |
| `design-review` | design-consultant | qa-engineer |
| `design-shotgun` | design-consultant | frontend-engineer |
| `design-consultation` | design-consultant | — |
| `plan-design-review` | design-consultant | — |
| `brand-voice-enforcement` | content-writer | design-consultant |
| `implementing` | backend-engineer | — |
| `careful` | security-officer | backend-engineer |
| `ship` | release-engineer | — |
| `land-and-deploy` | release-engineer | — |
| `github` | release-engineer | — |
| `document-release` | release-engineer | — |
| `retro` | release-engineer | — |
| `checkpoint` | release-engineer | any agent |
| `qa` | qa-engineer | frontend-engineer |
| `qa-only` | qa-engineer | — |
| `benchmark` | qa-engineer | — |
| `canary` | qa-engineer | — |
| `browse` | qa-engineer | — |
| `guard` | security-officer | — |
| `freeze` / `unfreeze` | security-officer | — |
| `write-policy` | content-writer | — |
| `writing-documentation` | content-writer | research-analyst |
| `autoplan` | chief-of-staff | — |
| `learn` | any agent | — |
| `user-interview` | solo-founder | — |
| `pmf-pulse` | solo-founder | — |
| `pitch-deck` | solo-founder | — |
| `investor-update` | solo-founder | — |
| `runway` | solo-founder | — |
| `launch-strategy` | solo-founder | — |
| `sales-playbook` | solo-founder | — |
| `pricing-strategy` | solo-founder | — |
| `growth-experiment` | solo-founder | — |
| `legal-basics` | solo-founder | — |
| `cap-table` | solo-founder | — |
| `first-hire` | solo-founder | — |
| `content-machine` | solo-founder | — |
| `demo-script` | solo-founder | — |
| `decision-journal` | solo-founder | — |
| `founder-rhythm` | solo-founder | — |

---

## Coordination Protocols

### Feature Request Flow
```
User → Chief of Staff (/office-hours, /plan-ceo-review)
      → Product Manager (/discover-product, /writing-plans)
      → CTO (/plan-eng-review)
      → [Frontend + Backend in parallel]
      → QA (/qa)
      → Release (/ship → /land-and-deploy)
      → Content (/document-release + copy updates)
```

### Bug Fix Flow
```
User → QA (/qa-only: report) → [Frontend or Backend: /investigate + fix]
      → QA (/qa: verify) → Release (/ship)
```

### Research → Decision Flow
```
User → Research Analyst (/x-research or /last30days-nux)
      → /synthesize-research
      → Chief of Staff (/write-brief → decision)
      → Product Manager (update spec)
```

### Security Incident Flow
```
Any agent flags issue → Security Officer (/cso or /investigate)
      → Report with severity + remediation
      → Chief of Staff approves remediation priority
      → Backend/Frontend fix → Security Officer verifies
```

### Solo Founder Weekly Cadence
```
Monday  → Solo Founder (/founder-rhythm --mode=week-plan)
Friday  → Solo Founder (/founder-rhythm --mode=week-retro → /decision-journal)
Monthly → Solo Founder (/founder-rhythm --mode=monthly)
          → /runway (burn + scenarios)
          → /pmf-pulse (if 50+ users)
          → /investor-update (draft from monthly review)
Quarter → Solo Founder (/founder-rhythm --mode=quarterly)
          → /decision-journal (quarterly pattern analysis)
```

### 0-to-1 Discovery Flow
```
User → Solo Founder (/user-interview → /pmf-pulse)
     → if PMF signal: /pitch-deck + /runway + /launch-strategy
     → if no PMF: /growth-experiment → iterate
     → if raising: /investor-update (monthly) + /cap-table
```

---

## Human-in-the-Loop Gates

Agents pause and request human approval before:

| Action | Agent | Gate |
|--------|-------|------|
| Create + merge PR | release-engineer | Approval in inbox |
| Deploy to production | release-engineer | Explicit confirm |
| DB migration on prod | backend-engineer | /careful prompt |
| Security remediation | security-officer | Severity ≥ High |
| Major scope change | chief-of-staff | User confirmation |
| Publish marketing copy | content-writer | Content review |

Configure additional gates in `.paperclip.yaml` under `agents.[name].approval_required`.

---

## Budget Defaults

Each agent defaults to $5/session. Modify in `.paperclip.yaml`:

```yaml
agents:
  cto:
    budget:
      per_session: 15   # deep architectural work
      daily: 60
  research-analyst:
    budget:
      per_session: 10   # multi-platform research
      daily: 40
```

---

## Memory Integration

All agents read the memory layer at session start:

1. `MEMORY.md` — auto-injected into system prompt (patterns, preferences, key paths)
2. `learnings.jsonl` — top 3 relevant learnings from gstack-learnings-search
3. Recent `checkpoint` files — if resuming an interrupted session

See `memory/README.md` for full documentation.
