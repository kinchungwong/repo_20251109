# Tasks: Stakeholder Vision and Stack Spikes

**Input**: Design documents from `/specs/001-capture-stakeholder-vision/`  
**Prerequisites**: `plan.md`, `spec.md`, `research.md`, `checklists/requirements.md`, `reports/spike-tracker.csv`  
**Tests**: Tier 1 discovery—evidence tasks focus on checklists, spike trackers, and briefing artifacts rather than automated harnesses.  
**Organization**: Tasks are grouped by user story so each story remains independently testable.

## Context Budget & Evidence Hooks

| Artifact / Stream | Target Lines / Tokens | Current Estimate | Evidence / Link |
|-------------------|----------------------|------------------|-----------------|
| tasks.md | ≤250 lines | 220 lines | specs/001-capture-stakeholder-vision/tasks.md |
| Story-level logs | per spike completion | stakeholder_inputs/digests/ | Facilitator posts close-out notes + decision links |
| Short-term-memory notes | ≤40 lines/file | N/A (use research.md) | Retire notes once merged into spec/plan |

## Format: `[ID] [P?] [Story] Description`

- `[P]` marks tasks that can run in parallel (no shared files or dependencies).
- `[US#]` labels tasks tied to a user story; setup/foundational/polish tasks omit the label.
- Every description names at least one concrete file path.

## Path Conventions

- Feature docs: `specs/001-capture-stakeholder-vision/`
- Evidence trackers: `reports/`
- Stakeholder notes & briefs: `stakeholder_inputs/`
- Spike experiments: `experiments/` or `reports/<spike-name>/`

---

## Phase 1: Setup (Shared Infrastructure)

**Purpose**: Initialize documentation and evidence scaffolding referenced across all stories.

- [ ] T001 Initialize spike tracker headers (Spike ID, Hypothesis, Timebox, Priority, Status {proposed/speccing/implementing/success/failure}, Artifact Status {implementing/done/aborted/deleted}, Decision Link) in `reports/spike-tracker.csv`.
- [ ] T002 [P] Draft the facilitation & spike-ops outline in `specs/001-capture-stakeholder-vision/quickstart.md`, referencing and, if needed, updating `.specify/memory/spike_management_policy.md`.
- [ ] T003 [P] Create the stakeholder intake note template in `stakeholder_inputs/templates/intake-session.md`.

---

## Phase 2: Foundational (Blocking Prerequisites)

**Purpose**: Prepare canonical artifacts (vision brief template, spike backlog, research heuristics) required before story work.

**⚠️ CRITICAL**: Complete this phase before any user story work.

- [ ] T004 Scaffold `specs/001-capture-stakeholder-vision/vision-brief.md` with sections for Goals, Target Users, Constraints, Success Measures, Decisions, and Sign-offs.
- [ ] T005 [P] Seed `specs/001-capture-stakeholder-vision/spike-backlog.md` with columns mirroring the tracker (Spike ID, Hypothesis, Timebox, Priority, Status, Artifact Status) plus brief guidance on how each field is maintained iteration over iteration.
- [ ] T006 [P] Document interview roster, question bank, and spike ranking heuristics inside `specs/001-capture-stakeholder-vision/research.md`.
- [ ] T007 [P] Add 48-hour timer workflow and evidence drop-zone instructions to `specs/001-capture-stakeholder-vision/quickstart.md`.

**Checkpoint**: Vision brief + spike backlog templates ready; research heuristics published; teams can begin story work.

---

## Phase 3: User Story 1 – Capture Shared Vision (Priority: P1) 🎯 MVP

**Goal**: Produce a single, structured vision brief capturing stakeholder inputs, trade-offs, and approvals.  
**Independent Test**: Run the requirements checklist against `vision-brief.md`; confirm 100% stakeholder sign-off (SC-001).

### Implementation for User Story 1

- [ ] T008 [US1] Aggregate all sponsor and stakeholder intake responses into `specs/001-capture-stakeholder-vision/vision-brief.md#Stakeholder-Inputs` using the template sections.
- [ ] T009 [P] [US1] Document conflicting objectives, trade-offs, and assigned risk owners within `specs/001-capture-stakeholder-vision/vision-brief.md#Decisions`.
- [ ] T010 [US1] Capture approvals/dissent per section and update the sign-off log in `specs/001-capture-stakeholder-vision/vision-brief.md#Approvals`.
- [ ] T011 [US1] Execute the structured intake checklist in `specs/001-capture-stakeholder-vision/checklists/requirements.md`, linking results back to the finalized `vision-brief.md`.

**Checkpoint**: Vision brief is complete, auditable, and approved—unblocks spike prioritization.

---

## Phase 4: User Story 2 – Prioritize Stack Spikes (Priority: P2)

**Goal**: Translate risks into a ranked backlog of ≤48-hour spikes with hypotheses, success signals, and owners; execute mandated spikes (log sanitizer, hello-world linkage demo).  
**Independent Test**: `spike-backlog.md` lists each spike with hypothesis/metrics/owner, and `reports/spike-tracker.csv` shows schedule + completion data that supports ≥80% success rate and SC-004/SC-005/SC-006 outputs.

### Implementation for User Story 2

