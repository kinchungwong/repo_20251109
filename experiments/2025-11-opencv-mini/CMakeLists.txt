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

ExternalProject_Add(opencv-mini
    PREFIX opencv-mini
    URL https://github.com/opencv/opencv/archive/refs/tags/${OPENCV_VERSION}.tar.gz
    DOWNLOAD_DIR ${OPENCV_DOWNLOAD_DIR}
    SOURCE_SUBDIR .
    CONFIGURE_COMMAND 
        ${CMAKE_COMMAND} -S <SOURCE_DIR> -B <BINARY_DIR> \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=${OPENCV_INSTALL_DIR} \
        -DBUILD_LIST=${_opencv_build_list} \
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
    BUILD_COMMAND ${CMAKE_COMMAND} --build <BINARY_DIR> --target install
    INSTALL_COMMAND ""
)

message(STATUS "Configured OpenCV minimal build with modules: ${_opencv_build_list}")
message(STATUS "Install dir: ${OPENCV_INSTALL_DIR}")
