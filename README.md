# Second Work Brain

One Claude skill that gives you a persistent home for your work. Run it once. It asks where you want the folder, interviews you briefly about what you do, then builds and maintains the whole thing.

Works for any kind of work: a day job, a business you run, products you wholesale, clients you freelance for, side projects, or all of them at once.

## What it builds

```
your-folder/
├── CLAUDE.md      how you work, how Claude behaves here, your guardrails
├── memory.md      recent context: decisions, open loops, changes
├── inbox/         drop anything here, Claude files or ingests it
├── projects/      one folder per strand of work
├── meetings/      preps, notes, transcripts
├── notes/         loose notes
└── wiki/          compiled knowledge (Karpathy LLM wiki pattern)
    ├── WIKI.md    rules
    ├── index.md   one line per page
    ├── log.md     what changed, when
    ├── raw/       sources as received, never edited
    └── pages/     entities, processes, decisions, sources, syntheses
```

The wiki is the part that compounds. Instead of Claude re-reading everything each session, anything you share gets compiled once into linked, indexed pages: suppliers, customers, products, processes, decisions. Ask "what did that supplier quote last time" and it reads the page, not your inbox.

A weekly refresh processes the inbox, updates the wiki, tidies files, and flags anything stale. It never deletes or rewrites without a yes.

## Install

**Claude Cowork:** add `second-work-brain.skill` in Settings, Skills. Then say "set up my work brain". For the weekly refresh to run on its own, make a Project and connect your brain folder to it; the skill handles the rest.

**Claude Code:** copy the `second-work-brain/` folder into `~/.claude/skills/`. Then run `/second-work-brain`.

## Everyday use

- "set up my work brain": first run, or review an existing one
- "ingest this" plus a link, a file, or pasted text: compiles it into the wiki
- "what does my wiki say about X": answers from the pages, files good answers back in
- "run my weekly refresh": manual version of the scheduled task

## Why this and not a starter vault

Most second-brain repos hand you a folder to copy and templates to fill in. This one has Claude build it around you, keep it indexed, and maintain it. No pasting, no templates.

## Licence

MIT. Fork it, change the folder names, make it yours.
