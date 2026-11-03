#!/bin/sh
# Report GitHub Copilot CLI state to the terminal via OSC 7501 (Program Status Protocol).
# Usage (from a Copilot CLI hook): rex-status.sh <state> [kind]
#   state: idle | working | done | blocked | error | clear
#   kind:  permission | question | auth   (only used with "blocked")
#
# Copilot parses hook stdout as JSON, so the escape sequence is written to
# /dev/tty instead, and nothing is printed to stdout.

state=$1
kind=$2

# Pull a human-readable message from the hook payload on stdin (needs jq; optional).
msg=""
if command -v jq >/dev/null 2>&1; then
  msg=$(jq -r '.message // .error.message // empty' 2>/dev/null | tr -d '\000-\037\177')
fi

body="state=$state:app=copilot-cli"
[ -n "$kind" ] && body="$body:kind=$kind"
[ -n "$msg" ] && body="$body:msg=$(printf '%s' "$msg" | base64 | tr -d '\n')"

{ printf '\033]7501;%s\033\\' "$body" > /dev/tty; } 2>/dev/null
exit 0
