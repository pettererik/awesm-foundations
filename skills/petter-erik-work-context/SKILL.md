---
name: petter-erik-work-context
description: Loads Petter Erik Nyvoll's working context (tools, file structure, voice rules, business principles, and operational defaults) for AweSM Sales and Marketing, a Scandinavian agency for Norwegian and Swedish webinar funnels, high-ticket mentoring, and AI marketing automation, plus Wildr Japan / Chase the Powder, a powder ski tour operation in Hokkaido. Apply broadly whenever work involves Norwegian or Swedish copywriting, webinar funnel strategy or audits, the AweSM Auto AI system, GoHighLevel, WebinarFuel, Notion integrations, Wildr proposals, AI automation for marketing, or any task where Petter Erik's voice, principles, or workflow conventions should apply. Use this skill even when not explicitly named since most of his work falls under it, including AweSM sequence conventions (BWE, ARS, AWE, ATR, SE), the two funnel architectures (Direct Sale and Application), and generating PDFs, brochures, ads, or landing pages for Scandinavian markets.
---

# Petter Erik Work Context

This skill loads my full working context for Claude Code (or any Claude session that supports skills). It covers what tools I use, how I write, why I write that way, and how I want Claude to operate.

## About me

I'm Petter Erik Nyvoll, co-founder of **AweSM Sales & Marketing** (Scandinavian agency — webinar funnels, high-ticket mentoring, AI marketing automation for coaches, consultants, and course creators in Norway and Sweden). I also run **Wildr Japan / Chase the Powder** (small-group powder ski tours in Hokkaido).

Most work falls into one of these buckets:
- Webinar funnel strategy + copy (NO/SE/EN)
- AI automation systems (n8n + Claude API)
- Landing pages, ads, email/SMS sequences
- Sales decks, brochures, PDF proposals

**Default working language:** English for code and system work. Norwegian or Swedish for client-facing copy — I'll specify per task.

---

## Tools & stack

### Marketing infrastructure
- **GoHighLevel (GHL)** — CRM, email/SMS, landing pages, automations. Contact tags drive routing.
- **WebinarFuel** — webinar registration, automated/evergreen webinars, automation gate conditions.
- **Notion** — source of truth for funnel databases, briefs, SOPs, prompt library.
- **Meta Ads Manager** — primary paid channel.

### AI & automation
- **Claude API** — `claude-sonnet-4-20250514` default; Opus for heavy reasoning/strategy.
- **n8n** — workflow orchestration for the AweSM Auto AI system.
- **Custom prompt templates** — versioned in Notion, called from n8n.

### Build / dev
- **Lovable** — landing pages and lightweight web apps.
- **Python 3.11+** — automation scripts, PDF generation (ReportLab), data wrangling.
- **Node 20+** — when needed for JS tooling.
- **Claude Code** — local agentic coding.
- **`.skill` files** — reusable generators (e.g. `wildr-proposal-skill.skill`). Treat as production assets.

### Output formats
- **PDF** — branded proposals and brochures (Python pipeline).
- **DOCX** — client-editable deliverables.
- **Markdown** — internal docs, briefs, system manuals, funnel templates.

---

## File & folder organization

### Top-level layout

```
~/work/
├── awesm/                    # Agency client work
│   ├── clients/
│   │   └── [client-name]/
│   │       ├── funnel/
│   │       ├── ads/
│   │       ├── emails/
│   │       ├── landing-pages/
│   │       └── notes/
│   ├── internal/             # Team SOPs, hiring, training
│   └── auto-ai/              # n8n + Claude API system
├── wildr/                    # Wildr Japan / Chase the Powder
│   ├── proposals/
│   ├── marketing/
│   └── operations/
├── personal/                 # Content, podcast, golf, ski
└── skills/                   # Reusable .skill files
```

### Naming conventions

**Email & SMS sequences (AweSM standard):**
- `BWE` — Before Webinar Email
- `ARS` — Auto-Replay Sequence
- `AWE` — After Webinar Email
- `ATR` — After Trial / Reactivation
- `SE` — Sales Email

**Files:**
- Lowercase, hyphenated: `webinar-roi-accelerator-landing-v2.md`
- Date-prefixed for time-sensitive work: `2026-04-15_webinar-script.md`
- Versioned: `*-v1.md`, `*-v2.md`, etc.

**Client folders:** `[client-shortname]/[program-name]/[asset-type]/`

### Working directories
- `outputs/` — final deliverables, ready to ship.
- `drafts/` or `_wip/` — in-progress; never mix with finals.
- `archive/` — old versions kept for reference; don't edit.

---

## Reference files

This skill includes three reference documents in `references/`. Read them when relevant:

- **`references/VOICE.md`** — Tone and copy rules. Read when writing any client-facing copy, drafting emails or ads, deciding on phrasing, or when the task involves Norwegian/Swedish/English voice decisions.

- **`references/PRINCIPLES.md`** — The business logic underneath the rules (Scandinavian buyer psychology, why content-driven beats urgency-driven, the two-funnel architecture, individual-decision purchase logic). Read when a situation isn't clearly covered by VOICE.md, when designing new funnels or offers, or when reasoning about strategy.

- **`references/OPERATIONS.md`** — Execution defaults (permissions, code formatting, git conventions, file handling, communication style during work). Read at the start of any Claude Code session and refer back when uncertain about how to proceed operationally.

When the rules in VOICE.md conflict with a new situation, fall back to PRINCIPLES.md — principles are the tiebreaker.

---

## Quick reference — things to always remember

- **Merge tag format (Norwegian):** `Hei (firstname).` — period, not comma.
- **Never recommend turning off webinar chat** during the pitch.
- **Janteloven-aware copy:** no superlatives, no hype, no "the best."
- **Specific over vague:** anchor every "dette" / "det" / "this" / "that" with the actual referent.
- **AweSM funnel default:** individual-decision purchase logic, not employer-pay or buying-committee logic, unless the offer is genuinely B2B.
- **Wildr CTAs:** "send us a message" style, not push-to-book.
- **Real names** in testimonials and proof, not anonymous quotes.
- **Two funnel architectures:** Direct Sale (4–15k NOK) vs Application (20–80k NOK). Price determines architecture.

---

## When to expand context

If the task is substantive (a full funnel build, a strategic decision, a new client), read all three reference files at the start. If the task is small (a quick email, a one-liner), the SKILL.md alone is usually enough — pull in references only when the specific question demands it.
