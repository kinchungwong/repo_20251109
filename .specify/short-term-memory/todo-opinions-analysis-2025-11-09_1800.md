# Stakeholder Opinion Digest (2025-11-09 16:24 PST)
**Scope**: Analysis of `stakeholder_inputs/opinions_2025-11-09-1624.md` – first section only (Knowledge 1 → Appendix 999).  
**Status**: Working notes to inform constitution revisions; junk text after the first horizontal divider intentionally ignored per stakeholder guidance.

## Confirmed Themes
1. **Spec-Kit as Non-Negotiable Backbone** – Knowledge 1 and Principle 4 emphasize that Spec-Kit controls methodology, repo layout, and automation hooks. Constitution must treat Spec-Kit conventions (Specify → Plan → Task → Implement, branch-per-increment) as axioms, not preferences.
2. **Specification Anchors + Lightweight Gates** – Knowledge 2 wants anchors (spec artifacts) plus quick validation gates. Our draft should highlight how risk-tiered checkpoints satisfy this without recreating heavyweight checklists.
3. **Agent Respect & Human Collaboration (Principles 3a & 3b)** – Reiterates ADMS compliance, short-term memory usage, prohibition on fabricated outputs, and explicit human escalation paths. Need to ensure constitution language mirrors these bullet points verbatim or references ADMS to avoid drift.
4. **Iterative Git-Centric Flow (Principle 4)** – Every increment is a Git feature branch with required artifacts (`spec.md`, `plan.md`, `tasks.md`) in `/specs/[###-feature-name]/`. Minimum artifact set is locked; optional folders (checklists/data-models/notes) depend on feature type and risk tier.
5. **Specification-First Delivery Clarifications (Principle 3)** – Increments ≠ user stories; stories span increments, but each branch must deliver independently testable value. Spec-Kit commands create directories; agents must not manually scaffold them. Aligns with earlier desire to unify feature/milestone/story semantics while respecting Spec-Kit’s automation boundaries.

## Implications for Constitution Draft
- Embed a “Spec-Kit Compatibility” clause referencing Knowledge 1/Principle 4 so contributors know automation scripts outrank custom process tweaks.
- Codify the required artifact trio and optional directories, with risk-tier addenda pointing to Appendix 999 once defined.
- Add explicit ADMS + short-term-memory compliance language under Agent-First principles, referencing Principle 3a/3b bullet points (logs, automation gaps, Socratic collaboration).
- Clarify that humans own feature-branch bootstrapping (Spec-Kit commands) and merges, fulfilling Principle 4 statements.

## Open Questions / TODOs
- Appendix 999 is referenced but not supplied—need to locate or draft it so constitution can cite concrete artifact requirements per risk tier.
- Principle numbering overlaps (two “Principle 3” entries). Determine final numbering scheme when integrating into our draft.
- Decide how to reconcile “project-level user stories span increments” with our idea of branch=story to avoid terminology conflicts.
- Confirm whether Knowledge 2’s Lightweight Gates map to the risk-tier gates we’re designing or require additional checkpoints.

## Next Steps
1. When editing `.specify/memory/constitution.md`, integrate these stakeholder-backed clauses before touching template alignment.
2. Track down (or request) Appendix 999 to avoid referencing a non-existent artifact in the constitution.
3. Update future short-term-memory entries with resolutions to the open questions above.
