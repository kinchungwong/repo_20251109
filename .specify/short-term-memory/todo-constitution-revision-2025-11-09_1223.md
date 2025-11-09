# Constitution Revision Notes (Pending Ratification)
**Scope**: Pre-ratified draft constitution for repo_20251109 (GSFD codename)  
**Status**: Working notes for large revision; do not treat as an approved artifact.

## Inputs Reviewed
- repo_20251109/README.md: outlines C++ biphase DAG executor focus (define vs execute, implicit/explicit dependencies, CPU-bound scope).
- repo_20251109/stakeholder_inputs/README.md: Agent-First mandate, GSFD codename, constitution must support AI-human collaboration.
- .specify/memory/agent_doc_mgmt_stds.md: document headers, single-source-of-truth, cross-reference prefixes, ✅/❌ notation, short-term-memory usage.
- .specify/memory/constitution.md: draft v0.9.0 (pending ratification) with nine provisional principles plus Sync Impact Report and TODO(RATIFICATION_DATE).
- stakeholder_inputs/obsolete_artifacts/very_old_constitution_draft.md: heavy SpecDD constitution with six principles emphasizing spec-first, gated execution, test-led proof, independent stories, living artifacts, verified evidence.
- stakeholder_inputs/obsolete_artifacts/readme_gsfd.md: GSFD domain concepts (Graph, Step, Field, Data, Finder, Executor) plus namespace guidance (allowed `gsfd` prefix).
- stakeholder_inputs/obsolete_artifacts/very_old_checklist.md: comprehensive spec checklist whose analysis burden exhausted agent context.
- stakeholder_inputs/obsolete_artifacts/large_obsolete_artifacts/00000000-very_old_story/: full SpecDD bundle (spec, plan, tasks, checklists, research, data-model, quickstarts, notes, contracts) illustrating systemic process sprawl.

## Key Takeaways
1. **Process Fatigue**: Previous constitution + checklist forced exhaustive reasoning per feature, exhausting AI context. New draft must encode outcomes without requiring agents to restate every check.
2. **Agent-First Requirements**: Documents need headers, scoped content, and short-term memory files (this document) for complex revisions.
3. **Risk-Based Governance**: Heavy gating (Phase 0/1, multi-layer tests) is valid for safety-critical runtime changes but should scale down for low-risk work.
4. **Safety-Critical Proof**: Verified execution evidence and test-led implementation remain essential, but we must define when the full harness is mandatory.
5. **Automation Limits**: Agents cannot fabricate command output; constitution must codify escalation paths when automation is blocked.
6. **Delivery Artifacts**: Need minimal, enforceable set (spec, plan, tasks, evidence bundles) with room for pragmatic exemptions; referencing `.specify/templates/*` for alignment remains TODO.
7. **GSFD Terminology**: Graph/Step/Field/Data semantics must stay consistent; constitution should encourage plain-English descriptions alongside names.
8. **Scaled Agile Intent**: Stakeholder wants alignment with scaled agile principles and “just-right” process.

## Open Questions / TODOs
- Define exact principle list (>=8) covering scaled agile, harness discipline, automation boundaries, evidence, delivery artifacts, observability.
- Decide risk tiers for artifacts/tests (e.g., runtime core, feature extensions, maintenance), so checklists become modular.
- Determine ratification date (currently TODO) and governance cadence for reviews.
- Align `.specify/templates/plan/spec/tasks/checklist` once principles finalized to avoid template drift.
- Specify how `gsfd` prefix policy integrates with cross-reference registry.
- Document workflow for capturing real execution evidence when agents lack runtime access (user-run logs, attachments, etc.).

## Next Actions
1. Draft constitution v0.9.0 marking all sections “Pending Ratification,” reflecting transitional state.
2. Capture Sync Impact Report in constitution file summarizing pending areas and template updates (likely ⚠ pending).
3. After stakeholder feedback, iterate on principle wording and finalize ratification and governance sections.
4. Update templates and guidance files once principles are locked, noting risk-tiered checklists.
5. Specify evidence catalog format, automation escalation workflow, gsfd prefix registry entry, and observability requirements.
6. Plan compliance review cadence and template updates, noting any additional TODOs in short-term-memory until resolved.

## Additional Observations (2025-11-09 12:40 UTC)
- **SpecDD bundle complexity**: The `00000000-very_old_story` directory contains ten-plus markdowns (spec, plan, tasks, data-model, research, quickstarts, contracts, notes, checklists) cross-linked via FR/SC/EC/EM/T/DD/FF registries. Reloading all of that context is exactly what exhausted prior agents.
- **Task/test explosion**: `tasks.md` enumerates 80+ entries tagged by story and enablement milestone, each demanding six test classes (contract/unit, integration, concurrency, performance, sanitizer/fuzz, agent onboarding) plus waiver bookkeeping. Any change ripples through multiple artifacts.
- **Checklist reverberation**: Requirements and onboarding checklists rephrase spec/plan content yet were meant to be repeated before each `/speckit` command. Combined with `spec-analysis-*` snapshots, they forced triple bookkeeping for the same facts.
- **Governance drift evidence**: Analysis reports point out template banners left in tasks, stale Constitution Checks, and missing evidence logs—proof that piling on more gates did not prevent drift but did increase cognitive load.
- **Implication for new constitution**: Favor lean, risk-tiered enforcement (e.g., summary-level Sync Impact notes, shared evidence catalog) over monolithic checklists so agents can comply without rereading the entire bundle every iteration.
