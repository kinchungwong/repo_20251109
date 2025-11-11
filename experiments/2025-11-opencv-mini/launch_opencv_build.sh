#!/bin/bash
set -ex

CURDIR=${PWD}
export OPENCV_VERSION=4.12.0
export OPENCV_URL=https://github.com/opencv/opencv/archive/refs/tags/${OPENCV_VERSION}.tar.gz
export OPENCV_DOWNLOAD_DIR="${CURDIR}/build/downloads"
export OPENCV_SOURCE_DIR="${CURDIR}/build/src"
export OPENCV_BUILD_DIR="${CURDIR}/build/out"
export OPENCV_INSTALL_DIR="${CURDIR}/install/manual"
export OPENCV_BUILD_LIST=core,imgproc,imgcodecs,videoio

TIMESTAMP=$(TZ=':America/Los_Angeles' date '+%Y-%m-%d_%H%M')
DATESTAMP="${TIMESTAMP:0:10}"
LOGDIR="./term_logs/${DATESTAMP}"
LOGFILE="${LOGDIR}/${TIMESTAMP}_opencv_build.log"
mkdir -p "${LOGDIR}"

export CLICOLOR_FORCE=1 # force colored output in logs

echo "Logging OpenCV build to ${LOGFILE}"

./scripts/download_opencv.sh 2>&1 | tee -a "${LOGFILE}"

./scripts/configure_opencv.sh 2>&1 | tee -a "${LOGFILE}"

./scripts/dump_opencv_cmake_opts.sh 2>&1 | tee -a "${LOGFILE}"

OPENCV_BUILD_TARGET=install ./scripts/build_opencv.sh 2>&1 | tee -a "${LOGFILE}"
