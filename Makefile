MZRE := mzretools
MZRETOOLDIR := $(MZRE)/tools
DOSBOX ?= dosbox
DOSBUILD := DOSBOX=$(DOSBOX) $(MZRETOOLDIR)/dosbuild.sh
DOSTEST := $(MZRETOOLDIR)/test.sh
DISASM := $(MZRETOOLDIR)/disasm.sh
ASSEMBLER ?= UASM
ifeq ($(ASSEMBLER),JWasm)
ASMDIR := JWasm
ASM := $(ASMDIR)/build/GccUnixR/jwasm
ASM_BUILD_CMD := make -f GccUnix.mak -j
else
ASMDIR := UASM
ASM := $(ASMDIR)/GccUnixR/uasm
ASM_BUILD_CMD := make -j
endif
MZDIFF := $(MZRE)/debug/mzdiff
MZHDR := $(MZRE)/debug/mzhdr
TOOLDIR := tools
CXXFLAGS := -Wfatal-errors
# UASM/JWasm: no copyright info, 8086 instructions, MASM compatibility
ASMFLAGS := -q -0 -Zm
# DOS C compiler: no stack probes, debug mode
C_TOOLCHAIN ?= msc510
MSC_CFLAGS ?= /Gs /Zi /Id:\f15-se2
# DOS assembler
ASM_TOOLCHAIN ?= masm510
# masm: suppress output in case of successful assembly
ASFLAGS := /t
# DOS linker
LINK_TOOLCHAIN ?= msc510
# ms link: verbose, create mapfile
LINKFLAGS := /M /I
DOSDIR := dos
TOOLCHAIN_DIR := $(DOSDIR)/$(C_TOOLCHAIN)
VERIFY_FLAGS := --loose --ctx 20
# optional verbosity parameter (--verbose/--debug etc.)
V ?=

SRCTOP := src
SRCDIR := $(SRCTOP)
BUILDDIR := build
MAPDIR := map
DEBUGDIR := debug_build
HDRFILES := dosfunc.h log.h pointers.h offsets.h biosfunc.h comm.h overlay.h f15util.h slot.h const.h struct.h
HDRS := $(addprefix $(SRCDIR)/,$(HDRFILES))

asmobj = $(addprefix $(1)/,$(2:.asm=.obj))
cobj = $(addprefix $(1)/,$(2:.c=.obj))

.PHONY: f15-se2 clean f15-se2-test verify verify-start verify-egame verify-end test start-gen-asm start hello debug debug-start debug-end debug-egame tools noasm noasm-f15 noasm-start noasm-egame noasm-end release
all: f15-se2

#
# main executable, aka loader, replacement for f15.com and su.exe combined
#
MAIN_EXE := $(BUILDDIR)/f15.exe
MAIN_SRCS := f15.c dosfunc.c biosfunc.c log.c overlay.c f15util.c
MAIN_OBJS := $(call cobj,$(BUILDDIR),$(MAIN_SRCS))
# The launcher's diagnostics are always-on (unlike the matched binaries, which
# compile logging out), so build it with DEBUG to keep the Log* calls live.
$(MAIN_OBJS): MSC_CFLAGS := /Gs /Zi /Id:\f15-se2 /DDEBUG

$(MAIN_EXE): | $(BUILDDIR)
$(MAIN_EXE): $(MAIN_OBJS)
	@$(DOSBUILD) link $(LINK_TOOLCHAIN) -i $(MAIN_OBJS) -o $@ -f "$(LINKFLAGS)"

#
# start.exe reconstruction
#
START_EXE := $(BUILDDIR)/start.exe
START_MAP := $(MAPDIR)/start.map
START_LINKMAP := $(BUILDDIR)/start.map:link
START_BASE := stslots.asm
START_ASM := stcode.asm $(START_BASE)
COMMON_SRC := shared/cleanup.c
COMMON_SRC2 := shared/filepic.c
# The shared string/cleanup helpers were split into byte-identical pieces
# (cleanup.c=cleanup, drawstr.c=drawStringAt, textfmt.c=string/number helpers)
# so they can be interleaved into each program's link order to match the
# original module layout. All three keep /Gs /Zi flags. filepic.c (file/pic
# wrappers + strcpy) stays a single TU.
COMMON_OBJ := $(BUILDDIR)/cleanup.obj
COMMON_OBJ_B := $(BUILDDIR)/drawstr.obj
COMMON_OBJ_C := $(BUILDDIR)/textfmt.obj
COMMON_OBJ2 := $(BUILDDIR)/filepic.obj
COMMON_UTIL := $(COMMON_OBJ) $(COMMON_OBJ_B) $(COMMON_OBJ_C)
START_SRC := stmain.c stinit.c stmissn.c stsprit.c strand.c stpilot.c stalloc.c stterr.c stparse.c stgen.c stdata.c
START_BASEHDR = $(addprefix $(SRCDIR)/,sttypes.h stdata.h stcode.h stinit.h stmissn.h stsprit.h strand.h stpilot.h stalloc.h stterr.h stparse.h stgen.h)
START_COBJ := $(call cobj,$(BUILDDIR),$(START_SRC))
# Explicit link order interleaves the shared helper pieces between the per-module
# objs to match the original layout in map/start.map.
START_OBJ := $(BUILDDIR)/stmain.obj $(BUILDDIR)/stinit.obj $(COMMON_OBJ) \
	$(BUILDDIR)/stmissn.obj $(BUILDDIR)/stsprit.obj \
	$(COMMON_OBJ_B) $(COMMON_OBJ_C) $(BUILDDIR)/strand.obj $(BUILDDIR)/stpilot.obj \
	$(COMMON_OBJ2) \
	$(BUILDDIR)/stalloc.obj $(BUILDDIR)/stterr.obj $(BUILDDIR)/stparse.obj \
	$(BUILDDIR)/stgen.obj $(BUILDDIR)/stdata.obj \
	$(call asmobj,$(BUILDDIR),$(START_ASM))

