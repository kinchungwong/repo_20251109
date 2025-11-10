# Implementation Plan: [FEATURE]

**Branch**: `[###-feature-name]` | **Date**: [DATE] | **Spec**: [link]
**Input**: Feature specification from `/specs/[###-feature-name]/spec.md`

**Note**: This template is filled in by the `/speckit.plan` command (see `.specify/scripts/bash/setup-plan.sh`). Command reference docs will live under `.specify/templates/commands/` once published.

## Summary

[Extract from feature spec: primary requirement + technical approach from research]

## TL;DR (≤200 words)

[Concise summary that an agent can reload without re-reading the entire plan. Link to short-term-memory digest if more detail exists.]

## Context Budget & References

| Artifact / Stream | Target Lines / Tokens | Current Estimate | Evidence / Link |
|-------------------|----------------------|------------------|-----------------|
| spec.md | [e.g., ≤400 lines] | [estimate] | [link] |
| plan.md | [e.g., ≤300 lines] | [estimate] | [link] |
| tasks.md | [e.g., ≤250 lines] | [estimate] | [link] |
| Short-term-memory notes | [≤40 lines per file] | [link or N/A] | [todo file path] |
| External evidence store | [log size or artifact] | [link] | [location/owner] |

## Technical Context

<!--
  ACTION REQUIRED: Replace the content in this section with the technical details
  for the project. The structure here is presented in advisory capacity to guide
  the iteration process.
-->

**Language/Version**: [e.g., Python 3.11, Swift 5.9, Rust 1.75 or NEEDS CLARIFICATION]  
**Primary Dependencies**: [e.g., FastAPI, UIKit, LLVM or NEEDS CLARIFICATION]  
**Storage**: [if applicable, e.g., PostgreSQL, CoreData, files or N/A]  
**Testing**: [e.g., pytest, XCTest, cargo test or NEEDS CLARIFICATION]  
**Target Platform**: [e.g., Linux server, iOS 15+, WASM or NEEDS CLARIFICATION]
**Project Type**: [single/web/mobile - determines source structure]  
**Performance Goals**: [domain-specific, e.g., 1000 req/s, 10k lines/sec, 60 fps or NEEDS CLARIFICATION]  
**Constraints**: [domain-specific, e.g., <200ms p95, <100MB memory, offline-capable or NEEDS CLARIFICATION]  
**Scale/Scope**: [domain-specific, e.g., 10k users, 1M LOC, 50 screens or NEEDS CLARIFICATION]

## Constitution Check

*Record the gate chosen for this increment; Tier 2 fast-paths still require justification.*

| Field | Value |
|-------|-------|
| Risk Tier | [Tier 0 / Tier 1 / Tier 2] |
| Gate Path | [Standard Spec → Plan → Tasks / Tier 2 Fast-Path] |
| Mandatory Checklists | [link(s) or N/A] |
| Lightweight Waivers | [if any gates skipped, explain in ≤3 lines] |
| Evidence Strategy | [commands + log destinations per Principle 6] |
| Observability Commitments | [metrics/logging decided up front] |
| Automation Gaps / Human Help Needed | [describe commands requiring humans + link to TODO] |

[Gates determined based on constitution file]

## Project Structure

### Documentation (this feature)

> Create optional files only when the risk tier mandates them; otherwise cite the short-term-memory digest that stores exploratory reasoning.

```text
specs/[###-feature]/
├── plan.md              # This file (/speckit.plan command output)
├── research.md          # Phase 0 output (/speckit.plan command)
├── data-model.md        # Phase 1 output (/speckit.plan command)
├── quickstart.md        # Phase 1 output (/speckit.plan command)
├── contracts/           # Phase 1 output (/speckit.plan command)
└── tasks.md             # Phase 2 output (/speckit.tasks command - NOT created by /speckit.plan)
```

### Source Code (repository root)
<!--
  ACTION REQUIRED: Replace the placeholder tree below with the concrete layout
  for this feature. Delete unused options and expand the chosen structure with
  real paths (e.g., apps/admin, packages/something). The delivered plan must
  not include Option labels.
-->

```text
# [REMOVE IF UNUSED] Option 1: Single project (DEFAULT)
src/
├── models/
├── services/
├── cli/
└── lib/

tests/
├── contract/
├── integration/
└── unit/

# [REMOVE IF UNUSED] Option 2: Web application (when "frontend" + "backend" detected)
backend/
├── src/
│   ├── models/
│   ├── services/
│   └── api/
└── tests/

frontend/
├── src/
│   ├── components/
│   ├── pages/
│   └── services/
└── tests/

# [REMOVE IF UNUSED] Option 3: Mobile + API (when "iOS/Android" detected)
api/
└── [same as backend above]

ios/ or android/
└── [platform-specific structure: feature modules, UI flows, platform tests]
```

**Structure Decision**: [Document the selected structure and reference the real
directories captured above]

## Complexity Tracking

> **Fill ONLY if Constitution Check has violations that must be justified**

| Violation | Why Needed | Simpler Alternative Rejected Because |
|-----------|------------|-------------------------------------|
| [e.g., 4th project] | [current need] | [why 3 projects insufficient] |
| [e.g., Repository pattern] | [specific problem] | [why direct DB access insufficient] |
