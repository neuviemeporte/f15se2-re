cmake_minimum_required(VERSION 3.20)

project(f15 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED OFF)
set(CMAKE_CXX_EXTENSIONS ON)

set(SRC_DIR "${CMAKE_CURRENT_SOURCE_DIR}/src")

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

set(COMMON_HEADERS
    ${SRC_DIR}/biosfunc.h
    ${SRC_DIR}/comm.h
    ${SRC_DIR}/platform.h
    ${SRC_DIR}/const.h
    ${SRC_DIR}/debug.h
    ${SRC_DIR}/dosfunc.h
    ${SRC_DIR}/egame.h
    ${SRC_DIR}/end.h
    ${SRC_DIR}/f15util.h
    ${SRC_DIR}/gfx.h
    ${SRC_DIR}/inttype.h
    ${SRC_DIR}/lowlvl.h
    ${SRC_DIR}/offsets.h
    ${SRC_DIR}/output.h
    ${SRC_DIR}/overlay.h
    ${SRC_DIR}/ovl.h
    ${SRC_DIR}/pointers.h
    ${SRC_DIR}/sassert.h
    ${SRC_DIR}/slot.h
    ${SRC_DIR}/start.h
    ${SRC_DIR}/struct.h
    ${SRC_DIR}/shared/util.h
)

set(SHARED_SOURCES
    ${SRC_DIR}/shared/file_io.c
    ${SRC_DIR}/shared/gfxstub.c
    ${SRC_DIR}/shared/miscstub.c
    ${SRC_DIR}/shared/ovlstub.c
    ${SRC_DIR}/shared/picstub.c
    ${SRC_DIR}/shared/timer.c
    ${SRC_DIR}/shared/util.c
    ${SRC_DIR}/shared/util2.c
)

set(START_SOURCES
    ${SRC_DIR}/stmain.c
    ${SRC_DIR}/stinit.c
    ${SRC_DIR}/stmissn.c
    ${SRC_DIR}/stsprit.c
    ${SRC_DIR}/strand.c
    ${SRC_DIR}/stpilot.c
    ${SRC_DIR}/stpinp.c
    ${SRC_DIR}/stinkey.c
    ${SRC_DIR}/stalloc.c
    ${SRC_DIR}/stterr.c
    ${SRC_DIR}/stparse.c
    ${SRC_DIR}/stgrid.c
    ${SRC_DIR}/stgen.c
    ${SRC_DIR}/stdata.c
    ${SRC_DIR}/gfx_impl.c
    ${SHARED_SOURCES}
)

set(EGAME_SOURCES
    ${SRC_DIR}/egmain.c
    ${SRC_DIR}/eg3d_a.c
    ${SRC_DIR}/eg3d_b.c
    ${SRC_DIR}/eg3d_c.c
    ${SRC_DIR}/eg3d_d.c
    ${SRC_DIR}/eg3d_e.c
    ${SRC_DIR}/eg3d_f.c
    ${SRC_DIR}/eg3d_g.c
    ${SRC_DIR}/eghud.c
    ${SRC_DIR}/egflight.c
    ${SRC_DIR}/egtacmap.c
    ${SRC_DIR}/egui.c
    ${SRC_DIR}/egwaypt.c
    ${SRC_DIR}/egmath.c
    ${SRC_DIR}/egweap.c
    ${SRC_DIR}/egfileio.c
    ${SRC_DIR}/egpic.c
    ${SRC_DIR}/egfarbuf.c
)

set(END_SOURCES
    ${SRC_DIR}/enmain.c
    ${SRC_DIR}/enworld.c
    ${SRC_DIR}/eninput.c
    ${SRC_DIR}/entext.c
    ${SRC_DIR}/enaward.c
    ${SRC_DIR}/enbrief.c
    ${SRC_DIR}/endbrf.c
    ${SRC_DIR}/enfile.c
    ${SRC_DIR}/end_data.c
    ${SRC_DIR}/gfx_impl.c
    ${SHARED_SOURCES}
)

set(F15_SOURCES
    ${SRC_DIR}/f15.c
    ${SRC_DIR}/dosfunc.c
    ${SRC_DIR}/biosfunc.c
    ${SRC_DIR}/output.c
    ${SRC_DIR}/overlay.c
    ${SRC_DIR}/f15util.c
)

set(ALL_C_SOURCES
    ${F15_SOURCES}
    ${START_SOURCES}
    ${EGAME_SOURCES}
    ${END_SOURCES}
)

# Treat all .c files as C++17 source files on purpose.
# make clang/cl accept c-files as C
set_source_files_properties(${ALL_C_SOURCES} PROPERTIES LANGUAGE CXX)

add_executable(f15 ${F15_SOURCES} ${COMMON_HEADERS})
add_executable(start ${START_SOURCES} ${COMMON_HEADERS})
add_executable(egame ${EGAME_SOURCES} ${COMMON_HEADERS})
add_executable(end ${END_SOURCES} ${COMMON_HEADERS})

function(configure_f15_target target_name)
    target_include_directories(${target_name} BEFORE PRIVATE
        ${SRC_DIR}/compat64
        ${SRC_DIR}
        ${SRC_DIR}/shared
    )

    target_compile_definitions(${target_name} PRIVATE BUGFIX NO_ASM)
    target_compile_features(${target_name} PRIVATE cxx_std_17)

    if(
        CMAKE_CXX_COMPILER_ID STREQUAL "GNU"
        OR
        (
            CMAKE_CXX_COMPILER_ID MATCHES "Clang"
            AND
            NOT CMAKE_CXX_COMPILER_FRONTEND_VARIANT STREQUAL "MSVC"
        )
    )
        target_compile_options(${target_name} PRIVATE
            -Wall

            -Wno-unused
            -Wno-unused-variable
            -Wno-unused-parameter
            -Wno-unused-function
            -Wno-unused-but-set-variable
            -Wno-deprecated-declarations
            -Wno-deprecated

            $<$<CXX_COMPILER_ID:Clang>:-ferror-limit=1000>
            $<$<CXX_COMPILER_ID:AppleClang>:-ferror-limit=1000>
            $<$<CXX_COMPILER_ID:GNU>:-fmax-errors=1000>

            # Permissive mode needed for decompiled code:
            # - empty () parameter lists used as unspecified (C-style)
            # - pointer/int size mismatches from 16-bit code
            -fpermissive
            -Wno-int-to-pointer-cast
            -Wno-pointer-to-int-cast
            -Wno-narrowing
        )

    elseif(
        MSVC
        OR
        CMAKE_CXX_COMPILER_FRONTEND_VARIANT STREQUAL "MSVC"
    )
        target_compile_options(${target_name} PRIVATE
            /nologo
            /TP
            /W3
            /wd4100  # unreferenced formal parameter
            /wd4101  # unreferenced local variable
            /wd4189  # local variable initialized but not referenced
            /wd4996  # deprecated / unsafe CRT
            /wd4244  # conversion, possible loss of data
            /wd4267  # size_t -> smaller type
            /wd4305  # truncation
            /wd4311  # pointer truncation
            /wd4312  # conversion to pointer of greater size
        )

    else()
        message(WARNING "Unknown C++ compiler: ${CMAKE_CXX_COMPILER_ID}")
    endif()
endfunction()

configure_f15_target(f15)
configure_f15_target(start)
configure_f15_target(egame)
configure_f15_target(end)
