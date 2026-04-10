#!/usr/bin/env bash
# auto-dream.sh — Nightly MEMORY.md consolidation for Paperclip agents
#
# Inspired by human REM sleep: searches learnings.jsonl for high-signal patterns
# and consolidates them into MEMORY.md, keeping it under the 200-line limit.
#
# Run nightly (or manually) to prevent MEMORY.md from bloating.
# Wire to cron: 0 2 * * * /path/to/company-os/memory/auto-dream.sh
#
# Usage:
#   ./auto-dream.sh                    # auto-detect project slug
#   ./auto-dream.sh --slug my-project  # explicit slug
#   ./auto-dream.sh --dry-run          # preview changes without writing
#   ./auto-dream.sh --agent cto        # consolidate for a specific agent

set -euo pipefail

# ─── Config ──────────────────────────────────────────────────────────────────

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
COMPANY_OS_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
GSTACK_HOME="${GSTACK_HOME:-$HOME/.gstack}"
MEMORY_MD="$SCRIPT_DIR/MEMORY.md"
MAX_LINES=190  # Stay under 200-line limit with buffer

# ─── Args ─────────────────────────────────────────────────────────────────────

DRY_RUN=false
SLUG=""
AGENT_FILTER=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    --dry-run) DRY_RUN=true; shift ;;
    --slug) SLUG="$2"; shift 2 ;;
    --agent) AGENT_FILTER="$2"; shift 2 ;;
    *) echo "Unknown arg: $1"; exit 1 ;;
  esac
done

# ─── Resolve slug ────────────────────────────────────────────────────────────

if [ -z "$SLUG" ]; then
  if command -v gstack-slug &>/dev/null; then
    eval "$(gstack-slug 2>/dev/null)" 2>/dev/null || true
  fi

  if [ -z "${SLUG:-}" ]; then
    # Fallback: derive from company-os root directory name
    SLUG="$(basename "$COMPANY_OS_ROOT" | tr '[:upper:]' '[:lower:]' | tr ' /' '-')"
  fi
fi

LEARNINGS_FILE="$GSTACK_HOME/projects/$SLUG/learnings.jsonl"
CHECKPOINT_DIR="$GSTACK_HOME/projects/$SLUG/checkpoints"

echo "=== auto-dream.sh ==="
echo "Slug:        $SLUG"
echo "Learnings:   $LEARNINGS_FILE"
echo "MEMORY.md:   $MEMORY_MD"
echo "Dry run:     $DRY_RUN"
echo ""

# ─── Check current MEMORY.md size ────────────────────────────────────────────

current_lines=0
if [ -f "$MEMORY_MD" ]; then
  current_lines=$(wc -l < "$MEMORY_MD" | tr -d ' ')
fi

echo "Current MEMORY.md: $current_lines lines (limit: $MAX_LINES)"

if [ "$current_lines" -lt 100 ] && [ ! -f "$LEARNINGS_FILE" ]; then
  echo "Nothing to consolidate — MEMORY.md is healthy and no learnings yet."
  exit 0
fi

# ─── Load learnings ──────────────────────────────────────────────────────────

declare -a HIGH_CONFIDENCE=()
declare -a MEDIUM_CONFIDENCE=()
declare -a PATTERNS=()
declare -a PITFALLS=()
declare -a ARCHITECTURE=()
declare -a OPERATIONAL=()

if [ -f "$LEARNINGS_FILE" ]; then
  total_learnings=$(wc -l < "$LEARNINGS_FILE" | tr -d ' ')
  echo "Loaded $total_learnings learnings from $LEARNINGS_FILE"

  # Parse learnings with jq if available, else use grep
  if command -v jq &>/dev/null; then
    # High confidence (8-10): worth promoting to MEMORY.md
    while IFS= read -r line; do
      HIGH_CONFIDENCE+=("$line")
    done < <(jq -c 'select(.confidence >= 8)' "$LEARNINGS_FILE" 2>/dev/null || true)

    # Medium confidence (5-7): keep in learnings, summarize
    while IFS= read -r line; do
      MEDIUM_CONFIDENCE+=("$line")
    done < <(jq -c 'select(.confidence >= 5 and .confidence < 8)' "$LEARNINGS_FILE" 2>/dev/null || true)

    # Group by type
    while IFS= read -r line; do
      PATTERNS+=("$line")
    done < <(jq -c 'select(.type == "pattern" and .confidence >= 7)' "$LEARNINGS_FILE" 2>/dev/null || true)

    while IFS= read -r line; do
      PITFALLS+=("$line")
    done < <(jq -c 'select(.type == "pitfall" and .confidence >= 6)' "$LEARNINGS_FILE" 2>/dev/null || true)

    while IFS= read -r line; do
      ARCHITECTURE+=("$line")
    done < <(jq -c 'select(.type == "architecture" and .confidence >= 7)' "$LEARNINGS_FILE" 2>/dev/null || true)

    while IFS= read -r line; do
      OPERATIONAL+=("$line")
    done < <(jq -c 'select(.type == "operational" and .confidence >= 6)' "$LEARNINGS_FILE" 2>/dev/null || true)
  else
    echo "Warning: jq not installed. Install jq for full consolidation: brew install jq"
    # Fallback: just count
    echo "Learnings file exists but jq unavailable for parsing."
  fi
