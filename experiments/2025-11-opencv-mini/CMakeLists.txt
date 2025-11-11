cmake_minimum_required(VERSION 3.20)
project(opencv-mini-build LANGUAGES C CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

include(ExternalProject)

set(OPENCV_VERSION "4.10.0" CACHE STRING "OpenCV version to fetch and build")
set(OPENCV_ENABLE_CONTRIB OFF CACHE BOOL "Enable OpenCV contrib repository (adds download time)")
set(OPENCV_BUILD_LIST_DEFAULT "core,imgproc,imgcodecs" CACHE STRING "Default module list; override BUILD_LIST cache entry to expand")
set(OPENCV_CUSTOM_BUILD_LIST "" CACHE STRING "Explicit BUILD_LIST override; leave empty to use OPENCV_BUILD_LIST_DEFAULT")

if(OPENCV_CUSTOM_BUILD_LIST)
    set(_opencv_build_list "${OPENCV_CUSTOM_BUILD_LIST}")
else()
    set(_opencv_build_list "${OPENCV_BUILD_LIST_DEFAULT}")
endif()

set(OPENCV_DOWNLOAD_DIR ${CMAKE_BINARY_DIR}/downloads CACHE PATH "Where to store downloaded archives")
set(OPENCV_INSTALL_DIR ${CMAKE_BINARY_DIR}/install CACHE PATH "Where to install the minimal build")

set(OPENCV_SOURCE_DIR ${CMAKE_BINARY_DIR}/opencv-mini/src)
set(OPENCV_BINARY_DIR ${CMAKE_BINARY_DIR}/opencv-mini/build)
set(OPENCV_SCRIPTS_DIR ${CMAKE_CURRENT_SOURCE_DIR}/scripts)

ExternalProject_Add(opencv-mini
    PREFIX ${CMAKE_BINARY_DIR}/opencv-mini
    SOURCE_DIR ${OPENCV_SOURCE_DIR}
    BINARY_DIR ${OPENCV_BINARY_DIR}
    DOWNLOAD_COMMAND
        ${CMAKE_COMMAND} -E env
            OPENCV_VERSION=${OPENCV_VERSION}
            OPENCV_URL=https://github.com/opencv/opencv/archive/refs/tags/${OPENCV_VERSION}.tar.gz
            OPENCV_DOWNLOAD_DIR=${OPENCV_DOWNLOAD_DIR}
            OPENCV_SOURCE_DIR=${OPENCV_SOURCE_DIR}
            ${OPENCV_SCRIPTS_DIR}/download_opencv.sh
    CONFIGURE_COMMAND
        ${CMAKE_COMMAND} -E env
            OPENCV_SOURCE_DIR=${OPENCV_SOURCE_DIR}
            OPENCV_BUILD_DIR=${OPENCV_BINARY_DIR}
            OPENCV_INSTALL_DIR=${OPENCV_INSTALL_DIR}
            OPENCV_BUILD_LIST=${_opencv_build_list}
            ${OPENCV_SCRIPTS_DIR}/configure_opencv.sh
    BUILD_COMMAND
        ${CMAKE_COMMAND} -E env
            OPENCV_BUILD_DIR=${OPENCV_BINARY_DIR}
            OPENCV_BUILD_TARGET=install
            ${OPENCV_SCRIPTS_DIR}/build_opencv.sh
    INSTALL_COMMAND ""
    LOG_CONFIGURE 1
    LOG_BUILD 1
)

message(STATUS "Configured OpenCV minimal build with modules: ${_opencv_build_list}")
message(STATUS "Install dir: ${OPENCV_INSTALL_DIR}")
