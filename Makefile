MZRE := mzretools
MZRETOOLDIR := $(MZRE)/tools
DOSBUILD := $(MZRETOOLDIR)/dosbuild.sh
DOSTEST := $(MZRETOOLDIR)/test.sh
DISASM := $(MZRETOOLDIR)/disasm.sh
UASMDIR := UASM
UASM := $(UASMDIR)/GccUnixR/uasm
MZDIFF := $(MZRE)/debug/mzdiff
MZHDR := $(MZRE)/debug/mzhdr
REASMDIR := reasm
CONFDIR := conf
TOOLDIR := tools
CXXFLAGS := -Wfatal-errors
# UASM: no copyright into, 8086 instuctions, MASM compatibility
UASMFLAGS := -q -0 -Zm
# DOS C compiler: no stack probes, debug mode
C_TOOLCHAIN ?= msc510
MSC_CFLAGS ?= /Gs /Zi /Id:\f15-se2
# DOS assembler
ASM_TOOLCHAIN ?= masm510
# masm: suppress output in case of successful assembly
ASFLAGS := /t
# DOS linker
LINK_TOOLCHAIN ?= msc510
# ms link: verbose, create mapfile, no default libs
LINKFLAGS := /M /I
DOSDIR := dos
TOOLCHAIN_DIR := $(DOSDIR)/$(C_TOOLCHAIN)
VERIFY_FLAGS := --verbose --loose --ctx 20 --asm

SRCTOP := src
SRCDIR := $(SRCTOP)
BUILDDIR := build
DEBUGDIR := debug_build
HDRFILES := dosfunc.h output.h pointers.h offsets.h biosfunc.h comm.h overlay.h f15util.h start.h slot.h const.h struct.h debug.h
HDRS := $(addprefix $(SRCDIR)/,$(HDRFILES))

asmobj = $(addprefix $(1)/,$(2:.asm=.obj))
cobj = $(addprefix $(1)/,$(2:.c=.obj))

.PHONY: f15-se2 clean f15-se2-test verify verify-debug verify-start test reasm start-gen-asm start hello debug debug-end debug-egame tools
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
START_CONF := $(CONFDIR)/start_rc.json
START_BASE := start_rc.asm
START_ASM := start4.asm $(START_BASE)
COMMON_SRC := shared/util.c
COMMON_SRC2 := shared/util2.c
COMMON_OBJ := $(BUILDDIR)/util.obj
COMMON_OBJ2 := $(BUILDDIR)/util2.obj
START_SRC := start0.c start1.c start2.c start3.c startdat.c
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
$(BUILDDIR)/start2.obj: MSC_CFLAGS := /Gs /Id:\f15-se2
$(BUILDDIR)/start4.obj: MSC_CFLAGS := /Gs /Zi /Id:\f15-se2

$(START_EXE): | $(BUILDDIR)
$(START_EXE): $(START_OBJ)
	@$(DOSBUILD) link $(LINK_TOOLCHAIN) -i $(START_OBJ) -o $@ -f "$(LINKFLAGS)"

# start.exe debug build
START_DEBUG := $(DEBUGDIR)/start.exe
$(START_DEBUG): MSC_CFLAGS += /DDEBUG
START_DBG_OBJ := $(call cobj,$(DEBUGDIR),$(START_SRC)) $(call asmobj,$(DEBUGDIR),$(START_ASM)) $(DEBUGDIR)/util.obj $(DEBUGDIR)/util2.obj $(DEBUGDIR)/debug.obj
$(START_DBG_OBJ): $(START_BASEHDR)
$(START_DBG_OBJ): UASMFLAGS += -DDEBUG
$(START_DEBUG): $(DEBUGDIR) $(START_DBG_OBJ)
	@$(DOSBUILD) link $(LINK_TOOLCHAIN) -i $(START_DBG_OBJ) -o $@ -f "$(LINKFLAGS)" -l "slibce.lib"
	@if [ -n "$(F15_TESTDIR)" ]; then \
	    echo "Copying $@ to $(F15_TESTDIR)"; \
	    cp $@ "$(F15_TESTDIR)"; \
		ls -l $(F15_TESTDIR)/start.exe; \
	fi

