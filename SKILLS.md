# Skills Catalog — company-os

Complete inventory of all installed skills, grouped by function.
Every skill is a slash command (`/skill-name`) in Claude Code.

---

## I. Strategy & Product

| Skill | Trigger | What It Does |
|-------|---------|-------------|
| `plan-ceo-review` | "review strategy", "10-star product", "think bigger" | CEO/founder plan review — rethinks problem, finds 10-star product, challenges premises |
| `office-hours` | "is this worth building", "product feedback", "YC office hours" | YC-style forcing questions: demand reality, desperate specificity, narrowest wedge |
| `plan-strategy` | "set direction", "OKRs", "quarterly planning", "roadmap" | Strategic planning — defines north star, quarterly priorities, OKRs |
| `frame-problem` | "I'm stuck", "messy problem", "help me think through" | Structured problem framing before jumping to solutions |
| `discover-product` | "0-to-1", "validate idea", "product discovery", "early PRD" | Jobs-to-be-done, problem validation, early PRD for new products |
| `brainstorming` | "explore options", "design this", "before writing code" | Turn ideas into designs through collaborative dialogue + 2-3 approach proposals |
| `write-brief` | "write a 1-pager", "decision memo", "exec summary", "investor update" | Structured written communication — briefs, proposals, investor updates |
| `evaluating` | "evaluate this", "rate this", "how good is this" | Multi-dimension artifact evaluation with concrete upgrade paths to 10/10 |

---

## II. Research & Intelligence

| Skill | Trigger | What It Does |
|-------|---------|-------------|
| `x-research` | "search X", "twitter research", "what's X saying about" | Agentic X/Twitter research — decompose questions, follow threads, synthesize |
| `last30days-nux` | "/last30days [topic]" | Multi-platform social research (Reddit, X, YouTube, TikTok, HN, Polymarket) |
| `researching-web` | "search the web", "look up", "find documentation" | Web research — docs, blogs, news, technical solutions |
| `researching-codebase` | "how does X work", "find where Y is", "understand this code" | Codebase investigation — patterns, implementations, file discovery |
| `synthesize-research` | "synthesize this", "process these notes", "competitive analysis" | Turn raw research into structured synthesis with key findings |

---

## III. Planning & Documentation

| Skill | Trigger | What It Does |
|-------|---------|-------------|
| `writing-plans` | "create a plan", "implementation plan", "plan this feature" | Detailed implementation plans with phases, tasks, checks, living document |
| `writing-documentation` | "write docs", "document this", "create a thought doc" | Markdown docs in .thoughts/ with frontmatter and naming conventions |
| `write-policy` | "write a policy", "SOP", "governance doc", "operating procedure" | Policy docs, SOPs, team handbooks, compliance documentation |

---

## IV. Engineering & Architecture

| Skill | Trigger | What It Does |
|-------|---------|-------------|
| `plan-eng-review` | "review architecture", "lock the plan", "engineering review" | Eng manager plan review — architecture, data flow, edge cases, test coverage |
| `implementing` | "implement this", "execute this plan", "build from description" | Execute implementation plans with mandatory checkpoints and phase reviews |
| `investigate` | "debug this", "why is this broken", "root cause" | Systematic debugging — 4 phases: investigate, analyze, hypothesize, implement |
| `codex` | "second opinion", "codex review", "independent review" | OpenAI Codex second opinion — code review, adversarial challenge, consult |
| `health` | "code quality", "health check", "how healthy is the codebase" | Code quality dashboard — type checker, linter, test runner, dead code, trend tracking |
| `review` | "review this PR", "code review", "pre-landing review" | Pre-landing code review — SQL safety, LLM trust boundary, structural issues |
| `ralph-wiggum` | "ralph workflow", "researcher-coder-verifier loop" | Engineering tasks via Researcher → Coder → Verifier → Reviewer sequence |
| `devex-review` | "developer experience", "DX audit", "getting started flow" | Live DX audit — tests docs, times TTHW, screenshots error messages |
| `plan-devex-review` | "review DX plan", "DX gaps in plan" | DX review for plans before implementation |

---

## V. Design & Frontend

