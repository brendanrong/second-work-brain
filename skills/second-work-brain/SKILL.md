---
name: second-work-brain
description: Set up or maintain a Second Work Brain, one folder where all your work with Claude lives so everything it learns carries forward. Works for any kind of work, a day job, your own business, wholesale, freelancing, side projects, or all of them at once. Creates the folder where you choose, builds the context files (CLAUDE.md, context.md, a Karpathy-style LLM wiki that compiles what you learn into linked, indexed pages), learns from your corrections, and schedules one weekly refresh. Use when someone says "set up my work brain", "set up my second brain", "set up my space", "give Claude more context about my work", "ingest this into my wiki", "what does my wiki say about", wants their brain reviewed, or when the weekly refresh fires.
---

# Second Work Brain

Version 1.3 (2026-10-30). One skill, one invocation, one folder.

The model, and say it this simply: **you only need one folder for work, your Work Brain. Every piece of work happens there. Claude keeps notes on how you work, and compiles what you learn into a wiki, so nothing has to be re-explained and nothing you read gets lost.**

"Work" means whatever earns or builds: a job, a business you run, products you wholesale, clients you freelance for, a side project. One person can have several. The brain holds all of them.

Plain language, no jargon. Say "context" not "memory", "wiki" not "knowledge base". If asked what the files are: "written notes Claude keeps so it remembers your work. You never have to open or manage them, but you can."

Supporting files, read only when the step needs them:

- [references/claude-md-template.md](references/claude-md-template.md): the CLAUDE.md template written at setup.
- [references/wiki-rules.md](references/wiki-rules.md): the WIKI.md rules written at setup, and the page schema every wiki action follows.

## Step 0: get a folder

You can only write into a folder the user has connected. So:

1. If a connected folder contains `CLAUDE.md` or `wiki/`, that is their brain. Go to **Pick the mode**.
2. If a folder is connected but empty or unrelated, ask one question: "Build your Work Brain here, or pick a different folder?"
3. If no folder is connected, call whatever tool connects a folder to the session (in Cowork this is currently `request_cowork_directory`; the name may change, the job is the same). Say first, in one line: "Pick or create the folder where your Work Brain will live. Somewhere synced (iCloud, Drive, OneDrive) is a good default." Wait for the mount, then continue.
4. No such tool (Claude Code, other agents): ask for the path and confirm it exists before writing.

One brain per person. If their global instructions or the folder point to an existing brain elsewhere, do not build a second one. Offer to review that one instead.

## Pick the mode

- No `CLAUDE.md` in the folder → **Setup**.
- It exists → **Review**, unless they asked for a wiki action (ingest, query, lint), then run that from **Wiki workflows**.
- Fired by the scheduled task → **Weekly refresh**.
- They correct something you did or assumed → **Correction**, then carry on with the task.

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

### 3. CLAUDE.md and AGENTS.md

Write `CLAUDE.md` at the folder root from [references/claude-md-template.md](references/claude-md-template.md). Structure and rules only, no news. Fill the brackets from the interview. Generated content under Purpose and How Claude behaves here: under 100 words combined. Keep Non-negotiables and Hard boundary word for word. Never overwrite an existing CLAUDE.md without showing the change and getting a yes.

Also write `AGENTS.md` at the root, two lines, so agents that read that file instead find the same context:

```
# Agents

Read `CLAUDE.md` first. It is the context file for this folder and applies to every agent working here.
```

### 4. context.md

Recent working context: decisions, open loops, changes. Seed from the interview: strands, key people per strand, what they produce weekly, anything they keep re-explaining. Entries under a `## YYYY-MM-DD` heading, appended at the bottom, newest last, same direction as the wiki log. Keep it short; durable knowledge goes to the wiki, not here. Never overwrite an existing context.md without a yes.

Brains built before 1.3 call this file `memory.md`. Treat it as context.md. Offer the rename once, do it on a yes, and update the reference in CLAUDE.md at the same time.

### 5. The wiki (Karpathy LLM wiki pattern)

The idea: instead of Claude rediscovering things from scratch every session, it compiles what it reads and learns into structured, linked pages once, then keeps them current. Every source ingested and every good answer makes the wiki richer. Cross-references are already there. Contradictions are already flagged.

Create:

