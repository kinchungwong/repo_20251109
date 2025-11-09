# Obsolete Constitution Lessons – Deep Dive
**Scope**: Capture pros/cons and risk notes from the legacy SpecDD constitution/checklists/feature bundle (`stakeholder_inputs/obsolete_artifacts/*`).  
**Status**: Working memo to guide the pending-ratification draft toward leaner, risk-tiered governance.

## Purpose
- Provide the “thorough analysis and debate” stakeholders requested so we avoid recreating the process bloat that halted the prior program.
- Highlight which legacy mechanics must survive (safety-critical rigor) versus which should be simplified or deferred.

## Legacy Constitution Principle Analysis
### I. Specification-First Delivery
- **Pros**: Keeps every increment anchored to a spec with measurable acceptance criteria; enforces traceability from spec → plan → tasks.
- **Cons**: Hard stop on any work until `/specs/.../spec.md` is fully ratified caused long idle periods; even trivial fixes had to wait for full spec ceremonies, compounding backlog. Need a lightweight exception path for urgent maintenance.

### II. Plan-Gated Execution
- **Pros**: Crystal-clear gating between spec, Phase 0/1 artifacts, and implementation. Constitution Check forced proactive risk surfacing.
- **Cons**: Automation expected every plan to restate how each principle would be satisfied; plans and tasks drifted anyway (analysis reports showed stale Constitution Check text). Per-feature reproduction of the entire doctrine overwhelmed agents.

### III. Test-Led Implementation (NON-NEGOTIABLE)
- **Pros**: Ensured concurrency safety by demanding failing tests ahead of implementation plus multi-layer matrices (unit/integration/concurrency/perf/sanitizer/fuzz/onboarding). Critical for safety-critical runtime.
- **Cons**: Universal requirement for every story, even documentation-heavy ones, forced artificial tests or waivers. Coupling to `/speckit.tasks` output meant agents spent more time bookkeeping than coding. Need risk-based tailoring (e.g., Tier 2 maintenance shouldn’t need full fuzz harness).

### IV. Independent Story Slices
- **Pros**: Drove incremental delivery and allowed partial demos.
- **Cons**: Required complex dependency tables (`Complexity Tracking`, `[P]` concurrency flags) that were tedious to maintain and rarely accurate once implementation began. Enforcing strict isolation in a low-level runtime sometimes clashed with necessary refactors.

### V. Living Artifact Stewardship
- **Pros**: Emphasized single source of truth, up-to-date quickstarts, and regenerated agent guidance—aligned with Agent-First mandate.
- **Cons**: Mandated simultaneous updates to spec, plan, research, data-model, quickstarts, contracts, tasks, templates, and agent prompts for virtually any change. In practice, reviewers kept finding drift (e.g., `plan.md` describing “in progress” foundations after code already landed).

### VI. Verified Execution Evidence
- **Pros**: Zero tolerance for fabricated logs; every build/test command had to cite real outputs and storage paths—critical for trust.
- **Cons**: Required referencing log artifacts inside every spec/plan/task entry even when automation couldn’t run locally, creating copy/paste churn. Need a reusable “evidence catalog” instead of duplicating command strings everywhere.

## Required Delivery Artifacts & Workflow
- **Strength**: Clear artifact list (`spec.md`, `plan.md`, `research.md`, `data-model.md`, `quickstart*.md`, `contracts/`, `tasks.md`) gave contributors unambiguous expectations.
- **Weakness**: Mandating full Phase 0/1 outputs for every effort—even hotfixes—became prohibitive. Workflow steps 1–5 forced revalidation of entire artifact stack each iteration, compounding context size.

## Governance Section
- **Pros**: Semantic versioning of constitution, amendment requirements, quarterly compliance reviews—useful structure we should keep.
- **Cons**: Every `/speckit.plan` run demanded a Constitution Check audit referencing each principle, even if nothing changed. This requirement cascaded into giant plan sections repeating the same boilerplate.

## Checklist & Process Debt Findings
- `very_old_checklist.md` + `checklists/requirements.md`: Provided clarity but duplicated spec content, causing “analysis loops” before every command.
- `checklists/onboarding.md`: Useful for SC-005, yet required manual log capture, adding more friction.
- `/notes/spec-analysis-*.md`: Automated analyzers repeatedly flagged the same drift (plan vs reality, missing waivers, template banners), showing the process created audit work without preventing issues.
- `/notes/testing-probes-matrix.md`: Excellent mapping of success criteria → tests but mandated tracking six classes for every story/milestone. Implementation teams struggled to keep the table in sync.

## `00000000-very_old_story` Bundle – Highlights
- **Spec**: Extremely detailed (personas, edge-case tables, ID registries). Great institutional memory yet daunting for agents to reload.
- **Plan**: Constitution Check + enablement milestones spelled out but still went stale—evidence that even with rules, humans/agents fell behind.
- **Tasks**: ~80 entries with `[P]` flags, story tags, enablement tags, plus instructions to write failing tests first and run specific commands. Beneficial for rigor but unsustainable to maintain by hand.
- **Data Model / Contracts**: Provide high-fidelity API contracts we can reuse, but future constitution should reference them rather than require restatement.
- **Quickstarts**: Developer/programmer/CI versions were valuable but required constant synchronized updates; missing automation led to TODOs lingering.
- **Notes**: Deferred decisions (DD-###), future features (FF-###), ID registry, graph clone analysis—all necessary metadata, yet they multiplied doc count agents had to ingest before contributing.

## Guidance for the New Constitution
1. Retain the safety-critical intent (test-first, verified evidence) but bind it to risk tiers so simple fixes don’t need fuzz harnesses.
2. Replace per-document restatements with a single Sync Impact Report + evidence catalog update requirement.
3. Limit Constitution Check sections to delta summaries referencing the base constitution instead of rehashing every principle.
4. Modularize checklists: one per risk tier or artifact family, so agents load only what applies.
5. Provide explicit rules for when Phase 0/1 artifacts may be deferred or replaced with short-form notes.
6. Keep GSFD naming/namespace guardrails, but consolidate terminology guidance into one reference (e.g., `readme_gsfd.md` + new glossary) to avoid scattering context.

## Open Debates Needing Stakeholder Input
- Acceptable minimum artifact set for Tier 2 maintenance (spec update? plan addendum? checklist excerpt?).
- Definition of “evidence catalog” (per-commit log summary vs. shared ledger) so Verified Execution Evidence remains enforceable without repeated copy/paste.
- Whether enablement milestones remain (EM-01…05) or get condensed into simpler readiness gates.
- How to document automation limits/escalations without demanding bespoke text in every artifact.
- Preferred cadence for regenerating quickstarts and agent prompts (per release vs. per major change).
