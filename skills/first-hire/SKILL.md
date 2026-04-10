# /first-hire — First Employee Hiring Process

Structured process for a solo founder's first hire: role definition, sourcing strategy,
interview rubric, equity offer structure, and 30-day onboarding plan.

The first hire is the hardest and most consequential. Get it wrong and you've added complexity
without leverage. Get it right and everything after gets easier.

**Use when:**
- You're ready to hire your first full-time person
- You have runway for 12+ months including the hire
- You have too much high-leverage work for one person (you're the bottleneck)
- You want to stop being the bottleneck before you are

---

## Phase 0: Should You Hire Now?

Before writing a job description, answer these honestly:

```markdown
## Hiring Readiness Check

[ ] I have 12+ months of runway including this hire's salary
[ ] I've identified a specific, high-leverage job to be done (not "general help")
[ ] I've tried to automate this before hiring for it
[ ] I have at least 40 hours of work/week for this person
[ ] I know what "great" looks like in this role
[ ] I'm willing to spend 20% of my time managing and unblocking this person
```

If any of these is unchecked, pause and resolve it first.

The most common hiring mistake: hiring too early for a role you don't understand well enough
to manage. Your first hire will have questions. If you don't know the answers, they'll flounder.

---

## Phase 1: Role Definition

**Anti-pattern:** "Looking for a generalist who can wear many hats."
This is a description of what YOU need, not what THEY'll be hired to do.

Generate a clear role definition:

```markdown
## Role Definition: [Title]

### The Job in One Sentence
"This person's job is to [do what specific thing] so that [what outcome is unlocked]."

### What They Own
- [Outcome 1]: They are responsible for [specific deliverable/metric]
- [Outcome 2]: They own [specific area] end-to-end
- [Outcome 3]: They make decisions about [specific domain] without asking me

### What They DON'T Own (important)
- [Area 1]: Still owned by the founder
- [Area 2]: Will hire for this separately later

### Success Metric at 90 Days
"In 90 days, I will know this hire worked if [specific, measurable outcome]."

### Required Skills (non-negotiable)
- [Skill 1]: Must have — can't train for this
- [Skill 2]: Must have

### Nice to Have Skills
- [Skill 1]: Helpful but trainable

### Red Flags (automatic disqualifiers)
- [Flag 1]: e.g., "can't work without detailed direction"
- [Flag 2]: e.g., "has never worked in an early-stage company"
```

---

## Phase 2: Sourcing Strategy

**Where to find your first hire (by type):**

| Role | Best sources |
|------|-------------|
| First engineer | Your GitHub network, HN Who's Hiring, Wellfound (AngelList), referrals from investors |
| First salesperson | LinkedIn (look for people at companies like yours), your investor network, YC job board |
| First product/design | Dribbble, Twitter/X design community, Readymag, Figma community |
| Operations/EA | LinkedIn, your personal network, referrals from other founders |

**The referral-first approach:**
Before posting anywhere: message 10-20 people in your network with:
```
"I'm hiring my first [role] at [company].
We do [one sentence].
Looking for someone who [2-3 specific traits].
Know anyone who'd be great? Happy to pay a finder's fee if they join."
```

Referrals close faster, onboard better, and leave less often. Use them first.

---

## Phase 3: Interview Rubric

**The structured interview: 4 dimensions, consistent scoring**

```markdown
## Interview Rubric: [Role]

### Dimension 1: Can they do the job? (30% weight)
Sample question: "Tell me about a time you [did the core job function]. Walk me through
what you did, what went wrong, and what you'd do differently."

Look for: Specificity. Ownership. Learning.
Score: 1-5

### Dimension 2: Will they thrive in a scrappy environment? (30% weight)
Sample question: "Tell me about a time you had to figure something out completely on your own
without a clear process or playbook. What happened?"

Look for: Self-direction, comfort with ambiguity, action orientation.
Score: 1-5

### Dimension 3: Will they communicate well? (20% weight)
[Observed throughout the interview — are they clear? Do they answer the question asked?]

Score: 1-5

### Dimension 4: Values + culture fit (20% weight)
Sample question: "What did you like most about your last role? What would you change?"

Look for: What they value vs what you value. Do they care about users?
Score: 1-5

### Scoring
20-25: Strong hire — move fast
15-19: Possible hire — probe the low dimension in a second conversation
< 15: Pass — don't hire hoping they'll grow into it
```

**The reference check question that actually works:**
"On a scale of 1-10, how strong a performer was [name]?"
If they say 8: "What would make them a 10?"
If they can't answer clearly → they're protecting the candidate.

---

## Phase 4: Equity Offer Structure

**Equity benchmarks for first hires:**

| Role | Stage | Equity |
|------|-------|--------|
| CTO / First engineer (co-founder level) | Pre-seed | 2-5% |
| First engineer (employee level) | Pre-seed | 0.5-2% |
| First salesperson | Pre-seed | 0.25-1% |
| First product/design | Pre-seed | 0.25-1% |
| Operations / EA | Pre-seed | 0.1-0.25% |

**The offer template:**

```markdown
## Offer: [Name] — [Role]

Salary: $[X]/year
Equity: [X]% ([N] options) vesting over 4 years with 1-year cliff
Start date: [date]

Strike price: $[X] (current 409A valuation)
Exercise window: [90 days post-departure / 10 years / extended exercise]
```

**The extended exercise window:**
Standard exercise windows are 90 days after leaving. This means employees often can't exercise
(can't afford the tax bill). Offering a 5-10 year exercise window is one of the best
no-cost things you can do for early employees. It signals you trust them.

---

## Phase 5: 30-Day Onboarding Plan

**Week 1: Context**
- Day 1: Company story, mission, product demo, introduce to all stakeholders
- Day 2-3: Read everything — COMPANY.md, customer interviews, existing docs
- Day 4-5: Shadow the founder on calls; ask no questions, just observe

**Week 2: Tools + First Contribution**
- Set up all tools and access
- One small, completeable task that ships
- Daily 15-min check-in (decreases to weekly after month 1)

**Week 3-4: Real Work**
- First real project with clear success criteria
- They own the outcome, you're available for questions
- Friday: structured feedback on what's going well / what to change

**30-day review:**
```
"In your first 30 days:
- What's worked well?
- What's unclear or missing?
- What would have made the first month better?
- What are you most excited to do in month 2?"
```

---

## Output

**Save to `.thoughts/hiring/[role]-hire-[date].md`** with:
- Role definition
- Job posting draft (generated from role definition)
- Interview rubric
- Offer structure
- 30-day onboarding plan

**Chains with:**
- `/cap-table` — model the equity grant's dilution impact
- `/legal-basics` — employment contract, IP assignment, offer letter template
- `/runway` — verify you can afford this hire for 12 months
