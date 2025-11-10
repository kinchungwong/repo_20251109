<!-- Sync Impact Report
Version change: 0.10.1 → 0.10.2
Modified principles:
- Principle 7 – Delivery Artifacts & Single Source of Truth (aligned terminology with Risk-Tier Reference Matrix acronym)
Modified sections:
- Process Guardrails, Risk Tiers & RTRM – clarified linkage between guardrails and matrix, defined RTRM acronym
Added sections: None
Removed sections: None
Templates requiring updates:
- ✅ .specify/templates/plan-template.md – already aligned with Constitution Check guidance (no change)
- ✅ .specify/templates/spec-template.md – already aligned with risk-tier flow (no change)
- ✅ .specify/templates/tasks-template.md – already aligned with tiered evidence expectations (no change)
- ✅ .specify/templates/agent-file-template.md – updated to mention the pending Risk-Tier Reference Matrix instead of Appendix 999
Follow-up TODOs: TODO(RATIFICATION_DATE) – awaits stakeholder ratification; TODO(RTRM) – publish the detailed feature-type vs. risk-tier artifact/test mapping.
-->

# repo_20251109 Constitution
> **Status**: PENDING RATIFICATION — draft captured 2025-11-09 to guide negotiations; do not enforce verbatim yet.

## Core Principles

### Principle 1 – Spec-Kit Backbone & Incremental Flow
Spec-Kit governs every increment: humans bootstrap `/specs/[###-feature-name]/` branches (the canonical Spec-Kit folder slug) with the Specify → Plan → Task → Implement cadence, and agents trace each deliverable back to the originating spec. Every branch must deliver independently testable value, even if it only advances part of a larger user story. *Rationale*: Treating Spec-Kit as law keeps automation, governance, and audit hooks aligned, preventing side-channel processes that bloat documentation.

### Principle 2 – Context-Budgeted Knowledge Stewardship
Artifacts MUST follow `.specify/memory/agent_doc_mgmt_stds.md` headers and include a TL;DR (≤200 words) plus key links so agents and humans can reload state without rereading prior volumes. Reasoning that exceeds 400 lines migrates into `.specify/short-term-memory/` digests that summarize decisions before being retired. Each template now includes a "Context Budget" table to signal expected token/line ceilings, and teams SHALL cite where long-form evidence lives instead of duplicating it. *Rationale*: Intentional layering keeps the constitution + ADMS lightweight while preserving traceability.

### Principle 3 – Specification Anchors & Lightweight Gates
Net-new capabilities start from `spec.md` anchors that describe prioritized user journeys, acceptance criteria, and edge cases. Plans and tasks MUST cite the anchor IDs and record whether the work follows the standard gate (Spec → Plan → Tasks approvals) or a Tier 2 maintenance fast-path. Lightweight gates defer heavyweight checklists until the risk tier demands them, yet every deviation is logged inside the Plan’s Constitution Check. *Rationale*: Anchors guard scope while letting low-risk fixes move quickly.

### Principle 4 – Human-Agent Collaboration & Escalation Integrity
Agents declare tooling or permission constraints upfront, request human execution for privileged commands, and attach authentic logs to every claim. Socratic reviews and interruptions are expected; short-term-memory notes capture dead-ends so continuity survives hand-offs. Automation gaps become explicit TODOs with owners and due dates inside the relevant artifact instead of tribal knowledge. *Rationale*: Transparent collaboration prevents silent failures and makes the light process trustworthy.

### Principle 5 – Deterministic Graph Safety & Terminology Discipline
Define/execute phases stay separated, dependencies reflect real data flows, and the `gsfd_*` namespace plus prefix registry entry document graph semantics in plain English before any shorthand appears. Any new concept or identifier MUST be registered in `.specify/memory/crossref_prefixes.md` before use. *Rationale*: Terminology discipline keeps cross-team reasoning short and unambiguous.

### Principle 6 – Safety-Critical Test Harness & Verified Evidence
Tier 0 runtime or executor changes ship with contract, unit, integration, concurrency, sanitizer, and fuzz tests authored before implementation and run on real hardware or CI. Tier 1 features tailor the matrix but MUST justify omissions in plan.md; Tier 2 maintenance at least adds regression or smoke coverage. All assertions cite the exact command, platform, and log path; simulated outputs are prohibited. *Rationale*: Evidence-first delivery enables lightweight reviews without sacrificing quality.

