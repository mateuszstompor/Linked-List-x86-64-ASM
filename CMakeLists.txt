cmake_minimum_required(VERSION 3.0.7)
set(project_name linked_list)
set(CMAKE_CXX_STANDARD 14)
project(${project_name} C CXX ASM_NASM)

#
# check platform
#

if (WIN32)
    message(FATAL_ERROR "Windows is not amoung supported platforms")
elseif(APPLE)
    set (CMAKE_ASM_NASM_FLAGS "${CMAKE_ASM_NASM_FLAGS} -DAPPLE")
endif()

#
# linked_list library
#

set(LINKED_LIST_SOURCES source/ll_alloc.asm
                        source/ll_release.asm
                        source/ll_size.asm
                        source/lli_alloc.asm
                        source/lli_release.asm)
add_library(linked_list STATIC ${LINKED_LIST_SOURCES})
set_target_properties(linked_list PROPERTIES LINKER_LANGUAGE ASM_NASM)
set_target_properties(linked_list PROPERTIES PUBLIC_HEADER "source/linked_list.h")
install(TARGETS linked_list
        LIBRARY DESTINATION lib
        ARCHIVE DESTINATION lib/static
        PUBLIC_HEADER DESTINATION include)

#
# linked_list tests
#

IF (BUILD_TESTING)
  find_package(GTest REQUIRED)
  find_package (Threads REQUIRED)
  include_directories(${GTEST_INCLUDE_DIRS} ${CMAKE_SOURCE_DIR} source)
  add_executable(linked_list_tests ${CMAKE_SOURCE_DIR}/tests/tests.cpp)
  target_link_libraries(linked_list_tests ${GTEST_BOTH_LIBRARIES} ${CMAKE_THREAD_LIBS_INIT} linked_list)
  add_test(linked_list_tests linked_list_tests)
  set_tests_properties (linked_list_tests PROPERTIES PASS_REGULAR_EXPRESSION "Passed")
ENDIF(BUILD_TESTING)