```
wiki/
├── WIKI.md      schema and rules, copied verbatim from references/wiki-rules.md
├── index.md     catalog: one line per page, grouped by type
├── log.md       append-only activity log
├── raw/         sources as received. IMMUTABLE.
└── pages/       compiled pages
```

Seed `pages/` from the interview: one `entity` page per strand of work and per key person or company they named, thin is fine. Then write `index.md` listing them and the first `log.md` entry (`create | wiki`).

### 6. corrections.md

Create it empty, with this header:

```
# Corrections

One line per time Claude got something wrong here. Appended by Claude, read at the monthly review, turned into rules in CLAUDE.md when a pattern repeats.
```

### 7. No paste, no migration

Never ask the user to paste anything into an instructions panel. CLAUDE.md loads automatically.

Never move, copy, or reorganise their existing chats, projects, or files, and never offer to. If they ask, explain how to do it themselves. Anything they drop into `inbox/` is fair game.

### 8. The weekly refresh

A scheduled task runs in a fresh session with no one there to pick a folder. It only works when the brain folder is already connected to that session, which in Cowork means the task was created inside a Project that has this folder connected.

So:

- **Running inside a Project with this folder connected:** offer the scheduled refresh with a one-tap confirm, recommend yes. Weekly, default Friday 3pm their time. This is the ONLY scheduled task. Task prompt:

  "Run the weekly refresh from /second-work-brain: process anything in inbox/. Scan my last 7 days across connected sources and this folder's sessions. Append what's worth keeping to context.md. Ingest or update wiki pages for anything new, update the index and log. Propose moves for anything misfiled at the root. Run the wiki lint and flag stale entries. If log.md has no review entry this calendar month, also run the monthly review."

- **Not inside a Project (plain Cowork session, Claude Code, other agents):** do not create a scheduled task; it would fire into a session that cannot see the folder. Tell them instead: "To automate the weekly refresh in Cowork, make a Project, connect this folder to it, and run me once from there; I'll set up the schedule then. Until then, say 'run my weekly refresh' whenever you like." Keep it to those two sentences.

Never create a scheduled task that would need to pick a folder on its own.

### 9. Hand over

List what got created in one short list. Then the two habits that matter: work in this folder, and drop anything worth remembering into `inbox/` (or paste it in chat and say "ingest this"). Suggest 3 starter prompts based on their strands, at least one of them a wiki ingest.

If they use Cowork and are not already in a Project, add one line: "Make a Project and connect this folder to it: it opens with your context every time, and the weekly refresh can run on its own."

## Wiki workflows

Read `wiki/WIKI.md` before any of these.

### Ingest

Trigger: a file appears in `inbox/` or `wiki/raw/`, a URL or pasted text with "ingest this", or "read this and remember it". Pasted text IS the source; never ask them to file it first.

1. Save the source to `wiki/raw/`, verbatim. Two exceptions, and in both the digest goes on the `src-` page, never in `raw/`:
   - It cannot be stored verbatim (licensing, size, a page you can only read once). Save a pointer file instead: URL or location, date received, one line on what it is.
   - It contains private personal details about someone (health, pay, personal circumstances). Redact those lines before saving. If redaction would gut the source, save a pointer file.
   Then remove it from `inbox/`.
2. Read it in full.
3. Tell them the 2 to 4 most useful or surprising things, especially anything that contradicts what the wiki already holds. Skip this if they said batch.
4. Write a `source` page.
5. Create or update `entity`, `process`, `decision` pages for everything notable.
6. Update existing pages the source adds to or contradicts. This is the step that makes the wiki compound.
7. Update `index.md`, append to `log.md`.
8. Report: pages created, pages updated, contradictions, open questions.
9. Count `ingest` entries in `log.md` since the last `lint` entry. Ten or more: run **Lint** now.

### Query

Trigger: any question the wiki might answer ("what did supplier X quote last time", "how do we onboard a new stockist", "what do I know about Y").

1. Read `index.md`, pick relevant pages, read them and follow links.
2. Answer with [[links]] as inline citations.
3. If the answer is substantial and reusable, file it as a `synthesis` page without asking.
4. If the wiki cannot answer well, say so and name what source would fill the gap.

### Lint

Trigger: asked for a health check, the weekly refresh, or ten ingests since the last lint (counted in `log.md`, see Ingest step 9).