#
# egame.exe reconstruction (rc)
#
EGAME_EXE := $(BUILDDIR)/egame.exe
EGAME_CONF := $(CONFDIR)/egame_rc.json
EGAME_BASE := egame_rc.asm
EGAME_ASM := $(EGAME_BASE)
EGAME_SRC := egame0.c egame1.c egame1b.c egame2.c egame3.c egame4.c egame6.c
EGAME_BASEHDR = $(SRCDIR)/egame.h
EGAME_COBJ := $(call cobj,$(BUILDDIR),$(EGAME_SRC))
EGAME_OBJ := $(EGAME_COBJ) $(call asmobj,$(BUILDDIR),$(EGAME_ASM))
$(EGAME_COBJ): $(EGAME_BASEHDR)
$(EGAME_EXE): | $(BUILDDIR)
$(EGAME_EXE): $(EGAME_OBJ)
	@$(DOSBUILD) link $(LINK_TOOLCHAIN) -i $(EGAME_OBJ) -o $@ -f "$(LINKFLAGS)" -l "slibce.lib"

$(EGAME_COBJ): $(EGAME_BASEHDR)
$(BUILDDIR)/egame1b.obj: MSC_CFLAGS := /Gs /Zi /Ot /Id:\f15-se2
$(BUILDDIR)/egame2.obj: MSC_CFLAGS := /Gs /Id:\f15-se2
$(BUILDDIR)/egame3.obj: MSC_CFLAGS := /Od /Id:\f15-se2

# reference and target entrypoints (offset of main()) for binary comparison
EGAME_VRF_REF := bin/egame.exe
EGAME_VRF_REFEP := 0x10
EGAME_VRF_TGTEP := [558bec83ec??c746]

# egame.exe debug build
EGAME_DEBUG := $(DEBUGDIR)/egame.exe
$(EGAME_DEBUG): MSC_CFLAGS += /DDEBUG
EGAME_DBG_OBJ := $(call asmobj,$(DEBUGDIR),$(EGAME_ASM)) $(call cobj,$(DEBUGDIR),$(EGAME_SRC)) $(DEBUGDIR)/dbglite.obj $(DEBUGDIR)/dbgio.obj
$(EGAME_DBG_OBJ): $(EGAME_BASEHDR)
$(EGAME_DBG_OBJ): UASMFLAGS += -DDEBUG
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
END_BASE := end_rc.asm
END_ASM := $(END_BASE)
END_SRC := end0.c end1.c end2.c end3.c end_data.c
END_BASEHDR = $(SRCDIR)/end.h
END_COBJ := $(call cobj,$(BUILDDIR),$(END_SRC))
END_OBJ := $(END_COBJ) $(COMMON_OBJ) $(COMMON_OBJ2) $(call asmobj,$(BUILDDIR),$(END_ASM))
$(END_COBJ): $(END_BASEHDR)
$(END_EXE): | $(BUILDDIR)
$(END_EXE): $(END_OBJ)
	@$(DOSBUILD) link $(LINK_TOOLCHAIN) -i $(END_OBJ) -o $@ -f "$(LINKFLAGS)"

$(END_COBJ): $(END_BASEHDR)
$(BUILDDIR)/end1.obj: MSC_CFLAGS := /Gs /Id:\f15-se2
$(BUILDDIR)/end2.obj: MSC_CFLAGS := /Od /Id:\f15-se2
$(BUILDDIR)/end3.obj: MSC_CFLAGS := /Gs /Os /Id:\f15-se2

# reference and target entrypoints for binary comparison
END_VRF_REF := bin/end.exe
END_VRF_REFEP := 0x10
END_VRF_TGTEP := [558bec83ec0e56c746]

# end.exe debug build
END_DEBUG := $(DEBUGDIR)/end.exe
$(END_DEBUG): MSC_CFLAGS += /DDEBUG
END_DBG_OBJ := $(call cobj,$(DEBUGDIR),$(END_SRC)) $(call asmobj,$(DEBUGDIR),$(END_ASM)) $(DEBUGDIR)/util.obj $(DEBUGDIR)/util2.obj $(DEBUGDIR)/debug.obj
$(END_DBG_OBJ): $(END_BASEHDR)
$(END_DBG_OBJ): UASMFLAGS += -DDEBUG
$(END_DEBUG): $(DEBUGDIR) $(END_DBG_OBJ)
	@$(DOSBUILD) link $(LINK_TOOLCHAIN) -i $(END_DBG_OBJ) -o $@ -f "$(LINKFLAGS)" -l "slibce.lib"
	@if [ -n "$(F15_TESTDIR)" ]; then \
	    echo "Copying $@ to $(F15_TESTDIR)"; \
	    cp $@ "$(F15_TESTDIR)"; \
		ls -l $(F15_TESTDIR)/end.exe; \
	fi

