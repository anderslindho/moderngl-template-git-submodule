cmake_minimum_required(VERSION 3.16)
project(moderngl-template-git-submodule)

set(CMAKE_CXX_STANDARD 14)

set(SRC_DIR ${CMAKE_CURRENT_SOURCE_DIR}/moderngl-template-git-submodule)
set(LIB_DIR ${CMAKE_CURRENT_SOURCE_DIR}/libs)

set(SOURCES ${SRC_DIR}/main.cc)

add_executable(${PROJECT_NAME} ${SOURCES})

find_package(OpenGL REQUIRED)
include_directories(${OPENGL_INCLUDE_DIR})

set(GLFW_DIR ${LIB_DIR}/glfw)
set(GLFW_BUILD_EXAMPLES
    OFF
    CACHE INTERNAL "Build the GLFW example programs")
set(GLFW_BUILD_TESTS
    OFF
    CACHE INTERNAL "Build the GLFW test programs")
set(GLFW_BUILD_DOCS
    OFF
    CACHE INTERNAL "Build the GLFW documentation")
set(GLFW_INSTALL
    OFF
    CACHE INTERNAL "Generate installation target")
add_subdirectory(${GLFW_DIR})
target_link_libraries(${PROJECT_NAME} glfw ${GLFW_LIBRARIES})
target_include_directories(${PROJECT_NAME} PRIVATE ${GLFW_DIR}/include)
target_compile_definitions(${PROJECT_NAME} PRIVATE GLFW_INCLUDE_NONE)

set(GLAD_DIR ${LIB_DIR}/glad)
add_library(glad ${GLAD_DIR}/src/glad.c)
target_include_directories(glad PRIVATE ${GLAD_DIR}/include)
target_include_directories(${PROJECT_NAME} PRIVATE ${GLAD_DIR}/include)
target_link_libraries(${PROJECT_NAME} glad ${CMAKE_DL_LIBS})

set(GLM_DIR ${LIB_DIR}/glm)
include_directories(${GLM_DIR})