Check: contradictions between pages, stale claims superseded by newer ones, orphan pages with no inbound links, things mentioned repeatedly with no page, entities in several sources with no page, index accuracy, frontmatter completeness, index size (see WIKI.md, split past ~150 pages). Output a short prioritised list. Flag only; never delete or rewrite without a yes. Append a `lint` entry to `log.md` so the next count starts from here.

## Correction

Trigger: they tell you something you did or assumed here was wrong. Wrong file, wrong page, wrong tone, wrong assumption about how they work.

1. Fix the thing.
2. Append one line to `corrections.md`: `- YYYY-MM-DD: [what went wrong] → [what they wanted]`. Silently. No apology, no announcement.
3. Carry on.

The monthly review reads this file. A correction that appears three times becomes a proposed line in CLAUDE.md. That is how the brain learns how they work after the interview is over.

## Weekly refresh

1. Process `inbox/`: ingest sources, file documents into the folder map.
2. Scan the last 7 days: connected sources (skip unconnected ones silently) and recent sessions here.
3. Append short entries to context.md under today's date: decisions, changes, open loops. Ingest or update wiki pages for anything durable. Don't duplicate. If nothing happened, write nothing and say so. Never invent updates.
4. Tidy: list any files at the root that are not `CLAUDE.md`, `AGENTS.md`, `context.md`, or `corrections.md`, with where each belongs in the folder map. Move them on a yes, never before. Run the wiki lint.
5. If `log.md` has no `review` entry this calendar month: run the **Monthly review**.
6. Append a `refresh` entry to `log.md`. Report what changed in a few lines.

## Monthly review

Runs from the weekly refresh once a month, or on request.

1. Read `corrections.md`. Cluster repeated corrections. For any pattern seen three or more times, propose one line for CLAUDE.md under How to talk to me or How Claude behaves here. Quote the corrections it comes from.
2. Review CLAUDE.md against recent activity. Quote any line you'd change and why.
3. Propose compaction for context.md entries older than ~8 weeks: anything durable goes to the wiki, the rest is summarised or dropped. Show before/after.
4. Apply only on a yes. Append a `review` entry to `log.md` either way.

## Review

Re-run on an existing brain: read CLAUDE.md, context.md (or memory.md in an older brain), corrections.md, `wiki/index.md`, and recent files. Compare against the last 2 weeks of activity. Suggest specific improvements mapped to the structure above. Quote any line you'd change and say why. Propose edits as a diff and get a yes before writing.

## Rules

- Never overwrite CLAUDE.md, context.md, or WIKI.md without showing the change and getting a yes.
- Never move user content except out of `inbox/` (always fair game) or off the root (listed first, moved on a yes). Setup creates new files only.
- Never re-ask what global instructions, connectors, or the folder already answer. Max 4 questions per message, max 2 rounds.
- One brain per person. One scheduled task per person.
- Non-negotiables, Hard boundary, and WIKI.md rules are pre-written. Never remove or soften them.
- Refresh, lint, and review append and flag; they never delete or rewrite without a yes.
- Anything that needs counting or remembering across sessions (lint cadence, monthly review, repeated corrections) is read from `log.md` or `corrections.md`, never from memory of earlier sessions.

## Changelog

- 1.3 (2026-10-30): Fixed rules that contradicted each other: root tidy is propose-then-move on a yes; `raw/` is verbatim or a pointer, never a digest; private personal details are redacted before they reach `raw/`. `memory.md` renamed to `context.md` to match the skill's own language and avoid clashing with Claude Code's auto-memory. Both logs append newest at bottom. Lint cadence and monthly review are now read from `log.md`, not remembered. Added the correction loop (`corrections.md`, monthly clustering into CLAUDE.md rules), `AGENTS.md` for other agents, and an index split rule past ~150 pages. Templates moved to `references/`. Folder picker tool name no longer hardcoded.
- 1.2 (2026-09-16): Scheduled refresh only offered when running inside a Project with the folder connected; otherwise a manual "run my weekly refresh" until they make one. A scheduled task can never pick a folder on its own.
- 1.1 (2026-09-16): Any-kind-of-work model (strands: job, business, clients, side projects). Karpathy LLM wiki added as the compiled knowledge layer with ingest, query, and lint workflows and an always-on indexing habit in CLAUDE.md. `inbox/` replaces `role/`. memory.md narrowed to recent context.
- 1.0 (2026-09-16): New public skill. Generic fork of an internal Cowork Space skill. Folder picker replaces the "make a project first" gate; the folder is the brain, Project is optional.
