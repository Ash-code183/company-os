# /sales-playbook — Repeatable B2B Sales Process

Builds the sales motion from zero: ICP definition, cold outreach, demo flow, objection handling,
and follow-up cadence. Turns ad-hoc hustle into a repeatable process.

The first 10 customers are closed by the founder with no process. The first 100 need a playbook.
This skill builds that playbook.

**Use when:**
- You have a working product and need to go from 0 → 10 customers
- You've closed a few deals but want to systematize the process
- Before hiring your first sales rep (they need a playbook to follow)
- When conversion rates are low and you don't know where the leak is

---

## Phase 0: Context

```bash
cat COMPANY.md 2>/dev/null | head -20
ls .thoughts/research/interview-*.md 2>/dev/null | tail -5
ls .thoughts/research/pmf-report-*.md 2>/dev/null | tail -1
```

Read user research and PMF data if available — the ICP definition should come from
real customer patterns, not assumptions.

Ask:
1. "Who are your current best customers? (role, company size, industry)"
2. "How did you close your first deals? (warm intro / cold outreach / inbound)"
3. "What's the average deal size?"
4. "What's the sales cycle length so far (days from first contact to close)?"
5. "What are the most common objections you hear?"

---

## Phase 1: ICP Definition

The Ideal Customer Profile is the foundation. Vague ICPs produce vague pipelines.

**Generate the ICP with:**

```markdown
## Ideal Customer Profile

### Firmographic (company traits)
- Company size: [e.g., 10-200 employees]
- Industry: [be specific — not "tech", but "B2B SaaS companies with a sales team"]
- Stage: [e.g., post-Series A, pre-Series B]
- Geography: [if relevant]
- Annual revenue: [if relevant]

### Psychographic (decision-maker traits)
- Title/role: [who buys and who uses — sometimes different people]
- Pain awareness: [do they know they have the problem? are they actively searching?]
- Budget authority: [can they buy without approval, or is there a committee?]
- Tech-savvy: [will they need extensive handholding?]

### Situation triggers (what makes them ready to buy NOW)
- [Trigger 1: e.g., "just hired their 5th salesperson and outgrew spreadsheets"]
- [Trigger 2: e.g., "recently switched CRM and need new integrations"]
- [Trigger 3: e.g., "missed a quarterly target and their VP is demanding visibility"]

### Negative ICP (who NOT to sell to)
- [Disqualifier 1: e.g., companies that have a full-time data team — they'll build their own]
- [Disqualifier 2: e.g., enterprise deals > $100K — wrong sales cycle for where we are]
```

---

## Phase 2: Cold Outreach Templates

Three types of outreach. Use based on the trigger.

### Type 1: Trigger-based (best response rate)

```
Subject: [Company] → [specific observed change]

Hi [name],

Noticed [company] just [trigger: hired X, launched Y, raised funding, announced Z].

Companies in that situation usually face [specific problem] — [one sentence why].

We help [ICP] [do job] without [the painful workaround]. [Specific customer name]
went from [before] to [after] in [timeframe].

Worth a 15-min call to see if it's relevant?

[Your name]
```

### Type 2: Insight-led (for when you have research)

```
Subject: [Insight about their industry]

Hi [name],

Quick note: [counter-intuitive insight about their space — 1 sentence].

Most [their role] I talk to handle this by [common workaround]. It works until [the point it breaks].

I've been helping [ICP description] solve this differently. Happy to share what's working
if that's useful — no pitch, just the pattern.

[Your name]
```

### Type 3: Referral (warm)

```
Subject: [Mutual connection] suggested I reach out

Hi [name],

[Mutual] mentioned you might be dealing with [problem] — they said you two recently
talked about it.

We help [ICP] [job]. [Mutual] is using us for [their use case].

15 minutes to see if it's worth exploring?

[Your name]
```

**Follow-up cadence:**
- Day 1: Initial email
- Day 4: One-line bump ("Any thoughts on this?")
- Day 8: Value add (share an insight, article, or relevant data)
- Day 15: Break-up email ("I'll stop reaching out after this — happy to reconnect when timing is better")

---

## Phase 3: Demo Script

The demo that converts answers ONE question in the prospect's mind:
"Can I picture myself using this?"

**Structure (30-minute discovery + demo):**

**Minutes 0-5: Discovery**
- "Before I show you anything — what made you agree to take this call?"
- "What are you hoping to walk away with today?"
- "Walk me through how you handle [problem] today"

*Listen. Take notes. What they say in the first 5 minutes is what you should demo.*

**Minutes 5-10: Their world + the pain**
- "How often does that [pain] happen?"
- "What does it cost you when it does?"
- "Have you tried solving this before? What happened?"

**Minutes 10-25: The demo**
- "Based on what you just told me, let me show you specifically how we handle [their pain]."
- Show THEIR use case, not the default demo
- Hit the aha moment early — don't save it for the end
- "How does this compare to how you do it today?"

**Minutes 25-30: Close or next step**
- "What would need to be true for this to be a no-brainer for you?"
- "Who else needs to be involved in a decision like this?"
- "What's your timeline for solving this?"
- Close: "Based on what you've told me, here's what I'd suggest as a next step..."

---

## Phase 4: Objection Handling

Generate responses for the most common objections based on the user's context.

**Default objection bank:**

| Objection | Response |
|-----------|----------|
| "We're too early for this" | "What would need to be true for the timing to be right? [work backwards to now]" |
| "We built something ourselves" | "How long does that take to maintain? What do you wish it did that it doesn't?" |
| "We're using [competitor]" | "What do you love about it? What's the one thing that frustrates you?" |
| "Too expensive" | "What's the cost of not solving this? [walk through the ROI math together]" |
| "Need to check with the team" | "Who specifically? Should the three of us get on a call?" |
| "Send me more info" | "Happy to — what specifically would make the decision easier for you?" |

---

## Phase 5: Pipeline Tracker Setup

Generate a simple pipeline template for `.thoughts/sales/pipeline.md`:

```markdown
## Sales Pipeline — [Date]

| Company | Contact | Stage | ARR | Next Action | Date |
|---------|---------|-------|-----|-------------|------|
| [Co] | [Name, Title] | Demo scheduled | $[N] | Send proposal | [date] |
| [Co] | [Name, Title] | Proposal sent | $[N] | Follow up | [date] |
| [Co] | [Name, Title] | Negotiating | $[N] | Final call | [date] |

## Stages
1. Prospecting → 2. First contact → 3. Discovery → 4. Demo → 5. Proposal → 6. Negotiation → 7. Closed

## This Week's Focus
- [Top 3 deals to move forward]
```

---

## Output

**Save to `.thoughts/sales/playbook-[date].md`** with:
- ICP definition
- Outreach templates (all 3 types)
- Follow-up cadence
- Demo script
- Objection handling bank
- Pipeline template

**Chains with:**
- `/demo-script` — expand the demo section with full script
- `/pricing-strategy` — align positioning with pricing
- `/user-interview` — refine ICP from customer conversations
