# /pmf-pulse — Product-Market Fit Measurement

Answers "do we have PMF yet?" with data, not vibes. Combines the Sean Ellis PMF survey,
retention cohort analysis, and churn pattern investigation into a single PMF score.

Most founders confuse activity for fit. This skill finds the signal.

**Use when:**
- You have 50+ users/customers and want to know if you have something real
- Growth has stalled and you need to diagnose why
- Before raising a Series A (investors will ask about PMF signal)
- Monthly as a health check after initial traction

---

## The PMF Score Framework

Three inputs. Each tells you something different.

| Signal | Question | Strong PMF |
|--------|----------|------------|
| Disappointment score | "How would you feel if you could no longer use [product]?" | >40% say "very disappointed" |
| Retention curve | Do cohorts flatten, or do they go to zero? | Cohort retains 20%+ at week 8 |
| Churn reasons | Why do users leave? | Leaving for "built it myself" > "didn't need it" |

---

## Phase 0: Gather Context

```bash
cat COMPANY.md 2>/dev/null | head -30
ls .thoughts/research/ 2>/dev/null
```

Ask the user:
- "How many active users/customers do you have?"
- "Do you have any retention data (signup date, last active date)?"
- "Have you collected any user feedback or exit surveys?"

If fewer than 50 users: "PMF measurement at this stage produces noise, not signal.
Focus on `/user-interview` first — get to 50 users who use the product regularly, then run /pmf-pulse."

---

## Phase 1: Disappointment Survey

Generate the Sean Ellis survey for the user to send to their active users.

**Who to send it to:** Users who have used the product at least twice in the last 2 weeks.
Sending to all users (including one-time trialists) will dilute your score.

**The four questions:**

```
1. How would you feel if you could no longer use [product]?
   ○ Very disappointed
   ○ Somewhat disappointed
   ○ Not disappointed (it really isn't that useful)
   ○ N/A — I no longer use [product]

2. What type of person do you think would most benefit from [product]?
   [open text]

3. What is the main benefit you receive from [product]?
   [open text]

4. How can we improve [product] for you?
   [open text]
```

**Interpreting results:**
- **>40% "very disappointed"** = strong PMF signal. Focus on growth.
- **25-40%** = weak PMF. You have something, but it's not tight enough. Find the segment within your users who score highest and double down on them.
- **<25%** = no PMF yet. Don't accelerate. Go back to discovery.

**The hidden gold is in questions 2 and 3.** The "very disappointed" users' answers
to Q2 and Q3 become your ICP description and your copy. They know exactly who you're
for and what you do better than you do.

**Output to `.thoughts/research/pmf-survey-[date].md`** with the survey template
and an interpretation guide.

---

## Phase 2: Retention Curve Analysis

If the user has signup dates and last-active dates, generate a cohort retention table.

Ask the user to provide (or export from their analytics tool):
```
user_id, signup_date, last_active_date (or activity by week)
```

Calculate week-by-week retention by cohort. Look for:
- **The curve flattening** — any flat bottom > 0% means retained users exist
- **The depth of the flat** — 20%+ at week 8 is strong; 5% is weak
- **Cohort improvement** — are later cohorts retaining better? That's learning.

**Plot the curve conceptually:**
```
Week:    0    1    2    3    4    8    12
Cohort 1: 100% 60%  40%  30%  25%  20%  20%  ← PMF signal (flattened)
Cohort 2: 100% 55%  35%  25%  20%  18%  —    ← Similar (healthy)
Cohort 3: 100% 40%  25%  15%  10%   5%  2%   ← No PMF (going to zero)
```

**Key question:** Does the retention curve flatten, or does it trend to zero?

If it trends to zero, you don't have PMF — you have a leaky bucket. No amount of
acquisition fixes a retention curve going to zero.

---

## Phase 3: Churn Investigation

For users who left (or churned from paid), look for patterns in WHY they left.

Ask the user if they have any exit data. If not, generate a 3-question exit survey:

```
1. Why did you stop using [product]?
   ○ Solved my problem / built my own solution
   ○ Too expensive
   ○ Missing features I need
   ○ Found a better alternative ([please name it])
   ○ Just got busy / ran out of time
   ○ Other: ___

2. What would have made you stay?
   [open text]

3. Would you recommend us to someone else even though you left?
   ○ Yes  ○ No
```

**Interpreting churn reasons:**

| Churn reason | What it means |
|-------------|--------------|
| "Solved my problem / built my own" | Strong PMF signal — they valued it enough to replicate it |
| "Missing features" | Pre-PMF — wrong market or wrong product |
| "Too expensive" | PMF exists but pricing is wrong |
| "Found a better alternative" | You have real competition — get specifics on what they switched to |
| "Just got busy" | Engagement problem, not value problem |

---

## Phase 4: PMF Score Report

Generate a single report combining all three signals.

**Output to `.thoughts/research/pmf-report-[date].md`:**

```markdown
## PMF Report — [Company] — [Date]

### PMF Score: [STRONG / WEAK / NOT YET]

### Signal 1: Disappointment Score
- Survey responses: [N]
- "Very disappointed": [X]%
- Verdict: [Strong >40% / Weak 25-40% / No PMF <25%]
- Key insight from Q2+Q3: [who they say benefits + what the main benefit is]

### Signal 2: Retention
- Cohorts analyzed: [N]
- Week 8 retention: [X]%
- Curve shape: [Flattening / Declining to zero]
- Verdict: [Strong / Weak / No signal yet]

### Signal 3: Churn Patterns
- Most common reason: [reason]
- Verdict: [PMF signal / Concern / Neutral]

### Recommended Action
[STRONG PMF]: Accelerate acquisition. Don't change the core. Focus on removing friction.
[WEAK PMF]:   Find the segment within your users who love it. Build for them exclusively.
              Survey users who said "very disappointed" — who are they? Build more of that.
[NO PMF]:     Stop adding features. Do 20 more user interviews. Return to first principles.

### The Segment That Loves You
[Description of the "very disappointed" users — who they are, what job they're hiring you for]
```

---

## Chains With

- `/user-interview` — run before pmf-pulse to generate the users to survey
- `/write-brief` — turn the PMF report into an investor narrative
- `/founder-rhythm` — run pmf-pulse monthly as part of the monthly rhythm
