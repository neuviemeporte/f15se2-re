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
VERIFY_FLAGS := --verbose --loose --ctx 20 --asm

SRCTOP := src
SRCDIR := $(SRCTOP)
BUILDDIR := build
MAPDIR := map
DEBUGDIR := debug_build
HDRFILES := dosfunc.h output.h pointers.h offsets.h biosfunc.h comm.h overlay.h f15util.h start.h slot.h const.h struct.h debug.h
HDRS := $(addprefix $(SRCDIR)/,$(HDRFILES))

asmobj = $(addprefix $(1)/,$(2:.asm=.obj))
cobj = $(addprefix $(1)/,$(2:.c=.obj))

.PHONY: f15-se2 clean f15-se2-test verify verify-debug verify-start test reasm start-gen-asm start hello debug debug-start debug-end debug-egame tools noasm-start
all: f15-se2

#
# main executable, aka loader, replacement for f15.com and su.exe combined
#
MAIN_EXE := $(BUILDDIR)/f15.exe
MAIN_SRCS := f15.c dosfunc.c biosfunc.c output.c overlay.c f15util.c
MAIN_OBJS := $(call cobj,$(BUILDDIR),$(MAIN_SRCS))

$(MAIN_EXE): | $(BUILDDIR)
$(MAIN_EXE): $(MAIN_OBJS)
	@$(DOSBUILD) link $(LINK_TOOLCHAIN) -i $(MAIN_OBJS) -o $@ -f "$(LINKFLAGS)"

#
# start.exe reconstruction (rc)
#
START_EXE := $(BUILDDIR)/start.exe
START_MAP := $(MAPDIR)/start.map
START_LINKMAP := $(BUILDDIR)/start.map:link
START_BASE := stslots.asm
START_ASM := stcode.asm $(START_BASE)
COMMON_SRC := shared/util.c
COMMON_SRC2 := shared/util2.c
COMMON_OBJ := $(BUILDDIR)/util.obj
COMMON_OBJ2 := $(BUILDDIR)/util2.obj
START_SRC := stmain.c stinit.c stmissn.c stsprit.c strand.c stpilot.c stpinp.c stinkey.c stalloc.c stterr.c stparse.c stgrid.c stgen.c stdata.c
START_BASEHDR = $(SRCDIR)/start.h
START_COBJ := $(call cobj,$(BUILDDIR),$(START_SRC))
START_OBJ := $(START_COBJ) $(COMMON_OBJ) $(COMMON_OBJ2) $(call asmobj,$(BUILDDIR),$(START_ASM))

# reference and target entrypoints (offset of main()) for binary comparison
START_VRF_REF := bin/start.exe
START_VRF_REFEP := 0x10
START_VRF_TGTEP := [558bec83ec1c56c706]

$(START_COBJ): $(START_BASEHDR)
$(COMMON_OBJ) $(COMMON_OBJ2): $(SRCDIR)/shared/util.h
$(BUILDDIR)/util.obj: $(SRCDIR)/shared/util.c $(HDRS) | $(BUILDDIR)
	@$(DOSBUILD) cc $(C_TOOLCHAIN) -i $< -o $@ -f "$(MSC_CFLAGS)"
$(BUILDDIR)/util2.obj: $(SRCDIR)/shared/util2.c $(HDRS) | $(BUILDDIR)
	@$(DOSBUILD) cc $(C_TOOLCHAIN) -i $< -o $@ -f "$(MSC_CFLAGS)"
$(DEBUGDIR)/util.obj: $(SRCDIR)/shared/util.c $(HDRS) | $(DEBUGDIR)
	@$(DOSBUILD) cc $(C_TOOLCHAIN) -i $< -o $@ -f "$(MSC_CFLAGS)"
$(DEBUGDIR)/util2.obj: $(SRCDIR)/shared/util2.c $(HDRS) | $(DEBUGDIR)
	@$(DOSBUILD) cc $(C_TOOLCHAIN) -i $< -o $@ -f "$(MSC_CFLAGS)"
