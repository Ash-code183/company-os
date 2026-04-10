# /content-machine — Content Strategy & Distribution Engine

Content strategy as a compounding distribution channel: pillar content → derivative posts →
SEO cluster → distribution calendar. Turns one strong insight into 10 pieces of content
across channels.

**Use when:**
- You want organic distribution instead of paid
- Building in public (Twitter/X, LinkedIn)
- Starting a blog or content strategy
- SEO is part of your growth plan
- Monthly as part of `/founder-rhythm` for content planning

---

## Phase 0: Strategy Foundation

```bash
cat COMPANY.md 2>/dev/null | head -20
ls .thoughts/research/ 2>/dev/null | head -10
```

Ask:
1. "Who is the content for? (your ICP, your ICP's boss, developers, consumers)"
2. "What's the goal? (SEO / authority building / social distribution / community)"
3. "What channels are you active on or want to be? (Twitter/X, LinkedIn, blog, newsletter)"
4. "What are the 2-3 topics you can speak about with genuine authority?"
5. "How many hours/week can you spend on content?"

---

## Phase 1: Content Strategy Design

**The content flywheel:**

```
1 Pillar post (1,500-3,000 words deep)
    └── 3-5 Derivative posts (each explores one angle)
         └── 10-15 Social snippets (quotes, stats, observations)
              └── 1-2 SEO-optimized versions (repurposed for search)
```

**The pillar topic framework:**
Good pillar content sits at the intersection of:
- What you know that most people don't (your unfair insight)
- What your ICP actively searches for or discusses
- What positions you as the right solution to your problem

**Generate 3 pillar topic candidates:**

For each, evaluate:
```
Topic: "[candidate]"
- ICP relevance (1-10): [score]
- Your credibility (1-10): [score]
- Search demand (estimate): [high/medium/low]
- Competition: [high/medium/low]
- Link to product: [direct / indirect / awareness only]
```

Recommend the pillar topic with the best balance of credibility × demand × low competition.

---

## Phase 2: SEO Cluster Planning

For a blog-first strategy, build a topic cluster around the pillar:

**The cluster structure:**
```
Pillar page: "[Main keyword phrase]" (target: 500-2,000 searches/month)
├── Cluster 1: "[Related keyword 1]" (supporting page)
├── Cluster 2: "[Related keyword 2]" (supporting page)
├── Cluster 3: "[Long-tail keyword]" (supporting page)
├── Cluster 4: "[Comparison keyword: your category vs competitor]"
└── Cluster 5: "[Problem-aware keyword: 'how to X']"
```

**Keyword research without a tool:**
Use `/researching-web` to search:
- "site:reddit.com [topic] [pain point]"
- Google autocomplete for "[topic] ___"
- "People also ask" for your main keyword
- `/x-research` for what the ICP talks about

---

## Phase 3: Content Calendar

**Monthly cadence (for 3-5 hours/week of content work):**

```markdown
## Content Calendar — [Month Year]

### This Month's Pillar
Topic: [pillar topic]
Format: [deep blog post / video essay / thread series]
Target publish: [date]

### Weekly Schedule

Week 1:
- Mon: Research + outline the pillar
- Wed: Write the pillar
- Fri: Publish + extract 5 social snippets

Week 2:
- Mon: Write Cluster Post 1
- Wed: Post to LinkedIn (pillar summary)
- Fri: Twitter/X thread (pillar as thread)

Week 3:
- Mon: Write Cluster Post 2
- Wed: Post the LinkedIn native version
- Fri: Repurpose best snippet as standalone post

Week 4:
- Mon: Write Cluster Post 3
- Wed: Newsletter (this month's learnings)
- Fri: Review what performed → plan next month

### Monthly Metrics
- Organic sessions: [baseline → target]
- Newsletter subscribers: [baseline → target]
- Top performing post: [track for next month's double-down]
```

---

## Phase 4: Building in Public Templates

**The weekly build-in-public post:**
```
Working on [product/feature] this week.

Here's what I learned: [unexpected insight — 1-2 sentences]

The hard part wasn't [expected hard thing].
It was [actual hard thing].

[One screenshot / metric / before-after]

[Question for the audience — invites engagement]
```

**The milestone post:**
```
[Number] [users/customers/MRR] reached.

Here's the honest breakdown:
- What worked: [specific channel/tactic]
- What didn't: [honest miss]
- What surprised me: [unexpected learning]

Doing [next milestone] next. Ask me anything about [topic].
```

**The lesson post (highest engagement):**
```
I was wrong about [belief I held].

I used to think [old belief].
Then [what changed my mind — specific experience].

Now I [new belief or behavior].

The thing most founders miss: [one-line insight]
```

---

## Phase 5: Newsletter Setup

A newsletter is the highest-leverage content asset for solo founders:
- You own the audience (no algorithm dependency)
- High-trust channel
- Best-performing investor update channel

**Stack recommendation:**
- **Beehiiv** (free to 2,500 subscribers): Best for monetization later
- **Substack** (free): Best for discovery and community
- **ConvertKit** (free to 1,000): Best for automations + sequences

**Newsletter launch sequence:**
1. Import your email contacts (with permission)
2. Send a "welcome" explaining what you'll write about
3. Commit to a cadence (weekly > biweekly for growth)
4. First 3 issues = your best insights. Don't save them for later.

---

## Output

**Save to `.thoughts/content/strategy-[date].md`** with:
- Pillar topic selection + rationale
- SEO cluster plan (10-15 target keywords)
- 90-day content calendar
- Build-in-public post templates
- Newsletter setup recommendation

**Chains with:**
- `/brand-voice-enforcement` — align all content with brand voice
- `/x-research` — find what the ICP talks about for pillar research
- `/launch-strategy` — content strategy is part of launch distribution
- `/founder-rhythm` — monthly content planning as part of the cadence
