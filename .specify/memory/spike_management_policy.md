# Spike Management Policy

**Version**: 2025-11-11 | **Applies To**: All GSFD increments that schedule, execute, or archive stack spikes

> This policy is the durable interpretation of FR-007 for the “Stakeholder Vision & Stack Spikes” increment and SHALL persist in `.specify/memory/` so future iterations inherit the same lifecycle.

## Lifecycle & Required Columns

Every spike row recorded in `specs/001-capture-stakeholder-vision/spike-backlog.md` and `reports/spike-tracker.csv` MUST include:

| Column | Required Content |
|--------|------------------|
| `Spike ID` | Stable identifier (e.g., `SPK-001`). |
| `Hypothesis` | Crisp statement of the assumption being tested. |
| `Timebox` | Max duration (≤48h) plus planned start/finish timestamps once scheduled. |
| `Priority` | Current ranking driver and owner who set it. |
| `Status` | Enum: `proposed`, `speccing`, `implementing`, `success`, `failure`. |
| `Artifact Status` | Enum: `implementing`, `done`, `deleted` (tracks evidence availability). |
| `Decision Link` | Pointer to the note/brief approving the latest status change. |

## Lifecycle Rules

1. **Intake** – A spike enters the backlog only after the facilitator and responsible stakeholder/tech lead agree on the hypothesis and desired evidence. Log the meeting or async decision link in the `Decision Link` column.
2. **Approval** – Moving from `proposed` → `speccing` represents implicit approval to spend discovery time. Capture the approving role initials + date inside the `Decision Link` note.
3. **Prioritization** – Priority values are updated whenever the stakeholder-owned cap shifts; changes must be reflected within one business day of the decision.
4. **Implementation** – Transition to `implementing` when hands-on work starts; stay in that state ≤48 hours. At close, set `success` or `failure` and summarize lessons in the linked evidence file.
5. **Artifact Lifecycle** – Mark `Artifact Status` as `implementing` while evidence is being captured, `done` when artifacts are stored under `reports/` (or equivalent), and `deleted` if artifacts are intentionally retired (include rationale in the linked decision note).

## Governance

- The policy applies across increments; feature teams may extend columns but SHALL NOT remove or rename the mandated ones without amending this document.
- Any tooling (scripts, dashboards) that touch spike data must respect the status enums defined above.
- Deviations (e.g., emergency spikes) require a short waiver entry appended to this file with owner + expiry date.
