#!/bin/bash
set -ex

if [ "$#" -ne 0 ]; then
  echo "configure_opencv.sh does not accept positional arguments" >&2
  exit 1
fi

: "${OPENCV_SOURCE_DIR:?OPENCV_SOURCE_DIR must be set}"
: "${OPENCV_BUILD_DIR:?OPENCV_BUILD_DIR must be set}"
: "${OPENCV_INSTALL_DIR:?OPENCV_INSTALL_DIR must be set}"
: "${OPENCV_BUILD_LIST:?OPENCV_BUILD_LIST must be set}"

cmake -S "${OPENCV_SOURCE_DIR}" -B "${OPENCV_BUILD_DIR}" \
  -G "Unix Makefiles" \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_INSTALL_PREFIX="${OPENCV_INSTALL_DIR}" \
  -DBUILD_LIST="${OPENCV_BUILD_LIST}" \
  -DBUILD_SHARED_LIBS=OFF \
  -DBUILD_TESTS=OFF \
  -DBUILD_PERF_TESTS=OFF \
  -DBUILD_EXAMPLES=OFF \
  -DWITH_IPP=ON \
  -DWITH_TBB=ON \
  -DBUILD_JAVA=OFF \
  -DBUILD_opencv_python_tests=OFF \
  -DBUILD_opencv_python_bindings_generator=OFF \
  -DWITH_CUDA=OFF \
  -DCMAKE_CXX_STANDARD=17
