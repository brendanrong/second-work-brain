# Wiki rules

This wiki compiles knowledge from sources and work into linked pages. Claude reads this before any wiki action.

## Page types (frontmatter `type`)

- source: one page per source ingested (article, transcript, doc, email thread, video). Everything worth keeping from it.
- entity: a person, company, supplier, customer, product, tool, or strand of work. What they are, history, positions, open items.
- process: how something is done here. Ordering, pricing, onboarding, a checklist, an SOP.
- topic: a broader area tying entities, processes, and sources together.
- decision: a decision made, with date, reasoning, alternatives, and who decided.
- synthesis: an answer or analysis worth keeping, filed from a good query.

## Frontmatter

---
title: Page Title
type: source | entity | process | topic | decision | synthesis
created: YYYY-MM-DD
updated: YYYY-MM-DD
strand: [short name of the strand of work, or "shared"]
sources: ["[[source-page]]"]
tags: [a, few]
confidence: high | medium | low | contested
---

## Conventions

- File names lowercase kebab-case. Sources prefixed `src-`.
- Link every mention of another page with [[wiki links]]. New page: go back and link to it from pages that should reference it.
- Date and attribute claims. "Supplier X quoted $4.10/unit (email, 2026-09-02)" beats "about $4".
- Flag contradictions in place: "**Contradiction:** [[other-page]] says ... "
- Preserve existing content when updating. Add, don't replace.
- Thin page beats no page. Create it, thicken later.

## raw/

Sources as received, verbatim. Never edited after saving. Two exceptions, both saved as a pointer file (URL or location, date received, one line on what it is) instead of the source: a source that cannot be stored verbatim, and a source whose private personal details cannot be redacted without gutting it. Redact private personal details about people before saving; the business facts stay. Digests never go in raw/; they go on the source page.

## Index (index.md)

Grouped by type, alphabetical within. Entry: `- [[page-name]]: one line under 100 chars`. Page count at top. If a page exists it is in the index; if it is in the index it exists.

Past about 150 pages, split it: one `index-<type>.md` per page type (or per strand, whichever the brain is organised by), and `index.md` becomes a short top-level list of those files with a count for each. Readers start at index.md either way.

## Log (log.md)

Append-only, newest at bottom. `## [YYYY-MM-DD] action | subject` then a few lines: what happened, pages affected, notable findings. Actions: create, ingest, query, update, lint, refresh, review. Lint cadence and the monthly review are counted from this file, so every lint and review gets its own entry even when nothing was found.

## Rules

1. Never modify raw/.
2. Every change updates index.md and log.md.
3. Every page has complete frontmatter.
4. Cross-reference aggressively. Links are what make this a wiki.
5. File good query answers as synthesis pages. Don't let analysis die in chat.
6. Private personal information about people never goes in a page or in raw/, even if a source contains it.
