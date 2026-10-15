#!/bin/bash
# Claude Code status line for vic
# Colours mirror bash-it.vic.theme.bash: magenta user, orange host,
# green cwd, purple git branch.
#
#  WORK  vic@earth ~/vic-scripts on master* | Opus 5 high | 42% ctx | $0.31 +12/-3 | 5h 23% 2h14m | 7d 41% 3d0h
#
# Symlinked into place by setup-vic-config.sh as ~/.claude/statusline.sh
# and wired up via the "statusLine" key in ~/.claude/settings.json.

input=$(cat)

if tput setaf 1 &> /dev/null && [[ $(tput colors) -ge 256 ]] 2>/dev/null; then
  MAGENTA=$'\033[38;5;9m'
  ORANGE=$'\033[38;5;172m'
  GREEN=$'\033[38;5;190m'
  PURPLE=$'\033[38;5;141m'
  WHITE=$'\033[38;5;243m'
  RED=$'\033[38;5;196m'
  YELLOW=$'\033[38;5;220m'
  RESET=$'\033[0m'
else
  MAGENTA=$'\033[1;31m'; ORANGE=$'\033[1;33m'; GREEN=$'\033[1;32m'
  PURPLE=$'\033[1;35m'; WHITE=$'\033[1;37m'; RED=$'\033[1;31m'
  YELLOW=$'\033[1;33m'; RESET=$'\033[m'
fi

# Absent numbers come back as -1 so the shell can tell "missing" from "zero".
read -r DIR MODEL EFFORT PCT COST ADDED REMOVED \
        FIVE_H FIVE_H_AT WEEK WEEK_AT SPEND SPEND_AT < <(
  printf '%s' "$input" | jq -r '
    def num($v): if ($v == null) then -1 else ($v | floor) end;
    [ (.workspace.current_dir // .cwd // "?")
    , (.model.display_name // "?" | gsub(" "; "_"))
    , (.effort.level // "-")
    , num(.context_window.used_percentage)
    , (.cost.total_cost_usd // 0)
    , (.cost.total_lines_added // 0)
    , (.cost.total_lines_removed // 0)
    , num(.rate_limits.five_hour.used_percentage)
    , num(.rate_limits.five_hour.resets_at)
    , num(.rate_limits.seven_day.used_percentage)
    , num(.rate_limits.seven_day.resets_at)
    , num(.rate_limits.spend_limit.used_percentage)
    , num(.rate_limits.spend_limit.resets_at)
    ] | @tsv' | tr '\t' ' '
)
MODEL=${MODEL//_/ }
(( PCT < 0 )) && PCT=0

# Colour a 0-100 usage number: green, amber past 70, red past 90.
usage_color() {
  if   (( $1 >= 90 )); then printf '%s' "$RED"
  elif (( $1 >= 70 )); then printf '%s' "$YELLOW"
  else                      printf '%s' "$GREEN"
  fi
}

# "2h14m" / "43m" / "" once the window has already rolled over.
until_reset() {
  local at=$1 left
  (( at < 0 )) && return
  left=$(( at - $(date +%s) ))
  (( left <= 0 )) && return
  if (( left >= 86400 )); then
    printf '%dd%dh' $(( left / 86400 )) $(( (left % 86400) / 3600 ))
  elif (( left >= 3600 )); then
    printf '%dh%02dm' $(( left / 3600 )) $(( (left % 3600) / 60 ))
  else
    printf '%dm' $(( left / 60 ))
  fi
}

# " | 5h 23% 2h14m" — skipped entirely when the window is absent.
limit_segment() {
  local label=$1 pct=$2 at=$3 left
  (( pct < 0 )) && return
  left=$(until_reset "$at")
  printf '%s | %s %s%d%%%s' "$WHITE" "$label" "$(usage_color "$pct")" "$pct" "$WHITE"
  [[ -n $left ]] && printf ' %s' "$left"
}

# ~ instead of $HOME, same as the shell prompt
PRETTY_DIR=${DIR/#$HOME/\~}

# branch + dirty marker, cheaply
GIT=""
if branch=$(git -C "$DIR" symbolic-ref --quiet --short HEAD 2>/dev/null ||
            git -C "$DIR" rev-parse --short HEAD 2>/dev/null); then
  dirty=""
  [[ -n $(git -C "$DIR" status --porcelain 2>/dev/null) ]] && dirty="*"
  GIT="${WHITE} on ${PURPLE}${branch}${dirty}"
fi

DIFF=""
if (( ADDED > 0 || REMOVED > 0 )); then
  DIFF=" ${GREEN}+${ADDED}${WHITE}/${RED}-${REMOVED}"
fi

LIMITS="$(limit_segment 5h "$FIVE_H" "$FIVE_H_AT")"
LIMITS+="$(limit_segment 7d "$WEEK" "$WEEK_AT")"
LIMITS+="$(limit_segment spend "$SPEND" "$SPEND_AT")"

# Drop the host prefix on a narrow terminal so the limits always survive.
HOST_SEG=""
if (( ${COLUMNS:-120} >= 100 )); then
  HOST_SEG="${MAGENTA}${USER}${WHITE}@${ORANGE}${HOSTNAME:-$(hostname -s)} "
fi

# Account badge first: the status-line JSON has no account field, so read the
# active profile's login (claude: ~/.claude.json, claude-vic: ~/.claude-vic/.claude.json).
ACCOUNT_SEG=""
case $(jq -r '.oauthAccount.emailAddress // empty' "${CLAUDE_CONFIG_DIR:-$HOME}/.claude.json" 2>/dev/null) in
  "")       ;;
  *@usb.ch) ACCOUNT_SEG=$'\033[1;97;44m WORK \033[0m ' ;;
  *)        ACCOUNT_SEG=$'\033[1;30;42m PERSONAL \033[0m ' ;;
esac

printf '%s%s%s%s%s%s | %s%s%s %s%s | %s%d%%%s ctx | %s$%.2f%s%s%s\n' \
  "$ACCOUNT_SEG" \
  "$HOST_SEG" \
  "$GREEN" "$PRETTY_DIR" "$GIT" "$WHITE" \
  "$ORANGE" "$MODEL" "$WHITE" "$WHITE" "$EFFORT" \
  "$(usage_color "$PCT")" "$PCT" "$WHITE" \
  "$WHITE" "$COST" "$DIFF" \
  "$LIMITS" "$RESET"
