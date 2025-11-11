• Afterthoughts / Retro

  - Plan: The goal was clear—build an isolated OpenCV mini environment and capture stakeholder context for future spikes. Having the experiments playbook plus a vetted launch script kept
    scope constrained while still forward-looking (e.g., stressing high-core setups, modular OpenCV builds).
  - Do: We layered the experiments foundation, scripted reproducible build phases, and validated the default path with launch_opencv_build.sh. README now anchors on that proven flow, with
    manual/preset sections for power users.
  - Check: The CMake ExternalProject now defers to small scripts, making it easy to inspect configure-only warnings or run phases independently. The README points to the single source of
    truth for environment variables, reducing doc drift. Stakeholder context lives in short-term memory, so future iterations won’t lose the constraints.
  - Act (improvements for next spike):
      1. Codify a lightweight “verification template” for new experiments so they automatically reference the mini build and report success/fail in a consistent way.
      2. Add a smoke test target that links against the installed OpenCV subset, proving ABI compatibility before other spikes rely on it.
      3. Capture a brief “operator checklist” next to the launch script (e.g., expected runtime, disk usage) to predict resource needs when running on different machines.

  This sets us up to spin up the second spike quickly and validate the mini build under real workload scenarios.
