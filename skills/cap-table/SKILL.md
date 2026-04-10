# /cap-table — Equity & Cap Table Modeling

Models your cap table through fundraising rounds, option pool creation, SAFE conversions,
and dilution scenarios. Helps you understand what you're giving up before you sign anything.

Most founders sign term sheets they don't fully understand. This skill closes that gap.

**Use when:**
- Before incorporating (founder equity split)
- Before issuing advisor equity
- Before raising on a SAFE (model the dilution)
- Before signing any term sheet
- Monthly once you start issuing equity (keep it current)

---

## Phase 0: Current Cap Table

Ask the user:
1. "Who currently owns equity in the company? (founders, early employees, advisors)"
2. "How many authorized shares? How many issued?"
3. "Any SAFEs outstanding? What are the terms (cap, discount)?"
4. "Any options granted? Outstanding? Exercised?"

**Generate the current state:**

```markdown
## Cap Table — [Company] — [Date]

### Fully Diluted Shares

| Holder | Type | Shares | % (basic) | % (fully diluted) |
|--------|------|--------|-----------|-------------------|
| [Founder 1] | Common | [N] | [X]% | [X]% |
| [Founder 2] | Common | [N] | [X]% | [X]% |
| [Advisor 1] | Options | [N] | [X]% | [X]% |
| Option Pool (unissued) | Options | [N] | — | [X]% |
| SAFE holders | SAFE | TBD at conversion | — | [est. X]% |
| **Total** | | [N] | 100% | 100% |

### Basic Shares Outstanding: [N]
### Fully Diluted (including options + SAFEs at conversion): [N] (est.)
```

---

## Phase 1: Funding Round Dilution Modeling

When raising a round, model the dilution before accepting any terms.

**Inputs needed:**
- Pre-money valuation: $[X]
- Amount raising: $[X]
- Option pool top-up: [X]% (investors usually require this before the round)
- SAFE conversions: [list any existing SAFEs with cap + principal]

**The dilution formula:**

```
Post-money valuation = Pre-money + Investment
New investor % = Investment / Post-money
Option pool % = [agreed %] of post-money
Founder dilution = new investor % + option pool top-up %

Remaining founder % = 100% - new investor % - option pool %
```

**Show the before/after for each round:**

```markdown
## Pre-Seed Round Modeling

### Terms
- Pre-money: $[X]M
- Investment: $[X]M
- Post-money: $[X]M
- New option pool: [X]%

### Before Round
| Founder 1 | [X]% |
| Founder 2 | [X]% |
| Option Pool | [X]% |
| Total | 100% |

### After Round
| Founder 1 | [X]% | (was [X]%) |
| Founder 2 | [X]% | (was [X]%) |
| Option Pool | [X]% | (was [X]%) |
| New Investors | [X]% | (new) |
| Total | 100% | |

### Key Numbers
- Each founder's value at this valuation: $[X]
- Founder dilution this round: [X]%
- Cumulative founder dilution after this round: [X]%
```

---

## Phase 2: SAFE Conversion Modeling

SAFEs convert at your next priced round. Model what happens before you raise.

**For each outstanding SAFE:**

```
SAFE amount: $[X]
Valuation cap: $[X]M
Discount: [X]%

At a $[Y]M pre-money round:
  - Discounted price = $[Y]M × (1 - discount) = $[Z]/share
  - Cap price = Cap / (pre-money shares) = $[Z]/share
  - SAFE converts at: lower of discounted price or cap price
  - Shares issued to SAFE holder: SAFE amount / conversion price = [N] shares
  - SAFE holder % post-round: [N] shares / total diluted shares = [X]%
```

**Rule of thumb:** If your SAFE cap is significantly below your next round's pre-money,
the SAFE holders will get a significant ownership stake. Model this before raising.

---

## Phase 3: Option Pool Planning

**Standard option pool:**
- Pre-seed: 10% (often the first thing investors ask you to top up)
- Seed: 15%
- Series A: 15-20%
- Each company hire typically gets: 0.1-2% depending on seniority and stage

**Burn rate for your option pool:**

```markdown
## Option Pool Usage Plan

| Role | Stage | Typical Grant | Hired By |
|------|-------|---------------|---------|
| CTO (first eng hire) | Pre-seed | 1-3% | [date] |
| First sales hire | Post-seed | 0.5-1% | [date] |
| Head of Product | Series A | 0.25-0.5% | [date] |
| Senior Engineer | Any | 0.1-0.25% | [date] |
| Advisor | Any | 0.1-0.25% | [date] |

Projected option pool remaining after planned hires: [X]%
```

---

## Phase 4: Cap Table Tools

For ongoing cap table management, recommend one of:

| Tool | Price | Best for |
|------|-------|---------|
| **Carta** | Free for <25 stakeholders | Industry standard, VC-friendly |
| **Pulley** | $0 for early stage | YC-backed, founder-friendly UI |
| **Capbase** | $0 to start | Combines incorporation + cap table |
| **LTSE Equity** | Free | Open source friendly |
| **Google Sheets** | Free | First 30 days before you have investors |

**Recommendation:** Start with Carta or Pulley when you first incorporate.
Moving your cap table later is painful. Set it up right from Day 1.

---

## Output

**Save to `.thoughts/financial/cap-table-[date].md`** with:
- Current cap table snapshot
- Round dilution models (at multiple scenarios)
- SAFE conversion model (if applicable)
- Option pool burn rate plan

**Chains with:**
- `/legal-basics` — the legal scaffolding behind the cap table
- `/runway` — understand financial position before issuing equity
- `/pitch-deck` — investors will ask about your cap table structure
- `/first-hire` — equity grants for early employees
