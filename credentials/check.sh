#!/usr/bin/env bash
# credentials/check.sh — Preflight credential check for company-os
#
# Usage:
#   ./credentials/check.sh           # check all credentials
#   ./credentials/check.sh --agent research-analyst   # check one agent
#   ./credentials/check.sh --json    # machine-readable output
#
# Color codes
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BLUE='\033[0;34m'
BOLD='\033[1m'
RESET='\033[0m'

# Load .env if it exists
ENV_FILE="$(git rev-parse --show-toplevel 2>/dev/null)/.env"
if [ -f "$ENV_FILE" ]; then
  # shellcheck disable=SC1090
  set -a && source "$ENV_FILE" && set +a
fi

# ── Flags ─────────────────────────────────────────────────────────────────────
AGENT_FILTER=""
JSON_MODE=false

while [[ $# -gt 0 ]]; do
  case "$1" in
    --agent) AGENT_FILTER="$2"; shift 2 ;;
    --json)  JSON_MODE=true; shift ;;
    *)       shift ;;
  esac
done

# ── Helpers ───────────────────────────────────────────────────────────────────
pass=0
warn=0
fail=0

check() {
  local name="$1"
  local tier="$2"   # CORE | RECOMMENDED | OPTIONAL
  local agent="$3"
  local skills="$4"
  local value="${!name}"
  local note="$5"

  # Filter by agent if requested
  if [ -n "$AGENT_FILTER" ] && [[ "$agent" != *"$AGENT_FILTER"* ]]; then
    return
  fi

  if [ -n "$value" ]; then
    if $JSON_MODE; then
      echo "{\"name\":\"$name\",\"status\":\"set\",\"tier\":\"$tier\",\"agent\":\"$agent\",\"skills\":\"$skills\"}"
    else
      printf "${GREEN}✓${RESET} ${BOLD}%-35s${RESET} [%s] %s → %s\n" "$name" "$tier" "$agent" "$skills"
    fi
    ((pass++))
  else
    case "$tier" in
      CORE)
        if $JSON_MODE; then
          echo "{\"name\":\"$name\",\"status\":\"missing\",\"tier\":\"$tier\",\"agent\":\"$agent\",\"skills\":\"$skills\",\"note\":\"$note\"}"
        else
          printf "${RED}✗${RESET} ${BOLD}%-35s${RESET} [${RED}%s${RESET}] %s → %s\n" "$name" "$tier" "$agent" "$skills"
          [ -n "$note" ] && printf "  ${RED}↳ %s${RESET}\n" "$note"
        fi
        ((fail++))
        ;;
      RECOMMENDED)
        if $JSON_MODE; then
          echo "{\"name\":\"$name\",\"status\":\"missing\",\"tier\":\"$tier\",\"agent\":\"$agent\",\"skills\":\"$skills\",\"note\":\"$note\"}"
        else
          printf "${YELLOW}⚠${RESET} ${BOLD}%-35s${RESET} [${YELLOW}%s${RESET}] %s → %s\n" "$name" "$tier" "$agent" "$skills"
          [ -n "$note" ] && printf "  ${YELLOW}↳ %s${RESET}\n" "$note"
        fi
        ((warn++))
        ;;
      OPTIONAL)
        if $JSON_MODE; then
          echo "{\"name\":\"$name\",\"status\":\"missing\",\"tier\":\"$tier\",\"agent\":\"$agent\",\"skills\":\"$skills\"}"
        else
          printf "${BLUE}○${RESET} %-35s [OPTIONAL] %s → %s\n" "$name" "$agent" "$skills"
        fi
        ((warn++))
        ;;
    esac
  fi
}

check_x() {
  # X/Twitter — any of three methods is fine
  if [ -n "$XAI_API_KEY" ]; then
    printf "${GREEN}✓${RESET} ${BOLD}%-35s${RESET} [RECOMMENDED] research-analyst, solo-founder → /x-research /last30days-nux\n" "XAI_API_KEY (method: xai)"
    ((pass++))
  elif [ "$FROM_BROWSER" = "auto" ]; then
    printf "${GREEN}✓${RESET} ${BOLD}%-35s${RESET} [RECOMMENDED] research-analyst, solo-founder → /x-research /last30days-nux\n" "FROM_BROWSER=auto (method: cookies)"
    ((pass++))
  elif [ -n "$X_AUTH_TOKEN" ] && [ -n "$X_CT0" ]; then
    printf "${GREEN}✓${RESET} ${BOLD}%-35s${RESET} [RECOMMENDED] research-analyst, solo-founder → /x-research /last30days-nux\n" "X_AUTH_TOKEN+X_CT0 (method: manual)"
    ((pass++))
  else
    printf "${YELLOW}⚠${RESET} ${BOLD}%-35s${RESET} [${YELLOW}RECOMMENDED${RESET}] research-analyst, solo-founder → /x-research /last30days-nux\n" "X access (none configured)"
    printf "  ${YELLOW}↳ Set XAI_API_KEY, FROM_BROWSER=auto, or X_AUTH_TOKEN+X_CT0. See credentials/README.md.${RESET}\n"
    ((warn++))
  fi
}

