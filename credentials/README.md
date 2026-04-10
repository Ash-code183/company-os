# Credentials Guide — company-os

Everything you need to set up, where to get each credential, and what breaks without it.

**Quick start:**
```bash
cp .env.example .env          # copy the template
# fill in the ones you need
./credentials/check.sh        # see what's configured and what it unlocks
```

---

## Credential Map

| Credential | Tier | Agent | Skills | Get It At |
|-----------|------|-------|--------|-----------|
| `GH_TOKEN` | Recommended | release-engineer | `/ship` `/land-and-deploy` `/github` | github.com/settings/tokens |
| `XAI_API_KEY` | Recommended | research-analyst, solo-founder | `/x-research` `/last30days-nux` | api.x.ai |
| `FROM_BROWSER=auto` | Recommended (free) | research-analyst, solo-founder | `/x-research` `/last30days-nux` | Already logged in to x.com |
| `SCRAPECREATORS_API_KEY` | Optional | research-analyst, solo-founder | `/last30days-nux` | scrapecreators.com |
| `BRAVE_API_KEY` | Optional | research-analyst, solo-founder | `/researching-web` `/last30days-nux` | brave.com/search/api |
| `EXA_API_KEY` | Optional | research-analyst | `/researching-web` | exa.ai |
| `OPENROUTER_API_KEY` | Optional | research-analyst, solo-founder | `/last30days-nux` (deep research) | openrouter.ai |
| `BSKY_HANDLE` + `BSKY_APP_PASSWORD` | Optional | research-analyst | `/last30days-nux` | bsky.app/settings/app-passwords |
| `BEEHIIV_API_KEY` | Optional | solo-founder | `/content-machine` | app.beehiiv.com/settings |
| `CONVERTKIT_API_KEY` | Optional | solo-founder | `/content-machine` | app.convertkit.com/settings |
| `CARTA_API_KEY` | Optional | solo-founder | `/cap-table` | carta.com/settings |
| `PULLEY_API_KEY` | Optional | solo-founder | `/cap-table` | pulley.com/settings |
| `LOOM_API_KEY` | Optional | solo-founder | `/demo-script` | loom.com/settings |
| `STRIPE_SECRET_KEY` | Optional | solo-founder | `/runway` `/legal-basics` | dashboard.stripe.com/developers |
| `VERCEL_TOKEN` + `VERCEL_ORG_ID` + `VERCEL_PROJECT_ID` | Core (if using Vercel) | release-engineer | `/land-and-deploy` | vercel.com/account/tokens |
| `FLY_API_TOKEN` | Core (if using Fly.io) | release-engineer | `/land-and-deploy` | fly.io/user/personal_access_tokens |
| `RENDER_API_KEY` + `RENDER_SERVICE_ID` | Core (if using Render) | release-engineer | `/land-and-deploy` | render.com/docs/api |

---

## Tier Definitions

**CORE** — the agent or workflow won't function without this. Set it before running that agent.

**RECOMMENDED** — the agent works without it, but you'll hit walls fast. Worth 5 minutes to set up.

**OPTIONAL** — adds a specific integration. Set when you need that particular workflow.

---

## Setup Guides

### GH_TOKEN — GitHub Personal Access Token

**What it unlocks:** Full `/ship` workflow — automatic PR creation, branch management, CI status checks, merging via `/land-and-deploy`. Without it, the release-engineer can do git operations but can't interact with the GitHub API.

