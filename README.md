# Second Work Brain

One Claude skill that gives you a persistent home for your work. Run it once. It asks where you want the folder, interviews you briefly about what you do, then builds and maintains the whole thing.

Works for any kind of work: a day job, a business you run, products you wholesale, clients you freelance for, side projects, or all of them at once.

## What it builds

```
your-folder/
├── CLAUDE.md        how you work, how Claude behaves here, your guardrails
├── AGENTS.md        points other agents at CLAUDE.md
├── context.md       recent context: decisions, open loops, changes
├── corrections.md   one line each time Claude got it wrong; repeats become rules
├── inbox/           drop anything here, Claude files or ingests it
├── projects/        one folder per strand of work
├── meetings/        preps, notes, transcripts
├── notes/           loose notes
└── wiki/            compiled knowledge (Karpathy LLM wiki pattern)
    ├── WIKI.md      rules
    ├── index.md     one line per page
    ├── log.md       what changed, when
    ├── raw/         sources as received, never edited
    └── pages/       entities, processes, decisions, sources, syntheses
```

The wiki is the part that compounds. It follows [Andrej Karpathy's LLM wiki pattern](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f): instead of Claude re-reading everything each session, anything you share gets compiled once into linked, indexed pages: suppliers, customers, products, processes, decisions. Ask "what did that supplier quote last time" and it reads the page, not your inbox. When a new source contradicts an old page, both claims stay, dated and attributed, with the contradiction flagged in place.

The corrections file is the part that learns. When you correct Claude, it logs one line. Once a month it clusters the repeats and proposes them as rules in CLAUDE.md. The interview gets you started; the corrections keep it accurate.

A weekly refresh processes the inbox, updates the wiki, flags anything misfiled or stale, and once a month reviews CLAUDE.md. It never deletes or rewrites without a yes.

See [examples/harbour-goods](examples/harbour-goods) for a small seeded brain: a candle wholesaler with one supplier, one stockist, and a wiki of six pages.

## Install

**Claude Code:**

```
/plugin install second-work-brain --marketplace brendanrong/second-work-brain
```

Then say "set up my work brain" in the folder you want to use. Needs Claude Code 2.1.275 or later for the one-step install; on older versions, run `/plugin marketplace add brendanrong/second-work-brain` first, then `/plugin install second-work-brain@brendanrong`.

**Claude Cowork:** download `second-work-brain.skill` from the [latest release](https://github.com/brendanrong/second-work-brain/releases/latest) and add it in Settings, Skills. Then say "set up my work brain". For the weekly refresh to run on its own, make a Project and connect your brain folder to it; the skill handles the rest.

## Everyday use

- "set up my work brain": first run, or review an existing one
- "ingest this" plus a link, a file, or pasted text: compiles it into the wiki
- "what does my wiki say about X": answers from the pages, files good answers back in
- "run my weekly refresh": manual version of the scheduled task
- Correct it when it is wrong. That is the whole feedback loop.

## Why this and not a starter vault

Most second-brain repos hand you a folder to copy and templates to fill in. This one has Claude build it around you, keep it indexed, learn from your corrections, and maintain it. No pasting, no templates.

## Repo layout

```
.claude-plugin/      plugin and marketplace manifests
.github/workflows/   builds the .skill bundle on a version tag
skills/second-work-brain/
  SKILL.md           the skill
  references/        CLAUDE.md template, wiki rules
examples/            a seeded brain, also the eval fixture
evals/               claude plugin eval cases, see evals/README.md
```

Releasing: bump `version` in `.claude-plugin/plugin.json`, tag `vX.Y.Z`, push the tag. The workflow zips the skill and attaches it to a GitHub release.

## Licence

MIT. Fork it, change the folder names, make it yours.
