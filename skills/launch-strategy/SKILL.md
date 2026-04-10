# /launch-strategy — Product Launch Playbook

Generates the full launch plan across channels: Product Hunt, Hacker News Show HN, Twitter/X,
LinkedIn, Reddit, and email. Each channel has a different playbook. Using the wrong playbook
in the wrong channel is why most launches fail quietly.

**Use when:**
- 2-4 weeks before a major product launch
- For feature launches that deserve an audience
- When relaunching after a significant update
- When entering a new market or segment

---

## Phase 0: Context & Prerequisites

```bash
cat COMPANY.md 2>/dev/null | head -30
ls .thoughts/research/ 2>/dev/null | head -10
```

Ask the user:
1. "What exactly are you launching? (New product / major feature / relaunch / open source)"
2. "What's your current audience size? (Email list, Twitter followers, existing users)"
3. "What's the target audience? (Developers / founders / consumers / enterprise)"
4. "What's the ONE thing you want people to do after seeing the launch? (sign up / star the repo / share)"
5. "What's the launch window? (Target date)"
6. "Do you have any existing relationships with relevant communities?"

Based on the audience type, recommend 2-3 primary channels.

---

## Phase 1: Channel Selection

**Pick 2-3 channels. Don't launch everywhere simultaneously — you'll spread thin.**

### Channel Selection Guide

| Audience | Best channels |
|----------|--------------|
| Developers / technical founders | HN Show HN, GitHub, Twitter/X, specific subreddits |
| Consumer / B2C | Product Hunt, TikTok, Twitter/X, relevant subreddits |
| B2B / SaaS buyers | LinkedIn, Twitter/X, niche newsletters |
| Open source | HN, GitHub, Twitter/X, relevant Discord/Slack communities |
| Design / creative | Product Hunt, Twitter/X, Dribbble |

**The sequencing rule:** If doing Product Hunt, do it on a Tuesday-Thursday.
Avoid December holidays. Mondays have low traffic. Weekends are inconsistent.

---

## Phase 2: Pre-Launch (2 Weeks Before)

**Week -2 checklist:**
- [ ] Landing page live with email capture
- [ ] "Coming soon" post to existing audience to warm them up
- [ ] Identify 10-20 people to ask for Day 1 support
- [ ] Draft all launch copy for each channel
- [ ] Prepare assets: screenshots, demo GIF/video, social cards
- [ ] Schedule your maker/team for Day 1 to respond to every comment

**The pre-launch post template (Twitter/X):**
```
Working on [product] for the last [N] months.

It solves [problem] for [audience].

Launching in [N] days. Here's a sneak peek: [screenshot/GIF]

If you know someone who [does the job this solves], send this their way.
```

**The Hunter/Maker setup (for Product Hunt):**
- Create your PH maker profile if you haven't
- Find a hunter with >1,000 followers in your category OR self-hunt (now supported)
- Prepare: name, tagline (60 chars max), description, first comment, gallery

---

## Phase 3: Launch Day Playbook (By Channel)

### Product Hunt

**The anatomy of a winning PH post:**
- **Name:** [Product Name] — [verb phrase, not noun]
- **Tagline:** Under 60 characters. One job, no jargon.
  - Bad: "AI-powered project management platform"
  - Good: "Finish projects without losing your mind"
- **First comment (from maker):** The story. 150-200 words.
  ```
  Hey PH! I'm [name], maker of [product].

  I built this because [personal story — what frustrated you].

  [Product] lets [type of user] [do what job] by [how].

  We've been testing with [N] users and [specific result].

  Today we're opening to everyone. Here's what you can do:
  [3 specific use cases]

  Happy to answer any questions — ask me anything about [space].
  ```
- **Respond to every comment** — engagement drives ranking
- **Share the PH link** at 12:01 AM PT (when the day resets)
- **Personal outreach** to your pre-committed supporters: "We're live — [link]"

**Who to notify on launch day:**
- Your email list (use a dedicated launch email — see template below)
- Your Twitter followers
- Direct messages to 10-20 people who've expressed interest
- Relevant Slack/Discord communities (check rules first)

### Hacker News — Show HN

Show HN posts live or die by the first 2 hours.

**The formula:**
```
Show HN: [Product Name] – [What it does in plain English]
```

Examples of good Show HN titles:
- "Show HN: I built a tool that compresses API responses for slower networks"
- "Show HN: Open-source alternative to Retool that works offline"
- "Show HN: A CLI for managing multiple Git identities"

**HN rules:**
- Be the maker. Don't post for someone else.
- First comment should be the story: problem → what you built → current state
- Don't upvote-beg. The community detects and penalizes this.
- Engage with every technical question
- "Made by a solo dev in 3 months" resonates on HN

**The HN audience values:** technical depth, honest limitations, interesting engineering decisions.

### Twitter/X Thread

The launch thread formula:
```
1/ [Hook — the problem in one stark sentence]

2/ [What you built — screenshot/GIF]

3/ [Why existing solutions fail]

4/ [How yours is different — be specific]

5/ [Best result a user has gotten]

6/ [Free/paid/open? Where to get it] 👇
```

Post at 8-10 AM local time for your audience.
Pin the thread.
Reply to every quote tweet and comment for the first 4 hours.

### Email List Launch

Subject line formula: "[Product] is live — [specific benefit]"

```
Subject: [Product] is live — here's your early access

[First name],

[One sentence on what you built]

[The problem it solves — their words, not yours]

[What you can do with it — 3 bullets]

[CTA button: Get Started / Try It Free / Claim Your Spot]

If this isn't for you, forward it to someone who [does the job].

— [Your name]

P.S. [One specific thing they can do in the first 5 minutes]
```

---

## Phase 4: Post-Launch (Week 1)

**Day 2-7 checklist:**
- [ ] Thank your top supporters personally
- [ ] Respond to all feedback — good and bad
- [ ] Post a "Day 1 results" update (even if modest — shows momentum)
- [ ] Write up what you learned for your own records
- [ ] Identify which channel performed best — double down there
- [ ] Follow up with every person who commented/asked questions but didn't sign up

**The Day 1 results post:**
```
Day 1 recap:
- [N] signups
- [N] Product Hunt upvotes / HN comments
- Best piece of feedback: "[quote]"

Building in public. Next update: [when]
```

---

## Output

**Save to `.thoughts/plans/launch-[product]-[date].md`** with:
- Channel selection and rationale
- Pre-launch checklist with dates
- Copy for each channel
- Day 1 response templates
- Post-launch review template

---

## The One Insight About Launches

A launch is not a moment. It's the first day of a distribution habit.

The founders who win at distribution are the ones who launched 10 times —
each time to a slightly larger audience, with slightly better positioning.
Your first launch teaches you where your audience actually is.
Your fifth launch is when it starts compounding.
