<!-- Sync Impact Report
Version change: N/A → 0.9.0
Modified principles: Template placeholders → Principle 1–9 (pending wording)
Added sections: Core Principles (pending), Process Guardrails & Risk Tiers (pending), Delivery Workflow & Evidence Handling (pending)
Removed sections: None
Templates requiring updates: ⚠ .specify/templates/plan-template.md, ⚠ .specify/templates/spec-template.md, ⚠ .specify/templates/tasks-template.md, ⚠ .specify/templates/checklist-template.md, ⚠ .specify/templates/agent-file-template.md
Follow-up TODOs: TODO(RATIFICATION_DATE), finalize principle thresholds, define risk-tiered checklists, align templates, confirm gsfd prefix registry entry
-->

# repo_20251109 Constitution
> **Status**: PENDING RATIFICATION — draft captured 2025-11-09 to guide negotiations; do not enforce verbatim yet.

## Core Principles

### Principle 1 – Agent-First Stewardship & Context Protection
> Pending ratification: language will be tuned once stakeholder feedback confirms scope.

AI agents MUST structure every artifact with the mandated headers, concise scope statements, and cross-references so collaborators can reload context quickly. Documents SHALL remain single sources of truth and retire redundant reasoning into `.specify/short-term-memory/` digests once resolved, ensuring large checklists or audits are summarized rather than re-litigated.

### Principle 2 – Specification Anchors with Lightweight Gates
> Pending ratification: balance between thoroughness and agility under review.

Every net-new capability MUST originate from an approved `spec.md` capturing user journeys, acceptance criteria, and edge cases, yet small maintenance or safety fixes MAY follow an expedited path documented in the plan’s Constitution Check. Plans MUST trace deliverables back to specs while explicitly calling out any intentionally deferred requirements.

### Principle 3 – Scaled Agile Flow & Incremental Value
> Pending ratification: needs alignment with stakeholder scaled-agile expectations.

Work MUST be organized into independently deliverable increments with clear priorities (P1/P2/P3) so testing, demos, and evidence gathering can conclude per slice. Program-level ceremonies (backlog sync, system demos) SHALL consume artifact summaries rather than replaying full documents, preserving agent context budget.

### Principle 4 – Deterministic Graph Safety & Terminology Discipline
> Pending ratification: GSFD naming rules subject to refinement.

The constitution recognizes GSFD (Graph, Step, Field, Data) semantics: define/execute phases MUST remain separate, implicit dependencies derive from Data flows, and explicit dependencies are documented where needed. `gsfd` is the approved namespace/prefix for runtime code and include directories, and artifacts MUST explain concept names in plain English before referencing identifiers to avoid cross-POC ambiguity.

### Principle 5 – Safety-Critical Test Harness Discipline
> Pending ratification: risk tiers for the harness to be calibrated.

Core runtime or executor changes MUST ship with multi-layer tests (contract, unit, integration, concurrency stress, sanitizer/fuzz) authored before implementation and executed on real hardware or CI nodes. Lower-risk features MAY tailor the matrix but MUST document the rationale and minimum test evidence retained for audit.

### Principle 6 – Automation Boundaries & Escalation
> Pending ratification: escalation paths awaiting stakeholder confirmation.

Agents SHALL declare tooling or environment limitations upfront, MUST NOT fabricate command output, and MUST either capture real logs or request human execution with attached evidence. Automation gaps require explicit TODOs plus owner assignments in artifacts so nothing silently drops.

### Principle 7 – Verified Execution Evidence
> Pending ratification: evidence catalog format TBD.

All assertions about behavior (builds, tests, benchmarks) MUST cite the exact command, platform, and log location. When evidence cannot reside in-repo (size/security), artifacts MUST link to the authoritative storage path and record who validated the run and when. Simulated or assumed outputs are prohibited.

### Principle 8 – Delivery Artifact Minimums & Single Source of Truth
> Pending ratification: exemptions and tooling hooks still in discussion.

Each feature SHALL maintain a coherent set of artifacts: `spec.md`, `plan.md`, `tasks.md`, and, when applicable, `research.md`, `data-model.md`, `quickstart.md`, and `contracts/`. Updates happen in lockstep with decisions, and `.specify/templates/*` plus the agent guidance file MUST evolve to mirror the latest rules to keep automation honest.

### Principle 9 – Observability, Diagnostics, and Evidence of Performance
> Pending ratification: observability requirements to be prioritized with stakeholders.

Runtime work MUST define the logging, tracing, and metrics needed to debug gsfd graphs (including deterministic replay hooks) before implementation. Performance targets (throughput, latency, memory) SHALL be measurable, and observability scaffolding MUST be part of the acceptance criteria, not an afterthought.

## Process Guardrails & Risk Tiers
> Pending ratification: content captures negotiation baseline, not final policy.

The program SHALL maintain a lightweight risk-tier matrix (e.g., Tier 0 core runtime, Tier 1 feature expansion, Tier 2 maintenance) describing which artifacts, reviews, and harness steps are mandatory. High-tier work triggers full gates (Phase 0/1 artifacts, exhaustive tests, checklist deep-dives); lower tiers MAY opt into abridged flows provided the Constitution Check logs the deviation and rationale. Checklists SHALL be modular per tier to avoid reprocessing irrelevant items.

## Delivery Workflow & Evidence Handling
> Pending ratification: workflow steps may change once governance is settled.

1. Capture or update `spec.md` with agent-friendly structure and register any new cross-reference prefixes.  
2. Draft `plan.md` with Constitution Check focusing on delta analysis rather than rehashing closed findings; identify gating dependencies explicitly.  
3. Generate `tasks.md` after plan approval, grouping by user story and flagging where test-first work applies per risk tier.  
4. Execute increments: author failing tests (per Principle 5), implement features, collect real execution evidence, and store/log results with durable links.  
5. Summarize findings in short-term-memory notes when reasoning exceeds practical artifact scope, then incorporate conclusions into canonical docs and retire the temporary files.  
6. Regenerate or update agent guidance so automation inherits the new rules, ensuring `gsfd` namespace usage and observability requirements propagate.

## Governance
> Pending ratification: governance cadence and approval thresholds under negotiation.

This draft supersedes no prior policy until ratified; however, contributors SHALL begin aligning behavior with its intent to surface gaps early. Amendment proposals MUST include the intended semantic version bump (MAJOR for rewrites/removals, MINOR for new principles/sections, PATCH for clarifications) plus an updated Sync Impact Report and a delta list for affected templates. Reviews SHALL verify that ratified principles cascade into `.specify/templates/*`, `.codex/` prompts, and runtime guidance. Compliance reviews SHALL occur before each quarterly increment or major release to ensure evidence trails remain reproducible and automation guardrails still match reality.

**Version**: 0.9.0 | **Ratified**: TODO(RATIFICATION_DATE): set once stakeholder sign-off occurs | **Last Amended**: 2025-11-09
