---
name: second-work-brain
description: Set up or maintain a Second Work Brain, one folder where all your work with Claude lives so everything it learns carries forward. Works for any kind of work, a day job, your own business, wholesale, freelancing, side projects, or all of them at once. Creates the folder where you choose, builds the context files (CLAUDE.md, memory.md, a Karpathy-style LLM wiki that compiles what you learn into linked, indexed pages), and schedules one weekly refresh. Use when someone says "set up my work brain", "set up my second brain", "set up my space", "give Claude more context about my work", "ingest this into my wiki", "what does my wiki say about", wants their brain reviewed, or when the weekly refresh fires.
---

# Second Work Brain

Version 1.2 (2026-09-16). One skill, one invocation, one folder.

The model, and say it this simply: **you only need one folder for work, your Work Brain. Every piece of work happens there. Claude keeps notes on how you work, and compiles what you learn into a wiki, so nothing has to be re-explained and nothing you read gets lost.**

"Work" means whatever earns or builds: a job, a business you run, products you wholesale, clients you freelance for, a side project. One person can have several. The brain holds all of them.

Plain language, no jargon. Say "context" not "memory", "wiki" not "knowledge base". If asked what the files are: "written notes Claude keeps so it remembers your work. You never have to open or manage them, but you can."

## Step 0: get a folder

You can only write into a folder the user has connected. So:

1. If a connected folder contains `CLAUDE.md` or `wiki/`, that is their brain. Go to **Pick the mode**.
2. If a folder is connected but empty or unrelated, ask one question: "Build your Work Brain here, or pick a different folder?"
3. If no folder is connected, call the folder picker tool (`request_cowork_directory` in Cowork). Say first, in one line: "Pick or create the folder where your Work Brain will live. Somewhere synced (iCloud, Drive, OneDrive) is a good default." Wait for the mount, then continue.
4. No picker tool (Claude Code, other agents): ask for the path and confirm it exists before writing.

One brain per person. If their global instructions or the folder point to an existing brain elsewhere, do not build a second one. Offer to review that one instead.

## Pick the mode

- No `CLAUDE.md` in the folder → **Setup**.
- It exists → **Review**, unless they asked for a wiki action (ingest, query, lint), then run that from **Wiki workflows**.
- Fired by the scheduled task → **Weekly refresh**.

## Setup

### 1. Interview: infer, confirm, gaps

Read their global instructions and any connected sources first. Open with a short "here's what I've got" summary to confirm. Then ask only the gaps. Max 4 questions per message, max 2 rounds. Cover if unknown:

- What their work is. List every strand: job, business, clients, side projects. Get a one-line description and a short name for each.
- Who matters in each strand: suppliers, customers, partners, manager, team, competitors. Names of the top few only.
- What they produce or decide every week.
- What they most risk getting wrong or forgetting.
- What they read, watch, or receive that they wish they retained (this seeds the wiki).
- How Claude should behave here (pick-list: thinking partner, drafter, skeptical reviewer, research-heavy, operator who just gets things done).

### 2. Folder skeleton

Create exactly these. Empty is fine.

- `inbox/`: drop anything here. Claude files it.
- `projects/`: one subfolder per strand of work, kebab-case (`acme-wholesale/`, `day-job/`, `etsy-shop/`). Inside, whatever that strand needs.
- `meetings/`: preps, notes, transcripts, call summaries. Files named `YYYY-MM-DD Title`.
- `notes/`: loose notes that belong to no project yet.
- `wiki/`: the compiled knowledge layer. See step 5.

Do not add more at setup. The structure grows when they need it.

### 3. CLAUDE.md

Write at the folder root. Structure and rules only, no news. Never overwrite an existing CLAUDE.md without showing the change and getting a yes. Template (fill brackets from the interview):

```
# [First name]'s Work Brain (Claude Context)

Work folder for [name]. Strands of work:
- [short name]: [one line]
- [short name]: [one line]

All work with Claude happens here. Work content only.

## How to talk to me

[Their preferences: length, tone, format, directness. Concrete lines, not adjectives.]
- Lead with the answer, then reasoning. End with the next concrete action.
- Say "I don't know" rather than guessing. Flag anything you're unsure of.

## Read every session

1. This file.
2. **memory.md**: recent working context, newest at top under `## YYYY-MM-DD`. Short entries only: decisions, open loops, changes. Not a knowledge base; that is the wiki.
3. **wiki/index.md** when the task touches anything the wiki might already know (a supplier, a customer, a product, a process, a topic). Read the relevant pages before answering.

