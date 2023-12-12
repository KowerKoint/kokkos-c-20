cmake_minimum_required(VERSION 3.12)

project(sample)

include(FetchContent)

### Kokkos Option ###
set(Kokkos_ENABLE_SERIAL Yes)
set(Kokkos_ENABLE_CUDA Yes)
find_program(CUDA_NVCC_EXECUTABLE nvcc)
if(CUDA_NVCC_EXECUTABLE)
    set(CMAKE_CUDA_COMPILER_WRAPPER ${CUDA_NVCC_EXECUTABLE})
    message(STATUS "Using nvcc_wrapper for CUDA compilation")
else()
    message(SEND_ERROR "nvcc not found")
endif()

### Kokko Fetch ###
FetchContent_Declare(
    kokkos_fetch
    GIT_REPOSITORY https://github.com/kokkos/kokkos
    GIT_TAG 4.2.00
)
FetchContent_GetProperties(kokkos_fetch)
if(NOT kokkos_fetch_POPULATED)
    message(STATUS "Fetch Kokkos")
    FetchContent_Populate(kokkos_fetch)
    add_subdirectory(${kokkos_fetch_SOURCE_DIR})
endif(NOT kokkos_fetch_POPULATED)

### Copmiler options ###
set(CMAKE_CXX_STANDARD 20)
#add_compile_options(-std=c++20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_POSITION_INDEPENDENT_CODE ON)

### Add subdirectory ###
add_subdirectory(sample)
