# /founder-rhythm — Solo Founder Operating Cadence

Runs the weekly, monthly, and quarterly rhythm that keeps a solo founder focused,
sane, and compounding. No team means no natural forcing functions — this creates them.

**Use when:**
- Monday morning (weekly plan)
- Friday afternoon (weekly retro)
- First day of the month (monthly review + investor update)
- First day of the quarter (quarterly direction-setting)

---

## The Three Cadences

```
Weekly (30 min)
  └── Monday: Priorities for the week
  └── Friday: What shipped, what I learned, quick decision log

Monthly (90 min)
  └── Metrics review
  └── PMF pulse check
  └── Runway update
  └── Investor update draft
  └── Content planning

Quarterly (half day)
  └── Direction check — am I working on the right things?
  └── Decision journal review
  └── Network + relationship audit
  └── Personal + company health check
```

---

## Mode: Weekly Plan (Monday)

**Run:** `/founder-rhythm --mode=week-plan`

```bash
cat COMPANY.md 2>/dev/null | head -10
ls .thoughts/decisions/ 2>/dev/null | tail -3
```

Ask:
1. "What's the #1 thing that would make this week a success?"
2. "What are you procrastinating on that actually matters?"

**Generate the weekly plan:**

```markdown
## Week of [date]

### This Week's North Star
[ONE goal — if only this happens, the week was worth it]

### The Three
[Maximum 3 priorities. If you have 10, you have 0.]

1. **[Priority 1]** — [why this week, not next week]
2. **[Priority 2]** — [estimated hours]
3. **[Priority 3]** — [estimated hours]

### Scheduled
- [ ] [Meetings / calls — with prep time blocked before each]
- [ ] [Recurring commitments]

### Protect
- Deep work block: [time] to [time] — no meetings, no Slack
- [Other non-negotiable personal time]

### What I'm Putting Off Until Next Week
[Things that feel urgent but aren't — explicitly choosing to ignore them this week]
```

**Save to `.thoughts/weekly/[YYYY-MM-DD]-week-plan.md`**

---

## Mode: Weekly Retro (Friday)

**Run:** `/founder-rhythm --mode=week-retro`

```bash
ls .thoughts/weekly/ 2>/dev/null | tail -1
```

Read this week's plan first, then fill in the retro:

```markdown
## Week Retro: [date]

### North Star: [achieved / partially / not achieved]
[2 sentences on why]

### Priority Check
1. [Priority 1] — [DONE / PARTIAL / SKIPPED] — [why]
2. [Priority 2] — [DONE / PARTIAL / SKIPPED] — [why]
3. [Priority 3] — [DONE / PARTIAL / SKIPPED] — [why]

### What Shipped
[Concrete outputs — not effort, not progress. Things that shipped.]

### What Surprised Me
[One thing you didn't expect this week]

### Quick Decision Log
[Any significant decision made this week — 2-3 sentences, link to full decision journal if needed]

### Energy Check (1-10)
[1=exhausted, 10=on fire]
If < 6: [what's draining you?]
If < 4: [schedule recovery time, this is a signal]

### Next Week's Bet
[ONE thing you'll do differently next week based on this week's learning]
```

**Save to `.thoughts/weekly/[YYYY-MM-DD]-week-retro.md`**

---

## Mode: Monthly Review

**Run:** `/founder-rhythm --mode=monthly`

**Automatically chains to:**
- `/runway` — update burn rate and runway
- `/pmf-pulse` — check PMF signal (if 50+ users)
- `/investor-update` — draft monthly investor update
- Content planning for next month

**Generate the monthly dashboard:**

```markdown
## Monthly Review: [Month Year]

### Company Health Dashboard

| Metric | This Month | Last Month | Trend |
|--------|-----------|------------|-------|
| [Primary KPI] | [N] | [N] | [↑↓→] |
| MRR/ARR | $[N] | $[N] | [↑↓→] |
| Active users | [N] | [N] | [↑↓→] |
| Net burn | $[N] | $[N] | [↑↓→] |
| Runway | [N] mo | [N] mo | [↑↓→] |

### This Month's Wins (top 3)
1. [Win 1 — specific and measurable]
2. [Win 2]
3. [Win 3]

### This Month's Misses (top 3, honest)
1. [Miss 1 — what happened and why]
2. [Miss 2]
3. [Miss 3]

### Key Decisions Made
[Link to any decision journal entries from this month]

### Pattern From This Month
[One meta-observation about how the month went]

### Next Month's North Star
[ONE focus for next month]
```

**Save to `.thoughts/monthly/[YYYY-MM]-review.md`**
Then run `/investor-update` using this review as input.

---

## Mode: Quarterly Direction

**Run:** `/founder-rhythm --mode=quarterly`

**The quarterly check takes a half day — block it on the calendar.**

**Part 1: Direction Check (60 min)**

```markdown
## Quarterly Direction Check: [Q] [Year]

### Am I Working on the Right Things?

The three most important questions:
1. What is the single most important problem for this company right now?
2. Am I (the founder) the right person to be solving it, or should I hire/delegate?
3. Is my weekly/monthly work actually moving this problem?

### Evidence-Based Answers
[Pull from 3 months of weekly plans and retros]

### What I'm Stopping
[What worked last quarter but shouldn't be your job this quarter]

### What I'm Starting
[What you've been avoiding but needs to start this quarter]
```

**Part 2: Network Audit (30 min)**

```markdown
### Relationship Audit

Key relationships to invest in this quarter:
| Person | Why they matter | Last meaningful touch | Action |
|--------|----------------|----------------------|--------|
| [investor] | [why] | [date] | [update / coffee / intro ask] |
| [advisor] | [why] | [date] | [advice needed on X] |
| [potential customer] | [why] | [date] | [follow up on Y] |
| [potential hire] | [why] | [date] | [keep warm] |
```

**Part 3: Personal Health Check (30 min)**

Solo founders burn out quietly. Check in honestly:

```markdown
### Founder Health

Energy: [1-10]
Clarity: [1-10] (do I know what I'm doing and why?)
Momentum: [1-10] (does it feel like things are moving?)
Relationships: [1-10] (am I isolated or connected?)

If any score < 5:
- [Energy] < 5: Schedule a proper break. Not a "work from a café" break.
- [Clarity] < 5: Run /frame-problem — something is unclear about the path.
- [Momentum] < 5: Run /pmf-pulse — is the product stuck or is this temporary?
- [Relationships] < 5: Reach out to 3 people this week who aren't vendors or investors.
```

---

## The Meta-Rule

This rhythm works because it creates **forcing functions** that a solo founder doesn't
get naturally from a team.

A weekly plan forces you to choose. The Friday retro forces you to be honest.
The monthly review forces you to look at the numbers. The quarterly check forces
you to zoom out before the tactics consume everything.

Each session takes 30 minutes or less (except quarterly). The ROI is 10x.

**Chains with all skill tools:**
- `/decision-journal` — Friday retro feeds the decision log
- `/investor-update` — Monthly review generates the update
- `/pmf-pulse` — Monthly cadence
- `/runway` — Monthly cadence
- `/growth-experiment` — Review experiment results monthly