$(BUILDDIR)/util2.obj: MSC_CFLAGS := /Gs /I.. /Id:\f15-se2
$(BUILDDIR)/util.obj: MSC_CFLAGS := /Gs /Zi /I.. /Id:\f15-se2
$(DEBUGDIR)/util2.obj: MSC_CFLAGS := /Gs /w /I.. /Id:\f15-se2 /DDEBUG
$(DEBUGDIR)/util.obj: MSC_CFLAGS := /Gs /Zi /I.. /Id:\f15-se2 /DDEBUG
$(BUILDDIR)/stpilot.obj: MSC_CFLAGS := /Gs /Id:\f15-se2
$(BUILDDIR)/stpinp.obj: MSC_CFLAGS := /Gs /Id:\f15-se2
$(BUILDDIR)/stinkey.obj: MSC_CFLAGS := /Gs /Id:\f15-se2
$(BUILDDIR)/stalloc.obj: MSC_CFLAGS := /Gs /Id:\f15-se2
$(BUILDDIR)/stterr.obj: MSC_CFLAGS := /Gs /Zi /Id:\f15-se2
$(BUILDDIR)/stparse.obj: MSC_CFLAGS := /Gs /Id:\f15-se2
$(BUILDDIR)/stgrid.obj: MSC_CFLAGS := /Gs /Id:\f15-se2
$(BUILDDIR)/stmissn.obj: MSC_CFLAGS := /Gs /Zi /Id:\f15-se2
$(BUILDDIR)/stsprit.obj: MSC_CFLAGS := /Gs /Id:\f15-se2
$(BUILDDIR)/stgen.obj: MSC_CFLAGS := /Gs /Zi /Id:\f15-se2
$(BUILDDIR)/stcode.obj: MSC_CFLAGS := /Gs /Zi /Id:\f15-se2

$(START_EXE): | $(BUILDDIR)
$(START_EXE): $(START_OBJ)
	@$(DOSBUILD) link $(LINK_TOOLCHAIN) -i $(START_OBJ) -o $@ -f "$(LINKFLAGS)"

# start.exe debug build
START_DEBUG := $(DEBUGDIR)/start.exe
$(START_DEBUG): MSC_CFLAGS += /DDEBUG
$(DEBUGDIR)/stmain.obj: MSC_CFLAGS := /Gs /Zi /Id:\f15-se2 /DDEBUG /DDEBUG_AUTOSTART
START_DBG_OBJ := $(call cobj,$(DEBUGDIR),$(START_SRC)) $(call asmobj,$(DEBUGDIR),$(START_ASM)) $(DEBUGDIR)/util.obj $(DEBUGDIR)/util2.obj $(DEBUGDIR)/debug.obj
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
# start.exe NO_ASM build (pure C graphics, no overlay needed)
#
NOASMDIR := noasm_build
START_NOASM := $(NOASMDIR)/start.exe
NOASM_SRC := $(START_SRC) gfx_impl.c
NOASM_SHARED_SRC := file_io.c timer.c miscstub.c gfxstub.c picstub.c ovlstub.c
NOASM_COBJ := $(call cobj,$(NOASMDIR),$(NOASM_SRC)) $(addprefix $(NOASMDIR)/,$(NOASM_SHARED_SRC:.c=.obj))
NOASM_OBJ := $(NOASM_COBJ) $(NOASMDIR)/util.obj $(NOASMDIR)/util2.obj
$(NOASM_COBJ): $(START_BASEHDR)
$(NOASM_COBJ): MSC_CFLAGS := /Gs /Zi /Id:\f15-se2 /DNO_ASM /DBUGFIX
$(NOASMDIR)/util.obj: $(SRCDIR)/shared/util.c $(HDRS) | $(NOASMDIR)
	@$(DOSBUILD) cc $(C_TOOLCHAIN) -i $< -o $@ -f "/Gs /I.. /Id:\f15-se2 /DNO_ASM /DBUGFIX"
$(NOASMDIR)/util2.obj: $(SRCDIR)/shared/util2.c $(HDRS) | $(NOASMDIR)
	@$(DOSBUILD) cc $(C_TOOLCHAIN) -i $< -o $@ -f "/Gs /I.. /Id:\f15-se2 /DNO_ASM /DBUGFIX"