| Skill | Trigger | What It Does |
|-------|---------|-------------|
| `design-consultation` | "design system", "brand identity", "visual direction" | Complete design system consultation — typography, color, spacing, motion → DESIGN.md |
| `frontend-design` | "build this UI", "create this page", "web component" | Distinctive, production-grade frontend — avoids AI aesthetics |
| `design-html` | "finalize design", "production HTML", "implement mockup" | Production-quality Pretext-native HTML/CSS from approved designs |
| `design-review` | "design audit", "visual polish", "UI issues" | Designer's eye QA — spacing, hierarchy, AI slop patterns → fixes in source |
| `design-shotgun` | "explore designs", "show me options", "design variants" | Generate multiple AI design variants, comparison board, iterate with feedback |
| `plan-design-review` | "review design plan", "design gaps" | Designer's eye plan review — rates each dimension 0-10 before building |
| `brand-voice-enforcement` | "write an email", "draft copy", "content with brand voice" | Apply brand guidelines to any content — tone, voice, style enforcement |

---

## VI. Quality & Testing

| Skill | Trigger | What It Does |
|-------|---------|-------------|
| `qa` | "test this", "find bugs", "QA the site" | Systematic browser QA + iterative fixes — test → fix → verify loop |
| `qa-only` | "report bugs", "QA report", "test but don't fix" | QA report only — health score, screenshots, repro steps, no fixes |
| `benchmark` | "performance", "page speed", "lighthouse", "web vitals" | Performance regression detection — baselines, before/after comparison |
| `canary` | "monitor deploy", "post-deploy check", "watch for errors" | Post-deploy canary monitoring — console errors, regressions, anomalies |
| `browse` | "open the site", "test this URL", "navigate to" | Fast headless browser — navigate, interact, screenshot, diff, assert |
| `setup-browser-cookies` | "import cookies", "login to the site", "authenticate browser" | Import real browser cookies into headless session for auth testing |
| `open-gstack-browser` | "open gstack browser", "launch browser with sidebar" | Launch headed Chromium with AI sidebar extension |

---

## VII. Shipping & Deployment

| Skill | Trigger | What It Does |
|-------|---------|-------------|
| `ship` | "ship this", "deploy", "push", "create PR" | Full ship workflow — merge base, tests, diff review, VERSION bump, CHANGELOG, PR |
| `land-and-deploy` | "merge", "land", "deploy to production" | Merge PR, wait for CI, verify prod health via canary |
| `github` | "git workflow", "branch strategy", "PR management" | Git/GitHub — draft PRs, squash merging, Graphite-style dev |
| `document-release` | "update docs after ship", "sync documentation" | Post-ship docs update — README, ARCHITECTURE, CHANGELOG voice, TODOs |
| `retro` | "weekly retro", "what did we ship", "retrospective" | Weekly engineering retro — commit history, patterns, per-person breakdowns |
| `autoplan` | "run all reviews", "full review pipeline" | Auto-runs CEO, design, eng, and DX reviews with 6 decision principles |

---

## VIII. Safety & Guardrails

| Skill | Trigger | What It Does |
|-------|---------|-------------|
| `careful` | "safety mode", "be careful", "destructive command" | Warns before rm -rf, DROP TABLE, force-push, reset --hard, kubectl delete |
| `guard` | "full safety", "lock it down", "careful + freeze" | Combines /careful (destructive warnings) + /freeze (directory scoping) |
| `freeze` | "freeze edits", "only edit this folder", "restrict to" | Restrict file edits to a specific directory for the session |
| `unfreeze` | "unfreeze", "allow all edits", "remove freeze" | Clear the freeze boundary |
| `cso` | "security audit", "threat modeling", "OWASP scan" | Infrastructure security audit — secrets, supply chain, CI/CD, LLM security |

---

## IX. State & Memory

| Skill | Trigger | What It Does |
|-------|---------|-------------|
| `checkpoint` | "save progress", "checkpoint", "resume", "where was I" | Save working state — git state, decisions, remaining work → resume across resets |
| `learn` | "what have we learned", "show learnings", "prune stale learnings" | Manage project learnings — review, search, prune, export from learnings.jsonl |
| `last30days-nux` | Memory layer: research saved to ~/Documents/Last30Days/ | Research briefings persisted across sessions |

---

## X. Third-Party / Plugin Skills

| Skill | Source | What It Does |
|-------|--------|-------------|
| `ui-ux-pro-max` | NextLevelBuilder | Design intelligence — 67 UI styles, 161 palettes, 57 font pairings, 99 UX guidelines, 25 chart types |
| `openclaw` | thedotmack | OpenClaw agent framework integration |