- [ ] T012 [US2] Enumerate all spike candidates with hypotheses, measurable exit criteria, and owner assignments inside `specs/001-capture-stakeholder-vision/spike-backlog.md`.
- [ ] T013 [P] [US2] Record prioritization rationale (impact, urgency, dependencies) for every spike row within `specs/001-capture-stakeholder-vision/spike-backlog.md`.
- [ ] T014 [US2] Sync the backlog into `reports/spike-tracker.csv`, including planned start/end timestamps and evidence links for each spike.
- [ ] T015 [P] [US2] Run the log-sanitizer spike, capturing tool experiments, sanitized sample logs, and go/no-go recommendation in `reports/log-sanitizer-spike/README.md`.
- [ ] T016 [P] [US2] Update `specs/001-capture-stakeholder-vision/research.md#Log-Sanitizer` with sanitizer findings, reusable artifacts, and backlog decision references (supports SC-005).
- [ ] T017 [US2] Build the “hello world” sample library under `experiments/hello-world-lib/` with CMake presets producing both `.a` and `.so` outputs (toggle via build switch).
- [ ] T018 [P] [US2] Document consumer linkage proof (build steps, static/shared linkage logs) inside `reports/hello-world-lib/README.md` and link it from `spike-backlog.md` (supports SC-006).
- [ ] T019 [US2] Update `reports/spike-tracker.csv` post-execution with the policy-mandated columns (status, artifact status, decision link), success metric data, lessons summaries, and artifact links to maintain the ≥80% spike success metric (SC-002, SC-004, FR-007).

**Checkpoint**: Ranked spike backlog plus mandated spikes complete; evidence ready for communications.

---

## Phase 5: User Story 3 – Share Decisions & Learnings (Priority: P3)

**Goal**: Deliver timely digests and spike close-out briefs that tie outcomes to vision goals and flag new decisions within two working days.  
**Independent Test**: For a simulated spike completion, verify `stakeholder_inputs/digests/` contains the briefing within SLA, references SC-001..SC-004 metrics, and logs approvals/no-protests.

### Implementation for User Story 3

- [ ] T020 [US3] Define the communication cadence (weekly digest + spike close-out briefs) and SLAs inside `specs/001-capture-stakeholder-vision/quickstart.md#Communication-Cadence`.
- [ ] T021 [P] [US3] Create the spike briefing template in `stakeholder_inputs/templates/spike-brief.md`, referencing required fields (hypothesis result, blockers, requests).
- [ ] T022 [US3] Publish learning summaries and decision impacts for each spike in date-stamped files under `stakeholder_inputs/digests/`.
- [ ] T023 [P] [US3] Maintain the backlog decision log in `specs/001-capture-stakeholder-vision/vision-brief.md#Decision-Log`, ensuring ≥95% of completed spikes map to approved backlog entries (SC-004).
- [ ] T024 [US3] Produce the iteration wrap-up executive brief tying outcomes to vision goals and capturing “no protest” confirmation in `stakeholder_inputs/briefings/iteration-close.md` (supports SC-003).

**Checkpoint**: Stakeholders receive timely, actionable communications; continuation confidence documented.

---

## Phase 6: Polish & Cross-Cutting Concerns

**Purpose**: Cross-story refinements, documentation hygiene, and archival tasks.

- [ ] T025 Reconcile cross-links in `spec.md` and `plan.md` so new artifacts (`vision-brief.md`, `spike-backlog.md`, trackers) are referenced in Context Budgets.
- [ ] T026 [P] Curate a final evidence index in `specs/001-capture-stakeholder-vision/research.md#Evidence-Index`, pointing to sanitized logs, trackers, and briefings.
- [ ] T027 [P] Capture retro notes and next-iteration recommendations in `stakeholder_inputs/digests/retro.md`, highlighting deferred IPC spike planning.

---

## Dependencies & Execution Order

- **Setup → Foundational**: Phase 1 must finish before templates and research prep in Phase 2.  
- **Foundational → User Stories**: All user stories depend on the templated artifacts, spike backlog skeleton, and quickstart updates from Phase 2.  
- **User Story Order**: Default sequencing is US1 → US2 → US3, but US2 may start once the vision brief template (T004) is ready if intake scheduling overlaps.  
- **Mandated Spikes**: T015–T019 depend on spike definitions (T012–T014) and share resources with US3 communications.

## Parallel Execution Opportunities

- Phase 1: T002 and T003 run in parallel after T001 seeds the tracker.  
- Phase 2: T005–T007 can proceed concurrently once T004 establishes the shared template.  
- US1: T009 can occur alongside T008 when multiple facilitators review different sections.  
- US2: T015/T016 (log-sanitizer) and T017/T018 (C++ library) can operate in parallel teams after T014 syncs scheduling.  
- US3: T021–T023 can overlap once the communication cadence (T020) is defined.

## Implementation Strategy

1. **MVP**: Deliver US1 end-to-end (T008–T011) so planning has a ratified vision brief.  
2. **Increment 2**: Execute US2 spikes, prioritizing mandated log-sanitizer and hello-world linkage experiments plus tracker updates.  
3. **Increment 3**: Roll out US3 communications, ensuring decision logs and executive briefs make spike outcomes consumable.  
4. **Final Polish**: Close documentation gaps and archive evidence for future increments.
