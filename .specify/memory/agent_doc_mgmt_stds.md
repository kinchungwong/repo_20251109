# Agent Document Management Standards

**TL;DR** — This document operationalizes Constitution Principle 2 (Context-Budgeted Knowledge Stewardship). Every artifact must start with a reader-ready header, declare its context budget, and link to the canonical template. Deep reasoning lives in short-term-memory digests, then gets summarized back into the permanent artifact so the corpus stays light.

## Scope & Canonical Sources

- Constitution: `.specify/memory/constitution.md` defines the “what.” This standard explains the “how.”
- Templates: `.specify/templates/*.md` own formatting rules; update them instead of duplicating guidance here.
- Prefix registry: `.specify/memory/crossref_prefixes.md` must be edited before introducing any new shorthand.
- Agent prompts: `.codex/prompts/` inherit the same expectations.

## Agent-First Headers & Context Budgets

Every Spec-Kit artifact authored or touched by an agent MUST begin with:
1. Document name + status (Draft, In Progress, Ratified, Archived).
2. TL;DR ≤200 words covering purpose, key decisions, and next action.
3. Context Budget table or bullets that state the target line/token ceiling and point to supporting digests if overflow occurs.
4. Ownership metadata: spec/plan/task path, feature branch, latest evidence link or command reference.

Templates already include placeholders for these items; remove unused fields rather than leaving them blank.

## Single Source of Truth & Versioning

Each Spec-Kit file is authoritative for its subject. When facts change, update the canonical file instead of copying text elsewhere. Git records the history; agents focus on describing *what* changed and why, and SHOULD propose a commit message for any substantive edit even though humans perform the actual commit.

## Cross-References & Prefix Discipline

- Register every domain shorthand (e.g., `GSFD`, `ADMS`) in `crossref_prefixes.md` before first use.
- Reference other documents by their registered prefix plus section anchor; avoid renumbering unless unavoidable.
- If renumbering occurs, log it in the Sync Impact Report and rerun affected consistency checks or scripts.

## Temporary Notes & Pruning

- Use `.specify/short-term-memory/` for global digests and `/specs/[###-feature]/notes/todo/` for branch-scoped notes.
- File names follow `todo-{keywords}-{YYYY-mm-dd_HHMM}.md` (generate the timestamp via `echo $(TZ=':America/Los_Angeles' date '+%Y-%m-%d_%H%M')`).
- Keep each note under 40 lines or 20 checklist items; split or archive when exceeding the limit.
- Summaries of resolved notes MUST flow back into the canonical spec/plan/tasks before deleting or retiring the note.

## Artifact Context Budget Reference

| Artifact | Canonical Path | Target Line Budget | Notes |
|----------|----------------|--------------------|-------|
| Spec (`spec.md`) | `/specs/[###-feature]/spec.md` | ≤250 | Includes journeys, acceptance criteria, edge cases, and context budget. |
| Plan (`plan.md`) | `/specs/[###-feature]/plan.md` | ≤150 | Contains Constitution Check, gate/waiver log, evidence strategy. |
| Tasks (`tasks.md`) | `/specs/[###-feature]/tasks.md` | ≤120 | Group by story/goal; cite evidence expectations per task. |
| Research/Notes | `/specs/.../notes/` | ≤200 per file | Use for exploratory work; summarize back into canonical docs. |
| Short-Term Memory Digest | `.specify/short-term-memory/*.md` | ≤400 | Retire once summarized; keep only active digests. |

Budgets are ceilings, not quotas. When a document exceeds its budget temporarily, record the exception in the header and create an action item to prune it.