# reference and target entrypoints (offset of main()) for binary comparison
START_VRF_REF := bin/start.exe
START_VRF_REFEP := main
START_VRF_TGTEP := main

$(START_COBJ): $(START_BASEHDR)
$(COMMON_OBJ) $(COMMON_OBJ_B) $(COMMON_OBJ_C) $(COMMON_OBJ2): $(SRCDIR)/shared/common.h
$(BUILDDIR)/cleanup.obj: $(SRCDIR)/shared/cleanup.c $(HDRS) | $(BUILDDIR)
	@$(DOSBUILD) cc $(C_TOOLCHAIN) -i $< -o $@ -f "$(MSC_CFLAGS)"
$(BUILDDIR)/drawstr.obj: $(SRCDIR)/shared/drawstr.c $(HDRS) | $(BUILDDIR)
	@$(DOSBUILD) cc $(C_TOOLCHAIN) -i $< -o $@ -f "$(MSC_CFLAGS)"
$(BUILDDIR)/textfmt.obj: $(SRCDIR)/shared/textfmt.c $(HDRS) | $(BUILDDIR)
	@$(DOSBUILD) cc $(C_TOOLCHAIN) -i $< -o $@ -f "$(MSC_CFLAGS)"
$(BUILDDIR)/filepic.obj: $(SRCDIR)/shared/filepic.c $(HDRS) | $(BUILDDIR)
	@$(DOSBUILD) cc $(C_TOOLCHAIN) -i $< -o $@ -f "$(MSC_CFLAGS)"
$(DEBUGDIR)/cleanup.obj: $(SRCDIR)/shared/cleanup.c $(HDRS) | $(DEBUGDIR)
	@$(DOSBUILD) cc $(C_TOOLCHAIN) -i $< -o $@ -f "$(MSC_CFLAGS)"
$(DEBUGDIR)/drawstr.obj: $(SRCDIR)/shared/drawstr.c $(HDRS) | $(DEBUGDIR)
	@$(DOSBUILD) cc $(C_TOOLCHAIN) -i $< -o $@ -f "$(MSC_CFLAGS)"
$(DEBUGDIR)/textfmt.obj: $(SRCDIR)/shared/textfmt.c $(HDRS) | $(DEBUGDIR)
	@$(DOSBUILD) cc $(C_TOOLCHAIN) -i $< -o $@ -f "$(MSC_CFLAGS)"
$(DEBUGDIR)/filepic.obj: $(SRCDIR)/shared/filepic.c $(HDRS) | $(DEBUGDIR)
	@$(DOSBUILD) cc $(C_TOOLCHAIN) -i $< -o $@ -f "$(MSC_CFLAGS)"
$(BUILDDIR)/filepic.obj: MSC_CFLAGS := /Gs /I.. /Id:\f15-se2
$(BUILDDIR)/cleanup.obj $(BUILDDIR)/drawstr.obj $(BUILDDIR)/textfmt.obj: MSC_CFLAGS := /Gs /Zi /I.. /Id:\f15-se2
$(DEBUGDIR)/filepic.obj: MSC_CFLAGS := /Gs /w /I.. /Id:\f15-se2 /DDEBUG
$(DEBUGDIR)/cleanup.obj $(DEBUGDIR)/drawstr.obj $(DEBUGDIR)/textfmt.obj: MSC_CFLAGS := /Gs /Zi /I.. /Id:\f15-se2 /DDEBUG
$(BUILDDIR)/stpilot.obj: MSC_CFLAGS := /Gs /Id:\f15-se2
$(BUILDDIR)/stalloc.obj: MSC_CFLAGS := /Gs /Id:\f15-se2
$(BUILDDIR)/stterr.obj: MSC_CFLAGS := /Gs /Zi /Id:\f15-se2
$(BUILDDIR)/stparse.obj: MSC_CFLAGS := /Gs /Id:\f15-se2
$(BUILDDIR)/stsprit.obj: MSC_CFLAGS := /Gs /Id:\f15-se2
$(BUILDDIR)/stgen.obj: MSC_CFLAGS := /Gs /Zi /Id:\f15-se2
$(BUILDDIR)/stcode.obj: MSC_CFLAGS := /Gs /Zi /Id:\f15-se2

$(START_EXE): | $(BUILDDIR)
$(START_EXE): $(START_OBJ)
	@$(DOSBUILD) link $(LINK_TOOLCHAIN) -i $(START_OBJ) -o $@ -f "$(LINKFLAGS)"

