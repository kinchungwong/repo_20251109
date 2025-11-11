# 2025-11 OpenCV Mini Build Spike

Goal: validate that we can build a minimal, redistributable OpenCV subset (core/imgproc/imgcodecs by default) using only the modules required for the current CPU-oriented flowgraph experiments. This spike intentionally lives outside production code so we can iterate on toolchains, module mixes, and stress testing without polluting the main project tree.

## How to Use

1. Ensure CMake ≥3.20 and GCC/Clang with C++17 support are installed.
2. Configure using presets or manual commands (examples below) to generate Unix Makefiles under `build/`.
3. Run `cmake --build` to produce a stripped OpenCV install inside `install/`.
4. Point downstream experiments at `install/` (via `OpenCV_DIR` or pkg-config) to consume the mini build.
5. Optional: use the helper scripts in `scripts/` (`download_opencv.sh`, `configure_opencv.sh`, `build_opencv.sh`) directly by exporting the documented environment variables when you want to inspect each phase outside of CMake.

## Configuring

```bash
cmake -S . -B build/minimal -G "Unix Makefiles"
cmake --build build/minimal -j
```

Key cache options:

- `-DOPENCV_VERSION=4.10.0` (override to align with prod)
- `-DOPENCV_BUILD_LIST_DEFAULT=core,imgproc,imgcodecs` (expand as needed)
- `-DOPENCV_CUSTOM_BUILD_LIST=core,imgproc,imgcodecs,videoio` (fully override)
- `-DOPENCV_INSTALL_DIR=/abs/path/to/install`

Add extra modules later by editing `OPENCV_BUILD_LIST_DEFAULT` or setting `OPENCV_CUSTOM_BUILD_LIST` when configuring. The ExternalProject invocation forwards `BUILD_LIST` directly into the upstream OpenCV build so only requested modules compile. To run individual phases manually (e.g., inspect configure-time warnings), export the required variables and invoke the scripts directly:

```bash
export OPENCV_VERSION=4.10.0
export OPENCV_URL=https://github.com/opencv/opencv/archive/refs/tags/${OPENCV_VERSION}.tar.gz
export OPENCV_DOWNLOAD_DIR=$PWD/build/downloads
export OPENCV_SOURCE_DIR=$PWD/build/src
export OPENCV_BUILD_DIR=$PWD/build/out
export OPENCV_INSTALL_DIR=$PWD/install/manual
export OPENCV_BUILD_LIST=core,imgproc,imgcodecs,videoio

./scripts/download_opencv.sh
./scripts/configure_opencv.sh
./scripts/build_opencv.sh
```

## Outputs

- `downloads/`: cached tarballs (gitignored)
- `build/`: OpenCV’s internal build directory (gitignored)
- `install/`: ready-to-link OpenCV subset for other spikes (gitignored)

## Next Steps

- Stress-test the resulting libraries using representative CPU-saturating workloads.
- Capture benchmark data and compatibility findings back into `reports/` or the relevant spec.
- Once the approach is validated, promote reusable build logic into `cmake/` or tooling scripts outside `experiments/`.
