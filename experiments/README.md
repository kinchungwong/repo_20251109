# Experiments & Spikes

This directory holds temporary or semi-temporary work used for de-risking, stress-testing, or prototyping. Nothing under `experiments/` is considered production-ready; promote learnings into `src/`, `include/`, `cmake/`, or `third_party/` before shipping.

## Ground Rules

1. **Isolation**: Production targets must never include files from this directory. Treat it as a sand-boxed workspace.
2. **Naming**: Use ISO date prefixes to keep spikes chronological, e.g. `2025-11-opencv-mini` or `2025-12-env-preset`.
3. **Documentation**: Each spike MUST include a `README.md` that states its purpose, entry points, and cleanup expectations.
4. **CMake Usage**: Spikes may define their own `CMakeLists.txt` and presets without affecting the root build; prefer FetchContent or local downloads instead of adding huge submodules.
5. **Outputs**: Put large build artifacts inside per-spike `build/`, `downloads/`, or `install/` folders that are gitignored.
6. **Cleanup**: Delete the spike folder (or archive it) once the learning is captured elsewhere. Keep history concise.

## Typical Layout

```
experiments/
  README.md
  .gitignore
  2025-11-opencv-mini/
    README.md
    CMakeLists.txt
    cmake/
    data/
    build/        # gitignored
    downloads/    # gitignored
```

Feel free to add more spikes as needed. If an experiment grows large, document how to reproduce it on a fresh machine so others can re-run the stress tests.
