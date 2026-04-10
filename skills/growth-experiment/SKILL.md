# /growth-experiment — Growth Experiment Tracker

Structured growth experiment log: hypothesis → metric → run → result → decision.
Prevents the common trap of trying 20 things with no learning between them.

**Use when:**
- Starting any growth initiative (acquisition, retention, activation, referral)
- After a launch that underperformed
- When you want to try a new channel but aren't sure it'll work
- Monthly as part of `/founder-rhythm` review

---

## Phase 0: Current Growth Audit

```bash
ls .thoughts/growth/ 2>/dev/null
```

Read prior experiments if any exist. Ask:
1. "What growth experiments have you already tried?"
2. "What's your primary growth bottleneck right now? (Acquisition / Activation / Retention / Revenue / Referral)"
3. "What's your current volume? (signups/week, active users, revenue)"

---

## Phase 1: Experiment Design

The most important part. A poorly designed experiment teaches nothing.

**The experiment template:**

```markdown
## Growth Experiment #[N]: [Name]

**Date:** [start date]
**Owner:** [who's running it]

### Hypothesis
"We believe that [doing X] will result in [outcome] because [mechanism]."

Example: "We believe that adding a 'share your result' button after task completion
will increase referral signups by 20% because users feel pride after finishing something
and want to show others."

### AARRR Stage
[ ] Acquisition  [ ] Activation  [ ] Retention  [ ] Revenue  [ ] Referral

### Primary Metric
[The ONE number that tells you if the experiment worked]
Current baseline: [X]
Target: [Y] (+[Z]% improvement)

### Secondary Metrics (to watch for unintended effects)
- [Metric 1: watching for negative side effects]
- [Metric 2]

### Method
[Exactly what you're changing and how you're measuring it]

### Sample Size / Duration
Minimum [N] users / [N] days to reach statistical significance
Test runs: [start date] to [end date]

### Success Criteria
SHIP if: primary metric improves [X]%+ with no significant secondary regression
ITERATE if: primary metric improves [X-Y]% — something's there, refine it
KILL if: primary metric flat or worse after [N] users / [N] days
```

---

## Phase 2: Prioritization

When you have multiple experiment ideas, prioritize using the ICE framework:

| Experiment | Impact (1-10) | Confidence (1-10) | Ease (1-10) | ICE Score |
|-----------|--------------|------------------|-------------|-----------|
| [Exp A]   | 8 | 6 | 7 | 21 |
| [Exp B]   | 9 | 4 | 3 | 16 |
| [Exp C]   | 5 | 8 | 9 | 22 |

- **Impact:** If this works, how much does it move the needle? (1=trivial, 10=game-changing)
- **Confidence:** How sure are you it'll work? (1=pure guess, 10=we've seen this work elsewhere)
- **Ease:** How hard is it to run? (1=months of eng work, 10=done in an afternoon)

**Run the highest ICE score first.** Resist the urge to run the highest-impact experiment
if your confidence is low — you'll misread the results.

---

## Phase 3: Experiment Log

After the experiment runs, fill in the results:

```markdown
### Results

**Outcome:** [SHIPPED / ITERATED / KILLED]

**Actual metrics:**
- Primary metric: [before] → [after] ([+/-X]%)
- Secondary metric 1: [before] → [after]
- Secondary metric 2: [before] → [after]

**Statistical confidence:** [X]% (need >80% to trust the result)

**What we learned:**
[1-2 sentences on the actual insight — not just the number, but WHY]

**Surprises:**
[What you didn't expect to see]

**Next experiment:**
[What this result suggests you should test next]
```

---

## Phase 4: Growth Experiment Backlog

Generate and maintain a backlog in `.thoughts/growth/experiment-backlog.md`:

```markdown
## Growth Experiment Backlog

### High Priority (run next)
- [ ] [Experiment name] — ICE: [score] — Hypothesis: [one line]

### Medium Priority
- [ ] [Experiment name] — ICE: [score] — Hypothesis: [one line]

### Parking Lot (validate first)
- [ ] [Experiment name] — Need: [what you need to validate before running]
```

---

## The 5 Growth Levers (AARRR)

For each lever, generate one experiment idea specific to the user's product:

**Acquisition** — How do new users find you?
Ideas: SEO content, Product Hunt, cold email, partnerships, community presence

**Activation** — Do new users reach the "aha moment"?
Ideas: Onboarding flow shortcut, time-to-value reduction, activation milestone email

**Retention** — Do activated users keep coming back?
Ideas: Habit hooks, email cadence, power user feature, usage milestones

**Revenue** — Do retained users pay more over time?
Ideas: Usage-based upsell trigger, expansion email, annual conversion campaign

**Referral** — Do happy users bring new users?
Ideas: Share mechanic, referral program, user-generated content hook

---

## Output

**Save to `.thoughts/growth/experiment-[N]-[name]-[date].md`**

After 5+ experiments, run a synthesis:
- What patterns hold across successful experiments?
- Which channels have the best signal?
- What's the one thing that keeps working?

**Chains with:**
- `/pmf-pulse` — retention experiments work differently pre vs post PMF
- `/founder-rhythm` — review experiment results monthly
- `/launch-strategy` — launch experiments are growth experiments
