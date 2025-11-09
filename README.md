# repo_20251109

Simple C++ biphase task graph framework

This is a simple C++ task graph framework that uses distinct define/execute phases for CPU-bound tasks to
automatically discover and exploit opportunities for parallelization. By requiring a distinct graph definition
phase, a dependency graph (DAG) can be constructed, validated, and optimized before any tasks are executed.

The dependency graph is constructed from both implicit and explicit dependencies.

Implicit dependencies are inferred from data dependencies between tasks based on shared data access patterns.
All data exchanges are modelled; each piece of shared data has a single writer and multiple readers. When all
users of a piece of data have finished executing, the data is automatically freed.

Explicit dependencies are used to capture dependencies that cannot be inferred from data access patterns alone.
Additionally, extra explicit dependencies can be added to shape the concurrency characteristics of the task
graph at runtime, to correct for any imbalance.

This framework is not suitable for I/O-bound workloads, or workloads that depend on external locks or blocks
(those which can potentially cause a deadlock if timely acquisition is not guaranteed). It is primarily designed
for CPU-bound workloads where tasks can be executed in parallel without external dependencies. A typical use case
would be data processing pipelines, where each stage of the pipeline can be executed independently and in parallel.
