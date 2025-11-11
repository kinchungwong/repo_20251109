# Research: Project Vision & De-Risking Readiness

## Decision: Twin Spike Architecture for Stack Validation
- **Rationale**: Running a GSFD simulator that spawns Sobel workloads via `std::thread` alongside a client harness proves we can configure CMake + minimal OpenCV (core/imgproc/imgcodecs) on the 16C/32T workstation before iteration 1. This mirrors the stakeholder-approved workload without over-engineering a production runtime.
- **Alternatives Considered**:
  - *Single spike only*: rejected because it would not exercise producer/consumer hand-offs or validate handshakes between framework and client deliverables.
  - *Synthetic benchmarks*: rejected per stakeholder guidance (no meaningful workloads or benchmarking during this iteration).

## Decision: Compatibility List Instead of Formal Constraint Matrix
- **Rationale**: Documenting actual "tested-on" environments (OS image, compiler, preset, sanitizer flag) is lightweight enough for a mostly solo engineer yet produces verifiable evidence for downstream teams. It also satisfies FR-002 without demanding unavailable business metrics (budget, launch date).
- **Alternatives Considered**:
  - *Full charter-style matrix*: rejected because stakeholders are unavailable to fill business rows and it would slow the iteration without improving technical clarity.
  - *Ad-hoc verbal updates*: rejected because they are untraceable and violate Principle 7's single-source-of-truth expectation.

## Decision: Assurance Harness Coverage Strategy
- **Rationale**: Sanitizer builds (ASan + TSan), deterministic-vs-max parallel scheduler comparisons, and oversubscribed stress runs can all execute locally via CTest presets anchored in the spike repos. Fuzzing remains waived (toolchain gap), but feasibility notes will document any sanitizer or stress limitation discovered on the 16C/32T host.
- **Alternatives Considered**:
  - *Running fuzzers via third-party services*: rejected for this iteration because the toolchain and time budget do not support it.
  - *Skipping oversubscribed stress runs*: rejected due to Principle 5 (concurrency contracts) obligations; stress coverage is mandatory whenever task graphs fan out.

## Decision: Single Demo-Ready Briefing for Stakeholder Comms
- **Rationale**: Stakeholders prefer minimal engagement until spikes show promising results. Publishing one concise briefing (repo note or email) once the twin spikes succeed keeps Principle 3 satisfied without weekly status churn.
- **Alternatives Considered**:
  - *Weekly status reports*: rejected because they would consume solo engineering time without new information.
  - *Silence until code complete*: rejected because governance still needs evidence tying waivers and readiness artifacts together before iteration 1 begins.
