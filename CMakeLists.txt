cmake_minimum_required(VERSION 3.20)

project(f15 LANGUAGES CXX)

set(SRC_DIR "${CMAKE_CURRENT_SOURCE_DIR}/src")

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# Virtual-overlay gfx trampolines: start/end/egame far-call into f15.exe's
# gfx_impl.c at runtime. f15 itself links gfx_impl.c directly instead.
set(NOASM_GFX_SOURCES
    ${SRC_DIR}/slottram.c
    ${SRC_DIR}/ovlpatch.c
)

# Shared gfx-slot / timer / misc / pic / overlay basics — the same C
# implementations every program's NO_ASM build routes its slots through.
set(SHARED_SLOT_SOURCES
    ${SRC_DIR}/shared/gfximpl.c
    ${SRC_DIR}/shared/miscimpl.c
    ${SRC_DIR}/shared/ovlimpl.c
    ${SRC_DIR}/shared/picimpl.c
    ${SRC_DIR}/shared/timer.c
)

# File + string helpers. egame provides its own (egfileio.c / egtacmap.c), so it
# omits these to avoid redefining openFileWrapper/closeFileWrapper/drawStringCentered.
set(SHARED_IO_SOURCES
    ${SRC_DIR}/shared/file_io.c
    ${SRC_DIR}/shared/cleanup.c
    ${SRC_DIR}/shared/drawstr.c
    ${SRC_DIR}/shared/textfmt.c
    ${SRC_DIR}/shared/filepic.c
)

set(SHARED_SOURCES
    ${SHARED_SLOT_SOURCES}
    ${SHARED_IO_SOURCES}
)

set(START_SOURCES
    ${SRC_DIR}/stmain.c
    ${SRC_DIR}/stinit.c
    ${SRC_DIR}/stmissn.c
    ${SRC_DIR}/stsprit.c
    ${SRC_DIR}/strand.c
    ${SRC_DIR}/stpilot.c
    ${SRC_DIR}/stalloc.c
    ${SRC_DIR}/stterr.c
    ${SRC_DIR}/stparse.c
    ${SRC_DIR}/stgen.c
    ${SRC_DIR}/stdata.c
    ${SHARED_SOURCES}
    ${NOASM_GFX_SOURCES}
)

set(EGAME_SOURCES
    ${SRC_DIR}/egmain.c
    ${SRC_DIR}/egsphere.c
    ${SRC_DIR}/egframe.c
    ${SRC_DIR}/eg3dview.c
    ${SRC_DIR}/eg3dproj.c
    ${SRC_DIR}/eg3dgrid.c
    ${SRC_DIR}/eg3dload.c
    ${SRC_DIR}/eg3dmap.c
    ${SRC_DIR}/eg3dvp.c
    ${SRC_DIR}/eg3dcam.c
    ${SRC_DIR}/egflight.c
    ${SRC_DIR}/egthreat.c
    ${SRC_DIR}/egcombat.c
    ${SRC_DIR}/egtacmap.c
    ${SRC_DIR}/egui.c
    ${SRC_DIR}/egtarget.c
    ${SRC_DIR}/egtgt2.c
    ${SRC_DIR}/egmath.c
    ${SRC_DIR}/egkeys.c
    ${SRC_DIR}/egfileio.c
    ${SRC_DIR}/egpic.c
    ${SRC_DIR}/egdata.c
    ${SRC_DIR}/egfarbuf.c
    ${SRC_DIR}/eg3dmath.c
    ${SRC_DIR}/eghudm.c
    ${SRC_DIR}/eghudr.c
    ${SRC_DIR}/eg3drast.c
    ${SRC_DIR}/egsys.c
    ${SRC_DIR}/egtick.c
    ${SRC_DIR}/egstubs.c
    ${SRC_DIR}/compat64/egregsh.c
    ${SHARED_SLOT_SOURCES}
    ${NOASM_GFX_SOURCES}
)

set(END_SOURCES
    ${SRC_DIR}/enmain.c
    ${SRC_DIR}/enmisc.c
    ${SRC_DIR}/enworld.c
    ${SRC_DIR}/eninput.c
    ${SRC_DIR}/entext.c
    ${SRC_DIR}/enrand.c
    ${SRC_DIR}/enaward.c
    ${SRC_DIR}/enbrief.c
    ${SRC_DIR}/endbrf.c
    ${SRC_DIR}/enfile.c
    ${SRC_DIR}/endata.c
    ${SHARED_SOURCES}
    ${NOASM_GFX_SOURCES}
)

set(F15_SOURCES
    ${SRC_DIR}/f15.c
    ${SRC_DIR}/dosfunc.c
    ${SRC_DIR}/biosfunc.c
    ${SRC_DIR}/output.c
    ${SRC_DIR}/overlay.c
    ${SRC_DIR}/f15util.c
    ${SRC_DIR}/gfx_impl.c
    ${SRC_DIR}/compat64/gfx_regshim.c
)

add_executable(f15 ${F15_SOURCES})
add_executable(start ${START_SOURCES})
add_executable(egame ${EGAME_SOURCES})
add_executable(end ${END_SOURCES})

# Treat .c files as C++17 (decompiled code uses C++ features)
function(configure_f15_target target_name)
    set_source_files_properties(${ARGN} PROPERTIES LANGUAGE CXX)

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

            -fpermissive
            -Wno-int-to-pointer-cast
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

configure_f15_target(f15 ${F15_SOURCES})
configure_f15_target(start ${START_SOURCES})
configure_f15_target(egame ${EGAME_SOURCES})
configure_f15_target(end ${END_SOURCES})