**How to get it:**
1. Go to [github.com/settings/tokens](https://github.com/settings/tokens)
2. Click "Generate new token (classic)"
3. Name: `company-os-release`
4. Expiration: 90 days (set a reminder to rotate)
5. Scopes: check `repo` + `workflow`
6. Copy the token (starts with `ghp_` or `github_pat_`)

**Minimum scopes:**
- `repo` — read/write to repositories
- `workflow` — update GitHub Actions workflows (needed for `/land-and-deploy`)

**Where to set it:**
```bash
echo "GH_TOKEN=ghp_yourtoken" >> .env
```

---

### X / Twitter Access

**What it unlocks:** `/x-research` and `/last30days-nux` become your best research tools — real-time X search with engagement signals, thread following, and synthesis. Without X access, these skills fall back to Reddit + HN only.

**Three methods — pick one:**

#### Method A: xAI API Key (recommended for teams)
- Persistent, no expiry, no browser dependency
- ~$0.05/search query
- Get it: [api.x.ai](https://api.x.ai) → Create API key
- Set: `XAI_API_KEY=xai_yourkey`

#### Method B: Browser cookies (free, for personal use)
- Reads your logged-in x.com session — same access as your account
- Expires when your browser session expires
- Set: `FROM_BROWSER=auto` in your `.env`
- Chrome on macOS will prompt for Keychain access the first time

#### Method C: Manual cookies (advanced)
- For environments without browser access
- Get cookies: x.com → F12 → Application → Cookies → copy `auth_token` and `ct0`
- Set: `X_AUTH_TOKEN=...` and `X_CT0=...`

---

### SCRAPECREATORS_API_KEY — TikTok & Instagram Research

**What it unlocks:** Adds TikTok, Instagram, and a Reddit backup to `/last30days-nux`. Useful for consumer products, creator economy research, and any audience that skews younger.

**How to get it:** [scrapecreators.com](https://scrapecreators.com) → Sign up with GitHub → copy your API key.
- 10,000 free API calls, no credit card required
- After free tier: pay-as-you-go

**After getting the key:**
```bash
echo "SCRAPECREATORS_API_KEY=sc_yourkey" >> .env
```

Then add to `~/.config/last30days/.env`:
```
SCRAPECREATORS_API_KEY=sc_yourkey
INCLUDE_SOURCES=tiktok,instagram
```

---

### BRAVE_API_KEY — Web Search

**What it unlocks:** Better web search results in `/researching-web` and `/last30days-nux`. Without it, web search falls back to DuckDuckGo.

**How to get it:** [brave.com/search/api](https://brave.com/search/api) → Sign up → Free Data for Independents: 2,000 queries/month free.

---

### OPENROUTER_API_KEY — Deep Research (Perplexity Sonar)

**What it unlocks:** Adds Perplexity Sonar Pro to `/last30days-nux --deep-research`. Returns AI-synthesized reports with 50+ citations on complex topics. ~$0.02/query for standard, ~$0.90 for exhaustive deep research.

**How to get it:** [openrouter.ai](https://openrouter.ai) → Sign in → Create API key.

---

### BEEHIIV_API_KEY / CONVERTKIT_API_KEY — Newsletter Automation

**What it unlocks:** `/content-machine` can draft newsletter issues and schedule them, not just output markdown.

**Beehiiv:** Recommended for build-in-public, growth newsletters.
- Get it: [app.beehiiv.com](https://app.beehiiv.com) → Settings → API

**ConvertKit:** Recommended for lead gen sequences, product launches.
- Get it: [app.convertkit.com](https://app.convertkit.com) → Settings → Advanced → API Secret

Only set the one you use.

---

### CARTA_API_KEY / PULLEY_API_KEY — Cap Table Sync

**What it unlocks:** `/cap-table` pulls live equity data instead of asking you to paste numbers manually. Dilution modeling and scenario analysis become real-time.

**Carta:** Dominant for VC-backed companies.
- Get it: Carta Settings → Integrations → API

**Pulley:** Simpler, recommended for early-stage pre-seed companies.
- Get it: Pulley Settings → API Access

---

### STRIPE_SECRET_KEY — Revenue Data

**What it unlocks:** `/runway` can pull live MRR and burn rate directly from Stripe instead of asking you to enter numbers. Makes monthly financial reviews much faster.

**Use a restricted key — read-only:**
1. [dashboard.stripe.com/developers/api-keys](https://dashboard.stripe.com/developers/api-keys)
2. "Create restricted key"
3. Read access only on: Charges, Customers, Subscriptions, Balance
4. Name it: `company-os-runway`

---

### Deployment Credentials

The release-engineer uses `/land-and-deploy` to deploy to production. You need the credentials for your platform.

**Vercel:**
```bash
VERCEL_TOKEN=your_vercel_token       # vercel.com/account/tokens
VERCEL_ORG_ID=team_xxx               # vercel.com/[org]/settings
VERCEL_PROJECT_ID=prj_xxx            # vercel.com/[org]/[project]/settings
```

**Fly.io:**
```bash
FLY_API_TOKEN=fo1_xxx                # fly.io/user/personal_access_tokens
```

**Render:**
```bash
RENDER_API_KEY=rnd_xxx               # render.com → Account Settings → API Keys
RENDER_SERVICE_ID=srv-xxx            # render.com → your service → Settings
```

The fastest way to configure deployment is: run `/setup-deploy` in Claude Code. It auto-detects your platform and writes the right config.

---

## Security Practices

### Never commit `.env`
The `.gitignore` already excludes `.env`. Always verify before committing:
```bash
git status | grep .env   # should show nothing
```

### Minimum scopes
Every credential above is described with minimum required scopes. Request only what's needed. A compromised read-only Stripe key can't create charges.

### Rotation schedule

| Credential | Rotate Every |
|-----------|-------------|
| `GH_TOKEN` | 90 days |
| `XAI_API_KEY` | 180 days |
| `STRIPE_SECRET_KEY` | 90 days |
| `VERCEL_TOKEN` / `FLY_API_TOKEN` | 180 days |
| Browser cookies (`FROM_BROWSER`) | Auto-expires with session |
| `SCRAPECREATORS_API_KEY` | Annual |

### What to do if a credential is leaked
1. Immediately revoke it at the provider
2. Generate a new one
3. Update your `.env`
4. Run `./credentials/check.sh` to verify the new credential works
5. If it was committed: contact the provider's security team, they often auto-detect exposed tokens

---

## Per-Agent Credential Requirements

### chief-of-staff
No credentials required. Runs fully on Claude Code.

### product-manager
No credentials required.

### research-analyst
- `XAI_API_KEY` or `FROM_BROWSER=auto` — **Recommended** for X research
- `BRAVE_API_KEY` — Optional, better web search
- `SCRAPECREATORS_API_KEY` — Optional, adds TikTok/Instagram
- `OPENROUTER_API_KEY` — Optional, deep research mode
- `BSKY_HANDLE` + `BSKY_APP_PASSWORD` — Optional, Bluesky research

### cto
No credentials required.

### frontend-engineer
No credentials required.

### backend-engineer
No credentials required.

### release-engineer
- `GH_TOKEN` — **Recommended** for full ship workflow
- Deployment credentials (`VERCEL_TOKEN` or `FLY_API_TOKEN` or `RENDER_API_KEY`) — **Core** for `/land-and-deploy`

### qa-engineer
No API credentials needed. Browser cookies imported at runtime via `/setup-browser-cookies`.

### design-consultant
No credentials required.

### security-officer
No credentials required.

### content-writer
No credentials required.

### solo-founder
- `XAI_API_KEY` or `FROM_BROWSER=auto` — **Recommended** for research skills
- `STRIPE_SECRET_KEY` — Optional, live revenue data in `/runway`
- `BEEHIIV_API_KEY` or `CONVERTKIT_API_KEY` — Optional, newsletter automation in `/content-machine`
- `CARTA_API_KEY` or `PULLEY_API_KEY` — Optional, live cap table in `/cap-table`
- `LOOM_API_KEY` — Optional, demo upload in `/demo-script`
