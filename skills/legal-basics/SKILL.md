# /legal-basics — Founder Legal Essentials

Covers the legal basics every early-stage founder needs: incorporation, IP assignment,
equity vesting, NDAs, contractor agreements, and advisor agreements.

Not a lawyer. Not legal advice. But enough to know what you don't know — and not get burned
on the easy stuff that trips up founders who've never done this before.

**Use when:**
- Starting your company (incorporation checklist)
- Bringing on a co-founder (equity and vesting)
- Hiring a contractor (IP assignment)
- Bringing on advisors (SAFE note vs equity)
- Doing your first fundraise (SAFE vs priced round)

---

## Phase 1: Incorporation

**The default for US tech startups:**
- **Entity:** Delaware C-Corp
- **Why:** Preferred by VCs and angels. Clean equity structure. Flexible.
- **Not:** LLC (wrong structure for VC), California corp (double taxes for out-of-state investors)

**What you need before incorporating:**

```markdown
## Incorporation Checklist

[ ] Choose company name (check: Google, USPTO trademark search, Delaware name availability)
[ ] Decide state of incorporation (almost always Delaware for VC-backed)
[ ] Decide state of operation (where you physically work — you'll register there too)
[ ] Founders list with % split agreed before incorporating
[ ] Choose registered agent service (Stripe Atlas, Clerky, Firstbase, or a lawyer)
[ ] Physical address (can use a virtual address service)
```

**Recommended services:**
- **Stripe Atlas** ($500 one-time) — fastest, everything in one place
- **Clerky** ($499+) — popular with YC founders, more complete documents
- **Firstbase** ($399+) — similar to Atlas, good for non-US founders
- **Lawyer** ($2K-$5K) — worth it if you have unusual complexity

**Timeline:** 1-5 business days with Stripe Atlas or Clerky. Lawyers take 2-4 weeks.

---

## Phase 2: Founder Equity & Vesting

**The cardinal rule:** All founder equity must vest. No exceptions.

If you don't vest and a co-founder leaves after 6 months, they keep all their equity.
You'll be recruiting new co-founders and investors to a company where 30% of the cap
table belongs to someone who left.

**Standard vesting schedule:**
- 4 years total
- 1-year cliff (nothing until 12 months in, then 25% vests at once)
- Monthly vesting thereafter (1/48th per month, or 1/36th after cliff)

**Early exercise (83(b) election):**
If you're in the US: file the 83(b) election within 30 days of incorporation.
This is a one-page document that can save you 6-figures in taxes.
It tells the IRS you're being taxed on the equity now (at near-zero value) rather
than when it vests (at higher value). Most lawyers miss reminding founders about this.

**Generate the founder equity table:**

```markdown
## Founder Equity

| Founder | Shares | % | Vesting | Cliff | Notes |
|---------|--------|---|---------|-------|-------|
| [Name] | [N] | [X]% | 4yr/1yr | 12 months | CTO |
| [Name] | [N] | [X]% | 4yr/1yr | 12 months | CEO |
| Option pool | [N] | 10-15% | — | — | For future hires |
```

**Option pool size:**
- Pre-seed: 10% is standard
- Post-seed: 15-20%
- Never go below 10% before your first raise — investors will make you create a pool anyway

---

## Phase 3: IP Assignment

**The single most important legal document for technical founders:**

Every person who writes code, designs UI, or creates content for your company
must assign their IP to the company. This includes:
- All founders (at incorporation)
- All employees (in their offer letter)
- All contractors (in their contractor agreement)

**Why it matters:** If a contractor writes your core feature without an IP assignment,
they legally own it. Investors will find this in due diligence and kill the deal.

**IP Assignment Agreement — what it covers:**
```
1. All work product created during the engagement belongs to the company
2. Contractor assigns all IP (including inventions, code, designs) to the company
3. "Work for hire" clause
4. Carve-outs: any prior IP the contractor owned before this engagement (list explicitly)
```

Use Clerky or Stripe Atlas — they generate these automatically.
For contractors, add it to every contract. Takes 30 seconds.

---

## Phase 4: Contractor vs Employee

**The threshold test:**
If you tell someone WHEN to work, HOW to work, and WHERE to work → they're an employee.
Misclassifying employees as contractors is an expensive mistake (back taxes, penalties).

**When to use contractors:**
- Specific projects with defined deliverables
- Part-time (< 20 hrs/week)
- They work for other clients
- You're not their primary income source

**When to hire employees:**
- Core team doing ongoing work
- Anyone who's essentially full-time
- Anyone working exclusively for you

**Contractor agreement template:**
```markdown
## Contractor Agreement — Key Terms

1. Services: [specific scope of work]
2. Deliverables: [specific outputs]
3. Timeline: [start/end or milestone-based]
4. Compensation: $[X] [per hour / per project]
5. IP Assignment: all work product is property of [Company]
6. Confidentiality: NDA terms (see below)
7. Non-solicitation: [typically 1 year after engagement ends]
8. Independent contractor status: no employment relationship
```

---

## Phase 5: Advisor Agreements

**Standard advisor agreement:**
- Equity: 0.1% - 0.5% depending on engagement level and stage
- Vesting: 2 years (no cliff is common for advisors)
- Grant type: common stock or options (options are cleaner for small amounts)
- Services: 2-5 hours/month, intros, advice on [specific domain]

**The FAST template (Founder/Advisor Standard Template):**
FAST is an open-source standard for advisor agreements from Founder Institute.
Free to use: foundercollective.com/fast

**Advisor equity benchmarks:**

| Stage | Hours/mo | Equity |
|-------|----------|--------|
| Pre-product | 5+ | 0.25-0.5% |
| Pre-revenue | 3-5 | 0.1-0.25% |
| Post-revenue | 2-3 | 0.1-0.15% |
| Series A | 1-2 | 0.05-0.1% |

---

## Phase 6: First Fundraise — SAFE vs Priced Round

**The default for pre-seed:**
Use a SAFE (Simple Agreement for Future Equity).

SAFE = you give investors money now; they get equity at your next priced round.

**SAFE terms to understand:**
- **Valuation cap:** Maximum valuation at which the SAFE converts (lower cap = better for investor)
- **Discount:** Investors get a % discount when they convert (typically 15-20%)
- **MFN (Most Favored Nation):** Uncapped SAFE investors get to convert at the same terms as the best future SAFE

**Standard terms for pre-seed:**
- $1M-$3M cap (varies widely by market/traction)
- 20% discount
- No MFN if you have a cap

Use YC's SAFE template (free): ycombinator.com/documents

**When to do a priced round instead:**
- Raising > $2M at pre-seed
- Investors require it (some large funds won't do SAFEs)
- You want to set a formal valuation

---

## Output

Ask the user what they most urgently need, then generate:
1. A checklist specific to their current stage
2. The relevant document template (contractor agreement, advisor agreement, etc.)
3. A list of 2-3 services/lawyers that handle their specific need

**Save to `.thoughts/legal/legal-checklist-[date].md`**

**Important reminder:** This skill helps you understand what you need.
For actual documents, use Stripe Atlas, Clerky, or a startup lawyer.
Contracts protect you. Get them done right.
