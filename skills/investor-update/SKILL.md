# /investor-update — Monthly Investor & Advisor Update

Writes the monthly investor update that investors actually read: 250 words, sharp metrics,
honest lowlights, and a specific ask. No fluff, no spin.

Most founders either skip these entirely (bad) or write 800-word essays that nobody reads (also bad).
The best investor updates take 15 minutes to write and 3 minutes to read.

**Use when:**
- Monthly (wire to `/founder-rhythm --mode=monthly`)
- After a major milestone (fundraise close, big customer, key hire)
- Before starting a fundraise (warm up your network)
- When you need something specific (introductions, advice, referrals)

---

## Phase 0: Load Context

```bash
cat COMPANY.md 2>/dev/null | head -20
ls .thoughts/research/pmf-report-*.md 2>/dev/null | tail -1
ls .thoughts/investor-updates/ 2>/dev/null | tail -3
```

Read the most recent prior update (if it exists) to ensure continuity.
Check if there's a PMF report or financial data from `/runway` to pull numbers from.

Ask the user:
1. "What month is this for?"
2. "What's the single biggest thing that happened this month?"
3. "What's your current MRR / ARR / active users / key metric?"
4. "What's one thing that went wrong or didn't work?"
5. "What do you need from your investors/advisors right now?"

---

## Phase 1: Generate the Update

The format is fixed. Do not deviate. Investors scan, not read.

```markdown
Subject: [Company] — [Month Year] Update

Hi [name / "everyone"],

**One line on the company:**
[What we do — 1 sentence for new readers]

---

## Key Metrics

| Metric | This Month | Last Month | Change |
|--------|-----------|------------|--------|
| [Primary metric] | [N] | [N] | [+/-X%] |
| [Secondary metric] | [N] | [N] | [+/-X%] |
| [Revenue/MRR if applicable] | $[N] | $[N] | [+/-X%] |
| Runway | [N] months | — | — |

---

## Highlights ✅
- [Best thing that happened — specific, not vague]
- [Second best — include names, numbers]
- [Third — optional]

## Lowlights ⚠️
- [What didn't work — honest, 1-2 sentences. Never skip this section.]
- [What you're doing differently]

---

## The Ask 🙏
[One specific ask. Not "any help appreciated." Examples:]
- "Intros to B2B SaaS founders who've raised a $1M pre-seed in the last 6 months"
- "Anyone who's worked with [specific type of enterprise customer] in [industry]"
- "A lawyer recommendation for our first SAFE round"

---

## Next Month
[2-3 specific goals for next month. Investors remember these — you'll be accountable.]
- [ ] [Goal 1]
- [ ] [Goal 2]

---

[Your name]
[Reply directly to this email / Book time: calendly link]
```

---

## Phase 2: Quality Check

Before sending, verify:

- **Lowlights exist** — If your update has no lowlights, you're either not being honest or
  it was a truly exceptional month. The former is more likely. Investors who receive updates
  with no lowlights stop trusting the founder's judgment. One honest struggle is worth more
  than ten polished wins.

- **The ask is specific** — "Any help appreciated" is not an ask. "An intro to the Head of
  Engineering at [specific company]" is. Specific asks get specific responses.

- **Numbers are consistent with prior updates** — If you said 200 users last month and you
  have 180 this month, explain why, don't just change the number.

- **Word count** — Under 300 words in the body (excluding the metrics table). If it's longer,
  cut it.

---

## Phase 3: Save & Log

**Save to `.thoughts/investor-updates/[year]-[month]-update.md`**

This creates a log you can search before future updates. The progression of your metrics
across 12 months of updates tells a story that's often more powerful than any single deck.

```bash
mkdir -p .thoughts/investor-updates/
```

---

## The Psychology of a Good Investor Update

Investors in early-stage companies are not primarily tracking your metrics. They're tracking
**your judgment and trustworthiness**.

An update that shows:
- You know your numbers cold
- You're honest about what's not working
- You ask for specific things
- You follow through on what you said last month

...signals a founder they want to back again.

An update that shows:
- Vague optimism ("it's been a great month!")
- Only highlights, no lowlights
- A generic ask for "intros"
- No connection to what you said last month

...signals someone they can't evaluate.

Write like someone who has nothing to hide. That's the whole skill.
