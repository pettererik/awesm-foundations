#!/usr/bin/env bash
# Harness eval runner. Discovers evals/cases/*.sh, runs each, reports pass/fail.
# Exit non-zero if any case file fails — this is what CI gates on.
set -u
cd "$(dirname "$0")"

total=0
failed=0
for c in cases/*.sh; do
  [ -e "$c" ] || continue
  echo "▶ $(basename "$c")"
  bash "$c"
  rc=$?
  total=$((total + 1))
  [ "$rc" -ne 0 ] && failed=$((failed + 1))
  echo
done

echo "──────────────────────────"
if [ "$failed" -eq 0 ]; then
  echo "All $total eval file(s) passed."
  exit 0
fi
echo "$failed/$total eval file(s) failed."
exit 1
