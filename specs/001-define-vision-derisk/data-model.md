# Data Model: Project Vision & De-Risking Readiness

## Entities

### VisionCharter
- **Fields**: `id`, `problem_statement`, `target_users`, `desired_outcomes`, `success_metrics`, `scope_boundaries`, `exclusions`, `approval_signoffs`, `supporting_links`.
- **Relationships**: References `ConstraintMatrix` entries for guardrails; links to `GovernanceWaiver` records when mandates are relaxed.
- **Validation Rules**: Must include at least one measurable success metric and two explicit exclusions before being marked "approved".

### ConstraintMatrixEntry
- **Fields**: `id`, `category` (business/technical/operational/compliance), `statement`, `owner`, `negotiability` (enum), `evidence_link`.
- **Relationships**: Aggregated into the Vision Charter appendix; referenced by `CompatibilityRun` when verifying technical constraints.
- **State**: `draft`, `validated`, `deferred`.

### CompatibilityRun
- **Fields**: `id`, `spike_name`, `os_image`, `compiler_version`, `cmake_preset`, `sanitizer_flags`, `timestamp`, `result`, `notes`.
- **Relationships**: Linked to `ExperimentEntry` records to show which test evidence produced the compatibility data.
- **Validation Rules**: Result must be one of `pass`, `fail`, or `blocked`; at least one run per spike each iteration.

### ExperimentEntry
- **Fields**: `id`, `hypothesis`, `steps`, `evidence_path`, `result`, `follow_up_owner`, `due_date`.
- **Relationships**: Tied to both `CompatibilityRun` (for stack validation) and `GovernanceWaiver` (if experiment justifies a waiver).
- **Lifecycle**: `planned` → `executing` → `complete` (with residual risk rating).

### GovernanceWaiver
- **Fields**: `id`, `mandated_check`, `rationale`, `compensating_control`, `approval_owner`, `reentry_criteria`, `status`.
- **Relationships**: References the specific ExperimentEntry providing evidence; surfaced in the Governance Addendum deliverable.
- **Validation Rules**: Only fuzzing can enter `status=accepted` this iteration; others must be `rejected` or `pending`.

### RiskNote
- **Fields**: `id`, `date_logged`, `description`, `impact`, `mitigation`, `status`.
- **Storage**: Lives in `checklists/risks.md`; limited to 2–3 concurrent entries.

### ReadinessChecklistItem
- **Fields**: `id`, `category` (access, tooling, monitoring, dependencies), `step`, `owner`, `status`.
- **Relationships**: References `Quickstart` steps for bootstrap order; once all items pass, the readiness checklist is approved.
