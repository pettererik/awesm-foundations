# Deploy safety — done means verified live

This project deploys via `deploy/deploy.sh <profile> [service]` (see `deploy/README.md`). These
rules exist because a deploy was once marked "Phase 1 COMPLETE" on file-existence alone — the
profile had a placeholder GCP project and had never actually been run. That failure mode is what
this rule blocks.

## Design for independent deployment — decide this AT architecture time, not after
If this project has more than one service (frontend, backend, api gateway, workers, …), design
each so it can be built and deployed on its **own**: its own Dockerfile, its own entry in
`deploy/deploy.sh` (so `deploy.sh <profile> <service>` ships just that one), and profile config
that carries it. This is the standard microservice property — shipping one service must not force
redeploying the rest. Hold it in mind while shaping module boundaries: retrofitting independent
deploy onto services that assumed a single lockstep deploy is far more work than designing for it
up front. Common trap: a frontend that bakes the api's URL in at build time couples the two —
give the api a stable custom domain instead, so each service deploys alone. The `deploy` skill
reads the architecture to place each service correctly; your job at design time is to not paint it
into a corner.

## Done = verified live, never "file exists" or "script parses"

A deploy claim needs a running proof: the deployed URL returned 200, the revision is Ready, the
resource knobs actually applied. "The profile file is there" or "the script has no syntax errors"
is not verification — run it, check the live result, then report done.

## Prod requires explicit in-session confirmation

Never infer the deploy target from ambiguous phrasing. If the user says "dev" but the only
configured profile is prod-shaped, or if a profile's realness is unclear, STOP and ask which
environment before deploying — do not guess and proceed. Confirm before every prod deploy: show
the target project + what will change, wait for an explicit yes.

## Profiles carry a real project or the guard refuses

`deploy.sh` hard-fails (exit 1) on a `GCP_PROJECT_ID` that's empty or a `your-*` sentinel. Never
weaken or remove this guard to make a deploy "succeed" — an unconfigured profile should fail loudly,
not deploy to the wrong place or silently no-op.

## Containerized path only

Deploys build from the same Docker path as local dev (`local-env-docker-only` if present in this
project) — never deploy a host-built artifact. Mock-mode success is never deploy verification.

## Report honestly

State exactly what was verified (which URLs, which checks) and what wasn't. Never report GREEN
because a script exited 0 if the live result wasn't checked.
