cmake_minimum_required(VERSION 3.14)
project(tdd_unity_fff_template)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# Include directories for source code
include_directories(${CMAKE_SOURCE_DIR}/include)

# Add source files for the main module (my_module.c)
add_library(my_module src/my_module.c)

# Add the executable target for the main application
add_executable(my_app src/main.c)

# Link the application with the my_module library
target_link_libraries(my_app my_module)

# Enable testing and add the test subdirectory
enable_testing()
add_subdirectory(tests)

# Include the static analysis configuration
include(cmake/static-analysis.cmake)