$(START_NOASM): | $(NOASMDIR)
$(START_NOASM): $(NOASM_OBJ)
	@$(DOSBUILD) link $(LINK_TOOLCHAIN) -i $(NOASM_OBJ) -o $@ -f "$(LINKFLAGS)" -l "slibce.lib"
	@if [ -n "$(F15_TESTDIR)" ]; then \
	    echo "Copying $@ to $(F15_TESTDIR)"; \
	    cp $@ "$(F15_TESTDIR)"; \
		ls -l $(F15_TESTDIR)/start.exe; \
	fi

$(NOASMDIR):
	mkdir -p $@

$(NOASMDIR)/%.obj: $(SRCDIR)/%.c $(HDRS) | $(NOASMDIR)
	@$(DOSBUILD) cc $(C_TOOLCHAIN) -i $< -o $@ -f "$(MSC_CFLAGS)"

$(NOASMDIR)/%.obj: $(SRCDIR)/shared/%.c $(HDRS) | $(NOASMDIR)
	@$(DOSBUILD) cc $(C_TOOLCHAIN) -i $< -o $@ -f "/Gs /Zi /I.. /Id:\f15-se2 /DNO_ASM /DBUGFIX"

$(NOASMDIR)/%.obj: $(SRCDIR)/%.asm | $(NOASMDIR)
	$(ASM) $(ASMFLAGS) -Fo$@ $<

noasm-start: $(START_NOASM)

#
# egame.exe reconstruction (rc)
#
EGAME_EXE := $(BUILDDIR)/egame.exe
EGAME_MAP := $(MAPDIR)/egame.map
EGAME_LINKMAP := $(BUILDDIR)/egame.map:link
EGAME_BASE := egame_rc.asm
EGAME_ASM := $(EGAME_BASE) egfarbu2.asm egseg3.asm egseg2.asm egseg1.asm
EGAME_SRC := egmain.c eg3d_a.c eg3d_b.c eg3d_c.c eg3d_d.c eg3d_e.c eg3d_f.c eg3d_g.c eghud.c egflight.c egtacmap.c egui.c egwaypt.c egmath.c egweap.c egfileio.c egpic.c egfarbuf.c
EGAME_BASEHDR = $(SRCDIR)/egame.h
EGAME_COBJ := $(call cobj,$(BUILDDIR),$(EGAME_SRC))
EGAME_OBJ := $(EGAME_COBJ) $(call asmobj,$(BUILDDIR),$(EGAME_ASM))
$(EGAME_EXE): | $(BUILDDIR)
$(EGAME_EXE): $(EGAME_OBJ)
	@$(DOSBUILD) link $(LINK_TOOLCHAIN) -i $(EGAME_OBJ) -o $@ -f "$(LINKFLAGS)" -l "slibce.lib"

$(EGAME_COBJ): $(EGAME_BASEHDR)
$(BUILDDIR)/egmain.obj: MSC_CFLAGS := /Gs /Zi /Id:\f15-se2
$(BUILDDIR)/eg3d_b.obj: MSC_CFLAGS := /Gs /Zi /Id:\f15-se2
$(BUILDDIR)/eg3d_c.obj: MSC_CFLAGS := /Gs /Zi /Id:\f15-se2
$(BUILDDIR)/eg3d_d.obj: MSC_CFLAGS := /Gs /Zi /Id:\f15-se2
$(BUILDDIR)/eg3d_f.obj: MSC_CFLAGS := /Gs /Zi /Ot /Id:\f15-se2
$(BUILDDIR)/eghud.obj: MSC_CFLAGS := /Gs /Zi /Id:\f15-se2
$(BUILDDIR)/egtacmap.obj: MSC_CFLAGS := /Gs /Zi /Id:\f15-se2
$(BUILDDIR)/egwaypt.obj: MSC_CFLAGS := /Gs /Zi /Id:\f15-se2
$(BUILDDIR)/egweap.obj: MSC_CFLAGS := /Gs /Zi /Id:\f15-se2
$(BUILDDIR)/eg3d_a.obj: MSC_CFLAGS := /Gs /Id:\f15-se2
$(BUILDDIR)/eg3d_e.obj: MSC_CFLAGS := /Gs /Id:\f15-se2
$(BUILDDIR)/eg3d_g.obj: MSC_CFLAGS := /Gs /Id:\f15-se2
$(BUILDDIR)/egflight.obj: MSC_CFLAGS := /Gs /Id:\f15-se2
$(BUILDDIR)/egui.obj: MSC_CFLAGS := /Gs /Id:\f15-se2
$(BUILDDIR)/egmath.obj: MSC_CFLAGS := /Gs /Id:\f15-se2
$(BUILDDIR)/egfileio.obj: MSC_CFLAGS := /Gs /Id:\f15-se2
$(BUILDDIR)/egpic.obj: MSC_CFLAGS := /Od /Id:\f15-se2
$(DEBUGDIR)/egpic.obj: MSC_CFLAGS := /Gs /Os /Id:\f15-se2 /DDEBUG