# start.exe debug build
START_DEBUG := $(DEBUGDIR)/start.exe
# Set AUTOSTART=1 to build start.exe that skips the menu UI and chains
# straight into egame.exe (DEBUG_AUTOSTART block in stmain.c) — useful for
# runtime-testing egame changes without navigating the menus by hand.
AUTOSTART ?=
$(START_DEBUG): MSC_CFLAGS += /DDEBUG
$(DEBUGDIR)/stmain.obj: MSC_CFLAGS := /Gs /Zi /Id:\f15-se2 /DDEBUG $(if $(AUTOSTART),/DDEBUG_AUTOSTART)
START_DBG_OBJ := $(call cobj,$(DEBUGDIR),$(START_SRC)) $(call asmobj,$(DEBUGDIR),$(START_ASM)) $(DEBUGDIR)/cleanup.obj $(DEBUGDIR)/drawstr.obj $(DEBUGDIR)/textfmt.obj $(DEBUGDIR)/filepic.obj $(DEBUGDIR)/log.obj
$(START_DBG_OBJ): $(START_BASEHDR)
$(START_DBG_OBJ): ASMFLAGS += -DDEBUG
$(START_DEBUG): $(DEBUGDIR) $(START_DBG_OBJ)
	@$(DOSBUILD) link $(LINK_TOOLCHAIN) -i $(START_DBG_OBJ) -o $@ -f "$(LINKFLAGS)" -l "slibce.lib"
	@if [ -n "$(F15_TESTDIR)" ]; then \
	    echo "Copying $@ to $(F15_TESTDIR)"; \
	    cp $@ "$(F15_TESTDIR)"; \
		ls -l $(F15_TESTDIR)/start.exe; \
	fi

#
# start.exe NO_ASM build
#
NOASMDIR := noasm_build
START_NOASM := $(NOASMDIR)/start.exe
NOASM_SRC := $(START_SRC) slottram.c ovlpatch.c
NOASM_SHARED_SRC := file_io.c timer.c miscimpl.c gfximpl.c picimpl.c ovlimpl.c
NOASM_COBJ := $(call cobj,$(NOASMDIR),$(NOASM_SRC)) $(addprefix $(NOASMDIR)/,$(NOASM_SHARED_SRC:.c=.obj))
NOASM_OBJ := $(NOASM_COBJ) $(NOASMDIR)/cleanup.obj $(NOASMDIR)/drawstr.obj $(NOASMDIR)/textfmt.obj $(NOASMDIR)/filepic.obj $(NOASMDIR)/egregsh.obj
$(NOASM_COBJ): $(START_BASEHDR)
# /Ox breaks the timer-polled busy-waits (MSC 5.1 hoists the non-volatile poll
# out of the loop and its `volatile` is non-functional), so stay at /Gs.
$(NOASM_COBJ): MSC_CFLAGS := /Gs /Id:\f15-se2 /DNO_ASM /DBUGFIX
$(NOASMDIR)/cleanup.obj: $(SRCDIR)/shared/cleanup.c $(HDRS) | $(NOASMDIR)
	@$(DOSBUILD) cc $(C_TOOLCHAIN) -i $< -o $@ -f "/Gs /I.. /Id:\f15-se2 /DNO_ASM /DBUGFIX"
$(NOASMDIR)/filepic.obj: $(SRCDIR)/shared/filepic.c $(HDRS) | $(NOASMDIR)
	@$(DOSBUILD) cc $(C_TOOLCHAIN) -i $< -o $@ -f "/Gs /I.. /Id:\f15-se2 /DNO_ASM /DBUGFIX"
$(START_NOASM): | $(NOASMDIR)
$(START_NOASM): $(NOASM_OBJ)
	@$(DOSBUILD) link $(LINK_TOOLCHAIN) -i $(NOASM_OBJ) -o $@ -f "$(LINKFLAGS)" -l "slibce.lib"
	@if [ -n "$(F15_TESTDIR)" ]; then \
	    echo "Copying $@ to $(F15_TESTDIR)"; \
	    cp $@ "$(F15_TESTDIR)"; \
		ls -l $(F15_TESTDIR)/start.exe; \
	fi

#
# f15.exe NO_ASM build (virtual gfx overlay — no Mgraphic.exe required)
#
F15_NOASM := $(NOASMDIR)/f15.exe
NOASM_F15_SRC := f15.c dosfunc.c biosfunc.c log.c overlay.c f15util.c gfx_impl.c
NOASM_F15_COBJ := $(call cobj,$(NOASMDIR),$(NOASM_F15_SRC))
# regshim.asm: register-call ABI glue for the register-passed gfx slots
NOASM_F15_OBJ := $(NOASM_F15_COBJ) $(NOASMDIR)/regshim.obj
# Not byte-matched against an original (no verify target), so build for
# maximum optimization. /Ox = max opt favoring speed (implies /Gs).
$(NOASM_F15_COBJ): MSC_CFLAGS := /Ox /Id:\f15-se2 /DNO_ASM /DBUGFIX /DDEBUG
$(F15_NOASM): | $(NOASMDIR)
$(F15_NOASM): $(NOASM_F15_OBJ)
	@$(DOSBUILD) link $(LINK_TOOLCHAIN) -i $(NOASM_F15_OBJ) -o $@ -f "$(LINKFLAGS)"

$(NOASMDIR):
	mkdir -p $@

$(NOASMDIR)/%.obj: $(SRCDIR)/%.c $(HDRS) | $(NOASMDIR)
	@$(DOSBUILD) cc $(C_TOOLCHAIN) -i $< -o $@ -f "$(MSC_CFLAGS)"

$(NOASMDIR)/%.obj: $(SRCDIR)/shared/%.c $(HDRS) | $(NOASMDIR)
	@$(DOSBUILD) cc $(C_TOOLCHAIN) -i $< -o $@ -f "/Gs /I.. /Id:\f15-se2 /DNO_ASM /DBUGFIX"

$(NOASMDIR)/%.obj: $(SRCDIR)/%.asm | $(NOASMDIR) $(ASM)
	$(ASM) $(ASMFLAGS) -Fo$@ $<

