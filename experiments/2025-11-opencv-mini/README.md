# 2025-11 OpenCV Mini Build Spike

Goal: validate that we can build a minimal, redistributable OpenCV subset (core/imgproc/imgcodecs by default) using only the modules required for the current CPU-oriented flowgraph experiments. This spike intentionally lives outside production code so we can iterate on toolchains, module mixes, and stress testing without polluting the main project tree.

## Quick Start (human verified)

1. Ensure CMake ≥3.20 and GCC/Clang with C++17 support are installed.
2. From this directory run `./launch_opencv_build.sh`.
    * The script sets the vetted environment, and
    * Streams the nested script output with `tee`, and
    * Stores logs under `term_logs/<date>/`.
3. Finished artifacts land in `install/manual`.
4. Downstream spikes can consume them by setting `OpenCV_DIR=<this path>/lib/cmake/opencv4`.

`launch_opencv_build.sh` has been executed and validated by a human; review the script for the exact variables if you need to tweak versions or modules.

## Using CMake Presets

If you prefer to stay within raw CMake tooling:

```bash
cmake --preset default
cmake --build --preset default --target opencv-mini-configure   # configure only
cmake --build --preset default --target opencv-mini-build       # build+install
```

Key cache knobs (set via `cmake --preset` or `cmake -S . -B build/custom -D...`):

- `OPENCV_VERSION` – defaults to 4.10.0 in presets; adjust to mirror target deployments.
- `OPENCV_BUILD_LIST_DEFAULT` – modules included when no custom list is provided.
- `OPENCV_CUSTOM_BUILD_LIST` – full override (comma-separated, e.g., `core,imgproc,imgcodecs,videoio`).
- `OPENCV_INSTALL_DIR` – destination that downstream experiments will consume.

Presets forward the module list directly into OpenCV’s `BUILD_LIST`, so only requested components are compiled.

## Manual Phase Control

For diagnostics or custom orchestration, reuse the helper scripts without re-defining the logic here:

1. Export the same variables used by `launch_opencv_build.sh` (open the script to copy the block).
2. Run `./scripts/download_opencv.sh`, `./scripts/configure_opencv.sh`, `./scripts/dump_opencv_cmake_opts.sh` (optional), and `OPENCV_BUILD_TARGET=install ./scripts/build_opencv.sh`.

Each script enforces zero positional arguments, requires its environment upfront, and runs with `set -ex` so configure-only warnings are easy to inspect.

## Outputs

- `downloads/` and `build/downloads`: cached tarballs
- `build/`: OpenCV’s internal build directory
- `install/`: ready-to-link OpenCV subset for other spikes
- `term_logs/<date>/`: full terminal logs for each run, on the local machine

All these outputs are git-ignored.

Content of `term_logs/` contain security-sensitive side channel information; must not be shared or shipped into reports without redaction.

## Next Steps

- Stress-test the resulting libraries using representative CPU-saturating workloads.
- Capture benchmark data and compatibility findings back into `reports/` or the relevant spec.
- Once the approach is validated, promote reusable build logic into `cmake/` or tooling scripts outside `experiments/`.
