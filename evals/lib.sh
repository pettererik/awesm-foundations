# Shared assertion helpers for eval cases. Sourced, not executed.
# A case sources this, calls pass/fail, then ends with:  exit $FAILS
FAILS=0
pass() { printf '  PASS - %s\n' "$1"; }
fail() { printf '  FAIL - %s\n' "$1"; FAILS=$((FAILS + 1)); }