#
# egame.exe NO_ASM build (virtual gfx overlay - Phase 3 of plan)
#
EGAME_NOASM := $(NOASMDIR)/egame.exe
# Source set mirrors CMakeLists.txt's EGAME_SOURCES: the full eg*.c list plus
# egstubs.c (C stand-ins for the not-yet-migrated asm helpers) and the gfx
# trampolines (slottram.c/ovlpatch.c).
EGAME_NOASM_SRC := egmain.c egsphere.c egframe.c eg3dview.c eg3dproj.c eg3dgrid.c eg3dload.c eg3dmap.c eg3dvp.c eg3dcam.c egflight.c egthreat.c egcombat.c egtacmap.c egui.c egtarget.c egtgt2.c egmath.c egkeys.c egfileio.c egpic.c egdata.c egfarbuf.c eg3dmath.c eghudm.c eghudr.c eg3drast.c egsys.c egtick.c eginput.c egstubs.c slottram.c ovlpatch.c
# Shared gfx-slot / timer / misc / pic / overlay basics, the same C
# implementations noasm-start and noasm-end use. egame keeps its own egfileio.c
# file layer and egtacmap.c string helpers, so it omits the shared
# file_io.c/filepic.c/textfmt.c/cleanup.c/drawstr.c (which would redefine
# openFileWrapper/closeFileWrapper/drawStringCentered). egstubs.c then only
# covers the egame-specific asm helpers (3D engine, joystick, sound) that have
# no shared C implementation.
EGAME_NOASM_SHARED := timer.c miscimpl.c gfximpl.c picimpl.c ovlimpl.c
EGAME_NOASM_COBJ := $(call cobj,$(NOASMDIR),$(EGAME_NOASM_SRC)) $(addprefix $(NOASMDIR)/,$(EGAME_NOASM_SHARED:.c=.obj))
EGAME_NOASM_OBJ := $(EGAME_NOASM_COBJ) $(NOASMDIR)/egregsh.obj
# /Os (favour size) keeps the egame C + shared basics inside the 64K _TEXT.
$(EGAME_NOASM_COBJ): MSC_CFLAGS := /Gs /Os /Id:\f15-se2 /DNO_ASM /DBUGFIX
# timer.c stays at /Gs: MSC's size/speed optimiser hoists its timer-polled
# busy-waits (its `volatile` is non-functional in 5.1), breaking frame pacing.
$(NOASMDIR)/timer.obj: MSC_CFLAGS := /Gs /Id:\f15-se2 /DNO_ASM /DBUGFIX
# eghudr.c is the C analogue of the hand-written egseg2.asm; like seg002 it is
# large enough that it must live in its own code segment so it does not push the
# shared _TEXT past 64K. /NT names that segment; its far entry points
# (drawInstrumentGaugesFar / setupInstrumentLayoutFar / drawClipLineGlobal)
# and the eghudm.c far helpers keep every cross-segment call far.
$(NOASMDIR)/eghudr.obj: MSC_CFLAGS := /Gs /Ot /Id:\f15-se2 /DNO_ASM /DBUGFIX /NT EGHUD_TEXT
# eg3drast.c is the C 2D rasterizer / model decoder (the egseg1.asm analogue).
# Like eghudr.c it is too large for the shared _TEXT, so it gets its own far
# code segment; its far entry points are far-called and it does its 32-bit math
# inline (no near call to the _TEXT long-runtime helpers from this segment).
$(NOASMDIR)/eg3drast.obj: MSC_CFLAGS := /Gs /Ot /Id:\f15-se2 /DNO_ASM /DBUGFIX /NT EG3D_TEXT
# egtick.c (per-tick timer hook) lives in its own far segment: shared _TEXT is
# full and the hook is reached via a far function pointer (segment irrelevant).
$(NOASMDIR)/egtick.obj: MSC_CFLAGS := /Gs /Os /Id:\f15-se2 /DNO_ASM /DBUGFIX /NT EGTICK_TEXT
$(EGAME_NOASM): | $(NOASMDIR)
$(EGAME_NOASM): $(EGAME_NOASM_OBJ)
	@$(DOSBUILD) link $(LINK_TOOLCHAIN) -i $(EGAME_NOASM_OBJ) -o $@ -f "$(LINKFLAGS)" -l "slibce.lib"

#
# egame.exe reconstruction
#
EGAME_EXE := $(BUILDDIR)/egame.exe
EGAME_MAP := $(MAPDIR)/egame.map
EGAME_LINKMAP := $(BUILDDIR)/egame.map:link
EGAME_BASE := egslots.asm
EGAME_ASM := egcode.asm $(EGAME_BASE) egfarbu2.asm egseg3.asm egseg2.asm egseg1.asm
# egmain.c split after gfxInit so drawProjectionSphere (egsphere.c) links between
# gfxInit and updateFrame, matching its early position in map/egame.map.
# The reference build gets byte_228D0/byte_2D6A4 from egfarbu2.asm (two distinct
# symbols at fixed offsets); the NO_ASM build uses egfarbuf.c (single buffer) instead.
EGAME_SRC := egmain.c egsphere.c egframe.c eg3dview.c eg3dproj.c eg3dgrid.c eg3dload.c eg3dmap.c eg3dvp.c eg3dcam.c egflight.c egthreat.c egcombat.c egtacmap.c egui.c egtarget.c egtgt2.c egmath.c egkeys.c egfileio.c egpic.c egdata.c
EGAME_BASEHDR = $(addprefix $(SRCDIR)/,egtypes.h egdata.h egcode.h eg3dcam.h eg3dgrid.h eg3dload.h eg3dmap.h eg3dproj.h eg3dview.h eg3dvp.h egcombat.h egfileio.h egflight.h egframe.h egkeys.h egmath.h egpic.h egsphere.h egtacmap.h egtarget.h egthreat.h egui.h)
EGAME_COBJ := $(call cobj,$(BUILDDIR),$(EGAME_SRC))
EGAME_OBJ := $(EGAME_COBJ) $(call asmobj,$(BUILDDIR),$(EGAME_ASM))
$(EGAME_EXE): | $(BUILDDIR)
$(EGAME_EXE): $(EGAME_OBJ)
	@$(DOSBUILD) link $(LINK_TOOLCHAIN) -i $(EGAME_OBJ) -o $@ -f "$(LINKFLAGS)" -l "slibce.lib"

