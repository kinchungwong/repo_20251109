# Obsolete Artifacts - Very Old Constitution Draft from a different project

This document is provided by stakeholders as an example of a previous constitution draft for a different project. It is retained here for reference purposes only and is not intended to guide the current project's constitution.

# SpecDD Reference Project Constitution

## Core Principles

### I. Specification-First Delivery
- All product increments MUST start from an approved `/specs/.../spec.md` that captures prioritized user journeys, acceptance criteria, and edge cases before any research or planning begins.
- Implementation plans MUST trace every commitment back to the specification and MAY NOT introduce scope that lacks explicit specification coverage.
- Task breakdowns MUST reference the user stories they support so changes remain traceable from specification through delivery.
Rationale: Shared specifications keep delivery anchored to user value and make compliance reviews objective.

### II. Plan-Gated Execution
- Phase 0 and Phase 1 artifacts (`research.md`, `data-model.md`, `quickstart.md`, `contracts/`) MUST be produced and linked in `plan.md` before `/speckit.tasks` or implementation work can start.
- Every `plan.md` MUST include a Constitution Check section that documents how the feature will satisfy each principle before implementation begins.
- Foundational work MUST record gating dependencies; no user story work may begin until the plan documents that prerequisites are complete.
Rationale: Formal gates prevent ad-hoc execution and surface risks before code is written.

### III. Test-Led Implementation (NON-NEGOTIABLE)
- Tests for each user story MUST be defined, committed, and failing before implementation work on that story starts; no code path may be authored without a corresponding red test.
- Every story MUST record a multi-layer test matrix in `tasks.md` covering contract, unit, integration, and—because this project delivers a reusable C++ task-graph runtime—concurrency probes, determinism checks, stress/performance benchmarks, and sanitizer/fuzz harnesses needed to prove the runtime safe on real hardware.
- Test artifacts MUST encode the invariants promised in `spec.md` (single-writer enforcement, sealed snapshot semantics, fixed worker-pool behavior, edge-case handling) and include reproduction instructions for CI rigs meeting the documented hardware requirements.
- Continuous integration MUST block merges when required tests are absent, failing, or do not exercise the declared invariants; stories close only after all planned tests pass under the mandated tooling (sanitizers, profilers, perf harnesses) with real execution traces or logs attached to the artifact history—simulated outputs are not acceptable evidence.
Rationale: C++17 lacks built-in task-graph safety guarantees; test-led proofs of concurrency correctness and performance are the only objective evidence that this reusable library behaves safely for downstream workloads.

### IV. Independent Story Slices
- User stories in `spec.md` MUST be framed so each delivers a demonstrable outcome without relying on future stories.
- Task lists MUST keep work for different stories isolated (use `[P]` only when there is no shared file conflict) and document unavoidable cross-story dependencies in the Complexity Tracking table.
- Deployment and review MUST evaluate each story as an independently releasable increment before progressing to the next story.
Rationale: Independence enables incremental value delivery and reduces coordination risk.

### V. Living Artifact Stewardship
- Canonical artifacts (spec, plan, research, data-model, quickstart, contracts, tasks, and aggregated agent guidance) MUST be updated immediately when decisions change scope, design, or constraints.
- Observability, performance, and compliance requirements MUST be documented in an artifact before code changes that implement them.
- Upon feature completion, the agent guidance file MUST be regenerated or manually updated so automation reflects the current system state.
Rationale: Up-to-date artifacts keep automated tooling reliable and preserve institutional knowledge.

### VI. Verified Execution Evidence
- Agents MUST never treat simulated or hypothesized command output (e.g., fake `cmake`, compiler, or test results) as factual. When a command cannot be run directly, they MUST request that the user execute it and provide the real logs or artifacts before relying on the outcome.
- Build, test, and benchmark steps recorded in specs, plans, or tasks MUST reference the actual command invocation plus the source of truth for its output (log path, attachment, or checklist link). When automation is impossible, the artifact MUST state who supplied the evidence and when.
- Reviewers MUST reject any change whose validation relies on simulated output or “assumed pass” language; all assertions about runtime behavior require reproducible, real execution evidence captured in the repository’s reports or notes.
Rationale: Preventing trust in hallucinated outputs preserves the integrity of safety-critical concurrency work and keeps audits defensible.

## Required Delivery Artifacts

The following artifacts are mandatory for every feature and MUST live under `/specs/[###-feature-name]/` unless otherwise stated:

- `spec.md`: Prioritized, independently testable user stories with acceptance scenarios and edge cases (Principles I & IV).
- `plan.md`: Constitution Check, technical context, and agreed structure mapping artifacts to implementation phases (Principles I & II).
- `research.md`, `data-model.md`, `quickstart.md`, `contracts/`: Document Phase 0/1 findings, domain models, onboarding steps, and external agreements before coding (Principle II).
- `tasks.md`: Story-organized task list including tests, dependencies, and Complexity Tracking justifications (Principles III & IV).
- Repository-level guidance (`.specify/templates/*`, agent file) and runtime notes: update alongside changes so later features inherit accurate constraints (Principle V).

## Delivery Workflow

1. Author and approve `spec.md`, ensuring stories are independent, prioritized, and testable.
2. Produce Phase 0/1 artifacts and complete `plan.md`, explicitly documenting Constitution Check outcomes and gating prerequisites.
3. Generate `tasks.md` only after the plan is ratified; enumerate tests first, then implementation work per story.
4. Execute per story: write failing tests, implement to pass, validate independence, and update artifacts before closing the story.
5. Regenerate or update aggregated guidance and verify all artifacts remain in sync prior to declaring the feature complete.

## Governance

- This constitution supersedes conflicting process documentation; subordinate templates must be updated to align rather than override these rules.
- Amendment proposals MUST document the intended semantic version bump (MAJOR for principle removal/redefinition, MINOR for new principles or material scope, PATCH for clarifications) before review.
- Adopt amendments via pull request that includes an updated Sync Impact Report, constitution text, and any necessary template updates; ratification requires maintainer approval and recorded decision history.
- Each `/speckit.plan` run MUST include a Constitution Check audit referencing the principles; features failing the gate cannot progress until the gap is resolved.
- Conduct a quarterly compliance review (or before major releases) to confirm artifacts, tests, and automation still reflect the constitution; corrective work MUST be scheduled when gaps are found.

**Version**: 1.2.0 | **Ratified**: 2025-11-05 | **Last Amended**: 2025-11-07
