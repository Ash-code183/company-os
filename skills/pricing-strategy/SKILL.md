# /pricing-strategy — Pricing Model Design

Researches competitor pricing, applies value-based frameworks, generates a pricing page structure,
and suggests the experiment to validate it.

Most founders underprice by 3-10x. This skill finds the right number.

**Use when:**
- Before launching (you need to price something)
- When conversion is low (pricing might be the signal)
- When customers never ask about price (you're underpriced)
- When every deal requires negotiation (pricing is unclear or wrong)
- Every 6 months as a standard review

---

## Phase 0: Context

```bash
cat COMPANY.md 2>/dev/null | head -20
ls .thoughts/research/ 2>/dev/null | head -10
```

Ask:
1. "What are you pricing? (Product / plan / service)"
2. "Who is your buyer? (end user / manager / VP / CEO)"
3. "What's the unit of value? (per seat / per usage / per outcome / per company)"
4. "What do your best customers get out of it? (time saved, money made, risk reduced)"
5. "What are you charging now, and why?"

---

## Phase 1: Competitive Pricing Research

Run `/x-research` or `/researching-web` to find competitor pricing pages.

Search queries:
- "[product category] pricing page"
- "[competitor 1] vs [competitor 2] pricing"
- "[ICP role] tools pricing"

**Build a competitive map:**

```markdown
## Competitor Pricing Map

| Product | Model | Entry Price | Mid Tier | Top/Enterprise |
|---------|-------|-------------|----------|----------------|
| [Comp A] | Per seat | $X/mo | $X/mo | Custom |
| [Comp B] | Usage | $X/unit | $X/unit | Volume discount |
| [Comp C] | Flat | $X/mo | — | — |
| Our current | [Model] | $X | — | — |
```

Identify:
- The price anchor in the category (what buyers mentally compare against)
- The cheapest credible competitor (floor)
- The premium leader (ceiling)
- Any pricing model that nobody else is using (opportunity)

---

## Phase 2: Value-Based Pricing Framework

**The three types of value:**
1. **Time savings** — how many hours/week does this save? × their hourly rate
2. **Revenue generation** — how much more do they make using this?
3. **Risk reduction** — what's the cost of the problem this prevents?

**Calculate willingness to pay:**

```
Time savings model:
[N] hours/week saved × $[hourly rate] × 4 weeks = $[monthly value]
Pricing target: 10-20% of monthly value

Revenue generation model:
[Average deal size] × [conversion rate improvement] = $[monthly value added]
Pricing target: 10-15% of monthly value

Risk reduction model:
[Cost of incident/problem] × [probability reduced] = $[expected value]
Pricing target: 10-20% of expected value saved
```

**Present the value math clearly:**
"If your tool saves a 5-person team 2 hours/week each, that's 10 hours × $75/hr = $750/month in value.
At $149/month, you're capturing 20% of the value you create."

Charging 10-20% of the value you create is the floor.
Charging 5% or less signals that you don't believe in your own product.

---

## Phase 3: Pricing Model Selection

**The models:**

| Model | Best for | Watch out for |
|-------|----------|---------------|
| Per seat | Collaboration tools | Slows adoption when teams grow |
| Per usage | APIs, infra, data | Hard to predict costs → customer anxiety |
| Per outcome | Value-aligned products | Hard to measure, complex contracts |
| Flat rate | Simple products, easy to understand | Leaves money on the table as you scale |
| Tiered flat | SaaS with feature differentiation | Most common B2B SaaS model |
| Freemium | High distribution products | Can trap you in free tier support hell |

**Recommend a model** based on the user's context. State the model, the rationale, and
the one risk to watch.

---

## Phase 4: Pricing Page Structure

Generate the pricing page copy:

**The 3-tier structure (most B2B SaaS):**

```markdown
## [Product] Pricing

### Starter — $[X]/month
For [ICP description — smallest viable buyer]

✓ [Core feature 1]
✓ [Core feature 2]
✓ [Core feature 3]
✗ [Limit: N seats / N usage / no X feature]

[CTA: Start Free Trial / Get Started]

---

### Pro — $[X]/month ⭐ Most Popular
For [ICP description — main buyer segment]

Everything in Starter, plus:
✓ [Feature that justifies the upgrade]
✓ [Feature that justifies the upgrade]
✓ [Feature that justifies the upgrade]
✓ [Higher limits or unlimited]

[CTA: Start Free Trial / Get Started]

---

### Enterprise — Contact us
For [ICP description — large or complex buyer]

Everything in Pro, plus:
✓ SSO / SAML
✓ Dedicated support
✓ Custom contract / SLA
✓ [Compliance/security features]

[CTA: Talk to Sales]
```

**The ratio rule:** The Pro plan should be 2.5-4x the Starter price.
The gap needs to be large enough to make the upgrade feel worth it,
but not so large that it feels punitive.

**FAQ section — always include:**
- "What happens when my trial ends?"
- "Can I change plans?"
- "Do you offer annual billing?" (offer 2 months free — 17% discount — for annual)
- "Is there a free plan?" (if applicable)

---

## Phase 5: The Pricing Experiment

Before committing, design a simple test:

**Test 1: Raise the price by 30% for the next 10 signups**
If conversion stays the same → you were underpriced. Raise it again.
If conversion drops significantly → you found the ceiling. Back off 10%.

**Test 2: Ask during sales calls**
"Budget isn't a concern right now — what would make this a no-brainer to buy?"
If they don't mention price → the value isn't clear yet (not a pricing problem).
If they immediately mention price → they're price-sensitive (different ICP or wrong value prop).

**Test 3: Annual vs monthly conversion**
If >30% of buyers choose annual, your pricing is likely too low.
Buyers who choose annual are signaling high confidence in the product's value.

---

## Output

**Save to `.thoughts/sales/pricing-strategy-[date].md`** with:
- Competitive pricing map
- Value calculation
- Recommended model and rationale
- Pricing page copy (all 3 tiers)
- Validation experiment to run

**Chains with:**
- `/sales-playbook` — align outreach with pricing
- `/pitch-deck` — market size slide needs pricing assumptions
- `/investor-update` — track revenue vs pricing model over time
