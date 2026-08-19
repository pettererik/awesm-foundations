---
name: coding-execution-defaults
description: Execution defaults for agentic coding sessions on Petter Erik's machine — permission boundaries (when to act vs ask), code formatting (Python black/ruff line 100, TS prettier), git conventions (conventional commits, no auto-push), file handling (outputs/drafts/_wip), error handling, and communication style during work (no narration, lead with results). Reference at the start of any coding session and consult when uncertain about how to proceed operationally.
---

# OPERATIONS — How Claude Code should actually operate

Permissions, execution style, formatting, and workflow defaults. This is the *how*. The other files cover *what* (`SKILL.md`), *how to write* (`VOICE.md`), and *why* (`PRINCIPLES.md`).

---

## 1. Permission & autonomy

**Default mode: act, then summarize.** I'd rather see a finished result than approve every step. Don't pause for permission on routine work.

**Just do — no need to ask:**
- Read any file in the project.
- Create new files in `outputs/`, `drafts/`, or working folders.
- Run scripts in a sandbox or local virtualenv.
- Install dependencies in an isolated environment (venv, npm in project folder).
- Edit files I just asked you to edit.
- Run formatters, linters, and tests.

**Pause and confirm before:**
- Deleting files (especially anything outside `_wip/` or `drafts/`).
- Force-pushing, rebasing shared branches, or rewriting git history.
- Modifying `.skill` files — these are production assets.
- Hitting paid APIs in a loop (Claude API, Meta Ads API, etc.) where the cost could spike.
- Touching `production` configs, `.env` files with live keys, or anything in `archive/`.
- Sending messages, emails, or webhooks to real recipients (always dry-run first).

**Plan mode — when to use it:**
- Multi-file refactors.
- New funnel/system builds with more than ~3 components.
- Anything where a wrong path costs more than 10 minutes to back out of.
- When I say "plan this" or "before you start, walk me through it."

For everything smaller, skip the plan and just execute.

---

## 2. Execution style

**Bias to action.** When the request is clear, start. Don't restate the task back to me.

**Work in small, verifiable steps for big tasks.** Use TodoWrite (or equivalent) for anything with 3+ distinct subtasks. Mark items done as you complete them, not at the end.

**Read before you write.** For any file you'll modify, read it first — even if it seems obvious. Don't trust assumptions about structure.

**Fail loud, recover quietly.** If something breaks, surface the error, fix it if you can, and move on. Don't hide failures in a wall of green checkmarks.

**One pass, not three.** Don't over-iterate. Get to a working version, then ask if it needs refinement. Don't keep "improving" without input.

**When stuck, ask one good question.** Better than five clarifying questions or a generic guess. The question should be specific enough that my answer fully unblocks you.

---

## 3. Code formatting & style

### Python
- **Formatter:** `black` (line length 100).
- **Linter:** `ruff` with default rules.
- **Type hints:** use them for functions that cross module boundaries; skip for one-off scripts.
- **Docstrings:** one-liner for simple functions, full Google-style for anything non-trivial.
- **Imports:** standard lib → third-party → local, separated by blank lines.

### JavaScript / TypeScript
- **Formatter:** `prettier` defaults.
- **Prefer TypeScript** for anything beyond a one-file script.
- **`const` by default**, `let` only when reassignment is real.
- **Async/await** over raw promises.

### Markdown
- ATX headers (`#`, `##`, not underlined).
- Hyphenated bullets (`-`), not `*`.
- Fenced code blocks with language tags.
- Hard wrap at ~100 chars for long-form; no wrap for tables or code.

### General
- **No dead code.** Don't leave commented-out blocks "just in case" — git remembers.
- **No premature abstraction.** Inline first, extract when the duplication is real.
- **Comments explain why, not what.** The code shows what.

---

## 4. Git & version control

- **Commit messages:** conventional-commit style — `feat:`, `fix:`, `chore:`, `docs:`, `refactor:`. Subject line under 70 chars, imperative mood ("add" not "added").
- **Body when needed:** for non-trivial commits, add a body explaining *why* the change was made.
- **Atomic commits.** One logical change per commit. If you find yourself writing "and" in the message, split it.
- **Branch naming:** `type/short-description` — e.g. `feat/awesm-auto-ai-tagging`, `fix/wildr-pdf-image-crop`.
- **Don't commit:** `.env`, secrets, `node_modules`, `.venv`, generated PDFs in `outputs/` (unless explicitly versioned), `__pycache__`.
- **Don't auto-push.** Commit locally, let me push.

---

## 5. Testing & verification

I'm not a testing maximalist. I want **enough testing to catch real breakage**, not coverage theater.

- **Write tests when:** the function is called from multiple places, has tricky edge cases, or processes external data (CSVs, API responses, user input).
- **Skip tests when:** it's a one-off script, a prototype, or a glue function that's obvious by inspection.
- **Run before delivering:** if tests exist, run them. Don't hand me code that hasn't been executed.
- **For Python:** `pytest`. For JS: `vitest` or `jest` — match the project.
- **Smoke-test scripts** by running them with realistic inputs, not just imports.

---

## 6. Communication during work

- **No running commentary.** Don't narrate every action ("Now I'll open the file…"). Just do the work.
- **Status updates only when useful** — at meaningful checkpoints in long tasks, or when you hit something unexpected.
- **End with a summary.** When done, give me: what was built, where it lives, what to verify, anything that didn't work.
- **No apologies for routine things.** "Sorry for the long output," "Apologies for the confusion" — skip these. Fix the issue, move on.
- **No re-confirmations.** If I asked for X and you built X, don't ask "is X what you wanted?" — show me X.

### When summarizing
- Lead with the result, not the process.
- List files created or changed with paths.
- Flag anything I should manually check.
- Note any TODOs or known limitations.

---

## 7. File handling

- **Outputs go in `outputs/`** within the relevant project. Never scatter finals in random folders.
- **Drafts go in `drafts/` or `_wip/`.** Mark them clearly so I don't ship a draft by mistake.
- **Versioning:** when iterating, suffix with `-v2`, `-v3`. Don't overwrite v1 unless asked.
- **Naming:** lowercase, hyphenated, descriptive. `webinar-roi-accelerator-landing-v2.md`, not `final_FINAL_v2 (3).md`.
- **Don't auto-delete.** If something looks orphaned, ask before removing.
- **Backups:** for any destructive edit on a file >100 lines, copy to `_backup_[date]/` first.

---

## 8. Error handling & debugging

- **Read the actual error.** Not the type, the full message. Most bugs announce themselves clearly if read literally.
- **Fix the cause, not the symptom.** Don't `try/except: pass` your way past a real problem.
- **When debugging, isolate.** Reproduce in the smallest possible script before patching the big one.
- **Log enough to understand later.** For automation scripts that run unattended, log inputs, outputs, and any branch decisions.

---

## 9. When in doubt

- Match the existing style of the file or project — don't impose a new convention mid-stream.
- If two valid approaches exist, pick the simpler one and note the alternative.
- If the request is ambiguous, ask one specific question rather than guessing or asking five vague ones.
- If something in this file conflicts with `PRINCIPLES.md`, `PRINCIPLES.md` wins — these rules serve the principles, not the other way around.