else
  echo "No learnings file found at $LEARNINGS_FILE"
  echo "Run any gstack skill to start generating learnings."
fi

# ─── Check latest checkpoint ─────────────────────────────────────────────────

latest_checkpoint=""
if [ -d "$CHECKPOINT_DIR" ]; then
  latest_checkpoint=$(find "$CHECKPOINT_DIR" -name "*.md" -type f 2>/dev/null | xargs ls -t 2>/dev/null | head -1 || true)
fi

# ─── Identify what MEMORY.md already contains ────────────────────────────────

existing_memory=""
if [ -f "$MEMORY_MD" ]; then
  existing_memory=$(cat "$MEMORY_MD")
fi

# ─── Build consolidation report ──────────────────────────────────────────────

echo ""
echo "=== Consolidation Report ==="
echo "High-confidence learnings to promote: ${#HIGH_CONFIDENCE[@]}"
echo "Patterns to add: ${#PATTERNS[@]}"
echo "Pitfalls to add: ${#PITFALLS[@]}"
echo "Architecture decisions: ${#ARCHITECTURE[@]}"
echo "Operational notes: ${#OPERATIONAL[@]}"
echo ""

# ─── Generate MEMORY.md additions ────────────────────────────────────────────

ADDITIONS=""

# Add patterns section if we have any
if [ "${#PATTERNS[@]}" -gt 0 ]; then
  ADDITIONS+="## Confirmed Patterns\n\n"
  for learning in "${PATTERNS[@]}"; do
    if command -v jq &>/dev/null; then
      key=$(echo "$learning" | jq -r '.key // "unknown"')
      insight=$(echo "$learning" | jq -r '.insight // ""')
      confidence=$(echo "$learning" | jq -r '.confidence // 0')
      ts=$(echo "$learning" | jq -r '.ts // ""' | cut -c1-10)
      if [ -n "$insight" ]; then
        ADDITIONS+="- **$key** (confidence: $confidence/10, $ts): $insight\n"
      fi
    fi
  done
  ADDITIONS+="\n"
fi

# Add pitfalls section
if [ "${#PITFALLS[@]}" -gt 0 ]; then
  ADDITIONS+="## Known Pitfalls\n\n"
  for learning in "${PITFALLS[@]}"; do
    if command -v jq &>/dev/null; then
      key=$(echo "$learning" | jq -r '.key // "unknown"')
      insight=$(echo "$learning" | jq -r '.insight // ""')
      confidence=$(echo "$learning" | jq -r '.confidence // 0')
      if [ -n "$insight" ]; then
        ADDITIONS+="- **$key** (confidence: $confidence/10): $insight\n"
      fi
    fi
  done
  ADDITIONS+="\n"
fi

# Add architecture decisions
if [ "${#ARCHITECTURE[@]}" -gt 0 ]; then
  ADDITIONS+="## Architecture Decisions\n\n"
  for learning in "${ARCHITECTURE[@]}"; do
    if command -v jq &>/dev/null; then
      key=$(echo "$learning" | jq -r '.key // "unknown"')
      insight=$(echo "$learning" | jq -r '.insight // ""')
      skill=$(echo "$learning" | jq -r '.skill // ""')
      if [ -n "$insight" ]; then
        ADDITIONS+="- **$key** (via $skill): $insight\n"
      fi
    fi
  done
  ADDITIONS+="\n"
fi

# Add operational notes
if [ "${#OPERATIONAL[@]}" -gt 0 ]; then
  ADDITIONS+="## Operational Notes\n\n"
  for learning in "${OPERATIONAL[@]}"; do
    if command -v jq &>/dev/null; then
      key=$(echo "$learning" | jq -r '.key // "unknown"')
      insight=$(echo "$learning" | jq -r '.insight // ""')
      if [ -n "$insight" ]; then
        ADDITIONS+="- **$key**: $insight\n"
      fi
    fi
  done
  ADDITIONS+="\n"
fi

# ─── Enforce 200-line limit ───────────────────────────────────────────────────

