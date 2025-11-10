# Concurrency Responsibility Catalogue

**TL;DR** — GSFD’s thread-safety guarantees come from layered ownership: Graph/Validator admit only legal dependency graphs, Executor upholds scheduling guarantees while exposing lock-free observability, DataHandle/VarData enforce safe data access, and task authors attach workloads that respect those contracts. This note summarizes expectations so specs, plans, and tasks can cite them without re-explaining internals.

## Layered Contracts

### Graph & Validator
- Maintain canonical representation of steps, resources, and dependencies.
- Run union-find and Kahn-style validations before any execution request; reject graphs that would violate exclusivity, fan-out, or lifecycle invariants.
- Emit clear diagnostics so task authors can fix structural issues without poking into Executor internals.

### Executor
- Schedule admitted graphs according to the validated topology, guaranteeing no double-execution or unsafe parallel fan-out.
- Offer deterministic scheduling modes to compare against maximally parallel runs for debugging or regressions.
- Provide the lock-free observability poll so external workloads can track progress/timing without injecting synchronization hazards.
- Record any mitigation applied when task authors violate contracts (e.g., forced serialization).

### DataHandle & VarData
- Enforce GSFD’s access rules for steps by guarding reads/writes through typed handles.
- VarData manages the type-erased container so framework code can transport payloads safely while still honoring static guarantees.
- Surface misuse (type mismatches, illegal aliasing) as deterministic errors rather than undefined behavior.

### Task Authors (External Workloads)
- Supply tasks that respect the ownership model (no out-of-band shared state without declared synchronization).
- Use the observability poll for monitoring instead of instrumenting internal state.
- Document any additional synchronization they own inside their specs so Validator/Executor assumptions remain valid.

## Validation Techniques

- **Deterministic scheduler comparisons**: run both deterministic and maximally parallel modes to ensure identical observable results.
- **Oversubscribed stress harnesses**: execute large graphs with thread counts above hardware concurrency (via test-only switches) to expose latent races.
- **Sanitizer matrix**: run AddressSanitizer, ThreadSanitizer, and UBSan where supported; capture logs per Principle 6.
- **Hazard analyses**: lock-order or aliasing reviews for new ownership transfers.
- **Fuzzer limitation**: g++ 14.2.0 lacks native fuzzing support; until tooling improves, deterministic + stress coverage stands in for fuzz obligations (see Constitution Principle 6).

This catalogue is a living document; update it whenever core responsibilities shift or new validation techniques are adopted.
