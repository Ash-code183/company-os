# /pitch-deck — Investor Pitch Deck Builder

Builds a narrative-first pitch deck that makes investors lean forward, not lean back.
Pulls from your company context, PMF data, and user research. Each slide answers one
specific question an investor is asking.

Most decks fail because they explain the product instead of telling the story.
This skill fixes that.

**Use when:**
- Raising a pre-seed or seed round
- Applying to accelerators (YC, Antler, etc.)
- Preparing for investor conversations even if not actively raising
- After you have at least one of: real users, real revenue, or a very sharp insight

---

## Phase 0: Context Gathering

Read existing context:
```bash
cat COMPANY.md 2>/dev/null
ls .thoughts/research/ 2>/dev/null | head -20
ls .thoughts/specs/ 2>/dev/null | head -10
```

Check for:
- PMF data from `/pmf-pulse` reports
- User research from `/user-interview` syntheses
- Financial data from `/runway` outputs
- Product specs from `/writing-plans` or `/discover-product`

Ask the user:
1. "What stage are you raising? (pre-seed / seed / Series A)"
2. "What's the ask? (amount + what it buys)"
3. "What's your strongest proof point right now? (users, revenue, growth rate, insight)"
4. "Who is the primary audience? (VC / angel / accelerator / strategic)"

---

## Phase 1: Narrative Architecture

Before any slides, build the narrative arc. A pitch is a story with one hero (the user)
and one villain (the problem). The product is the tool that defeats the villain.

**The 7-sentence story test:**
Generate this paragraph first. If you can't write it compellingly, no slide deck will save you.

```
[N] people face [problem]. Today they [current solution / workaround].
This is broken because [root cause of why existing solutions fail].
We're building [product] — [one-sentence description].
We've proven it works: [single best traction proof point].
The market opportunity is [size + why now].
We're raising [amount] to [specific milestone].
```

Present this to the user. Refine until it's tight. This becomes the through-line
for the entire deck.

---

## Phase 2: Slide-by-Slide Build

Each slide answers ONE investor question. Build in this order:

### Slide 1: Cover
- Company name + one-line description
- Your name, date
- Tagline: What job does your product do? (Not a product description — a job description)

**Investor question:** "What is this?"

### Slide 2: Problem
- The specific pain. Make it visceral.
- Use a story: "Sarah is a [person]. Every [day/week], she faces [specific situation]..."
- Quantify the pain if possible: time lost, money wasted, frustration score

**Investor question:** "Is this a real problem worth solving?"

Rules: One problem. Not three. Not a "problem landscape." The sharpest possible point.

### Slide 3: Solution
- ONE sentence on what you do.
- Screenshot or demo GIF if the product exists.
- The "aha moment" — the single thing that makes users realize they can't go back.

**Investor question:** "Does this actually solve it?"

### Slide 4: Why Now
- What changed in the world that makes this possible / necessary now?
- Technology shift? Regulation? Behavior change? New infrastructure?
- If you'd pitched this 3 years ago, why wouldn't it have worked?

**Investor question:** "Why hasn't this been built before? Why is now the moment?"

### Slide 5: Market Size
- TAM → SAM → SOM (but don't do the classic 1% of $10B market slide)
- Bottom-up: "[N] [type of customer] × [$X/year] = [market size]"
- Reference how the market is growing

**Investor question:** "Is this big enough to matter?"

### Slide 6: Product (if needed)
- Only if the product is non-obvious from Slide 3
- 3-4 screenshots or a product walkthrough
- Highlight the insight that makes your approach different

**Investor question:** "Does this actually work?"

### Slide 7: Traction
- The most important slide for early-stage.
- Show the SHAPE of growth, not just the number.
- Be precise: "87 active users, 43% WoW growth, 4 paying at $99/mo"
- If PMF survey done: "62% 'very disappointed'" is a powerful data point

**Investor question:** "Is this real? Are people actually using it?"

Rules: Don't show DAU if WAU is stronger. Don't show registered if active is your metric.
Show your best honest number, and show momentum.

### Slide 8: Business Model
- How do you make money? (Even if you don't yet)
- Pricing: what, who pays, how much
- Unit economics if known: CAC, LTV, payback period

**Investor question:** "Can this be a business, not just a product?"

### Slide 9: Team
- Why are YOU the right person to build this?
- Domain expertise + relevant experience + unfair advantage
- "I've been [role] for [N] years. I've lived this problem personally."
- Keep it 2-3 sentences per person. Not a LinkedIn bio.

**Investor question:** "Can this team pull it off?"

### Slide 10: Ask
- Amount: $[X]
- Use of funds: break into 3-4 buckets (e.g., 60% eng, 25% growth, 15% ops)
- Milestone: "This gets us to [specific milestone] in [timeframe]"
- What changes at that milestone: "[milestone] is the point where we know X is true"

**Investor question:** "Is this a good use of my money?"

### Appendix (optional but powerful)
- Deep product screenshots
- Customer testimonials / case studies
- More detailed financials
- Competitive landscape
- Hiring plan

---

## Phase 3: Slide Quality Check

Run `/evaluating` on the completed deck with these dimensions:

1. **Narrative clarity** — Can someone unfamiliar explain your pitch back in 2 sentences?
2. **Specificity** — Every claim has a number or a name attached
3. **Traction believability** — Numbers are precise, not rounded. Charts show methodology.
4. **Problem sharpness** — Is the problem one thing, not three?
5. **Ask clarity** — Is the amount, milestone, and use of funds unambiguous?

Flag any slide that:
- Uses the word "revolutionary", "disruptive", or "game-changing"
- Claims TAM > $1T without a credible bottom-up calculation
- Shows a hockey stick with no explanation of what changed
- Lists 10+ competitors with no differentiation logic

---

## Phase 4: Output

**Save to `.thoughts/specs/pitch-deck-[date].md`** — the complete slide outline with
copy for each slide.

Then recommend:
- Use Pitch.com, Canva, or Google Slides to build the visual version
- Run `/investor-update` to maintain the narrative momentum after the first meetings
- Run `/write-brief` if you need a 1-pager version for warm intros

---

## The One Test

Read your Slide 2 (Problem) and Slide 7 (Traction) back to back.
If those two slides don't make an investor want to hear the rest, the deck doesn't work.
The problem makes them lean forward. The traction makes them believe.
Everything else is supporting material.
