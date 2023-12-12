cmake_minimum_required(VERSION 3.12)

add_library(sample)

target_sources(sample PRIVATE
    sample.cpp
)
target_link_libraries(sample PRIVATE Kokkos::kokkos)
target_include_directories(sample PRIVATE ${PROJECT_SOURCE_DIR}/sample)
