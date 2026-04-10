# /user-interview — Customer Discovery Framework

Structures customer discovery so you learn instead of pitch. Generates screener criteria,
JTBD interview scripts, synthesis templates, and aggregated insight reports.

Most founders talk to users wrong — they explain their product and ask "would you use this?"
This skill forces the right posture: shut up, listen, and find the job being done.

**Use when:**
- Before building anything new (validate the problem exists)
- After getting your first users (understand why they stayed)
- When growth stalls (find what job you're actually being hired for)
- Before writing a pitch deck (you need real user language)

---

## Phase 0: Pre-Interview Setup

**Gather context:**
```bash
cat COMPANY.md 2>/dev/null | head -30
ls .thoughts/research/ 2>/dev/null | head -10
```

Read any prior interview notes. Don't repeat what's already known.

**Define the job hypothesis.** Before writing a single question, write one sentence:
> "We believe [type of person] hires our product to [do what job] when [situation]."

Example: "We believe indie developers hire task managers to feel in control when they're
context-switching between too many projects."

Present this hypothesis to the user and ask: "Is this the job we're testing, or do you
want to test a different hypothesis?"

---

## Phase 1: Screener Design

Generate a 5-question screener to find the RIGHT people to interview.

Bad screener: "Are you interested in productivity tools?"
Good screener: "In the last month, how many times did you switch between 3+ projects in a single day?"

Rules:
- Screen for the SITUATION, not the product category
- At least one question should eliminate the wrong person (not just include the right one)
- Keep it under 5 questions — longer screeners kill response rate

**Output to `.thoughts/research/screener-[date]-[topic].md`:**

```markdown
## Interview Screener — [Topic]

**Job hypothesis:** [one sentence]

**Target:** [description of ideal interviewee]

**Screener questions:**
1. [Situation question — frequency/recency]
2. [Behavior question — what they actually do today]
3. [Stakes question — how much this matters]
4. [Elimination question — disqualifier]
5. [Optional: referral hook — "who else do you know who faces this?"]

**Qualify if:** [scoring criteria]
**Disqualify if:** [red flags]
```

---

## Phase 2: Interview Script (JTBD Format)

Generate a 45-minute interview script using the Jobs-to-be-Done "timeline interview" format.

**The four moves:**
1. **First thought** — "When did you first realize you had this problem?"
2. **Passive looking** — "How were you managing before you found us?"
3. **Active looking** — "What triggered you to actually search for a solution?"
4. **Decision** — "Walk me through the moment you chose [product/solution]."

You're looking for: the trigger event, the anxiety, the desired outcome, the competing solutions.

**Output to `.thoughts/research/interview-script-[date]-[topic].md`:**

```markdown
## Interview Script — [Topic]

**Opening (5 min):**
- "I'm not going to pitch you anything today. I want to understand your experience."
- "There are no wrong answers. The goal is for me to learn."
- "Can I record this? [get consent]"

**Timeline section (25 min):**
- "Tell me about the last time you [situation from screener]."
- "Walk me back to when you first noticed this was a problem."
- "What were you doing to handle it before?"
- "What made you decide to look for something better?"
- "Walk me through how you found [current solution]."
- "What almost stopped you from [switching/signing up]?"

**Current state section (10 min):**
- "Show me how you do [task] today."
- "What's the most frustrating part of that?"
- "If you could change one thing, what would it be?"

**Closing (5 min):**
- "What would make you tell a friend about [category]?"
- "Is there anything I didn't ask that you think I should know?"
- "Who else do you know who has this problem?"
```

---

## Phase 3: Post-Interview Synthesis

After each interview, immediately (within 1 hour) fill out the synthesis template.
Memory degrades fast — the quotes and observations from an interview are worth
capturing within the hour.

**Output to `.thoughts/research/interview-[date]-[name].md`:**

```markdown
## Interview: [Name/Role] — [Date]

**Job hypothesis tested:** [which hypothesis]
**Interview duration:** [N] minutes

### The Trigger
[What caused them to start looking for a solution?]

### The Struggle
[What were they doing before? What was painful about it?]

### The Desired Outcome
[What does success look like to them? Exact words they used.]

### The Anxiety
[What almost stopped them? What were they worried about?]

### Competing Solutions
[What else did they consider? What did they try first?]

### Best Quotes
- "[exact quote 1]"
- "[exact quote 2]"
- "[exact quote 3]"

### Surprises
[What did you learn that you didn't expect?]

### Job Statement (updated)
[Revise your job hypothesis based on this interview]
```

---

## Phase 4: Insight Aggregation (After 5+ Interviews)

After 5+ interviews, aggregate patterns. Run this phase when the user asks for synthesis
or when patterns start repeating across interviews.

Search all interview files:
```bash
ls .thoughts/research/interview-*.md 2>/dev/null
```

Generate an insight report identifying:
- **Recurring triggers** (appeared in N/N interviews)
- **Recurring struggles** (appeared in N/N interviews)
- **Surprising findings** (appeared once but high-signal)
- **Language patterns** (exact words users repeat — use these in copy)
- **Competing solutions map** (what you're really competing with)
- **Strongest job statement** (synthesized from all interviews)

**Output to `.thoughts/research/user-research-synthesis-[date].md`**

Run `/synthesize-research` if available to assist with pattern extraction.

---

## Key Rules

1. **Never ask "would you pay for this?"** — People lie about hypothetical behavior.
2. **Never ask "what features do you want?"** — They'll describe the wrong solution.
3. **Always ask about past behavior** — "What did you do last time?" not "What would you do?"
4. **Silence is a tool** — After they answer, wait 5 seconds. Most important things come after the pause.
5. **Follow the energy** — If they get animated about something, go deeper there.

After 5 interviews, you'll hear the same trigger 3-4 times. That's your signal.
After 10, you're mostly confirming. Stop and build.
