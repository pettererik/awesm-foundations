# Evals — harness self-check

Automated checks on the **harness's own behavior**, not on any app built from it.
Where tests verify code, these verify the harness pieces you *designed* still hold after edits.

Ships with the harness: a project inherits these (they verify the delivered hooks/agents),
and adds its **own** separate suite for its app.

## Run
```bash
bash evals/run.sh          # all cases; exit 0 = green (this is what CI runs)
bash -n evals/run.sh evals/cases/*.sh   # syntax only
```

## Cases
- **`cases/stop-hook.sh`** — behavioral. Runs `.claude/hooks/state-handler-reminder.sh`
  in isolated temp git repos and asserts it: blocks on a real change, stays silent on a
  state-file-only / no change, gates once (`stop_hook_active`), and fails open on bad input.
- **`cases/structure.sh`** — structural. Agent frontmatter (name/description → callable),
  restricted-agent boundaries intact, `settings.json` is valid JSON, hooks executable +
  `bash -n` clean.

## Scope boundary
These cover **deterministic** behavior only. Whether an agent *reasons* correctly
(e.g. state-handler judging the checklist well) needs the live model and is verified
manually / in review — it is intentionally NOT faked here.

## Add a case
Drop `cases/<name>.sh`, `. "$(dirname "$0")/../lib.sh"`, call `pass`/`fail`,
end with `exit "$FAILS"`. `run.sh` discovers it automatically.
