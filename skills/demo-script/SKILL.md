# /demo-script — Product Demo Script Builder

Builds the 5-minute product demo that converts: problem hook → aha moment → proof → CTA.
The demo for your first meetings, your launch video, your investor deck.

Most founders demo features. This script demos value.

**Use when:**
- Preparing for sales calls
- Building a product demo video
- Creating an explainer for the landing page
- Preparing for investor meetings
- Before conferences, events, or press conversations

---

## Phase 0: Context

```bash
cat COMPANY.md 2>/dev/null | head -20
ls .thoughts/research/interview-*.md 2>/dev/null | tail -3
ls .thoughts/research/pmf-report-*.md 2>/dev/null | tail -1
```

Ask:
1. "Who is the primary audience? (potential customer / investor / press)"
2. "What's the format? (live call / recorded video / async demo link)"
3. "How long? (2 min / 5 min / 15 min)"
4. "What's the ONE thing you want them to do after the demo? (sign up / book a call / invest)"
5. "What do your best users say is the aha moment?"

---

## Phase 1: The Demo Architecture

**The 5-minute structure:**

```
0:00 – 0:30   Hook (the pain)
0:30 – 1:00   Setup (who this is for)
1:00 – 3:30   The demo (aha moment first)
3:30 – 4:00   Proof (someone already got the result)
4:00 – 4:30   CTA (one thing to do)
4:30 – 5:00   FAQ (one anticipated question, answered)
```

---

## Phase 2: Script Generation

### Opening Hook (30 seconds)

Start with the pain, not the product.

**Formula:** "Every [time period], [type of person] faces [specific pain]. [What happens as a result]. There has to be a better way."

**Examples:**
- "Every Monday morning, sales managers spend 2 hours pulling numbers from three different tools to build their pipeline report. Then spend another hour in Excel. Then miss the meeting because it took longer than expected. There has to be a better way."

- "Developers lose an average of 40 minutes a day to context switching between tickets, PRs, and Slack. By the time you're in flow, something interrupts it. There has to be a better way."

**Generate the hook** using language from the user's customer interviews (if available).
The best hooks use the exact words customers used to describe their own pain.

### Setup (30 seconds)

Establish who this is for and what the product does in ONE sentence.

**Formula:** "[Product] lets [type of person] [do job] in [time/way] — without [current workaround]."

**Example:**
"[Product] lets sales managers get their pipeline report in 30 seconds — without touching a spreadsheet."

### The Demo (2.5 minutes)

**The cardinal rule: lead with the aha moment.**

Most demos start with login → settings → dashboard → features → finally the good thing.
Start with the good thing.

**Demo structure:**
```
1. Start at the moment before the aha moment
   "Here I am — it's Monday morning, I need my pipeline report."

2. The action (30 seconds)
   "I [one action]..."

3. The aha moment (10 seconds)
   "...and here it is. [Show the result]."

4. Why this works (60 seconds)
   "What's happening here is [mechanism]. The reason it's fast is [insight]."

5. Second-best feature (45 seconds)
   "And while I have this open, one thing our users love is [secondary feature]..."
```

**The demo ends before the viewer gets bored. Cut ruthlessly.**

### Proof (30 seconds)

One specific result from a real customer (or your own use if pre-customers).

**Formula:** "[Name/role at company] was [before state]. After using [product] for [time], [specific measurable result]."

**Example:** "Priya, a sales manager at a 20-person SaaS company, was spending 3 hours every Monday on reporting. After switching to [product], that's down to 15 minutes. She said it was the first time she's been on time to her weekly review."

If no customers yet: use your own experience, or a beta tester's experience (with permission).

### CTA (30 seconds)

ONE action. Not three.

**Formats by audience:**
- Sales demo → "Want me to set this up for your team? [book a call / start trial]"
- Investor meeting → "We're raising [X] to [milestone]. Happy to send the deck."
- Launch video → "Try it free at [URL] — takes 2 minutes to set up."

### FAQ (30 seconds)

Anticipate the #1 objection and answer it before they ask.

**Common pre-emptions:**
- "Yes, it connects to [existing tool] — takes 2 clicks."
- "Yes, your data is secure — we're [SOC2 / encrypted / etc.]."
- "Yes, there's a free plan."

---

## Phase 3: Demo Script Full Output

Generate the complete word-for-word script:

```markdown
## Demo Script: [Product] — [Version] — [Date]
**Audience:** [target]  **Format:** [format]  **Length:** [duration]  **CTA:** [one action]

---

[Hook — 30 seconds]

[Setup — 30 seconds]

[Demo narration — 2.5 minutes]
[Include stage directions in brackets: (click X), (pause), (screen share this)]

[Proof — 30 seconds]

[CTA — 30 seconds]

[FAQ pre-emption — 30 seconds]

---

## Key Demo Principles
- Lead with the aha moment, not the login screen
- Say the customer's name/type when showing the proof
- Slow down at the aha moment — let it land
- Practice until the CTA feels natural, not scripted
```

---

## Phase 4: Async Demo Variant

For tools like Loom, Arcade, or interactive demos:

**Structure change for async:**
- Hook becomes a text overlay / thumbnail (not spoken)
- Must be 3 minutes or shorter — async viewers have less patience
- End card with a clear clickable CTA
- Include captions (70% of async video is watched on mute)

**Recommended tools:**
- Loom — personal, fast, easy to share
- Arcade.software — interactive product demos that users can click through
- Tella — clean recorded demos with teleprompter

---

## Chains With

- `/pitch-deck` — demo is embedded in the product slide
- `/sales-playbook` — demo is Phase 3 of the sales call
- `/launch-strategy` — demo video is the core launch asset
- `/user-interview` — use customer language in the hook
