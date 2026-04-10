# Engineering Team

## Members
- **CTO** (lead) — architecture, quality, technical standards
- **Frontend Engineer** — UI, design system
- **Backend Engineer** — API, data, business logic
- **Release Engineer** — git, ship, deploy
- **QA Engineer** — testing, monitoring
- **Security Officer** — guardrails, audits

## Workflow

```
CTO /plan-eng-review    → Architecture locked
[Frontend + Backend]    → Parallel implementation
QA /qa                  → Test + fix
Release /ship           → PR created
Release /land-and-deploy → Merged + verified in prod
```

## Standards

**Code quality gate:** Run `/health` before every PR.
**Security gate:** Run `/careful` before any DB migration or destructive operation.
**Canary gate:** Run `/canary` after every production deploy.
**Review gate:** `/review` on all PRs that touch auth, payments, or LLM inputs.

## Branch Convention

```
main                         ← production, always deployable
feature/[agent]-[desc]       ← new features
fix/[agent]-[desc]           ← bug fixes
chore/[agent]-[desc]         ← tooling, deps, config
```

## Codex Second Opinion

Use `/codex` for:
- Architecture decisions where two approaches seem equal
- Security-sensitive diffs
- Complex refactors before they land

Codex + Claude agreement = ship with confidence.
Codex + Claude disagreement = surface to CTO.
