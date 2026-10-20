cmake_minimum_required(VERSION 3.15...4.0)
project(injector)

file(GLOB_RECURSE INJECTOR_SOURCES src/*.cpp src/*.h)

add_executable(injector ${INJECTOR_SOURCES})

target_include_directories(injector PRIVATE
    src
    src/injector
)

set_target_properties(injector PROPERTIES
    CXX_STANDARD 17
    CXX_STANDARD_REQUIRED ON
)
