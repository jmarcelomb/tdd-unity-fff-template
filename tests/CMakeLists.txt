# Set the test source directory
set(TEST_SRC_DIR ${CMAKE_SOURCE_DIR}/tests)

# Add Unity and FFF include directories
include_directories(${TEST_SRC_DIR}/unity/src)
include_directories(${TEST_SRC_DIR}/fff)
include_directories(${CMAKE_SOURCE_DIR}/include)

# Download Unity and FFF if they are not present
if(NOT EXISTS "${TEST_SRC_DIR}/unity")
    message(STATUS "Cloning Unity...")
    execute_process(
        COMMAND git clone https://github.com/ThrowTheSwitch/Unity.git unity
        WORKING_DIRECTORY ${TEST_SRC_DIR}
    )
endif()

if(NOT EXISTS "${TEST_SRC_DIR}/fff")
    message(STATUS "Cloning FFF...")
    execute_process(
        COMMAND git clone https://github.com/meekrosoft/fff.git fff
        WORKING_DIRECTORY ${TEST_SRC_DIR}
    )
endif()

# Set the test source files and Unity framework
set(TEST_SOURCES ${TEST_SRC_DIR}/test_my_module.c ${TEST_SRC_DIR}/unity/src/unity.c)

# Create the test executable
add_executable(test_runner ${TEST_SOURCES})

# Link the main module (my_module) to the test executable
target_link_libraries(test_runner my_module)

# Add the tests to CTest
add_test(NAME test_my_module COMMAND test_runner)
