MZRE := mzretools
MZRETOOLDIR := $(MZRE)/tools
LST2ASM := $(MZRETOOLDIR)/lst2asm.py
LST2CH := $(MZRETOOLDIR)/lst2ch.py
DOSBUILD := $(MZRETOOLDIR)/dosbuild.sh
DOSTEST := $(MZRETOOLDIR)/test.sh
DISASM := $(MZRETOOLDIR)/disasm.sh
UASMDIR := UASM
UASM := $(UASMDIR)/GccUnixR/uasm
MZDIFF := $(MZRE)/debug/mzdiff
MZHDR := $(MZRE)/debug/mzhdr
LSTDIR := lst
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

SRCTOP := src
SRCDIR := $(SRCTOP)
BUILDDIR := build
DEBUGDIR := debug_build
HDRFILES := dosfunc.h output.h pointers.h offsets.h biosfunc.h comm.h overlay.h util.h start.h slot.h const.h struct.h debug.h
HDRS := $(addprefix $(SRCDIR)/,$(HDRFILES))

asmobj = $(addprefix $(1)/,$(2:.asm=.obj))
cobj = $(addprefix $(1)/,$(2:.c=.obj))

.PHONY: f15-se2 clean f15-se2-test verify verify-debug verify-start test reasm start-gen-asm start hello debug tools
all: f15-se2

#
# main executable, aka loader, replacement for f15.com and su.exe combined
#
MAIN_EXE := $(BUILDDIR)/f15.exe
MAIN_SRCS := f15.c dosfunc.c biosfunc.c output.c overlay.c util.c
MAIN_OBJS := $(call cobj,$(BUILDDIR),$(MAIN_SRCS))

$(MAIN_EXE): $(MAIN_OBJS)
	@$(DOSBUILD) link $(LINK_TOOLCHAIN) -i $^ -o $@ -f "$(LINKFLAGS)"

#
# start.exe reconstruction (rc)
#
START_EXE := $(BUILDDIR)/start.exe
START_LST := $(LSTDIR)/start.lst
START_INC := $(LSTDIR)/start.inc
START_CONF := $(CONFDIR)/start_rc.json
START_BASE := start_rc.asm
START_ASM := start4.asm $(START_BASE)
START_SRC := start0.c start1.c start2.c start3.c
START_BASEHDR = $(SRCDIR)/start.h
START_COBJ := $(call cobj,$(BUILDDIR),$(START_SRC))
START_OBJ := $(START_COBJ) $(call asmobj,$(BUILDDIR),$(START_ASM))

# reference and target entrypoints (offset of main()) for binary comparison
START_VRF_REF := bin/start.exe
START_VRF_REFEP := 0x10
START_VRF_TGTEP := [558bec83ec1c56c706]

$(START_LST) $(START_INC): $(MZRETOOLDIR) $(LSTDIR)
	touch $@

# generate C header file from ida listing
$(START_BASEHDR): $(START_LST) $(START_INC) $(START_CONF) $(LST2CH)
	$(LST2CH) $< $(SRCDIR) $(START_CONF) --noc

# generate assembly for base object from ida listing
$(SRCDIR)/$(START_BASE): $(START_LST) $(START_INC) $(START_CONF) $(LST2ASM)
	$(LST2ASM) $< $@ $(START_CONF) --noproc --nopreserve

$(START_COBJ): $(START_BASEHDR)
$(BUILDDIR)/start2.obj: MSC_CFLAGS := /Gs /Id:\f15-se2
$(BUILDDIR)/start4.obj: MSC_CFLAGS := /Gs /Zi /Id:\f15-se2

$(START_EXE): $(START_OBJ)
	@$(DOSBUILD) link $(LINK_TOOLCHAIN) -i $^ -o $@ -f "$(LINKFLAGS)"

# start.exe debug build
START_DEBUG := $(DEBUGDIR)/start.exe
START_DBG_OBJ := $(call cobj,$(DEBUGDIR),$(START_SRC)) $(call asmobj,$(DEBUGDIR),$(START_ASM))
$(START_DBG_OBJ): $(START_BASEHDR)
$(START_DEBUG): MSC_CFLAGS += /DDEBUG
$(START_DEBUG): UASMFLAGS += -DDEBUG
$(START_DEBUG): $(START_DBG_OBJ)
	@$(DOSBUILD) link $(LINK_TOOLCHAIN) -i $^ -o $@ -f "$(LINKFLAGS)"

#
# start.exe reassembly (re)
#
STARTRE_EXE := $(BUILDDIR)/start_re.exe
STARTRE_CONF := $(CONFDIR)/start_re_conf.py
STARTRE_ASM := $(SRCDIR)/start_re.asm
STARTRE_OBJ := $(BUILDDIR)/start_re.obj

# the reassembly file is created from the IDA listing file by the Python cleanup/tweak script
$(STARTRE_ASM): $(START_LST) $(STARTRE_CONF) $(LST2ASM)
	$(LST2ASM) $^ $@ $(STARTRE_CONF)