#
# unit test executable
#
TEST_EXE := $(DEBUGDIR)/test.exe
TEST_SRCS := test.c start1.c start2.c start3.c startdat.c
TEST_ASMS := start4.asm start_rc.asm
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

f15-se2: $(BUILDDIR) $(TOOLCHAIN_DIR) $(UASM) $(MAIN_EXE) $(START_EXE) $(EGAME_EXE) $(END_EXE)

start: $(START_EXE)
egame: $(EGAME_EXE)
end: $(END_EXE)

debug: $(DEBUGDIR) $(START_DEBUG) $(END_DEBUG) $(EGAME_DEBUG)
debug-end: $(DEBUGDIR) $(END_DEBUG)
debug-egame: $(DEBUGDIR) $(EGAME_DEBUG)

clean:
	-rm -rf $(BUILDDIR)
	-rm -rf $(DEBUGDIR)

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

$(UASM): $(UASMDIR)/Makefile
	cd $(UASMDIR) && make -j

$(UASMDIR)/Makefile:
	git submodule init
	git submodule update	

$(MZDIFF):
	cd $(MZRE) && ./build.sh

$(BUILDDIR)/%.obj: $(SRCDIR)/%.c $(HDRS) | $(BUILDDIR)
	@$(DOSBUILD) cc $(C_TOOLCHAIN) -i $< -o $@ -f "$(MSC_CFLAGS)"

$(DEBUGDIR)/%.obj: $(SRCDIR)/%.c $(HDRS) | $(DEBUGDIR)
	@$(DOSBUILD) cc $(C_TOOLCHAIN) -i $< -o $@ -f "$(MSC_CFLAGS)"

$(BUILDDIR)/%.obj: $(SRCDIR)/%.asm | $(BUILDDIR)
	$(UASM) $(UASMFLAGS) -Fo$@ $<

$(DEBUGDIR)/%.obj: $(SRCDIR)/%.asm | $(DEBUGDIR)
	$(UASM) $(UASMFLAGS) -Fo$@ $<
#	@$(DOSBUILD) as $(ASM_TOOLCHAIN) -i $< -o $@ -f "$(ASFLAGS)"

reasm: $(STARTRE_EXE)

verify: verify-start verify-egame verify-end
verify-debug: VERIFY_FLAGS += --debug
verify-debug: verify-start

$(START_VRF_REF):
	@echo "---> Place start.exe (unpacked with tools/unp) with md5sum cf6e997ed4582cf82db6ec37d2b1a6fd into bin/"
	@exit 1

verify-start: $(MZDIFF) $(START_EXE) $(START_VRF_REF)
	$(MZDIFF) $(START_VRF_REF):$(START_VRF_REFEP) $(START_EXE):$(START_VRF_TGTEP) $(VERIFY_FLAGS) --map map/start.map --asm

$(EGAME_VRF_REF):
	@echo "---> Place egame.exe (unpacked with tools/unp) with md5sum ffc191b1caeafc3b6f435795f8ea868e into bin/"
	@exit 1

verify-egame: $(MZDIFF) $(EGAME_EXE) $(EGAME_VRF_REF)
	$(MZDIFF) $(EGAME_VRF_REF):$(EGAME_VRF_REFEP) $(EGAME_EXE):$(EGAME_VRF_TGTEP) $(VERIFY_FLAGS) --map map/egame.map

$(END_VRF_REF):
	@echo "---> Place end.exe (unpacked with tools/unlzexe) with md5sum 3b7aac9c52ca3fedefff3a8db54b5799 into bin/"
	@exit 1

verify-end: $(MZDIFF) $(END_EXE) $(END_VRF_REF)
	$(MZDIFF) $(END_VRF_REF):$(END_VRF_REFEP) $(END_EXE):$(END_VRF_TGTEP) $(VERIFY_FLAGS) --map map/end.map

TOOLS := $(TOOLDIR)/ovltool $(TOOLDIR)/vgapal $(TOOLDIR)/wldparse
f15-tools: $(TOOLDIR) $(TOOLS)

$(TOOLDIR)/ovltool: $(SRCTOP)/ovltool.cpp
	g++ $(CXXFLAGS) -o $@ $^

$(TOOLDIR)/vgapal: $(SRCTOP)/vgapal.c
	gcc -o $@ $^

$(TOOLDIR)/wldparse: $(SRCTOP)/wldparse.cpp
	g++ -o $@ $^ -I$(SRCDIR)
