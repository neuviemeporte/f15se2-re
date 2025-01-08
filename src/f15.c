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
#include "output.h"
#include "memory.h"
#include "comm.h"
#include "overlay.h"
#include "util.h"
#include "offsets.h"

#include <STDIO.H>
#include <STDDEF.H>
#include <STDLIB.H>
#include <STRING.H>
#include <CTYPE.H>

const char* SOUND_DRIVER = "Nsound.exe";
const char* GFX_DRIVER = "Mgraphic.exe";
const char* MISC_LIBRARY = "MISC.EXE";
const char* GAME_MENU = "START.EXE";
const char* GAME_FLIGHT = "EGAME.EXE";
const char* GAME_DEBRIEFING = "END.EXE";
const char* DEBUGGER = "Z:\\DEBUG.COM";
const uint16 GFX_INIT_ARG = 2;
const int RET_MENU = 0xc;
const int RET_DEBRIEFING = 0x23;
const int RET_NONZERO = -1;
enum { CMDLINE_LEN = 128 };
char cmdlineBuf[CMDLINE_LEN] = "";
const char FAR *CMDLINE = (const char FAR*)cmdlineBuf;
uint16 commSegment = 0;

uint16 load_driver(const char* filename, const uint16 commPtrOffset) {
    /* load driver overlay into memory */
    uint16 drvAddress;
    uint16 FAR *commPtr = MK_FP(commSegment, commPtrOffset);
    if (commSegment == 0)
        FATAL("COMM segment address invalid");
    if ((drvAddress = overlay_load(filename)) == 0)
        FATAL("unable to load driver %s!", filename);
    /* place address of loaded driver into an offset in the communication buffer */
    *commPtr = drvAddress;
    INFO("Loaded driver %s at 0x%x, address stored in COMM at %p", filename, drvAddress, commPtr);
    return drvAddress;
}

void game_init(void) {
    size_t freeMemory;
    int8 FAR *charPtr;
    OverlayFunc gfxInit = NULL;
    uint16 gfxDrvAddress, gfxBufAddress;
    int err;
    
    bios_clearkeyflags();

    /* get amount of free memory */
    freeMemory = dos_getfree();
    if (freeMemory == 0) 
        FATAL("Unable to get amount of free memory!");
    INFO("free memory: %s", sizeString(freeMemory));
    
    /* allocate memory for communication buffer between game executables */
    commSegment = dos_alloc(COMM_SIZE_PARA);
    if (commSegment == 0)
        FATAL("Unable to allocate memory for COMM");
    INFO("Allocated COMM buffer at 0x%x, size = %up (%lu)", commSegment, COMM_SIZE_PARA, PARA_TO_BYTES(COMM_SIZE_PARA));
    /* magic values written into the MCB for the COMM buffer, EGAME.EXE later checks for them */
    writeWordFar(commSegment - 1, COMM_MCB_OFFSET_MAGIC1, COMM_MCB_VALUE_MAGIC1);
    writeWordFar(commSegment - 1, COMM_MCB_OFFSET_MAGIC2, COMM_MCB_VALUE_MAGIC2);

    /* put address of communication buffer into the Intra-Application Comunication Area in low memory 
       so that all game executables can find out where it is */
    writeWordFar(SEG_LOWMEM, OFF_IACA_START, commSegment);
    writeWordFar(SEG_LOWMEM, OFF_IACA_NEEDSPLASH, 1);
    writeWordFar(SEG_LOWMEM, OFF_IACA_FLAG2, 0);
    /* values written into COMM by SU.EXE */
    writeWordFar(commSegment, COMM_SETUP1_OFFSET, 0);
    writeWordFar(commSegment, COMM_SETUP_MONOCHROME_OFFSET, 0);
    writeWordFar(commSegment, COMM_SETUP_SWITCHT_OFFSET, 0);
    writeWordFar(commSegment, COMM_SETUP2_OFFSET, 0);
    writeWordFar(commSegment, COMM_SETUP_DETAIL_OFFSET, 3); /* max detail */
    writeWordFar(commSegment, COMM_SETUP_USEJOY_OFFSET, 0);
    strcpyFar(GFX_DRIVER, commSegment, COMM_GFXOVL_NAME_OFFSET, strlen(GFX_DRIVER));
    strcpyFar(SOUND_DRIVER, commSegment, COMM_SNDOVL_NAME_OFFSET, strlen(SOUND_DRIVER));
    writeWordFar(commSegment, COMM_SETUP_DONE_OFFSET, 1);
    writeWordFar(commSegment, COMM_SETUP_GFXMODE_OFFSET, (uint16)'M'); /* mcga */

    /* load sound, misc and video driver overlays */
    load_driver(SOUND_DRIVER, COMM_SNDOVL_ADDR_OFFSET);
    load_driver(MISC_LIBRARY, COMM_MISCOVL_ADDR_OFFSET);
    gfxDrvAddress = load_driver(GFX_DRIVER, COMM_GFXOVL_ADDR_OFFSET);

    /* call function 0 from video driver, init video */
    gfxInit = overlay_functionAddress(gfxDrvAddress, 0);
    INFO("gfx init function at %p", gfxInit);
    gfxBufAddress = gfxInit(GFX_INIT_ARG);
    INFO("gfx init function returned 0x%x", gfxBufAddress);
    writeWordFar(commSegment, COMM_GFXINIT_RESULT_OFFSET, gfxBufAddress);

    /* initialization done */
    INFO("COMM contents:");
    hexdump(MK_FP(commSegment - 1, 0), COMM_BUFFER_OFFSET + SIZE_PARAGRAPH, 0, 1);
    INFO("Initialization complete, free memory = %s", sizeString(dos_getfree()));
}

bool game_run(const char* filename, const int returnCode, const bool debug) {
    int err;
    /* launch game executable */
    log_close();
    if (debug) {
        INFO("Executing %s under the debugger", filename);
        sprintf(cmdlineBuf, " %s", filename);
        filename = DEBUGGER;
    }
    else {
        memset(cmdlineBuf, 0, CMDLINE_LEN);
        INFO("Executing %s with commandline '%Fs'", filename, CMDLINE);
    }
    if ((err = dos_runProgram(filename, CMDLINE)) != 0)
        FATAL("Unable to run %s", filename);
    err = dos_getReturnCode();
    INFO("%s exited with code 0x%x", filename, err);
    log_open(true);
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
    int i, j;
    bool debugMenu = false, debugFlight = false, debugDebrief = false;

    log_open(false);

    for (i = 1; i < argc; ++i) {
        const char *arg = argv[i];
        const size_t len = strlen(arg);
        if (len < 3 || arg[0] != '/' || tolower(arg[1]) != 'd')
            FATAL("Unrecognized argument: '%s'", arg);
        for (j = 2; j < len; ++j) {
            switch (arg[j]) {
            case '1': debugMenu = true; break;
            case '2': debugFlight = true; break;
            case '3': debugDebrief = true; break;
            default:
                FATAL("Unrecognized argument: '%s'", arg);
            }
        }
    }

    INFO("Starting game initialization routine");
    game_init();
    dos_mcbInfo();

    INFO("Starting game main loop");
    while (true) {
        if (!game_run(GAME_MENU, RET_MENU, debugMenu)) break;
        if (!game_run(GAME_FLIGHT, RET_NONZERO, debugFlight)) break;
        if (!game_run(GAME_DEBRIEFING, RET_DEBRIEFING, debugDebrief)) break;
    }

    INFO("Main loop finished, terminating");
    return 0;
}
