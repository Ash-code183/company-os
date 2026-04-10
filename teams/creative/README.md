# Creative Team

## Members
- **Design Consultant** (lead) — design system, visual direction, brand
- **Content Writer** — copy, policy, docs
- **Frontend Engineer** (shared with Engineering) — implements design decisions

## Workflow

```
Design Consultant /design-consultation  → DESIGN.md created
Content Writer /brand-voice-enforcement → Voice documented
Frontend Engineer /frontend-design      → Design implemented
Design Consultant /design-review        → Audit before ship
QA /qa                                  → Visual QA checklist
```

## DESIGN.md as Source of Truth

Every project must have a `DESIGN.md`. If it doesn't exist:
1. Design Consultant runs `/design-consultation`
2. Output: DESIGN.md with typography, color, spacing, motion decisions
3. DESIGN.md committed to repo
4. All agents reference it for every UI or copy decision

## Brand Voice

The Content Writer maintains brand voice documentation.
Run `/brand-voice-enforcement` for any customer-facing copy.

## Design Intelligence Stack

- `/design-consultation` — create the system
- `/design-shotgun` — explore variants
- `ui-ux-pro-max` plugin — 67 UI styles, 161 palettes, 57 font pairings
- `/design-review` — enforce the system

## Weekly Cadence

| Activity | Skill |
|----------|-------|
| Design drift check (weekly) | /design-review |
| New features before build | /plan-design-review |
| New copy before publish | /brand-voice-enforcement |
