# Quickstart: Project Vision & De-Risking Readiness

## 1. Prerequisites
- Linux workstation with ≥16 cores / 32 threads, 32 GB RAM.
- GCC 12.x toolchain (Clang optional later).
- CMake ≥3.24, Ninja, Python 3 for helper scripts.
- OpenCV build deps (libjpeg, libpng, tiff, etc.).

## 2. Fetch Experiments & Spikes
```bash
cd repo_20251109
cmake --preset host-release
```
- Use the existing `experiments/2025-11-opencv-mini` preset to build minimal OpenCV modules shared by both spikes.

## 3. Run the GSFD Simulator Spike
```bash
cd spikes/gsfd_simulator
cmake --preset host-sanitized
cmake --build --preset host-sanitized
ctest --preset host-sanitized
```
- Produces Sobel outputs across std::thread fan-out and stores logs under `reports/experiments/spikes/gsfd_simulator`.

## 4. Run the Client Spike
```bash
cd spikes/gsfd_client
cmake --preset host-release
cmake --build --preset host-release
./bin/gsfd_client --input ../fixtures/lenna.png --mode sobel
```
- Confirms the client consumes the simulator deliverable artifacts.

## 5. Capture Compatibility & Assurance Evidence
- Append entries to `specs/001-define-vision-derisk/compatibility.md` (created during FR-002 work) for each preset.
- Record sanitizer and scheduler comparison commands plus outcomes in `reports/experiments/assurance/` (referenced by the plan’s evidence strategy).

## 6. Governance Briefing Trigger
- Once both spikes pass ASan/TSan + stress runs and compatibility list has ≥2 environments, publish the single briefing (spec.md FR-007) summarizing:
  - Charter + constraint highlights
  - Verified compatibility table
  - Assurance feasibility notes (including any blocked coverage)
  - Residual risks + mitigation owners
