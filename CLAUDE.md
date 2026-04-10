# company-os — Claude Code Instructions

This file is read by every Claude Code session in this project.
It activates gstack skill routing and documents project conventions.

---

## Skill Routing

When a request matches a gstack skill, ALWAYS invoke it as the FIRST action.
Do NOT answer directly when a skill exists for the task.

### Strategy & Product
- New idea / "is this worth building" / product feedback → `/office-hours`
- Strategy, OKRs, quarterly planning, roadmap → `/plan-strategy`
- "I'm stuck" / messy problem / frame this → `/frame-problem`
- 0-to-1 / validate idea / product discovery → `/discover-product`
- "Think bigger" / 10-star product / scope challenge → `/plan-ceo-review`
- Explore options before code / design before build → `/brainstorming`
- Write a 1-pager / decision memo / investor update → `/write-brief`
- Evaluate this / rate this / how good is this → `/evaluating`

### Research
- X/Twitter research / "what is X saying about" → `/x-research`
- "Last 30 days" / multi-platform social research → `/last30days-nux`
- Search the web / find documentation / look up → `/researching-web`
- How does X work in our code / find pattern → `/researching-codebase`
- Synthesize research / process notes / competitive analysis → `/synthesize-research`

### Planning & Docs
- Create a plan / implementation plan / plan this feature → `/writing-plans`
- Write documentation / create notes / .thoughts file → `/writing-documentation`
- Write a policy / SOP / governance doc → `/write-policy`

### Engineering
- Review architecture / lock the plan / eng review → `/plan-eng-review`
- Implement this / execute plan / build from description → `/implementing`
- Debug / why is this broken / root cause → `/investigate`
- Second opinion / codex review / independent check → `/codex`
- Code quality / health check / how healthy is the codebase → `/health`
- Review this PR / code review / pre-landing → `/review`
- Developer experience / DX audit → `/devex-review`
- Review DX plan / DX gaps → `/plan-devex-review`

### Design & Frontend
- Design system / brand identity / visual direction → `/design-consultation`
- Build this UI / create this page / component → `/frontend-design`
- Finalize design / production HTML / implement mockup → `/design-html`
- Design audit / visual polish / UI issues → `/design-review`
- Show me options / design variants / 3 choices → `/design-shotgun`
- Review design plan → `/plan-design-review`
- Write email / draft copy / brand voice → `/brand-voice-enforcement`

### Quality & Testing
- Test this / find bugs / QA → `/qa`
- Report bugs / test but don't fix → `/qa-only`
- Performance / page speed / benchmark → `/benchmark`
- Monitor deploy / post-deploy check → `/canary`
- Open the site / navigate to / test URL → `/browse`
- Import cookies / login to site → `/setup-browser-cookies`

### Shipping
- Ship / deploy / push / create PR → `/ship`
- Merge / land / deploy to production → `/land-and-deploy`
- Git workflow / branch strategy → `/github`
- Update docs after ship → `/document-release`
- Weekly retro / what did we ship → `/retro`
- Run all reviews automatically → `/autoplan`

### Safety
- Safety mode / be careful / destructive command → `/careful`
- Full safety mode / lock it down → `/guard`
- Freeze edits / restrict to this folder → `/freeze`
- Unfreeze / allow all edits → `/unfreeze`
- Security audit / threat modeling / OWASP → `/cso`

### State & Memory
- Save progress / checkpoint / resume → `/checkpoint`
- What have we learned / show learnings → `/learn`
- Upgrade gstack → `/gstack-upgrade`

### Solo Founder — Customer Discovery & PMF
- Talk to users / customer discovery / JTBD interviews → `/user-interview`
- Do we have PMF / product-market fit / should we keep building → `/pmf-pulse`
- Launch this product / go to market / Product Hunt / Show HN → `/launch-strategy`
- Close more customers / first 10 customers / build sales process → `/sales-playbook`
- How should I price this / pricing page / am I underpriced → `/pricing-strategy`
- Growth experiment / test this channel / acquisition ideas → `/growth-experiment`

### Solo Founder — Fundraising & Finance
- Build a pitch deck / investor presentation / raise funding → `/pitch-deck`
- Monthly investor update / write to investors / advisor update → `/investor-update`
- How long do I have / burn rate / runway calculation → `/runway`
- Cap table / equity model / dilution / SAFE conversion → `/cap-table`
- Legal basics / incorporation / contracts / equity paperwork → `/legal-basics`

### Solo Founder — Team & Scale
- First hire / hiring process / employee #1 → `/first-hire`
- Content strategy / build in public / SEO content / newsletter → `/content-machine`
- Product demo / demo script / show the product → `/demo-script`
- Log this decision / decision journal / decision review → `/decision-journal`
- Weekly plan / monthly review / founder cadence / operating rhythm → `/founder-rhythm`

---

## Design System

Always read `DESIGN.md` before making any visual or UI decisions.
If `DESIGN.md` doesn't exist for this project, run `/design-consultation` first.

---

## Agent Structure

This project runs on Paperclip + gstack.
- Company config: `.paperclip.yaml`
- Company overview: `COMPANY.md`
- Skill catalog: `SKILLS.md`
- Memory layer: `memory/README.md`
- Agent definitions: `agents/`
- Team structure: `teams/`

---

## Memory Layer

- `~/.claude/projects/[slug]/memory/MEMORY.md` — auto-loaded per session
- `~/.gstack/projects/[slug]/learnings.jsonl` — operational learnings
- `/checkpoint` — save state for long sessions

Update `MEMORY.md` when you discover stable patterns, preferences, or key architectural facts about the project.

---

## Customization

Fork this template and:
1. Replace mission in `.paperclip.yaml` and `COMPANY.md`
2. Add project-specific context to each `agents/*.md`
3. Create `DESIGN.md` via `/design-consultation`
4. Set your P0 test flow in `agents/qa-engineer.md`
5. Set deploy target via `/setup-deploy`