$(EGAME_COBJ): $(EGAME_BASEHDR)
$(BUILDDIR)/egmain.obj: MSC_CFLAGS := /Gs /Zi /Id:\f15-se2
$(BUILDDIR)/egframe.obj: MSC_CFLAGS := /Gs /Zi /Id:\f15-se2
$(BUILDDIR)/egsphere.obj: MSC_CFLAGS := /Gs /Id:\f15-se2
$(BUILDDIR)/eg3dproj.obj: MSC_CFLAGS := /Gs /Zi /Id:\f15-se2
$(BUILDDIR)/eg3dgrid.obj: MSC_CFLAGS := /Gs /Zi /Id:\f15-se2
$(BUILDDIR)/eg3dload.obj: MSC_CFLAGS := /Gs /Zi /Id:\f15-se2
$(BUILDDIR)/eg3dvp.obj: MSC_CFLAGS := /Gs /Zi /Ot /Id:\f15-se2
$(BUILDDIR)/egflight.obj: MSC_CFLAGS := /Gs /Zi /Id:\f15-se2
$(BUILDDIR)/egthreat.obj: MSC_CFLAGS := /Gs /Id:\f15-se2
$(BUILDDIR)/egtacmap.obj: MSC_CFLAGS := /Gs /Zi /Id:\f15-se2
$(BUILDDIR)/egkeys.obj: MSC_CFLAGS := /Gs /Zi /Id:\f15-se2
$(BUILDDIR)/eg3dview.obj: MSC_CFLAGS := /Gs /Id:\f15-se2
$(BUILDDIR)/eg3dmap.obj: MSC_CFLAGS := /Gs /Id:\f15-se2
$(BUILDDIR)/eg3dcam.obj: MSC_CFLAGS := /Gs /Id:\f15-se2
$(BUILDDIR)/egcombat.obj: MSC_CFLAGS := /Gs /Id:\f15-se2
$(BUILDDIR)/egui.obj: MSC_CFLAGS := /Gs /Id:\f15-se2
$(BUILDDIR)/egtarget.obj: MSC_CFLAGS := /Gs /Zi /Id:\f15-se2
$(BUILDDIR)/egtgt2.obj: MSC_CFLAGS := /Gs /Zi /Id:\f15-se2
$(BUILDDIR)/egmath.obj: MSC_CFLAGS := /Gs /Id:\f15-se2
$(BUILDDIR)/egfileio.obj: MSC_CFLAGS := /Gs /Id:\f15-se2
$(BUILDDIR)/egpic.obj: MSC_CFLAGS := /Od /Id:\f15-se2
$(DEBUGDIR)/egpic.obj: MSC_CFLAGS := /Gs /Os /Id:\f15-se2 /DDEBUG

# reference and target entrypoints (offset of main()) for binary comparison
EGAME_VRF_REF := bin/egame.exe
EGAME_VRF_REFEP := main
EGAME_VRF_TGTEP := main

# egame.exe debug build
EGAME_DEBUG := $(DEBUGDIR)/egame.exe
# egame's _TEXT sits right at the 64K small-model limit, so the whole debug
# build is compiled /Os (size) and without /Zi. The debug build isn't verified,
# so optimizing it freely is fine.
# DBG_DEFS: extra debug-only defines. /DDISABLE_3D skips the 3D world
# renderer (see sub_155AB) so 2D/HUD/radar render continuously.
# Set DBG_DEFS=/DDISABLE_3D on the make command line to disable 3D.
DBG_DEFS ?=
$(EGAME_DEBUG): MSC_CFLAGS := /Gs /Os /Id:\f15-se2 /DDEBUG $(DBG_DEFS)
EGAME_DBG_OBJ := $(call asmobj,$(DEBUGDIR),$(EGAME_ASM)) $(call cobj,$(DEBUGDIR),$(EGAME_SRC)) $(DEBUGDIR)/logdos.obj $(DEBUGDIR)/dbgio.obj
$(EGAME_DBG_OBJ): $(EGAME_BASEHDR)
$(EGAME_DBG_OBJ): ASMFLAGS += -DDEBUG
# Even at /Os egame's _TEXT can't absorb stdio's vfprintf/fopen, so its logging
# backend (LOG_DOS) formats by hand and writes through the raw DOS helpers in
# dbgio.asm. Built from the shared log.c into a distinct object so the stdio
# build the other binaries use can coexist.
$(DEBUGDIR)/logdos.obj: MSC_CFLAGS := /Gs /Os /Id:\f15-se2 /DDEBUG /DLOG_DOS
$(DEBUGDIR)/logdos.obj: $(SRCDIR)/log.c $(HDRS) | $(DEBUGDIR)
	@$(DOSBUILD) cc $(C_TOOLCHAIN) -i $< -o $@ -f "$(MSC_CFLAGS)"
