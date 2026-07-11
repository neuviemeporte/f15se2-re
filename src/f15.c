/*
 * This is the main game executable for F15 SE II.
 *
 * Since the original was apparently coded in assembly (and included a convoluted anti-debugging & copy protection scheme),
 * this is a purposefully divergent implementation that does not try to be faithful to the original binary.
 *
 * It also combines the functionality of SU.EXE (SetUp), whose purpose was to ask the user which graphics adapter and sound device
 * they would like to use - we aim to only support VGA (MCGA) and no sound (there's barely any sounds in the game as is,
 * perhaps this will be changed in the future), so this will skip the user queries and load MGRAPHIC and NSOUND overlays without asking.
 *
 * Other than that, the purpose of this executable is mostly to do some initial setup and then keep operating the game main loop, that is running
 * START, EGAME and END in sequence until the user decides to exit the game. The original calls DS.EXE (Disk Swap) between each of these, but
 * as far as I can tell DS.EXE only looks to see if the required binary exists in the current directory, and if it doesn't, it prompts the user
 * to insert a disk containing it (and load it, I think), so I will also ignore DS.EXE here.
 */

#include "inttype.h"
#include "pointers.h"
#include "biosfunc.h"
#include "dosfunc.h"
#include "log.h"
#include "memory.h"
#include "comm.h"
#include "overlay.h"
#include "f15util.h"
#include "offsets.h"
#ifdef NO_ASM
#include "gfx_impl.h"
#include "slot.h"
#endif

#include <dos.h>
#include <stdio.h>
#include <stddef.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

const char *SOUND_DRIVER = "Nsound.exe";
const char *GFX_DRIVER = "Mgraphic.exe";
const char *MISC_LIBRARY = "MISC.EXE";
const char *GAME_MENU = "START.EXE";
const char *GAME_FLIGHT = "EGAME.EXE";
const char *GAME_DEBRIEFING = "END.EXE";
const char *DEBUGGER = "Z:\\DEBUG.COM";
const uint16 GFX_INIT_ARG = 2;
const int16 RET_MENU = 0xc;
const int16 RET_DEBRIEFING = 0x23;
const int16 RET_NONZERO = -1;
enum { CMDLINE_LEN = 128 };
char cmdlineBuf[CMDLINE_LEN] = "";
const char FAR *CMDLINE = (const char FAR *)cmdlineBuf;
uint16 commSegment = 0;

/* The DOS EXEC call (INT 21h/4Bh) used to launch each child program writes a
 * stray memory-segment byte into this process's CRT "null pointer" guard at
 * the bottom of DGROUP (observed at DGROUP:0x02; the value tracks the child's
 * load segment and is independent of which child runs or whether the raw
 * INT 21h or the library spawn() is used). That guard is private CRT
 * bookkeeping we never touch, but MSC's exit-time check (_nullcheck) sees the
 * change and aborts with "R6001 - null pointer assignment". Snapshot the guard
 * at startup and repair it after every child run so the check passes. */
enum { NULLGUARD_SIZE = 66 };
static uint8 nullGuard[NULLGUARD_SIZE];
static uint8 FAR *nullGuardPtr(void) {
    void FAR *fp = (void FAR *)&commSegment; /* any DGROUP global → DS:0 */
    return (uint8 FAR *)MK_FP(FP_SEG(fp), 0);
}
static void nullGuardSave(void) {
    uint8 FAR *p = nullGuardPtr();
    int16 i;
    for (i = 0; i < NULLGUARD_SIZE; ++i) nullGuard[i] = p[i];
}
static void nullGuardRestore(void) {
    uint8 FAR *p = nullGuardPtr();
    int16 i;
    for (i = 0; i < NULLGUARD_SIZE; ++i) p[i] = nullGuard[i];
}
#ifdef NO_ASM
/* Satisfy linker for gfx_drawLine's extern refs when stdata.c is absent.
 * At runtime these live in the calling exe's data segment (correct behavior). */
int16 lineX1, lineX2, lineY1, lineY2;
#endif