$(STARTRE_EXE): UASMFLAGS += -Sp=1 -nt=startCode1
$(STARTRE_EXE): $(STARTRE_OBJ)
	@$(DOSBUILD) link $(LINK_TOOLCHAIN) -i $^ -o $@ -f "$(LINKFLAGS)"
	$(DISASM) $@ > $(REASMDIR)/start_re.dis
	$(MZHDR) $@ > $(REASMDIR)/start_re_hdr.txt
	xxd -o -$$((1024+0x6b50)) -s $$((1024+0x6b50)) $@ > $(REASMDIR)/start_re_data.hex
	xxd -o -$$((`$(MZHDR) $@ -l`)) -s $$((`$(MZHDR) $@ -l`)) $@ > $(REASMDIR)/start_re.hex
	diff -q $(REASMDIR)/start.hex $(REASMDIR)/start_re.hex

#
# unit test executable
#
TEST_EXE := $(DEBUGDIR)/test.exe
TEST_SRCS := test.c start1.c start2.c start3.c
TEST_ASMS := start4.asm start_rc.asm
TEST_OBJS := $(call cobj,$(DEBUGDIR),$(TEST_SRCS)) $(call asmobj,$(DEBUGDIR),$(TEST_ASMS))
TEST_LIBS := slibce.lib

$(TEST_EXE): MSC_CFLAGS := /Gs /w /Id:\f15-se2 /DDEBUG
$(TEST_EXE): $(TEST_OBJS) $(HDRS)
	@$(DOSBUILD) link $(LINK_TOOLCHAIN) -i $(TEST_OBJS) -o $@ -f "$(LINKFLAGS)" -l "$(TEST_LIBS)"

#
# example for various temporary experiments
#
HELLO_EXE := $(BUILDDIR)/hello.exe
HELLO_OBJ := $(BUILDDIR)/hello.obj
HELLO_LIB := slibce.lib

$(HELLO_OBJ): MSC_CFLAGS := /Gs /Ol
$(HELLO_EXE): LINKFLAGS := /M /I /NOD /NOE
$(HELLO_EXE): $(HELLO_OBJ)
	@$(DOSBUILD) link $(LINK_TOOLCHAIN) -i $^ -o $@ -f "$(LINKFLAGS)" -l "$(HELLO_LIB)"

f15-se2: $(BUILDDIR) $(TOOLCHAIN_DIR) $(UASM) $(MAIN_EXE) $(START_EXE) $(TEST_EXE)

start: $(START_EXE)

debug: $(DEBUGDIR) $(START_DEBUG)
	cp $(START_DEBUG) ../bin/03_test/start.exe

clean:
	-rm -rf $(BUILDDIR)/*
	-rm -rf $(DEBUGDIR)/*
	-rm $(START_BASEHDR)
	-touch $(START_LST)

test: $(TEST_EXE)
	@$(DOSBUILD) test -i $<

hello: $(HELLO_EXE)
	ls -l $^
	md5sum $^
	touch src/hello.c
	tools/disasm.sh $^ | less

f15-se2-test: $(BUILDDIR) $(MAIN_EXE)
	$(DOSTEST) $(MAIN_EXE)

$(BUILDDIR) $(DEBUGDIR) $(LSTDIR) $(TOOLDIR):
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

$(DEBUGDIR)/%.obj $(BUILDDIR)/%.obj: $(SRCDIR)/%.c $(HDRS)
	@$(DOSBUILD) cc $(C_TOOLCHAIN) -i $< -o $@ -f "$(MSC_CFLAGS)"

$(DEBUGDIR)/%.obj $(BUILDDIR)/%.obj: $(SRCDIR)/%.asm
	$(UASM) $(UASMFLAGS) -Fo$@ $<
#	@$(DOSBUILD) as $(ASM_TOOLCHAIN) -i $< -o $@ -f "$(ASFLAGS)"

reasm: $(STARTRE_EXE)

# skip libc routines (which start with an underscore in the map), and overlay slot pseudofunctions in the comparison
VERIFY_FLAGS := --loose --ctx 30

verify: VERIFY_FLAGS += --verbose
verify: verify-start

verify-debug: VERIFY_FLAGS += --debug
verify-debug: verify-start

$(START_VRF_REF):
	@echo "---> Place start.exe with md5sum cf6e997ed4582cf82db6ec37d2b1a6fd into bin/"
	@exit 1

verify-start: $(MZDIFF) $(START_EXE) $(START_VRF_REF)
	$(MZDIFF) $(START_VRF_REF):$(START_VRF_REFEP) $(START_EXE):$(START_VRF_TGTEP) $(VERIFY_FLAGS) --map map/start.map --asm

TOOLS := $(TOOLDIR)/ovltool $(TOOLDIR)/vgapal $(TOOLDIR)/wldparse
f15-tools: $(TOOLDIR) $(TOOLS)

$(TOOLDIR)/ovltool: $(SRCTOP)/ovltool.cpp
	g++ $(CXXFLAGS) -o $@ $^

$(TOOLDIR)/vgapal: $(SRCTOP)/vgapal.c
	gcc -o $@ $^

$(TOOLDIR)/wldparse: $(SRCTOP)/wldparse.cpp
	g++ -o $@ $^ -I$(SRCDIR)