# reference and target entrypoints (offset of main()) for binary comparison
EGAME_VRF_REF := bin/egame.exe
EGAME_VRF_REFEP := 0x10
EGAME_VRF_TGTEP := [558bec83ec??c746]

# egame.exe debug build
EGAME_DEBUG := $(DEBUGDIR)/egame.exe
# Disable /Zi globally for debug egame to keep _TEXT under 64K
# DBG_DEFS: extra debug-only defines. /DDISABLE_3D skips the 3D world
# renderer (see sub_155AB) so 2D/HUD/radar render continuously.
# Set DBG_DEFS=/DDISABLE_3D on the make command line to disable 3D.
DBG_DEFS ?=
$(EGAME_DEBUG): MSC_CFLAGS := /Gs /Id:\f15-se2 /DDEBUG $(DBG_DEFS)
EGAME_DBG_OBJ := $(call asmobj,$(DEBUGDIR),$(EGAME_ASM)) $(call cobj,$(DEBUGDIR),$(EGAME_SRC)) $(DEBUGDIR)/dbglite.obj $(DEBUGDIR)/dbgio.obj
$(EGAME_DBG_OBJ): $(EGAME_BASEHDR)
$(EGAME_DBG_OBJ): ASMFLAGS += -DDEBUG
# Compile largest C files with /Os in debug to stay under 64K _TEXT limit
$(DEBUGDIR)/eghud.obj: MSC_CFLAGS := /Gs /Os /Id:\f15-se2 /DDEBUG $(DBG_DEFS)
$(DEBUGDIR)/egweap.obj: MSC_CFLAGS := /Gs /Os /Id:\f15-se2 /DDEBUG $(DBG_DEFS)
$(DEBUGDIR)/egmain.obj: MSC_CFLAGS := /Gs /Os /Id:\f15-se2 /DDEBUG $(DBG_DEFS)
$(EGAME_DEBUG): $(DEBUGDIR) $(EGAME_DBG_OBJ)
	@$(DOSBUILD) link $(LINK_TOOLCHAIN) -i $(EGAME_DBG_OBJ) -o $@ -f "$(LINKFLAGS)" -l "slibce.lib"
	@if [ -n "$(F15_TESTDIR)" ]; then \
	    echo "Copying $@ to $(F15_TESTDIR)"; \
	    cp $@ "$(F15_TESTDIR)"; \
		ls -l $(F15_TESTDIR)/egame.exe; \
	fi

#
# end.exe reconstruction (rc)
#
END_EXE := $(BUILDDIR)/end.exe
END_MAP := $(MAPDIR)/end.map
END_LINKMAP := $(BUILDDIR)/end.map:link
END_BASE := endslots.asm
END_ASM := endcode.asm $(END_BASE)
END_SRC := enmain.c enworld.c eninput.c entext.c enaward.c enbrief.c endbrf.c enfile.c end_data.c
END_BASEHDR = $(SRCDIR)/end.h
END_COBJ := $(call cobj,$(BUILDDIR),$(END_SRC))
END_OBJ := $(END_COBJ) $(COMMON_OBJ) $(COMMON_OBJ2) $(call asmobj,$(BUILDDIR),$(END_ASM))
$(END_COBJ): $(END_BASEHDR)
$(END_EXE): | $(BUILDDIR)
$(END_EXE): $(END_OBJ)
	@$(DOSBUILD) link $(LINK_TOOLCHAIN) -i $(END_OBJ) -o $@ -f "$(LINKFLAGS)"

