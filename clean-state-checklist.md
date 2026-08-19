# Clean State Checklist

The `state-handler`'s definition of done. Every box must be **genuinely** tickable —
verify with evidence, never assume. If a box can't be ticked, the state isn't clean:
either finish the work, or record exactly what's blocking it and the next step in `progress.md`.

## Changes are complete
- [ ] Every change this session is **finished and verified**, or **explicitly parked** in `progress.md` with a concrete next step — nothing is half-done and silent.
- [ ] No stray or broken leftovers — no syntax errors, no blocking `TODO`, no dead half-implementation left in the tree.
- [ ] Anything claimed "done" is **actually done and was verified with evidence**, not assumed.

## The repo runs
- [ ] The standard startup path still works.
- [ ] The standard verification path still runs, and its real result is recorded.

## The state is true
- [ ] `progress.md` reflects the actual current state **and** the next best step.
- [ ] Feature state reflects what is actually passing versus unverified — nothing inflated.
- [ ] Docs checked against the diff, explicitly — not assumed, not "documented elsewhere." Record the verdict in `progress.md` as a literal line: `Docs sync: in-sync` (no drift) or `Docs sync: pending: <what changed, which doc, why>` (drift found). This item is **not tickable** while the marker reads `pending` — it only ticks once `docs-writer` has actually run and the marker is updated to `in-sync`.
- [ ] The code map is current — if `graphify-out/` exists and code changed, `graphify update .` has been run so the map matches the tree (AST-only, no API cost).

## The handoff is clean
- [ ] The next session can continue from the repo artifacts alone, without manual repair.
