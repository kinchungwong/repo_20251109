# Risk-Tier Reference Matrix (RTRM)

> **Status**: RATIFIED 2025-11-09 — mirrors Constitution §“Process Guardrails, Risk Tiers & RTRM” for quick lookup.

## Purpose *(Principle 2 TL;DR)*

Provide a single lookup table that tells contributors which artifacts, validations, and approvals each risk tier requires. Use this matrix when filling out plan.md Constitution Checks or requesting gate waivers. The constitution, templates, and agent guidance already point here as the canonical source.

## How to Use This Matrix *(Principle 2 TL;DR)*

1. During specification, select the tier that best matches the intended work and copy the relevant artifact/test checklist into plan.md.
2. During planning, document any waivers and reference this matrix row by row so reviewers can verify coverage.
3. During tasks execution, ensure evidence commands/logs satisfy the validation column for the chosen tier.

## Tier Overview

| Tier | Typical Work | Gate Owner | Rationale |
|------|--------------|------------|-----------|
| **Tier 0 – Core Runtime & Executor** | Scheduler, graph safety, memory management, concurrency primitives | Tech Lead + Architecture steward | Changes impact every workload; failures compromise thread safety guarantees. |
| **Tier 1 – Feature Expansion & Integrations** | New graph ops, APIs, tooling, adapters | Feature lead (with reviewer) | Delivers user-visible capability but within established safety rails. |
| **Tier 2 – Maintenance, Docs, Enablement** | Bug fixes, doc refresh, automation chores | Feature owner | Low-risk increments to keep the system healthy. |

## Artifact & Validation Requirements

| Tier | Mandatory Artifacts | Optional / Conditional Artifacts | Validation & Evidence | Approvals / Notes |
|------|--------------------|----------------------------------|----------------------|-------------------|
| **Tier 0** | spec.md (full journeys + edge cases), plan.md, tasks.md, checklist (full), research.md (if new algo), data-model.md (if data touched), contracts/, quickstart.md updates | notes/, observability design doc if new telemetry | Contract + unit + integration + concurrency + sanitizer + deterministic scheduler A/B + oversubscribed stress harnesses; external evidence links required; fuzzing TODO logged until toolchain supports | Requires human lead sign-off plus architecture steward; Constitution Check must show “all gates” with zero waivers. |
| **Tier 1** | spec.md (story-level), plan.md, tasks.md, checklist (targeted), research.md or data-model.md when new surfaces, notes/ if reasoning >400 lines | quickstart.md if UX/API exposed, contracts/ if interface changes | Contract + unit + integration + whichever concurrency tests apply; sanitizer matrix encouraged; deterministic scheduler runs when concurrency touched; stress harnesses for graph-affecting work | Plan may request waivers for unused artifacts; reviewer must confirm rationale in Constitution Check. |
| **Tier 2** | spec delta (inline or mini spec), plan TL;DR (≤10 lines) inside plan.md or maintenance plan stub, tasks.md (can be short checklist), Constitution Check (<10 lines) | research.md / notes/ only if needed for context; checklists optional unless policy requires | Regression or smoke tests; at least one command/log per affected area; sanitizers or stress harnesses when touching concurrency-sensitive files | Maintenance fast-path allowed if Constitution Check states why heavier gates aren’t needed and cites validation evidence. |

## Additional Rules & Guidance

- **Concurrency responsibilities**: Whenever work touches Graph, Validator, Executor, DataHandle, VarData, or task-author contracts, also cite `.specify/memory/concurrency_responsibilities.md` and detail the ownership transfer in plan.md. Tier classification does not loosen these expectations.
- **Automation gaps**: If a required validation cannot run (e.g., fuzzing on g++ 14), document the limitation plus mitigation strategy in plan.md and short-term memory notes. Tier 0 cannot waive concurrency tests; Tier 1/2 can only defer with explicit reviewer approval.
- **Observability & evidence**: Principle 8 applies to every tier. Tier 0 work must land observability scaffolding before merge. Tier 1/2 may stub metrics only if plan.md documents the follow-up owner/date.
- **Escalation**: Any tier may be escalated if scope expands (e.g., Tier 2 bugfix discovers deeper runtime flaw). Update plan.md Constitution Check immediately when tier changes mid-iteration.

Feedback welcome—submit edits or open a discussion if governance needs evolve.