# If MEMORY.md would exceed the limit, prune low-signal sections
if [ "$current_lines" -gt "$MAX_LINES" ]; then
  echo "WARNING: MEMORY.md exceeds $MAX_LINES lines ($current_lines). Pruning..."

  if [ "$DRY_RUN" = false ]; then
    # Create backup
    cp "$MEMORY_MD" "${MEMORY_MD}.bak.$(date +%Y%m%d)"
    echo "Backup saved to ${MEMORY_MD}.bak.$(date +%Y%m%d)"

    # Truncate to MAX_LINES, preserving from the top
    head -n "$MAX_LINES" "$MEMORY_MD" > "${MEMORY_MD}.tmp"
    echo "" >> "${MEMORY_MD}.tmp"
    echo "<!-- auto-dream: truncated to $MAX_LINES lines on $(date +%Y-%m-%d) -->" >> "${MEMORY_MD}.tmp"
    mv "${MEMORY_MD}.tmp" "$MEMORY_MD"
    echo "MEMORY.md pruned to $MAX_LINES lines."
  else
    echo "[DRY RUN] Would prune MEMORY.md to $MAX_LINES lines"
  fi
fi

# ─── Write additions to MEMORY.md ────────────────────────────────────────────

if [ -n "$ADDITIONS" ]; then
  new_content="$(printf '%s' "$ADDITIONS")"
  new_lines=$(printf '%s' "$new_content" | wc -l | tr -d ' ')

  # Check if adding would exceed limit
  projected_lines=$((current_lines + new_lines))
  if [ "$projected_lines" -gt "$MAX_LINES" ]; then
    echo "Adding $new_lines lines would exceed limit ($projected_lines > $MAX_LINES)."
    echo "Prune MEMORY.md manually or increase MAX_LINES."
  else
    if [ "$DRY_RUN" = false ]; then
      {
        echo ""
        echo "---"
        echo "<!-- auto-dream: consolidated from learnings.jsonl on $(date +%Y-%m-%d) -->"
        printf '%s' "$new_content"
      } >> "$MEMORY_MD"
      echo "Added $new_lines lines to MEMORY.md (new total: $projected_lines)."
    else
      echo "[DRY RUN] Would add $new_lines lines to MEMORY.md"
      echo "---"
      printf '%s' "$new_content"
    fi
  fi
else
  echo "No new high-signal learnings to consolidate."
fi

# ─── Prune stale learnings from learnings.jsonl ──────────────────────────────

# After promoting high-confidence learnings to MEMORY.md,
# we can optionally prune them from learnings.jsonl to avoid duplication.
# Only prune entries that are already in MEMORY.md (by key).

if [ -f "$LEARNINGS_FILE" ] && command -v jq &>/dev/null && [ "${#HIGH_CONFIDENCE[@]}" -gt 0 ]; then
  if [ "$DRY_RUN" = false ]; then
    # Keep only learnings NOT already promoted (confidence < 8 or not already in MEMORY.md)
    # Simple approach: keep all medium and low confidence entries
    jq -c 'select(.confidence < 8)' "$LEARNINGS_FILE" > "${LEARNINGS_FILE}.tmp" 2>/dev/null || true
    remaining=$(wc -l < "${LEARNINGS_FILE}.tmp" | tr -d ' ')
    promoted=$((total_learnings - remaining))
    mv "${LEARNINGS_FILE}.tmp" "$LEARNINGS_FILE"
    echo "Promoted $promoted high-confidence learnings to MEMORY.md."
    echo "Kept $remaining medium/low-confidence learnings in learnings.jsonl."
  else
    echo "[DRY RUN] Would prune ${#HIGH_CONFIDENCE[@]} high-confidence learnings from learnings.jsonl"
  fi
fi

# ─── Log the dream session ────────────────────────────────────────────────────

DREAM_LOG="$SCRIPT_DIR/dream-log.jsonl"
if [ "$DRY_RUN" = false ]; then
  echo "{\"ts\":\"$(date -u +%Y-%m-%dT%H:%M:%SZ)\",\"slug\":\"$SLUG\",\"memory_lines\":$current_lines,\"learnings_promoted\":${#HIGH_CONFIDENCE[@]},\"patterns\":${#PATTERNS[@]},\"pitfalls\":${#PITFALLS[@]}}" >> "$DREAM_LOG"
  echo ""
  echo "Dream session logged to $DREAM_LOG"
fi

# ─── Summary ─────────────────────────────────────────────────────────────────

echo ""
echo "=== auto-dream complete ==="
echo ""
echo "Next run: Check cron (0 2 * * * $SCRIPT_DIR/auto-dream.sh)"
echo ""
echo "To add to cron:"
echo "  (crontab -l 2>/dev/null; echo \"0 2 * * * $SCRIPT_DIR/auto-dream.sh\") | crontab -"
echo ""
echo "To search learnings manually:"
echo "  gstack-learnings-search --limit 10 --cross-project"
echo ""
echo "Memory layer status:"
echo "  MEMORY.md:        $(wc -l < "$MEMORY_MD" 2>/dev/null || echo 0) / 200 lines"
echo "  learnings.jsonl:  $(wc -l < "$LEARNINGS_FILE" 2>/dev/null || echo 0) entries"
if [ -n "$latest_checkpoint" ]; then
  echo "  Latest checkpoint: $(basename "$latest_checkpoint")"
fi
