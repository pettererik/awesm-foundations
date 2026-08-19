# When to use graphify

If `graphify-out/graph.json` exists, **prefer graphify over grepping or reading raw files** for codebase questions — it returns a scoped subgraph and is far cheaper on tokens.

- Codebase question → `graphify query "<question>"` first.
- How two things relate → `graphify path "<A>" "<B>"`.
- A specific concept → `graphify explain "<concept>"`.
- Broad navigation → `graphify-out/wiki/index.md` (if present).
- Broad architecture review → `graphify-out/GRAPH_REPORT.md`, only when query/path/explain aren't enough.
- After changing code → `graphify update .` (AST-only, no API cost).

If `graphify-out/` doesn't exist yet, use normal search.