$(EGAME_DEBUG): $(DEBUGDIR) $(EGAME_DBG_OBJ)
	@$(DOSBUILD) link $(LINK_TOOLCHAIN) -i $(EGAME_DBG_OBJ) -o $@ -f "$(LINKFLAGS)" -l "slibce.lib"
	@if [ -n "$(F15_TESTDIR)" ]; then \
	    echo "Copying $@ to $(F15_TESTDIR)"; \
	    cp $@ "$(F15_TESTDIR)"; \
		ls -l $(F15_TESTDIR)/egame.exe; \
	fi

#
# end.exe reconstruction
#
END_EXE := $(BUILDDIR)/end.exe
END_MAP := $(MAPDIR)/end.map
END_LINKMAP := $(BUILDDIR)/end.map:link
END_BASE := endslots.asm
END_ASM := endcode.asm $(END_BASE)
END_SRC := enmain.c enmisc.c enworld.c eninput.c entext.c enrand.c enaward.c enbrief.c endbrf.c enfile.c endata.c
END_BASEHDR = $(addprefix $(SRCDIR)/,endtypes.h endata.h endcode.h enaward.h enbrief.h endbrf.h enfile.h eninput.h enmisc.h enrand.h entext.h enworld.h)
END_COBJ := $(call cobj,$(BUILDDIR),$(END_SRC))
# Explicit link order interleaves the shared helper pieces between the per-module
# objs to match the original layout in map/end.map (C functions only; ASM-base
# routines fall at the end of _TEXT). cleanup.obj=cleanup, drawstr=drawStringAt,
# textfmt=string/number helpers, filepic=file/strcpy helpers.
END_OBJ := $(BUILDDIR)/enmain.obj $(COMMON_OBJ) $(BUILDDIR)/enmisc.obj \
	$(BUILDDIR)/enworld.obj $(BUILDDIR)/eninput.obj $(COMMON_OBJ_B) \
	$(BUILDDIR)/entext.obj $(COMMON_OBJ_C) $(BUILDDIR)/enrand.obj \
	$(COMMON_OBJ2) $(BUILDDIR)/enaward.obj $(BUILDDIR)/enbrief.obj \
	$(BUILDDIR)/endbrf.obj $(BUILDDIR)/enfile.obj $(BUILDDIR)/endata.obj \
	$(call asmobj,$(BUILDDIR),$(END_ASM))
$(END_COBJ): $(END_BASEHDR)
$(END_EXE): | $(BUILDDIR)
$(END_EXE): $(END_OBJ)
	@$(DOSBUILD) link $(LINK_TOOLCHAIN) -i $(END_OBJ) -o $@ -f "$(LINKFLAGS)"

$(END_COBJ): $(END_BASEHDR)
$(BUILDDIR)/enmain.obj: MSC_CFLAGS := /Gs /Id:\f15-se2
$(BUILDDIR)/enmisc.obj: MSC_CFLAGS := /Gs /Id:\f15-se2
$(BUILDDIR)/enbrief.obj: MSC_CFLAGS := /Gs /Zi /Id:\f15-se2
$(BUILDDIR)/endbrf.obj: MSC_CFLAGS := /Gs /Id:\f15-se2
$(BUILDDIR)/eninput.obj: MSC_CFLAGS := /Gs /Id:\f15-se2
$(BUILDDIR)/enaward.obj: MSC_CFLAGS := /Gs /Id:\f15-se2
$(BUILDDIR)/enfile.obj: MSC_CFLAGS := /Gs /Id:\f15-se2
$(BUILDDIR)/enworld.obj: MSC_CFLAGS := /Gs /Os /Id:\f15-se2

# reference and target entrypoints for binary comparison
END_VRF_REF := bin/end.exe
END_VRF_REFEP := main
END_VRF_TGTEP := main

# end.exe debug build
END_DEBUG := $(DEBUGDIR)/end.exe
$(END_DEBUG): MSC_CFLAGS += /DDEBUG
END_DBG_OBJ := $(call cobj,$(DEBUGDIR),$(END_SRC)) $(call asmobj,$(DEBUGDIR),$(END_ASM)) $(DEBUGDIR)/cleanup.obj $(DEBUGDIR)/drawstr.obj $(DEBUGDIR)/textfmt.obj $(DEBUGDIR)/filepic.obj $(DEBUGDIR)/log.obj
$(END_DBG_OBJ): $(END_BASEHDR)
$(END_DBG_OBJ): ASMFLAGS += -DDEBUG
$(END_DEBUG): $(DEBUGDIR) $(END_DBG_OBJ)
	@$(DOSBUILD) link $(LINK_TOOLCHAIN) -i $(END_DBG_OBJ) -o $@ -f "$(LINKFLAGS)" -l "slibce.lib"
	@if [ -n "$(F15_TESTDIR)" ]; then \
	    echo "Copying $@ to $(F15_TESTDIR)"; \
	    cp $@ "$(F15_TESTDIR)"; \
		ls -l $(F15_TESTDIR)/end.exe; \
	fi

