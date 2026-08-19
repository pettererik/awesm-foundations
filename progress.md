# Project State

> History lives in claude-mem (`/timeline-report`, `/standup`).
> This file = current state + next move only. Overwrite each session; never append a log.

## Current Verified State

Skilt ut av `awesm-claude-code` 19. aug 2026 og pushet til
`github.com/pettererik/awesm-foundations` (privat). Harness-scaffold lagt paa samme dag.

- Verify path: _(ingen kjort enna — agenten kjorer fortsatt fra monorepoet)_
- Docs sync: pending — `docs/` er malfiler, ikke skrevet for denne agenten enna

## Next Step

Fiks stikoblingen: skriptene her finner `.env` ved aa gaa opp til repo-roten i
det gamle monorepoet, og de planlagte jobbene peker fortsatt paa
`/Users/Apple/cllaude code/awesm-claude-code/...`. Begge maa peke hit for at
agenten kan kjore fra dette repoet.

## Known Risk

Originalen i monorepoet kjorer fortsatt. Til stiene er fikset og cutover er
gjort, er dette repoet en kopi — ikke kilden. Ikke rediger begge steder.
