#!/bin/bash
set -ex

if [ "$#" -ne 0 ]; then
  echo "dump_opencv_cmake_opts.sh does not accept positional arguments" >&2
  exit 1
fi

: "${OPENCV_BUILD_DIR:?OPENCV_BUILD_DIR must be set}"

test -d "${OPENCV_BUILD_DIR}" || {
  echo "Error: OPENCV_BUILD_DIR '${OPENCV_BUILD_DIR}' does not exist or is not a directory" >&2
  exit 1
}

# cmake --system-information="${OPENCV_BUILD_DIR}/opencv_cmake_system_info.txt" -B "${OPENCV_BUILD_DIR}"

(
  cd "${OPENCV_BUILD_DIR}"
  cmake --system-information
  cmake -LAH . 
)