uint16 load_driver(const char *filename, const uint16 commPtrOffset) {
    /* load driver overlay into memory */
    uint16 drvAddress;
    uint16 FAR *commPtr = (uint16 FAR *)MK_FP(commSegment, commPtrOffset);
    if (commSegment == 0)
        LogCritical(("COMM segment address invalid"));
    if ((drvAddress = overlay_load(filename)) == 0)
        LogCritical(("unable to load driver %s!", filename));
    /* place address of loaded driver into an offset in the communication buffer */
    *commPtr = drvAddress;
    LogInfo(("Loaded driver %s at 0x%x, address stored in COMM at %p", filename, drvAddress, commPtr));
    return drvAddress;
}

void game_init(void) {
    size_t freeMemory;
    int8 FAR *charPtr;
    uint16 gfxBufAddress;
    int16 err;
#ifndef NO_ASM
    OverlayFunc gfxInit = NULL;
    uint16 gfxDrvAddress;
#endif

    bios_clearkeyflags();

    /* get amount of free memory */
    freeMemory = dos_getfree();
    if (freeMemory == 0)
        LogCritical(("Unable to get amount of free memory!"));
    LogInfo(("free memory: %s", sizeString(freeMemory)));

    /* allocate memory for communication buffer between game executables */
    commSegment = dos_alloc(COMM_SIZE_PARA);
    if (commSegment == 0)
        LogCritical(("Unable to allocate memory for COMM"));
    LogInfo(("Allocated COMM buffer at 0x%x, size = %up (%lu)", commSegment, COMM_SIZE_PARA, PARA_TO_BYTES(COMM_SIZE_PARA)));
    /* magic values written into the MCB for the COMM buffer, EGAME.EXE later checks for them */
    writeWordFar(commSegment - 1, COMM_MCB_OFFSET_MAGIC1, COMM_MCB_VALUE_MAGIC1);
    writeWordFar(commSegment - 1, COMM_MCB_OFFSET_MAGIC2, COMM_MCB_VALUE_MAGIC2);

    /* put address of communication buffer into the Intra-Application Comunication Area in low memory
       so that all game executables can find out where it is */
    writeWordFar(SEG_LOWMEM, OFF_IACA_START, commSegment);
    writeWordFar(SEG_LOWMEM, OFF_IACA_NEEDSPLASH, 1);
    writeWordFar(SEG_LOWMEM, OFF_IACA_FLAG2, 0);
    /* values written into COMM by SU.EXE */
    writeWordFar(commSegment, COMM_STARTDONE_OFFSET, 0);
    writeWordFar(commSegment, COMM_SETUP_MONOCHROME_OFFSET, 0);
    writeWordFar(commSegment, COMM_SETUP_SWITCHT_OFFSET, 0);
    writeWordFar(commSegment, COMM_SETUP2_OFFSET, 0);
    writeWordFar(commSegment, COMM_SETUP_DETAIL_OFFSET, 3); /* max detail */
    writeWordFar(commSegment, COMM_SETUP_USEJOY_OFFSET, 0);
#ifndef NO_ASM
    strcpyFar(GFX_DRIVER, commSegment, COMM_GFXOVL_NAME_OFFSET, strlen(GFX_DRIVER));
#endif
    /* sound driver name is read by start.exe (PC-speaker check) in both builds */
    strcpyFar(SOUND_DRIVER, commSegment, COMM_SNDOVL_NAME_OFFSET, strlen(SOUND_DRIVER));
    writeWordFar(commSegment, COMM_SETUP_DONE_OFFSET, 1);
    writeWordFar(commSegment, COMM_SETUP_GFXMODE_OFFSET, 'M'); /* mcga */

#ifndef NO_ASM
    /* load sound, misc and video driver overlays */
    load_driver(SOUND_DRIVER, COMM_SNDOVL_ADDR_OFFSET);
    load_driver(MISC_LIBRARY, COMM_MISCOVL_ADDR_OFFSET);
    gfxDrvAddress = load_driver(GFX_DRIVER, COMM_GFXOVL_ADDR_OFFSET);

    /* call function 0 from video driver, init video */
    gfxInit = overlay_functionAddress(gfxDrvAddress, 0);
    LogInfo(("gfx init function at %p", gfxInit));
    gfxBufAddress = gfxInit(GFX_INIT_ARG);
    LogInfo(("gfx init function returned 0x%x", gfxBufAddress));
#else
    {
        uint16 ovlSeg = dos_alloc(80);
        uint16 sndSeg, miscSeg;
        if (ovlSeg == 0)
            LogCritical(("Unable to allocate virtual gfx overlay"));
        gfx_buildVirtualOverlay(ovlSeg);
        writeWordFar(commSegment, COMM_GFXOVL_ADDR_OFFSET, ovlSeg);
        LogInfo(("Virtual gfx overlay at 0x%x", ovlSeg));

        /* Stub SOUND and MISC overlays provided by f15.exe itself — no
         * NSOUND.EXE / MISC.EXE on disk. An ASM child still patches its
         * audio/misc slots from these (otherwise the unpatched JMP FAR
         * 0000:0000 stubs crash); NO_ASM children ignore them (their misc
         * is direct C and the slot index range is out of their gfx table). */
        sndSeg = dos_alloc(4);
        miscSeg = dos_alloc(4);
        if (sndSeg == 0 || miscSeg == 0)
            LogCritical(("Unable to allocate stub misc/sound overlays"));
        gfx_buildSoundOverlay(sndSeg);
        gfx_buildMiscOverlay(miscSeg);
        writeWordFar(commSegment, COMM_SNDOVL_ADDR_OFFSET, sndSeg);
        writeWordFar(commSegment, COMM_MISCOVL_ADDR_OFFSET, miscSeg);
        LogInfo(("Stub sound overlay at 0x%x, misc overlay at 0x%x", sndSeg, miscSeg));

        gfxBufAddress = (uint16)gfx_allocPage(GFX_INIT_ARG);
        LogInfo(("gfx_allocPage returned 0x%x", gfxBufAddress));
    }
#endif
    writeWordFar(commSegment, COMM_GFXINIT_RESULT_OFFSET, gfxBufAddress);

    /* initialization done */
    LogInfo(("COMM contents:"));
    hexdump(MK_FP(commSegment - 1, 0), COMM_BUFFER_OFFSET + SIZE_PARAGRAPH, 0, 1);
    LogInfo(("Initialization complete, free memory = %s", sizeString(dos_getfree())));
}

