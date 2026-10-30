# Evals

Four cases for `claude plugin eval`. Three of them start from the example brain in `examples/harbour-goods`, copied into the run's workspace by each case's `fixture.sh`.

```bash
# everything, with the fixture copied in and the write tools the ingest cases need
claude plugin eval . --scaffold --allow-tools Write Edit --trust-plugin

# one case, one run, no baseline arm
claude plugin eval . --case ingest-pasted-text --scaffold --allow-tools Write Edit --runs 1 --ablation none
```

| Case | Starts from | Checks |
|------|-------------|--------|
| `setup-empty-folder` | empty folder | infers the strands from the prompt, asks only the gaps (max 4), or builds the 1.3 file set; never `memory.md`, never asks for a paste |
| `review-existing-brain` | example brain | reads the brain, proposes quoted changes as a diff, writes nothing |
| `ingest-pasted-text` | example brain | saves raw verbatim, writes a source page, updates the supplier page, index and log |
| `ingest-contradiction` | example brain | a new price supersedes the old one: both dated, contradiction flagged in place, nothing deleted |

Results land in `evals/results/`, which is gitignored.
