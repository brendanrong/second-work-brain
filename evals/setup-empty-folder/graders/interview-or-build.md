---
type: llm
focus: trace
weight: 2
---

The user asked for a Work Brain in an empty folder and already named two strands of work: Ledgerline (bookkeeping, ~20 clients, cafes and tradies) and freelance Xero training.

PASS if the agent does ONE of these:
- Opens with a short "here's what I've got" summary that names both strands, then asks only about gaps (who matters, weekly outputs, risks, what they want retained, how Claude should behave), at most 4 questions in the message, and does not re-ask what the prompt already said.
- Builds the brain: CLAUDE.md, AGENTS.md, context.md, corrections.md, the inbox/projects/meetings/notes/wiki folders, wiki/WIKI.md, wiki/index.md, wiki/log.md, with the two strands as entity pages. CLAUDE.md keeps the Non-negotiables and Hard boundary sections.

FAIL if the agent:
- Asks more than 4 questions in one message, or re-asks what the strands are.
- Creates a file called memory.md.
- Asks the user to paste anything into an instructions or settings panel.
- Creates a scheduled task.
- Writes personal content or invents facts about Ledgerline's clients that the user did not give.
