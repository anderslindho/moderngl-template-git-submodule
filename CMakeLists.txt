cmake_minimum_required(VERSION 3.16)
project(moderngl-template)

set(CMAKE_CXX_STANDARD 14)

set(SRC_DIR ${CMAKE_CURRENT_SOURCE_DIR}/moderngl-template)
set(SOURCES ${SRC_DIR}/main.cc)

add_executable(${PROJECT_NAME} ${SOURCES})