check_deploy() {
  if [ -n "$VERCEL_TOKEN" ] && [ -n "$VERCEL_ORG_ID" ] && [ -n "$VERCEL_PROJECT_ID" ]; then
    printf "${GREEN}✓${RESET} ${BOLD}%-35s${RESET} [CORE] release-engineer → /land-and-deploy (platform: Vercel)\n" "Vercel credentials"
    ((pass++))
  elif [ -n "$FLY_API_TOKEN" ]; then
    printf "${GREEN}✓${RESET} ${BOLD}%-35s${RESET} [CORE] release-engineer → /land-and-deploy (platform: Fly.io)\n" "FLY_API_TOKEN"
    ((pass++))
  elif [ -n "$RENDER_API_KEY" ] && [ -n "$RENDER_SERVICE_ID" ]; then
    printf "${GREEN}✓${RESET} ${BOLD}%-35s${RESET} [CORE] release-engineer → /land-and-deploy (platform: Render)\n" "Render credentials"
    ((pass++))
  else
    printf "${BLUE}○${RESET} %-35s [OPTIONAL] release-engineer → /land-and-deploy\n" "Deployment credentials"
    printf "  ↳ Set when you're ready to deploy. Run /setup-deploy in Claude Code to configure.\n"
    ((warn++))
  fi
}

# ── Main Output ───────────────────────────────────────────────────────────────
if ! $JSON_MODE; then
  echo ""
  echo "${BOLD}company-os — Credential Check${RESET}"
  echo "──────────────────────────────────────────────────────────────────"
  if [ -f "$ENV_FILE" ]; then
    echo "Loaded from: $ENV_FILE"
  else
    echo "${YELLOW}No .env file found. Copy .env.example → .env and fill in your credentials.${RESET}"
    echo "  cp .env.example .env"
  fi
  echo "──────────────────────────────────────────────────────────────────"
  echo ""
  echo "${BOLD}GitHub${RESET}"
fi
check "GH_TOKEN" "RECOMMENDED" "release-engineer" "/ship /land-and-deploy /github" \
  "PR creation and GitHub API calls won't work without this. See: github.com/settings/tokens"

if ! $JSON_MODE; then echo ""; echo "${BOLD}X / Twitter${RESET}"; fi
check_x

if ! $JSON_MODE; then echo ""; echo "${BOLD}Web Search${RESET}"; fi
check "BRAVE_API_KEY"       "OPTIONAL" "research-analyst, solo-founder"  "/researching-web /last30days-nux" ""
check "EXA_API_KEY"         "OPTIONAL" "research-analyst"                "/researching-web" ""
check "OPENROUTER_API_KEY"  "OPTIONAL" "research-analyst, solo-founder"  "/last30days-nux --deep-research" ""

if ! $JSON_MODE; then echo ""; echo "${BOLD}Social Research${RESET}"; fi
check "SCRAPECREATORS_API_KEY" "OPTIONAL" "research-analyst, solo-founder" "/last30days-nux (TikTok, Instagram)" ""
check "BSKY_HANDLE"            "OPTIONAL" "research-analyst"               "/last30days-nux (Bluesky)" ""
check "BSKY_APP_PASSWORD"      "OPTIONAL" "research-analyst"               "/last30days-nux (Bluesky)" ""

if ! $JSON_MODE; then echo ""; echo "${BOLD}Solo Founder — Revenue & Finance${RESET}"; fi
check "STRIPE_SECRET_KEY" "OPTIONAL" "solo-founder" "/runway (live MRR)" ""
check "CARTA_API_KEY"     "OPTIONAL" "solo-founder" "/cap-table (live equity)" ""
check "PULLEY_API_KEY"    "OPTIONAL" "solo-founder" "/cap-table (live equity)" ""

if ! $JSON_MODE; then echo ""; echo "${BOLD}Solo Founder — Content & Marketing${RESET}"; fi
check "BEEHIIV_API_KEY"    "OPTIONAL" "solo-founder" "/content-machine (newsletter)" ""
check "CONVERTKIT_API_KEY" "OPTIONAL" "solo-founder" "/content-machine (email list)" ""

if ! $JSON_MODE; then echo ""; echo "${BOLD}Solo Founder — Product${RESET}"; fi
check "LOOM_API_KEY" "OPTIONAL" "solo-founder" "/demo-script (async demos)" ""

if ! $JSON_MODE; then echo ""; echo "${BOLD}Deployment${RESET}"; fi
check_deploy

# ── Summary ───────────────────────────────────────────────────────────────────
if ! $JSON_MODE; then
  echo ""
  echo "──────────────────────────────────────────────────────────────────"
  echo "${GREEN}✓ Configured:${RESET} $pass   ${YELLOW}⚠ Missing (recommended/optional):${RESET} $warn   ${RED}✗ Missing (core):${RESET} $fail"

  if [ "$fail" -gt 0 ]; then
    echo ""
    echo "${RED}${BOLD}Action required:${RESET} $fail CORE credential(s) are missing. Affected workflows won't run."
    echo "See credentials/README.md for setup instructions."
    exit 1
  elif [ "$pass" -eq 0 ]; then
    echo ""
    echo "Nothing configured yet. Copy .env.example → .env and fill in at minimum:"
    echo "  GH_TOKEN (for shipping) and XAI_API_KEY (for research)"
    echo ""
    echo "  cp .env.example .env"
  else
    echo ""
    echo "All core credentials are set. Run your agents."
  fi
fi