$(END_COBJ): $(END_BASEHDR)
$(BUILDDIR)/enmain.obj: MSC_CFLAGS := /Gs /Id:\f15-se2
$(BUILDDIR)/enbrief.obj: MSC_CFLAGS := /Gs /Zi /Id:\f15-se2
$(BUILDDIR)/endbrf.obj: MSC_CFLAGS := /Gs /Id:\f15-se2
$(BUILDDIR)/eninput.obj: MSC_CFLAGS := /Gs /Id:\f15-se2
$(BUILDDIR)/enaward.obj: MSC_CFLAGS := /Gs /Id:\f15-se2
$(BUILDDIR)/enfile.obj: MSC_CFLAGS := /Gs /Id:\f15-se2
$(BUILDDIR)/enworld.obj: MSC_CFLAGS := /Gs /Os /Id:\f15-se2

# reference and target entrypoints for binary comparison
END_VRF_REF := bin/end.exe
END_VRF_REFEP := 0x10
END_VRF_TGTEP := [558bec83ec0e56c746]

# end.exe debug build
END_DEBUG := $(DEBUGDIR)/end.exe
$(END_DEBUG): MSC_CFLAGS += /DDEBUG
END_DBG_OBJ := $(call cobj,$(DEBUGDIR),$(END_SRC)) $(call asmobj,$(DEBUGDIR),$(END_ASM)) $(DEBUGDIR)/util.obj $(DEBUGDIR)/util2.obj $(DEBUGDIR)/debug.obj
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
# end.exe NO_ASM build (pure C graphics, no overlay needed)
#
END_NOASM := $(NOASMDIR)/end.exe
NOASM_END_SRC := $(END_SRC) gfx_impl.c
NOASM_END_COBJ := $(call cobj,$(NOASMDIR),$(NOASM_END_SRC)) $(addprefix $(NOASMDIR)/,$(NOASM_SHARED_SRC:.c=.obj))
NOASM_END_OBJ := $(NOASM_END_COBJ) $(NOASMDIR)/util.obj $(NOASMDIR)/util2.obj
$(NOASM_END_COBJ): $(END_BASEHDR)
$(NOASM_END_COBJ): MSC_CFLAGS := /Gs /Zi /Id:\f15-se2 /DNO_ASM /DBUGFIX
$(END_NOASM): | $(NOASMDIR)
$(END_NOASM): $(NOASM_END_OBJ)
	@$(DOSBUILD) link $(LINK_TOOLCHAIN) -i $(NOASM_END_OBJ) -o $@ -f "$(LINKFLAGS)" -l "slibce.lib"
	@if [ -n "$(F15_TESTDIR)" ]; then \
	    echo "Copying $@ to $(F15_TESTDIR)"; \
	    cp $@ "$(F15_TESTDIR)"; \
		ls -l $(F15_TESTDIR)/end.exe; \
	fi

noasm-end: $(END_NOASM)

#
# unit test executable
#
TEST_EXE := $(DEBUGDIR)/test.exe
TEST_SRCS := test.c stinit.c stmissn.c stsprit.c strand.c stpilot.c stpinp.c stinkey.c stalloc.c stterr.c stparse.c stgrid.c stgen.c stdata.c
TEST_ASMS := stcode.asm stslots.asm
TEST_OBJS := $(call cobj,$(DEBUGDIR),$(TEST_SRCS)) $(call asmobj,$(DEBUGDIR),$(TEST_ASMS)) $(DEBUGDIR)/util.obj $(DEBUGDIR)/util2.obj $(DEBUGDIR)/debug.obj
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

f15-se2: $(BUILDDIR) $(TOOLCHAIN_DIR) $(ASM) $(MAIN_EXE) $(START_EXE) $(EGAME_EXE) $(END_EXE)

start: $(START_EXE)
egame: $(EGAME_EXE)
end: $(END_EXE)

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

hello: $(HELLO_EXE)
	ls -l $^
	md5sum $^
	touch src/hello.c
	tools/disasm.sh $^ | less