## Who maintains this

Claude writes and maintains every file here. My job is to work, drop things in, ask questions, and correct anything wrong. A weekly scheduled refresh keeps it current.

## Folder map

| Folder | What goes here |
|--------|----------------|
| `inbox/` | Anything I drop in. Claude files or ingests it, then removes it from inbox |
| `projects/<strand>/` | One folder per strand of work |
| `meetings/` | Preps, notes, transcripts. Name files `YYYY-MM-DD Title` |
| `notes/` | Loose notes with no home yet |
| `wiki/` | Compiled knowledge. Rules in `wiki/WIKI.md` |

Save new files into these folders, not the root.

## Wiki habit (always on)

After writing any meeting note, project doc, or decision, and after reading any source I share: update or create the relevant wiki pages, add the links, update `wiki/index.md`, append to `wiki/log.md`. Do this without being asked. If it is not in the index, the brain does not know it.

## Purpose
[What they use Claude for, from the interview]

## How Claude behaves here
[Role from the pick-list, plus 2 to 3 things to never do or assume, from the risk question]

## Non-negotiables

Never expose, guess at, or repeat private information about people: health, pay, personal circumstances. Business facts about customers, suppliers, and partners are fine; that is what the wiki is for.
Don't invent prices, policy, legal, tax, or compliance facts. If unsure, say so and tell me to verify.
Don't send, post, order, pay, or share anything on my behalf without asking first.
Flag anything with legal, tax, or contractual weight before it goes out.

## Hard boundary

This folder is for work. Personal content (journals, health, relationships, personal finances beyond the business) lives somewhere else.
```

Generated content under Purpose and How Claude behaves here: under 100 words combined. Keep Non-negotiables and Hard boundary word for word.

### 4. memory.md

Seed from the interview: strands, key people per strand, what they produce weekly, anything they keep re-explaining. Newest entries at top under a `## YYYY-MM-DD` heading. Keep it short; durable knowledge goes to the wiki, not here. Never overwrite an existing memory.md without a yes.

### 5. The wiki (Karpathy LLM wiki pattern)

The idea: instead of Claude rediscovering things from scratch every session, it compiles what it reads and learns into structured, linked pages once, then keeps them current. Every source ingested and every good answer makes the wiki richer. Cross-references are already there. Contradictions are already flagged.

Create:

```
wiki/
├── WIKI.md      schema and rules (write the block below, verbatim)
├── index.md     catalog: one line per page, grouped by type
├── log.md       append-only activity log
├── raw/         sources as received. IMMUTABLE.
└── pages/       compiled pages
```

Seed `pages/` from the interview: one `entity` page per strand of work and per key person or company they named, thin is fine. Then write `index.md` listing them and the first `log.md` entry.

Write this into `wiki/WIKI.md`:

```
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

## Index (index.md)

Grouped by type, alphabetical within. Entry: `- [[page-name]]: one line under 100 chars`. Page count at top. If a page exists it is in the index; if it is in the index it exists.

## Log (log.md)

Append-only, newest at bottom. `## [YYYY-MM-DD] action | subject` then a few lines: what happened, pages affected, notable findings. Actions: ingest, query, lint, update, create.

## Rules