---

## XI. Meta Skills

| Skill | Trigger | What It Does |
|-------|---------|-------------|
| `gstack-upgrade` | "upgrade gstack", "update gstack" | Upgrade gstack to latest version |
| `setup-deploy` | "configure deployment", "set up deploy" | Configure deployment settings for land-and-deploy |

---

## XII. Solo Founder Skills (Tier 1 — Critical)

> Skills for founders in the first 0-6 months. Customer discovery, PMF, fundraising, financial survival.

| Skill | Trigger | What It Does |
|-------|---------|-------------|
| `user-interview` | "talk to users", "customer discovery", "JTBD interviews" | Screener → interview script → synthesis → pattern aggregation using Jobs-to-be-Done format |
| `pmf-pulse` | "do we have PMF", "product-market fit", "should we keep building" | Sean Ellis survey + retention curve + churn pattern analysis → PMF score report |
| `pitch-deck` | "build a pitch deck", "investor presentation", "raise funding" | Narrative-first pitch deck: 10-slide structure, each slide answers one investor question |
| `investor-update` | "monthly investor update", "write to investors", "advisor update" | 250-word monthly update template — metrics table, highlights, lowlights, specific ask |
| `runway` | "how long do I have", "burn rate", "runway calculation" | Burn rate + 3 runway scenarios + fundraising trigger date + default alive check |

---

## XIII. Solo Founder Skills (Tier 2 — Growth)

> Skills for founders getting first customers and building repeatable processes.

| Skill | Trigger | What It Does |
|-------|---------|-------------|
| `launch-strategy` | "launch this product", "go to market", "Product Hunt", "Show HN" | Full launch plan: channel selection, pre-launch checklist, day-of playbook by channel |
| `sales-playbook` | "close more customers", "first 10 customers", "build a sales process" | ICP definition, cold outreach templates, demo flow, objection handling, pipeline tracker |
| `pricing-strategy` | "how should I price this", "pricing page", "am I underpriced" | Competitor research, value-based pricing calc, 3-tier page copy, validation experiment |
| `growth-experiment` | "growth experiment", "test this channel", "acquisition ideas" | Hypothesis → ICE prioritization → run → results → patterns across AARRR funnel |
| `legal-basics` | "legal basics", "incorporation", "contracts", "equity paperwork" | Incorporation checklist, IP assignment, contractor agreements, SAFE vs priced round |

---

## XIV. Solo Founder Skills (Tier 3 — Scale)

> Skills for founders building for the long term: equity, hiring, content, and operating cadence.

| Skill | Trigger | What It Does |
|-------|---------|-------------|
| `cap-table` | "cap table", "equity model", "dilution", "SAFE conversion" | Founder equity, round dilution modeling, SAFE conversion math, option pool planning |
| `first-hire` | "first hire", "hiring process", "employee #1", "how to hire" | Role definition, sourcing strategy, interview rubric, equity offer, 30-day onboarding |
| `content-machine` | "content strategy", "build in public", "SEO content", "newsletter" | Pillar → derivatives → social → SEO cluster → content calendar → build-in-public templates |
| `demo-script` | "product demo", "demo script", "show the product", "demo video" | Hook → aha moment → proof → CTA for 5-min demos, sales calls, or launch videos |
| `decision-journal` | "log this decision", "decision journal", "decision review" | Log decisions with alternatives + reasoning → monthly review → quarterly pattern analysis |
| `founder-rhythm` | "weekly plan", "monthly review", "founder cadence", "operating rhythm" | Weekly (Mon plan / Fri retro) + monthly (metrics + investor update) + quarterly direction check |

---

## Skill Counts

| Category | Count |
|----------|-------|
| Strategy & Product | 8 |
| Research & Intelligence | 5 |
| Planning & Documentation | 3 |
| Engineering & Architecture | 9 |
| Design & Frontend | 7 |
| Quality & Testing | 7 |
| Shipping & Deployment | 6 |
| Safety & Guardrails | 5 |
| State & Memory | 3 |
| Third-Party Plugins | 2 |
| Meta | 2 |
| Solo Founder — Tier 1 (Critical) | 5 |
| Solo Founder — Tier 2 (Growth) | 5 |
| Solo Founder — Tier 3 (Scale) | 6 |
| **Total** | **73** |
