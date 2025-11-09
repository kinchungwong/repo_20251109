# Agent Document Management Standards

This standards document applies to AI Agent created and managed documents within the GSFD project.

## Applicable Documents

- Codex CLI agent prompts at `repo_20251109/.codex/prompts`
- Specification Governance, such as Constitution, at `repo_20251109/.specify`
- Specification Artifacts, such as Features, Stories, Specifications, Plans, and Tasks, at `repo_20251109/specs`

## Agent-First Document Header

Remember, this project will grow big. Big enough to overwhelm both human and AI agent memory.

Each document must contain a header section that quickly orients readers to the document's purpose, scope, and context. It shall enable readers to quickly decide if the document is relevant to their current task.

## Single Source of Truth

Each document must be the single source of truth for its content. AI agents and human developers must avoid duplicating or fragmenting information across multiple documents.

## Cross-Referencing, Numbering, and Prefix Registry

Projects of this size require extensive cross-referencing between documents. For brevity, unique identifiers such as document prefixes and section or item numbers should be used.

To prevent misuse of prefixes, all prefixes must be registered (added, updated, and maintained) in `repo_20251109/.specify/memory/crossref_prefixes.md`. All changes to cross-references must kick off an Agent-based consistency validation step.

Do not perform reordering of existing numbered items unless absolutely necessary. If reordering is necessary, ensure that all cross-references are updated accordingly.

For item completion, use the Unicode checkmark (✅). For item failures, use the Unicode cross mark (❌). For superseded items, use the Markdown strikethrough syntax (~~text~~), followed by reason.

## Persistence and Versioning

All files are under version control via Git. The human user is ultimately responsible for committing changes to the repository. Whenever applicable, AI agents must suggest appropriate commit messages.

## Temporary To-Do Notes

AI agents have limited memory, and must rely on documents for persistence of context. When AI agents respond to
a prompt that requires many steps, they may need to create temporary to-do notes.

Due to the complexity of thought processes in AI-mediated domain expert collaboration, these to-do notes may get long. AI agents must periodically review and prune completed or obsolete to-do notes to maintain clarity. If it gets to more than 40 lines of text or 20 items or 3 or more unrelated sections, consider splitting it into multiple to-do files. Rules for file locations and naming conventions are as follows.

### Locations for Temporary To-Do Notes

Feature branch specific to-do notes must be stored inside the directory `repo_20251109/specs/000-feature-branch-name/notes/todo/`.

General to-do notes can be stored inside the directory `repo_20251109/.specify/short-term-memory/`.

### File naming convention for Temporary To-Do Notes

All temporary to-do note file names must start with the prefix `todo-`, a filesystem-safe dash-separated keyword-only description, a timestamp in `YYYY-mm-dd_HHMM` format, and end with the `.md` extension.

Hint: the timestamp can be generated using the following command:

```sh
echo $(date +"%Y-%m-%d_%H%M")
```

### AI Agent Forgetfulness Mitigation

From time to time, the AI agent context need compaction (purging) or a fresh restart. Either case, some temporal memory may be lost. To mitigate this, AI agents must dutifully summarize and consolidate into permanent specification artifacts. Complex steps needing short-term memory can rely on temporary to-do notes.
