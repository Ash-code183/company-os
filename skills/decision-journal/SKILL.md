# /decision-journal — Founder Decision Log

Logs important decisions with context, alternatives considered, and the reasoning.
Reads back at retro time. Builds a searchable decision history that compounds over time.

The most important thing a founder can do to improve their decision quality is review their
past decisions. You can't do that without a record.

**Use when:**
- About to make a significant decision (hire, pivot, pricing change, fundraise timing)
- After a major decision with uncertain outcome
- Wire to `/founder-rhythm` for weekly quick capture
- Monthly review: look back at last month's decisions, score them in hindsight

---

## Phase 0: Setup

```bash
mkdir -p .thoughts/decisions/
ls .thoughts/decisions/ 2>/dev/null | head -20
```

Ask which mode:
1. **Log a new decision** — capture a decision you're about to make or just made
2. **Review past decisions** — look back at prior decisions and score them
3. **Search decisions** — find all decisions about a specific topic

---

## Phase 1: Log a New Decision

**The decision entry template:**

```markdown
## Decision: [Short title]
**Date:** [date]
**Category:** [Hire / Product / Strategy / Fundraise / Partnership / Pivot / Operations]
**Urgency:** [1-10 — how time-pressured was this?]
**Reversibility:** [Easy / Hard / Irreversible]

### The Question
[What decision are you making? One sentence.]

### Context
[2-4 sentences of background. What situation led to this decision?]

### Options Considered
1. **[Option A]** — [brief description]
   Pros: [main advantages]
   Cons: [main disadvantages]

2. **[Option B]** — [brief description]
   Pros: [main advantages]
   Cons: [main disadvantages]

3. **[Option C — status quo / do nothing]**
   Pros: [main advantages]
   Cons: [main disadvantages]

### Decision Made
**[Which option]**

### Reasoning
[3-5 sentences on WHY you chose this. What was the deciding factor?]

### Key Assumptions
[What would have to be true for this decision to work out?]
1. [Assumption 1]
2. [Assumption 2]

### Expected Outcome
[What do you expect to happen in 30 / 90 / 180 days as a result of this decision?]

### Review Date
[When will you look back at this? Set a reminder.]

---
Status: [PENDING / PLAYED OUT WELL / PLAYED OUT POORLY / TOO EARLY TO TELL]
```

**Save to `.thoughts/decisions/[YYYY-MM-DD]-[short-title].md`**

---

## Phase 2: Decision Review (Monthly)

At the start of each month, review the prior month's decisions.

For each decision logged last month:

```markdown
## Decision Review: [Decision title]
**Original date:** [date]  **Review date:** [today]

### What Actually Happened
[2-3 sentences on the actual outcome vs expected]

### Was the decision right?
[GOOD DECISION / BAD DECISION / TOO EARLY TO TELL]

Note: A good decision can have a bad outcome (bad luck). A bad decision can have
a good outcome (good luck). Score the PROCESS, not just the result.

Was the reasoning sound? Were the assumptions reasonable given what you knew at the time?

### What I'd Do Differently
[If anything. If it was a good decision with a bad outcome: what was the unlucky element?]

### Pattern (if any)
[If this connects to a prior decision or reveals a bias]

### Updated Status
PLAYED OUT WELL / PLAYED OUT POORLY / TOO EARLY TO TELL
```

---

## Phase 3: Decision Patterns (Quarterly)

After 20+ decisions logged, look for patterns.

Run a quarterly analysis:

**Questions to answer:**
1. Which category of decisions am I getting right most often?
2. Which category am I getting wrong most often?
3. Are my assumptions systematically optimistic or pessimistic?
4. Do I decide too fast or too slow? (urgency score vs actual need for urgency)
5. Am I reversing decisions too often or too rarely?

**Common founder decision biases to look for:**
- **Optimism bias** — assuming things will go better than they do
- **Availability bias** — overweighting the most recent or vivid example
- **Sunk cost fallacy** — not reversing bad decisions because of prior investment
- **Analysis paralysis** — treating reversible decisions as irreversible
- **Social proof** — deciding what other founders do rather than what's right for you

---

## The Key Insight About Decision Journals

Most decisions feel obvious in hindsight. The decision journal captures the uncertainty
at the time of decision, which is the only honest record of whether your reasoning was good.

Two decisions made the same way (sound reasoning, good information) can have
completely different outcomes. The journal lets you evaluate the quality of your
reasoning separately from the outcome.

Founders who review decisions monthly for 12+ months consistently report two improvements:
1. They make fewer of the same type of mistake twice
2. They become more comfortable making high-stakes decisions faster

---

## Output

**Save individual decisions to `.thoughts/decisions/[YYYY-MM-DD]-[title].md`**
**Save quarterly analysis to `.thoughts/decisions/quarterly-review-[Q]-[year].md`**

**Chains with:**
- `/founder-rhythm` — weekly quick capture in the Friday rhythm
- `/investor-update` — major decisions often belong in the lowlights section
- `/retro` — decision review is part of the weekly retro