### Principle 7 – Delivery Artifacts & Single Source of Truth
Every increment maintains `spec.md`, `plan.md`, and `tasks.md` in lockstep, with optional `research.md`, `data-model.md`, `quickstart.md`, `contracts/`, and `notes/` folders activated per the risk tier recorded in the plan’s Constitution Check. Once the Risk-Tier Reference Matrix (RTRM) is ratified, use it alongside the tier to decide which optional artifacts become mandatory. Until then, capture the rationale for each optional artifact (or its omission) directly in plan.md. Agents never scaffold Spec-Kit directories manually; humans run the commands and agents update content. Artifacts retire redundant reasoning once conclusions merge back into the canonical files. *Rationale*: A minimal, curated artifact set keeps the doc set slim yet authoritative.

### Principle 8 – Observability, Diagnostics & Performance Clarity
Runtime work specifies required logging, tracing, and metrics before implementation, including deterministic replay hooks for gsfd graphs. Performance goals (throughput, latency, memory) must be measurable and appear alongside acceptance criteria. Observability scaffolding is part of the MVP definition, not an afterthought. *Rationale*: Proactive diagnostics prevent bloated retrofits and shorten debugging cycles.

## Process Guardrails, Risk Tiers & RTRM
The program tracks three tiers to keep gates proportionate and will anchor them in the Risk-Tier Reference Matrix (RTRM) once ratified:

| Tier | Example Work | Mandatory Artifacts & Gates | Lightweight Strategy |
|------|--------------|-----------------------------|----------------------|
| **Tier 0 – Core Runtime & Executor** | Scheduler, graph safety, memory management | Full Spec → Plan → Tasks approvals, multi-layer tests, checklist deep dives, observability plan, exec evidence | None – all gates mandatory. Use short-term-memory files only for transient investigations and summarize results in specs immediately. |
| **Tier 1 – Feature Expansion & Integrations** | New graph ops, APIs, tooling | Spec anchors with acceptance criteria, plan Constitution Check, task breakdown per story, targeted harness matrix | May trim checklist categories that do not apply; record the waiver + rationale in plan.md. |
| **Tier 2 – Maintenance, Docs, Enablement** | Bug fixes, doc refresh, infra chores | Spec delta note (can be inline), mini-plan TL;DR, task list referencing impacted files | Use the maintenance fast-path: embed <10 line Constitution Check noting why heavier gates are skipped, and ensure tests or smoke validation still run. |

The RTRM (pending ratification) will capture detailed feature types and the artifacts/tests each tier requires; until it is published, teams SHALL document deviations explicitly inside plan.md.

## Delivery Workflow & Evidence Handling
1. Draft or refresh `spec.md` with TL;DR, prioritized journeys, acceptance criteria, edge cases, and Context Budget entries; register any new prefixes.
2. Run `/speckit.plan` to generate plan.md, populate the Constitution Check with current tier, required gates, lightweight waivers, and cite the evidence strategy and automation gaps.
3. Populate supporting docs (`research.md`, `data-model.md`, `quickstart.md`, `contracts/`) only when value is proven; otherwise reference the short-term-memory digest that stores exploratory reasoning.
4. Generate `tasks.md` via `/speckit.tasks`, grouping by user story and tagging each task with test/evidence expectations so increments stay independently shippable.
5. Execute increments: write failing tests first (per Principle 6), implement code, capture real logs, and stash large evidence externally with durable links noted in the artifact.
6. Summarize conclusions back into canonical documents, prune temporary notes, and update `.specify/templates/*` plus agent guidance when rules change so automation stays synchronized.

## Governance
This draft supersedes no prior ratified policy yet contributors SHALL align behavior with its intent to flush gaps before ratification. Amendment proposals MUST state the semantic version bump type (MAJOR for removals/rewrites, MINOR for new principles or sections, PATCH for clarifications), update the Sync Impact Report, and list every dependent template or runtime guide touched. Quarterly (or release-level) compliance reviews verify principles against `.specify/templates/*`, `.codex/` prompts, and runtime docs; review findings feed short-term-memory notes until resolved in canonical artifacts.

**Version**: 0.10.2 | **Ratified**: TODO(RATIFICATION_DATE): set once stakeholders approve | **Last Amended**: 2025-11-09
