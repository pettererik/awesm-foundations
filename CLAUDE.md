# awesm-foundations

Where things live and who tends them — open a file only when a task needs it.
Leave the repo so the next session continues without guessing.

## Always in context
Binding, loaded every session:

@.claude/rules/graphify.md
@.claude/rules/agent-memory.md
@.claude/rules/harness-file-scope.md
@.claude/rules/caveman-delegation.md
@.claude/rules/deploy-safety.md

**`agent-memory` is the one to hold in mind** — the thread that stops a session repeating
itself: long-term history (claude-mem, searchable) + the live pointer (`progress.md`). Add your
own always/never rules as files here and `@`-import them.

## The map
**`project/`** — the product: app code, scripts, whatever this project ships. Everything else is scaffold for it.

**`docs/`** — the source of truth; read the slice a task touches before building against it.
Owned by **`docs-writer`** — route every doc change there; never edit `docs/` yourself or add a doc file without the user's ok.
- `PRD.md` — what we're building and for whom.
- `architecture.md` — how the system is shaped.
- `technical-requirements.md` — stack, conventions, constraints.
- `feature_list.json` — per-feature status (once it exists).

**`progress.md` + state files** — `progress.md` is current state + next step (read to orient);
`clean-state-checklist.md` and `evaluator-rubric.md` are its rubrics. Owned by **`state-handler`**.

**`consultant`** — for shaping a vague brief or onboarding (not a file).

**Harness machinery** (agents, hooks, commands, skills) comes from the `awesm-harness` plugin —
declared in `.claude/settings.json`. To update it, run `/harness-update` (or, by hand from the
project root, `claude plugin update awesm-harness@awesm --scope project`), then restart Claude
Code. Never copy plugin internals into this repo.

**New files are protected**: don't add a new scaffold/state/rule/config file without the
user's explicit ok — update the existing file that owns the concern instead.

<!-- ══════════════════════════════════════════════════════════════════════════
     HARNESS CORE ends here. Everything below is PROJECT-SPECIFIC and is
     PRESERVED across harness updates: /harness-update regenerates the
     core above and leaves the region between the markers below untouched.
     Fill these in per project; keep them inside the markers.
     ══════════════════════════════════════════════════════════════════════════ -->
<!-- BEGIN PROJECT-SPECIFIC -->

## Project context

**awesm-foundations** — Delt kontekst alle agentene laster: arbeidskontekst, stemme- og tone-regler, forretningslogikk og kjøreregler for koding.

Work profile: `ai-agent`. Skilt ut av monorepoet `awesm-claude-code` 19. aug 2026
som del av server-migrasjonen. Ett repo, en agent, en Slack-bot.

Produktet ligger i `scripts/` (kjorbar kode) og `skill/SKILL.md` (agentens
kontrakt — reglene den folger). `data/` er agentens egne datafiler. Dette
avviker fra malens `project/`-konvensjon; strukturen er arvet fra monorepoet
og beholdt med vilje sa skriptene virker uendret.

### Hemmeligheter

Denne agenten ser **kun** disse variablene — aldri andre agenters nokler:

_Ingen. Denne agenten trenger ingen API-nokler._

Verdier leveres per migrasjonstrinn via 1Password, aldri via chat eller e-post.

### Slack

Ingen Slack-bot — dette er et delt bibliotek, ikke en agent.

## Specialized agents

_(ingen prosjektspesifikke agenter enna)_

<!-- END PROJECT-SPECIFIC -->
