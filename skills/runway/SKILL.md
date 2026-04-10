# /runway — Burn Rate & Runway Calculator

Answers the most important financial question for early-stage founders: how long do I have?
Calculates burn rate, projects runway under 3 scenarios, and tells you when to start fundraising
based on actual raise timelines.

**Use when:**
- Monthly as a financial health check
- Before making any significant spending decision (hire, tool, office)
- When starting to think about fundraising
- Wire to `/founder-rhythm --mode=monthly`

---

## Phase 0: Load Financial Context

Ask the user to provide (or share from their bank/accounting tool):

**Monthly expenses — current:**
```
Salaries/contractors: $[N]
Infrastructure (AWS, hosting, etc.): $[N]
SaaS tools (Notion, Figma, Linear, etc.): $[N]
Marketing/paid ads: $[N]
Office/coworking: $[N]
Legal/accounting: $[N]
Other: $[N]
```

**Current cash position:**
```
Cash in bank: $[N]
Any incoming (signed contracts, receivables): $[N]
Monthly revenue (if any): $[N]
```

If the user doesn't have exact numbers, help them estimate. Better a rough estimate
than no model. Ask: "Walk me through your biggest 3 monthly expenses."

---

## Phase 1: Burn Rate Calculation

Calculate:

**Gross burn** = all money going out per month (total expenses)
**Net burn** = gross burn minus revenue
**Runway** = current cash ÷ net burn

Show the current state clearly:

```
CURRENT FINANCIAL STATE
━━━━━━━━━━━━━━━━━━━━━━━
Gross burn:    $[X]/month
Monthly revenue: $[X]/month
Net burn:      $[X]/month

Cash on hand:  $[X]
Runway:        [N] months (until [date])
```

---

## Phase 2: Scenario Modeling

Generate three scenarios. Ask the user if any planned changes are upcoming
(hiring, cutting costs, new revenue contracts) before running scenarios.

### Scenario A: Conservative (things get harder)
Assumptions:
- Revenue stays flat or grows 5% MoM
- Add one key expense (engineer hire, bigger server costs)
- No fundraise closes

Runway: [N] months until [date]

### Scenario B: Base Case (current trajectory)
Assumptions:
- Revenue grows at current rate
- Expenses as currently planned
- No fundraise closes

Runway: [N] months until [date]

### Scenario C: Optimistic (things break well)
Assumptions:
- Revenue grows at 15-20% MoM
- No new expenses
- No fundraise closes

Runway: [N] months until [date]

**Show as a simple table:**

```
RUNWAY SCENARIOS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Scenario       Net Burn/mo    Runway    Date
─────────────────────────────────────────────
Conservative   $[X]           [N] mo    [date]
Base Case      $[X]           [N] mo    [date]
Optimistic     $[X]           [N] mo    [date]
```

---

## Phase 3: Fundraising Trigger

The single most important output of this skill: **when should you start fundraising?**

Rules of thumb for raise timelines:
- Pre-seed angel/friends+family: 1-3 months
- Pre-seed VC ($500K-$2M): 3-6 months
- Seed ($1M-$5M): 4-8 months
- Series A ($5M+): 6-12 months

**The math:**
Start fundraising when: `current runway > (raise timeline × 2)`

You need 2x the expected raise timeline because:
1. The first half of your raise happens before you have momentum
2. Due diligence takes longer than anyone expects
3. You need time to keep the company running while raising

**Calculate and display:**

```
FUNDRAISING READINESS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Current runway:          [N] months
Estimated raise timeline: [N] months
Safety buffer (2x):       [N] months

START FUNDRAISING BY: [date]
(Latest safe start: [date - 30 days])
```

**Flags:**
- If `runway < 6 months`: 🔴 URGENT — start fundraising now or cut burn immediately
- If `runway 6-12 months`: 🟡 WARNING — start fundraising prep now
- If `runway > 12 months`: 🟢 HEALTHY — focus on hitting milestones before raising

---

## Phase 4: Default Alive Check

Paul Graham's "default alive" question: if your company keeps growing at its current rate
with current expenses, will it reach profitability before running out of money?

Calculate:
- Monthly revenue growth rate (if applicable)
- Months until revenue covers net burn (the "default alive" date)

```
DEFAULT ALIVE ANALYSIS
━━━━━━━━━━━━━━━━━━━━━━
Revenue growth rate:   [X]% MoM
Current net burn:      $[X]/month
Break-even at:         $[X] MRR

At [X]% MoM growth:
Reach break-even in:   [N] months (on [date])
Runway lasts until:    [date]

Status: [DEFAULT ALIVE ✅ / DEFAULT DEAD ⚠️]
```

If DEFAULT DEAD with <12 months runway: flag this clearly.
The options are:
1. Cut burn (which expenses can go?)
2. Accelerate revenue (which sales can you close this month?)
3. Raise immediately

---

## Phase 5: Output & Save

**Save to `.thoughts/financial/runway-[date].md`**

```bash
mkdir -p .thoughts/financial/
```

Include:
- Current burn rate and runway (all 3 scenarios)
- Fundraising trigger date
- Default alive status
- Top 3 recommendations

**Top 3 recommendations format:**
```
1. [Most urgent action — cut this / sell to this / hire for this]
2. [Next priority]
3. [Watch this metric — leading indicator of trouble]
```

---

## The One Number

If you can only remember one thing: your runway in months.

Every spending decision, every hiring decision, every fundraising decision
flows from this single number. Keep it updated every month without fail.

Chains with:
- `/investor-update` — include runway in monthly updates
- `/founder-rhythm` — run monthly as part of the review cadence
- `/cap-table` — understand dilution before accepting terms