1. Never modify raw/.
2. Every change updates index.md and log.md.
3. Every page has complete frontmatter.
4. Cross-reference aggressively. Links are what make this a wiki.
5. File good query answers as synthesis pages. Don't let analysis die in chat.
6. Private personal information about people never goes in a page, even if a source contains it.
```

### 6. No paste, no migration

Never ask the user to paste anything into an instructions panel. CLAUDE.md loads automatically.

Never move, copy, or reorganise their existing chats, projects, or files, and never offer to. If they ask, explain how to do it themselves. Anything they drop into `inbox/` is fair game.

### 7. The weekly refresh

A scheduled task runs in a fresh session with no one there to pick a folder. It only works when the brain folder is already connected to that session, which in Cowork means the task was created inside a Project that has this folder connected.

So:

- **Running inside a Project with this folder connected:** offer the scheduled refresh with a one-tap confirm, recommend yes. Weekly, default Friday 3pm their time. This is the ONLY scheduled task. Task prompt:

  "Run the weekly refresh from /second-work-brain: process anything in inbox/. Scan my last 7 days across connected sources and this folder's sessions. Append what's worth keeping to memory.md. Ingest or update wiki pages for anything new, update the index and log. Tidy misfiled files into the folder map. Run the wiki lint and flag stale entries. First run of a calendar month: also review CLAUDE.md."

- **Not inside a Project (plain Cowork session, Claude Code, other agents):** do not create a scheduled task; it would fire into a session that cannot see the folder. Tell them instead: "To automate the weekly refresh in Cowork, make a Project, connect this folder to it, and run me once from there; I'll set up the schedule then. Until then, say 'run my weekly refresh' whenever you like." Keep it to those two sentences.

Never create a scheduled task that would need to pick a folder on its own.

### 8. Hand over

List what got created in one short list. Then the two habits that matter: work in this folder, and drop anything worth remembering into `inbox/` (or paste it in chat and say "ingest this"). Suggest 3 starter prompts based on their strands, at least one of them a wiki ingest.

If they use Cowork and are not already in a Project, add one line: "Make a Project and connect this folder to it: it opens with your context every time, and the weekly refresh can run on its own."

## Wiki workflows

### Ingest

Trigger: a file appears in `inbox/` or `wiki/raw/`, a URL or pasted text with "ingest this", or "read this and remember it". Pasted text IS the source; never ask them to file it first.

1. Save the source to `wiki/raw/` (verbatim when allowed, otherwise a digest). Remove from `inbox/`.
2. Read it in full.
3. Tell them the 2 to 4 most useful or surprising things, especially anything that contradicts what the wiki already holds. Skip this if they said batch.
4. Write a `source` page.
5. Create or update `entity`, `process`, `decision` pages for everything notable.
6. Update existing pages the source adds to or contradicts. This is the step that makes the wiki compound.
7. Update `index.md`, append to `log.md`.
8. Report: pages created, pages updated, contradictions, open questions.

### Query

Trigger: any question the wiki might answer ("what did supplier X quote last time", "how do we onboard a new stockist", "what do I know about Y").

1. Read `index.md`, pick relevant pages, read them and follow links.
2. Answer with [[links]] as inline citations.
3. If the answer is substantial and reusable, file it as a `synthesis` page without asking.
4. If the wiki cannot answer well, say so and name what source would fill the gap.

### Lint

Trigger: asked for a health check, weekly refresh, or after every ~10 ingests.

Check: contradictions between pages, stale claims superseded by newer ones, orphan pages with no inbound links, things mentioned repeatedly with no page, entities in several sources with no page, index accuracy, frontmatter completeness. Output a short prioritised list. Flag only; never delete or rewrite without a yes.

## Weekly refresh

1. Process `inbox/`: ingest sources, file documents into the folder map.
2. Scan the last 7 days: connected sources (skip unconnected ones silently) and recent sessions here.
3. Append short entries to memory.md under today's date: decisions, changes, open loops. Ingest or update wiki pages for anything durable. Don't duplicate. If nothing happened, write nothing and say so. Never invent updates.
4. Light lint: move misfiled files from the root into the folder map and say what moved. Run the wiki lint.
5. First run of a calendar month: review CLAUDE.md against recent activity (quote any line you'd change and why) and propose compaction for memory entries older than ~8 weeks. Show before/after, apply only on a yes.
6. Report what changed in a few lines.

## Review

Re-run on an existing brain: read CLAUDE.md, memory.md, `wiki/index.md`, and recent files. Compare against the last 2 weeks of activity. Suggest specific improvements mapped to the structure above. Quote any line you'd change and say why. Propose edits as a diff and get a yes before writing.

## Rules

- Never overwrite CLAUDE.md, memory.md, or WIKI.md without showing the change and getting a yes.
- Never move user content outside `inbox/`. Setup creates new files only.
- Never re-ask what global instructions, connectors, or the folder already answer. Max 4 questions per message, max 2 rounds.
- One brain per person. One scheduled task per person.
- Non-negotiables, Hard boundary, and WIKI.md rules are pre-written. Never remove or soften them.
- Refresh and lint append and flag; they never delete or rewrite without a yes.

## Changelog

- 1.2 (2026-09-16): Scheduled refresh only offered when running inside a Project with the folder connected; otherwise a manual "run my weekly refresh" until they make one. A scheduled task can never pick a folder on its own.
- 1.1 (2026-09-16): Any-kind-of-work model (strands: job, business, clients, side projects). Karpathy LLM wiki added as the compiled knowledge layer with ingest, query, and lint workflows and an always-on indexing habit in CLAUDE.md. `inbox/` replaces `role/`. memory.md narrowed to recent context.
- 1.0 (2026-09-16): New public skill. Generic fork of an internal Cowork Space skill. Folder picker replaces the "make a project first" gate; the folder is the brain, Project is optional.