bool game_run(const char *filename, const int16 returnCode, const bool debug) {
    int16 err;
    /* launch game executable */
    if (debug) {
        LogInfo(("Executing %s under the debugger", filename));
        sprintf(cmdlineBuf, " %s", filename);
        filename = DEBUGGER;
    } else {
        memset(cmdlineBuf, 0, CMDLINE_LEN);
        LogInfo(("Executing %s with commandline '%Fs'", filename, CMDLINE));
    }
    log_close();
    err = dos_runProgram(filename, CMDLINE);
    log_open(true);
    nullGuardRestore(); /* DOS EXEC scribbles on our CRT null-guard; undo it */
    if (err != 0)
        LogCritical(("Unable to run %s", filename));
    err = dos_getReturnCode();
    LogInfo(("%s exited with code 0x%x", filename, err));
    if (debug)
        return true;
    /* check return code if not in debug mode */
    if (returnCode >= 0)
        return err == returnCode;
    else
        return err != 0;
}

uint16 load_segment(const uint16 envParagraphs) {
    return dos_lastFreeBlock() + 1 + envParagraphs + 1;
}

int main(int argc, char *argv[]) {
    /* process cmdline args */
    int16 argIdx, charIdx;
    bool debugMenu = false, debugFlight = false, debugDebrief = false;

    log_set_app("f15");
    log_open(false);
    nullGuardSave();

    for (argIdx = 1; argIdx < argc; ++argIdx) {
        const char *arg = argv[argIdx];
        const size_t len = strlen(arg);
        if (len < 3 || arg[0] != '/' || tolower(arg[1]) != 'd')
            LogCritical(("Unrecognized argument: '%s'", arg));
        for (charIdx = 2; charIdx < len; ++charIdx) {
            switch (arg[charIdx]) {
            case '1':
                debugMenu = true;
                break;
            case '2':
                debugFlight = true;
                break;
            case '3':
                debugDebrief = true;
                break;
            default:
                LogCritical(("Unrecognized argument: '%s'", arg));
            }
        }
    }

    LogInfo(("Starting game initialization routine"));
    game_init();
    dos_mcbInfo();

    LogInfo(("Starting game main loop"));
    while (true) {
        if (!game_run(GAME_MENU, RET_MENU, debugMenu)) break;
        if (!game_run(GAME_FLIGHT, RET_NONZERO, debugFlight)) break;
        if (!game_run(GAME_DEBRIEFING, RET_DEBRIEFING, debugDebrief)) break;
    }

    LogInfo(("Main loop finished, terminating"));
    return 0;
}
