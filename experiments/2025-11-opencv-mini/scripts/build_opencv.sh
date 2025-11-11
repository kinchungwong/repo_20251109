#!/bin/bash
set -ex

if [ "$#" -ne 0 ]; then
  echo "build_opencv.sh does not accept positional arguments" >&2
  exit 1
fi

: "${OPENCV_BUILD_DIR:?OPENCV_BUILD_DIR must be set}"
: "${OPENCV_BUILD_TARGET:?OPENCV_BUILD_TARGET must be set}"

cmake --build "${OPENCV_BUILD_DIR}" --target "${OPENCV_BUILD_TARGET}"