#
# end.exe NO_ASM build
#
END_NOASM := $(NOASMDIR)/end.exe
NOASM_END_SRC := $(END_SRC) slottram.c ovlpatch.c
NOASM_END_COBJ := $(call cobj,$(NOASMDIR),$(NOASM_END_SRC)) $(addprefix $(NOASMDIR)/,$(NOASM_SHARED_SRC:.c=.obj))
NOASM_END_OBJ := $(NOASM_END_COBJ) $(NOASMDIR)/cleanup.obj $(NOASMDIR)/drawstr.obj $(NOASMDIR)/textfmt.obj $(NOASMDIR)/filepic.obj $(NOASMDIR)/egregsh.obj
$(NOASM_END_COBJ): $(END_BASEHDR)
# /Ox breaks the timer-polled busy-waits (MSC 5.1 hoists the non-volatile poll
# out of the loop and its `volatile` is non-functional), so stay at /Gs.
$(NOASM_END_COBJ): MSC_CFLAGS := /Gs /Id:\f15-se2 /DNO_ASM /DBUGFIX
$(NOASMDIR)/slottram.obj: MSC_CFLAGS := /Gs /Ox /Id:\f15-se2 /DNO_ASM /DBUGFIX /NT EGSLOT_TEXT
$(END_NOASM): | $(NOASMDIR)
$(END_NOASM): $(NOASM_END_OBJ)
	@$(DOSBUILD) link $(LINK_TOOLCHAIN) -i $(NOASM_END_OBJ) -o $@ -f "$(LINKFLAGS)" -l "slibce.lib"
	@if [ -n "$(F15_TESTDIR)" ]; then \
	    echo "Copying $@ to $(F15_TESTDIR)"; \
	    cp $@ "$(F15_TESTDIR)"; \
		ls -l $(F15_TESTDIR)/end.exe; \
	fi

#
# unit test executable
#
TEST_EXE := $(DEBUGDIR)/test.exe
TEST_SRCS := test.c stinit.c stsprit.c strand.c stpilot.c stalloc.c stterr.c stparse.c stgen.c stdata.c
TEST_ASMS := stcode.asm stslots.asm
TEST_OBJS := $(call cobj,$(DEBUGDIR),$(TEST_SRCS)) $(call asmobj,$(DEBUGDIR),$(TEST_ASMS)) $(DEBUGDIR)/cleanup.obj $(DEBUGDIR)/drawstr.obj $(DEBUGDIR)/textfmt.obj $(DEBUGDIR)/filepic.obj $(DEBUGDIR)/log.obj
TEST_LIBS := slibce.lib

$(TEST_EXE): MSC_CFLAGS := /Gs /w /Id:\f15-se2 /DDEBUG
$(TEST_EXE): $(DEBUGDIR) $(TEST_OBJS) $(HDRS)
	@$(DOSBUILD) link $(LINK_TOOLCHAIN) -i $(TEST_OBJS) -o $@ -f "$(LINKFLAGS)" -l "$(TEST_LIBS)"

#
# example for various temporary experiments
#
HELLO_EXE := $(BUILDDIR)/hello.exe
HELLO_OBJ := $(BUILDDIR)/hello.obj
HELLO_LIB := slibce.lib

$(HELLO_OBJ): MSC_CFLAGS := /Gs /Zi
$(HELLO_EXE): LINKFLAGS := /M /I
$(HELLO_EXE): $(HELLO_OBJ)
	@$(DOSBUILD) link $(LINK_TOOLCHAIN) -i $^ -o $@ -f "$(LINKFLAGS)" -l "$(HELLO_LIB)"

#
# release zipfile for upload
#
VERSION := $(shell git describe --tags --always --dirty 2>/dev/null || echo "unknown")
RELEASE := f15_se2-$(VERSION).zip
$(RELEASE): $(MAIN_EXE) $(START_EXE) $(EGAME_EXE) $(END_EXE)
	zip $@ $^
RELEASE_NOASM := f15_se2-$(VERSION)_noasm.zip
$(RELEASE_NOASM): $(F15_NOASM) $(START_NOASM) $(EGAME_NOASM) $(END_NOASM)
	zip $@ $^
release: $(RELEASE) $(RELEASE_NOASM)

f15-se2: $(BUILDDIR) $(TOOLCHAIN_DIR) $(ASM) $(MAIN_EXE) $(START_EXE) $(EGAME_EXE) $(END_EXE)
	@if [ -n "$$F15SE2_DIR" ]; then \
		cp $(MAIN_EXE) $(START_EXE) $(EGAME_EXE) $(END_EXE) "$$F15SE2_DIR" && \
		echo "=> Successfully copied executables to $$F15SE2_DIR"; \
	else \
		echo "=> F15SE2_DIR not set, skipping deployment."; \
	fi

start: $(START_EXE)
egame: $(EGAME_EXE)
end: $(END_EXE)

noasm: $(F15_NOASM) $(START_NOASM) $(EGAME_NOASM) $(END_NOASM)
	@if [ -n "$$F15SE2_DIR" ]; then \
		cp $^ "$$F15SE2_DIR" && \
		echo "=> Successfully copied NOASM executables to $$F15SE2_DIR"; \
	else \
		echo "=> F15SE2_DIR not set, skipping NOASM deployment."; \
	fi
noasm-f15: $(F15_NOASM)
noasm-start: $(START_NOASM)
noasm-egame: $(EGAME_NOASM)
noasm-end: $(END_NOASM)

debug: $(DEBUGDIR) $(START_DEBUG) $(END_DEBUG) $(EGAME_DEBUG)
debug-start: $(DEBUGDIR) $(START_DEBUG)
debug-end: $(DEBUGDIR) $(END_DEBUG)
debug-egame: $(DEBUGDIR) $(EGAME_DEBUG)

