# Memory strategy

The harness remembers in two layers. Know which is automatic and which you drive.

## 1. claude-mem — long-term history (across sessions)
- **Capture + recall is automatic** (hooks): it records observations and injects relevant past context at session start. You don't manage this.
- **Search is manual** — do it actively:
  - Resuming or unfamiliar work → search for prior context.
  - Before re-solving anything → check if it was already done ("did we do this before?").
  - When stuck → look for how a similar problem was handled.
  - How: `/mem-search`, or the `mcp-search` tools (`search`, `smart_search`, `timeline`, `observation_search`).

## 2. State files — the current picture (you maintain these)
- `progress.md` — the single live pointer: current verified state + next step. Read when resuming; update as state changes / before stopping.
- `clean-state-checklist.md` - the clean state rubric, ensuring next session can continue seamlessly. 
- `docs/` (PRD, technical-requirements, architecture) + `feature_list.json` — durable project facts; read on demand, update when decisions change.

## Division of labor
- **History → claude-mem** (automatic, exhaustive). Don't hand-maintain a log — it's already captured.
- **Current state → `progress.md`** (curated; the single source of truth for "where are we now").
- Don't redo work that's already recorded, and don't duplicate claude-mem's history into the state files.
