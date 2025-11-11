#!/bin/bash
set -ex

if [ "$#" -ne 0 ]; then
  echo "download_opencv.sh does not accept positional arguments" >&2
  exit 1
fi

: "${OPENCV_VERSION:?OPENCV_VERSION must be set}"
: "${OPENCV_URL:?OPENCV_URL must be set}"
: "${OPENCV_DOWNLOAD_DIR:?OPENCV_DOWNLOAD_DIR must be set}"
: "${OPENCV_SOURCE_DIR:?OPENCV_SOURCE_DIR must be set}"

mkdir -p "${OPENCV_DOWNLOAD_DIR}"

archive_path="${OPENCV_DOWNLOAD_DIR}/opencv-${OPENCV_VERSION}.tar.gz"

if [ ! -f "${archive_path}" ]; then
  curl -L "${OPENCV_URL}" -o "${archive_path}"
fi

rm -rf "${OPENCV_SOURCE_DIR}"
mkdir -p "${OPENCV_SOURCE_DIR}"

tar -xzf "${archive_path}" --strip-components=1 -C "${OPENCV_SOURCE_DIR}"