clean:
	-rm -rf $(BUILDDIR)
	-rm -rf $(DEBUGDIR)
	-rm -rf $(NOASMDIR)

test: $(TEST_EXE)
	@$(DOSBUILD) test -i $<

f15-se2-test: $(BUILDDIR) $(MAIN_EXE)
	$(DOSTEST) $(MAIN_EXE)

$(BUILDDIR) $(DEBUGDIR) $(TOOLDIR):
	mkdir -p $@

$(TOOLCHAIN_DIR):
	@echo "Place a copy of the Microsoft C 5.1 compiler in $(TOOLCHAIN_DIR) to build" && exit 1

$(ASM):
	cd $(ASMDIR) && $(ASM_BUILD_CMD)

$(MZDIFF):
	cd $(MZRE) && ./build.sh

$(BUILDDIR)/%.obj: $(SRCDIR)/%.c $(HDRS) | $(BUILDDIR)
	@$(DOSBUILD) cc $(C_TOOLCHAIN) -i $< -o $@ -f "$(MSC_CFLAGS)"

$(DEBUGDIR)/%.obj: $(SRCDIR)/%.c $(HDRS) | $(DEBUGDIR)
	@$(DOSBUILD) cc $(C_TOOLCHAIN) -i $< -o $@ -f "$(MSC_CFLAGS)"

$(BUILDDIR)/%.obj: $(SRCDIR)/%.asm | $(BUILDDIR) $(ASM)
	$(ASM) $(ASMFLAGS) -Fo$@ $<

$(DEBUGDIR)/%.obj: $(SRCDIR)/%.asm | $(DEBUGDIR) $(ASM)
	$(ASM) $(ASMFLAGS) -Fo$@ $<
#	@$(DOSBUILD) as $(ASM_TOOLCHAIN) -i $< -o $@ -f "$(ASFLAGS)"

verify: verify-start verify-egame verify-end
verify-debug: VERIFY_FLAGS += --debug
verify-debug: verify-start

$(START_VRF_REF):
	@echo "---> Place start.exe (unpacked with tools/unp) with md5sum cf6e997ed4582cf82db6ec37d2b1a6fd into bin/"
	@exit 1

verify-start: $(MZDIFF) $(START_EXE) $(START_VRF_REF)
	$(MZDIFF) $(START_VRF_REF):$(START_VRF_REFEP) $(START_EXE):$(START_VRF_TGTEP) $(VERIFY_FLAGS) --asm $(V) --map $(START_MAP) --tmap $(START_LINKMAP)

$(EGAME_VRF_REF):
	@echo "---> Place egame.exe (unpacked with tools/unp) with md5sum ffc191b1caeafc3b6f435795f8ea868e into bin/"
	@exit 1

verify-egame: $(MZDIFF) $(EGAME_EXE) $(EGAME_VRF_REF)
	$(MZDIFF) $(EGAME_VRF_REF):$(EGAME_VRF_REFEP) $(EGAME_EXE):$(EGAME_VRF_TGTEP) $(VERIFY_FLAGS) --asm $(V) --map $(EGAME_MAP) --tmap $(EGAME_LINKMAP)

$(END_VRF_REF):
	@echo "---> Place end.exe (unpacked with tools/unlzexe) with md5sum 3b7aac9c52ca3fedefff3a8db54b5799 into bin/"
	@exit 1

verify-end: $(MZDIFF) $(END_EXE) $(END_VRF_REF)
	$(MZDIFF) $(END_VRF_REF):$(END_VRF_REFEP) $(END_EXE):$(END_VRF_TGTEP) $(VERIFY_FLAGS) --asm $(V) --map $(END_MAP) --tmap $(END_LINKMAP)

# this does not work yet because the noasm build does not use correct cflags
verify-noasm: $(MZDIFF) $(START_VRF_REF) $(EGAME_VRF_REF) $(END_VRF_REF) $(START_NOASM) $(EGAME_NOASM) $(END_NOASM)
	$(MZDIFF) $(START_VRF_REF):$(START_VRF_REFEP) $(START_NOASM):$(START_VRF_TGTEP) $(VERIFY_FLAGS) $(V) --map $(START_MAP) --tmap $(START_NOASM:.exe=.map):link
	$(MZDIFF) $(EGAME_VRF_REF):$(EGAME_VRF_REFEP) $(EGAME_NOASM):$(EGAME_VRF_TGTEP) $(VERIFY_FLAGS) $(V) --map $(EGAME_MAP) --tmap $(EGAME_NOASM:.exe=.map):link
	$(MZDIFF) $(END_VRF_REF):$(END_VRF_REFEP) $(END_NOASM):$(END_VRF_TGTEP) $(VERIFY_FLAGS) $(V) --map $(END_MAP) --tmap $(END_NOASM:.exe=.map):link

TOOLS := $(TOOLDIR)/ovltool $(TOOLDIR)/vgapal $(TOOLDIR)/wldparse
f15-tools: $(TOOLDIR) $(TOOLS)

$(TOOLDIR)/ovltool: $(SRCTOP)/ovltool.cpp
	g++ $(CXXFLAGS) -o $@ $^

$(TOOLDIR)/vgapal: $(SRCTOP)/vgapal.c
	gcc -o $@ $^

$(TOOLDIR)/wldparse: $(SRCTOP)/wldparse.cpp
	g++ -o $@ $^ -I$(SRCDIR)