f15-se2-test: $(BUILDDIR) $(MAIN_EXE)
	$(DOSTEST) $(MAIN_EXE)

$(BUILDDIR) $(DEBUGDIR) $(TOOLDIR):
	mkdir -p $@

$(TOOLCHAIN_DIR):
	@echo "Place a copy of the Microsoft C 5.1 compiler in $(TOOLCHAIN_DIR) to build" && exit 1

$(ASM): $(ASMDIR)/Makefile
	cd $(ASMDIR) && $(ASM_BUILD_CMD)

$(ASMDIR)/Makefile:
	git submodule init
	git submodule update

$(MZDIFF):
	cd $(MZRE) && ./build.sh

$(BUILDDIR)/%.obj: $(SRCDIR)/%.c $(HDRS) | $(BUILDDIR)
	@$(DOSBUILD) cc $(C_TOOLCHAIN) -i $< -o $@ -f "$(MSC_CFLAGS)"

$(DEBUGDIR)/%.obj: $(SRCDIR)/%.c $(HDRS) | $(DEBUGDIR)
	@$(DOSBUILD) cc $(C_TOOLCHAIN) -i $< -o $@ -f "$(MSC_CFLAGS)"

$(BUILDDIR)/%.obj: $(SRCDIR)/%.asm | $(BUILDDIR)
	$(ASM) $(ASMFLAGS) -Fo$@ $<

$(DEBUGDIR)/%.obj: $(SRCDIR)/%.asm | $(DEBUGDIR)
	$(ASM) $(ASMFLAGS) -Fo$@ $<
#	@$(DOSBUILD) as $(ASM_TOOLCHAIN) -i $< -o $@ -f "$(ASFLAGS)"

reasm: $(STARTRE_EXE)

verify: verify-start verify-egame verify-end
verify-debug: VERIFY_FLAGS += --debug
verify-debug: verify-start

$(START_VRF_REF):
	@echo "---> Place start.exe (unpacked with tools/unp) with md5sum cf6e997ed4582cf82db6ec37d2b1a6fd into bin/"
	@exit 1

verify-start: $(MZDIFF) $(START_EXE) $(START_VRF_REF)
	$(MZDIFF) $(START_VRF_REF):$(START_VRF_REFEP) $(START_EXE):$(START_VRF_TGTEP) $(VERIFY_FLAGS) --map $(START_MAP) --tmap $(START_LINKMAP) --asm

$(EGAME_VRF_REF):
	@echo "---> Place egame.exe (unpacked with tools/unp) with md5sum ffc191b1caeafc3b6f435795f8ea868e into bin/"
	@exit 1

verify-egame: $(MZDIFF) $(EGAME_EXE) $(EGAME_VRF_REF)
	$(MZDIFF) $(EGAME_VRF_REF):$(EGAME_VRF_REFEP) $(EGAME_EXE):$(EGAME_VRF_TGTEP) $(VERIFY_FLAGS) --map $(EGAME_MAP) --tmap $(EGAME_LINKMAP)

$(END_VRF_REF):
	@echo "---> Place end.exe (unpacked with tools/unlzexe) with md5sum 3b7aac9c52ca3fedefff3a8db54b5799 into bin/"
	@exit 1

verify-end: $(MZDIFF) $(END_EXE) $(END_VRF_REF)
	$(MZDIFF) $(END_VRF_REF):$(END_VRF_REFEP) $(END_EXE):$(END_VRF_TGTEP) $(VERIFY_FLAGS) --map $(END_MAP) --tmap $(END_LINKMAP)

TOOLS := $(TOOLDIR)/ovltool $(TOOLDIR)/vgapal $(TOOLDIR)/wldparse
f15-tools: $(TOOLDIR) $(TOOLS)

$(TOOLDIR)/ovltool: $(SRCTOP)/ovltool.cpp
	g++ $(CXXFLAGS) -o $@ $^

$(TOOLDIR)/vgapal: $(SRCTOP)/vgapal.c
	gcc -o $@ $^

$(TOOLDIR)/wldparse: $(SRCTOP)/wldparse.cpp
	g++ -o $@ $^ -I$(SRCDIR)
