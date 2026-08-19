# Harness file scope — new-file protector

This project runs on the `awesm-harness` plugin. Machinery (agents, hooks, commands, skills)
comes from the plugin itself and is never copied into this repo — see `CLAUDE.md`.

## The scaffold this repo owns

- `CLAUDE.md` — thin core + your `PROJECT-SPECIFIC` section.
- `.claude/rules/*` — always-on context (`agent-memory.md`, `graphify.md`, this file).
- `progress.md`, `clean-state-checklist.md`, `evaluator-rubric.md` — current-state files, owned by `state-handler`.
- `docs/` (`PRD.md` as the specs index, `architecture.md`, `technical-requirements.md`, and
  `docs/specs/<slug>.md` per feature) — owned by `docs-writer`. `docs/specs/<slug>.md` is the one
  sanctioned exception to the new-file rule below: `docs-writer` creates these freely, one per
  feature, under its own granularity check — no per-instance confirmation needed for those
  specifically. Everything else in `docs/` still needs confirmation like any other new file.
- `init.sh`, `.gitignore`, `.graphifyignore` — project machine setup.

`/harness-update` reconciles these against the plugin's current templates after an
update — it preserves your `PROJECT-SPECIFIC` markers and never clobbers project-owned files.

## New files are protected — MUST get user confirmation

No agent may create a **new file** in this repo (a new rule, a new state file, a new top-level
config) without the user's explicit confirmation.
- Update an existing file that owns the concern first.
- If a task seems to need a new file, STOP and ask the user — name the file and why an existing
  one can't hold it. Create it only after they confirm.

## Not restricted

- Your own project code and files — this rule only governs harness scaffold/state files.
- Tool-regenerated output (e.g. `graphify update .` → `graphify-out/`).
