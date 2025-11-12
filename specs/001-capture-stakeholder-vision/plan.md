# Implementation Plan: Stakeholder Vision and Stack Spikes

**Branch**: `001-capture-stakeholder-vision` | **Date**: 2025-11-11 | **Spec**: specs/001-capture-stakeholder-vision/spec.md  
**Input**: Feature specification from `/specs/001-capture-stakeholder-vision/spec.md`

> Template text was treated as advisory only. Content below reflects stakeholder-approved constraints, including spike caps determined jointly with sponsors and the prohibition on auto-generating `data-model.md` or `contracts/` unless GSFD core APIs are being coded.

## Summary

This increment formalizes the discovery program for GSFD: capture a ratified stakeholder vision brief, translate risks into prioritized 48-hour stack spikes with explicit hypotheses, and circulate learning summaries fast enough that executives can green-light the next delivery increment. Work focuses on facilitation, documentation, and governance rather than runtime code. Key deliverables are the signed vision brief, the spike backlog with ownership and scheduling, a communications cadence (weekly digest + spike close-out briefs), and evidence that 80% of spikes succeed within their timebox while surfacing reusable artifacts.

## TL;DR (≤200 words)

1. Facilitate structured intake workshops/interviews, reconcile conflicts, and publish the stakeholder-signed vision brief (US1).
2. Convert stated risks into a ranked backlog of ≤48-hour spikes where each row captures `Spike ID, Hypothesis, Timebox, Priority, Status {proposed, speccing, implementing, success, failure}, Artifact Status {implementing, done, deleted}` so lifecycle decisions stay auditable while stakeholders maintain the cap on total spikes (US2).
3. Operate the spike execution loop: monitor 48-hour timers, enforce lessons-summary + artifact checklist, and distribute concise executive briefings within two working days of each spike close (US3).
4. Evidence strategy: spike tracker in `reports/` (CSV/Markdown) plus meeting minutes in `stakeholder_inputs/`; no automated `data-model.md` or `contracts/` artifacts per stakeholder promise; quickstart doc will describe the facilitation playbook for future increments.

## Context Budget & References

| Artifact / Stream | Target Lines / Tokens | Current Estimate | Evidence / Link |
|-------------------|----------------------|------------------|-----------------|
| spec.md | ≤400 lines | 210 lines | specs/001-capture-stakeholder-vision/spec.md |
| plan.md | ≤300 lines | 165 lines | specs/001-capture-stakeholder-vision/plan.md |
| tasks.md | ≤250 lines | TBD (post-plan) | specs/001-capture-stakeholder-vision/tasks.md |
| Short-term-memory notes | ≤40 lines/file | N/A (not needed yet) | N/A |
| External evidence store | per meeting | stakeholder_inputs/*.md | Stakeholder relations owner |

## Technical Context

**Language/Version**: C++17 (GSFD core) + Markdown/docs workflows for discovery outputs  
**Primary Dependencies**: Existing GSFD build system (CMake + Bazel experiments), internal doc style guide, stakeholder_inputs repository, Python tooling for log sanitizer prototype  
**Storage**: Git repo (`stakeholder_inputs/`, `reports/`), no new databases  
**Testing**: Process verification via checklists; spike tracker scripts verified with existing Python helper (if needed); log-sanitizer spike includes automated tests that run the winnowing + hash-based pinpoint rules against sample logs before/after.  
**Target Platform**: Linux dev environments where GSFD builds and documentation live  
**Project Type**: Core framework documentation & enablement (Tier 1 discovery)  
**Performance Goals**: Administrative—80% spike success within 48 hours, zero overdue decision briefs  
**Constraints**: 48-hour spike cap, lessons-summary + artifact checklist required, spike-count cap set by stakeholders (overrides spec-kit limits), suppress `data-model.md`/`contracts/` unless touching core APIs, log sanitizer must deliver assurance doc + hash-based rule file despite the hackathon-style timebox  
**Scale/Scope**: One discovery increment covering vision brief + prioritized spike backlog (expected 6–10 spikes, final count decided in kickoff)

### Spike Management Policy

- Canonical source lives at `.specify/memory/spike_management_policy.md` and applies to all future increments.  
- Mandated columns: `Spike ID`, `Hypothesis`, `Timebox`, `Priority`, `Status {proposed/speccing/implementing/success/failure}`, `Artifact Status {implementing/done/deleted}`, `Decision Link`.  
- Status transitions must be logged within one business day of the underlying approval decision (implicit or explicit).  
- Artifact lifecycle rules (implementing/done/deleted) dictate how long evidence remains in `reports/` or when it can be retired; waivers append to the memory doc.

## Constitution Check

| Field | Value |
|-------|-------|
| Risk Tier | Tier 1 |
| Gate Path | Standard Spec → Plan → Tasks |
| Mandatory Checklists | specs/001-capture-stakeholder-vision/checklists/requirements.md |
| Lightweight Waivers | (1) Skip `data-model.md` and `contracts/` per stakeholder directive; (2) No automated planning cap—stakeholder/delivery agreement supersedes template prompts. |
| Evidence Strategy | Vision brief checklist + sign-off log, spike tracker CSV in `reports/`, lessons summaries in `stakeholder_inputs/`, executive briefing distro list |
| Observability Commitments | Track spike timer start/stop, success rate dashboard, decision log referencing SC-001..SC-004 |
| Automation Gaps / Human Help Needed | Human-led workshops/interviews, executive brief reviews, stakeholder vote on spike-count cap |
| Waivers / SLA Adjustments | SC-001 10-business-day SLA waived by sponsors; requirement now states “before increment close” to reflect realistic reviewer availability. |

## Project Structure

### Documentation (this feature)

```text
specs/001-capture-stakeholder-vision/
├── spec.md               # Approved spec (already in place)
├── plan.md               # This document
├── research.md           # Will capture interview synthesis + spike prioritization heuristics (Phase 0)
├── quickstart.md         # Facilitation & spike-tracker playbook (Phase 1)
├── checklists/
│   └── requirements.md
└── reports/
    └── spike-tracker.csv (planned evidence, lives under repo root /reports/)
```

Per stakeholder promise, `data-model.md` and `contracts/` remain absent unless a future change involves coding GSFD core APIs.

### Source Code (repository root)

```text
src/
├── graph/
├── executor/
├── schedulers/
└── support/

include/gsfd/
├── graph/
├── executor/
└── diagnostics/

experiments/             # Disposable spike workspaces (log sanitizer, hello-world linkage)
reports/                 # Tracker CSV plus spike evidence folders (log sanitizer, C++ linkage)
stakeholder_inputs/       # Meeting notes, approvals, decisions
```

**Structure Decision**: Core GSFD targets remain untouched, but this increment intentionally provisions disposable spike workspaces under `experiments/` (e.g., `experiments/log-sanitizer/*`, `experiments/hello-world-lib/`) plus evidence folders under `reports/` (log-sanitizer findings, C++ linkage proof) to satisfy SC-005 and SC-006. These spikes may be retired or archived case by case once their artifacts are harvested; permanent runtime code changes stay out of scope for this discovery cycle, which is why long-lived documentation still resides in `specs/001-capture-stakeholder-vision/`, `reports/`, and `stakeholder_inputs/`.

## Complexity Tracking

| Violation | Why Needed | Simpler Alternative Rejected Because |
|-----------|------------|-------------------------------------|
| (none) | Current plan stays within Tier 1 guardrails | N/A |
