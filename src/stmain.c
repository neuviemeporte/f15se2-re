#include "inttype.h"
#include "offsets.h"
#include "pointers.h"
#include "comm.h"
#include "gfx.h"
#include "slot.h"
#include "const.h"
#include "log.h"
#include "stalloc.h"
#include "stcode.h"
#include "stdata.h"
#include "stgen.h"
#include "stinit.h"
#include "stmissn.h"
#include "stpilot.h"
#include "sttypes.h"
#include "shared/common.h"

#include <dos.h>

int main(void) {
    uint8 unused[14];
    uint8 introStage;
    uint16 FAR *commPtr;
    uint16 difficulty;
    int16 theater;
    uint16 bufSize;
    register bool isPcSpeaker;

    log_set_app("start");
    FP_SEG(needSplash) = SEG_LOWMEM;
    FP_OFF(needSplash) = OFF_IACA_NEEDSPLASH;
    FP_SEG(gfxModeSetPtr) = SEG_LOWMEM;
    FP_OFF(gfxModeSetPtr) = OFF_IACA_FLAG2;
    FP_SEG(commPtr) = SEG_LOWMEM;
    FP_OFF(commPtr) = OFF_IACA_START;
    FP_SEG(commData) = *commPtr;
    FP_OFF(commData) = 0;
    FP_SEG(gameData) = *commPtr;
    FP_OFF(gameData) = COMM_GAMEDATA_OFFSET;
    installCBreakHandler();
    setupOverlaySlots(commData->miscOvlAddr);
    setupOverlaySlots(commData->gfxOvlAddr);
    setupOverlaySlots(commData->sndOvlAddr);
    gfx_storeBufPtr(commData->gfxInitResult, 2);
    hercFlag = commData->setupMono;
    initGraphics();
    audio_shutdown();
    audio_setup(0, 0);
#ifndef DEBUG_AUTOSTART
    if (*needSplash == 1) {
        gameData->campaignProgress = 1;
        gameData->difficulty = 0xffff;
        gameData->theater = 0xffff;
        gfx_setFadeSteps(5);
        openShowPic("labs.pic", 0);
        gfx_commitPage();
        setTimerIrqHandler();
        for (timerCounter = 0; timerCounter < MPS_TIMEOUT;) {
            if (misc_checkKeyBuf() == 0) {
                misc_getKey();
                break;
            }
        }
        if (timerCounter >= MPS_TIMEOUT) { // key was not pressed, show adv.pic
            gfx_waitRetrace();
            gfx_setFadeSteps(15);
            openShowPic("adv.pic", 0);
            gfx_commitPage();
            gfx_flipPage();
            for (introStage = 0; introStage < 2; introStage++) {
                for (timerCounter = 0; timerCounter < ADV_TIMEOUT;) {
                    if (misc_checkKeyBuf() == 0) {
                        misc_getKey();
                        goto checkEga;
                    }
                }
            }
        }

    checkEga:
        if (commData->gfxModeNum >= GFX_MODE_EGA && (*MAKEFAR(uint8, SEG_BDA, OFF_BDA_EGASWITCH) & EGA_SWITCH_MASK) == EGA_SWITCH_VALUE) {
            if (commData->gfxModeNum != GFX_MODE_EGA) {
                setupOverlaySlots(loadOverlay("egraphic.exe"));
            }
            gfx_waitRetrace();
            showPic640("Title640.Pic");
        } else {
            gfx_setFadeSteps(1);
            gfx_waitRetrace();
            openShowPic("title16.pic", 0);
            gfx_commitPage();
            gfx_setDac(commData->gfxModeNum >= GFX_MODE_VGA ? 4 : 3);
        }
        waitMdaCgaStatus(4);
        isPcSpeaker = commData->sndOvlName[0] == 'I' || commData->sndOvlName[0] == 'i';
        if (isPcSpeaker != 0) restoreTimerIrqHandler();
        audio_playIntro();
        if (isPcSpeaker == 0) restoreTimerIrqHandler();
        if (commData->gfxModeNum >= GFX_MODE_EGA && (*MAKEFAR(uint8, SEG_BDA, OFF_BDA_EGASWITCH) & EGA_SWITCH_MASK) == EGA_SWITCH_VALUE) {
            gfx_setDac(2);
            getch();
            setupOverlaySlots(commData->gfxOvlAddr); /* restore temporarily shadowed overlay? */
            gfx_waitRetrace();
            gfx_setMode13(commData->setupMono);
        } else {
            gfx_setDac(0);
            getch();
        }
    }
#endif /* !DEBUG_AUTOSTART */

#ifdef DEBUG_AUTOSTART
    /* Auto-start: skip UI, set hardcoded difficulty/theater, go straight to egame */
    /* f15.com normally writes copy-protection magic into the COMM MCB; replicate here */
    *(int16 FAR *)((char FAR *)commData - 4) = COMM_MCB_VALUE_MAGIC1;
    *(int16 FAR *)((char FAR *)commData - 2) = COMM_MCB_VALUE_MAGIC2;
    gameData->difficulty = 0; /* 0=green (airborne start), 1=veteran, 2=ace, 3=max, 4=demo */
    gameData->theater = 0;    /* 0=Libya, 1=Desert, 2=Europe, 3=Kuril */
    gameData->missionReady = 1;
    gameData->isCampaignMission = 0;
    gameData->campaignProgress = 0;
    gameData->rand = 12345;
    commData->startDone = 1;
    joyAxes[0] = joyAxes[1] = JOY_CENTER;
    srand(gameData->rand);
    missionGenerate();
#else
    difficulty = gameData->difficulty;
    theater = gameData->theater;
    if (commData->trainingFlag == 0 && gameData->campaignProgress == 0 && gameData->theater < NUM_THEATERS &&
        ++(gameData->theater) == NUM_THEATERS) {
        gameData->theater = 0;
        if (gameData->difficulty < MAX_DIFFICULTY) {
            gameData->difficulty++;
        }
    }

    clearKeybuf();
    if (commData->setupUseJoy == 1) {
        /*
            This data of length 0x14 is copied in su.exe at seg0001(683):d1 from dseg(692):eb4 to COMM:48, then later this copies it from there onto the stack (???)
            1CC2:0CDE     6D 01 6D 01 00 00 00 00 73 01 73 01 00 00 00 00  m.m.....s.s.....\n            1CC2:0CEE     6E 01 6E 01 00 00 00 00 01 00 01 00 00 00 00 00  n.n.............\n        */
        copyJoystickData(commData->joyData);
    } else {
        joyAxes[0] = joyAxes[1] = JOY_CENTER;
    }
    joyReady[0] = 1;
    bufSize = gfx_getBufSize();
    menuSprites = allocBuffer(bufSize);
    pilotSelect(*needSplash);
    missionSelect();
    gameData->missionReady = 1;
    gameData->isCampaignMission = 1;
    gameData->campaignProgress = 0;
    commData->startDone = 1;
    /* Check if same diff and thea picked as last time */
    if (gameData->difficulty == difficulty && gameData->theater == theater && missionPick == -1 && askRepeatMission() != 0)
        goto doSrand;
    gameData->rand = rand();
doSrand:
    srand(gameData->rand);
    missionDecode();
    missionGenerate();
#endif
#ifdef DEBUG_AUTOSTART
    /* Auto-start: skip ONLY the interactive screens (printMission briefing and
       the checkDiskA disk prompt). Everything else must run exactly as the
       normal path below -- in particular the f15.spr sprite-sheet load into
       commData->gfxInitResult, which egame reads as gfxBufPtr for the radar /
       tactical-map / HUD sprites. */
    exitCode[0] = 12;
    restoreCbreakHandler();
    *needSplash = 0;
    gfx_setFadeSteps(8);
    if (gfx_getVal() == 0) {
        openShowPic("f15.spr", 2);
    } else {
        loadPic("f15.spr", commData->gfxInitResult);
    }
    exportWorldToComm("temp.wld");
    commData->setupDone = 3;
    commData->continueFlag = 0;
    commData->restartFlag = 0;
    if (gameData->missionReady > 1) {
        commData->trainingFlag = 1;
    } else {
        commData->trainingFlag = 0;
    }
    misc_clearKeyFlags();
    clearRect(bufPtr, 0, 0, SCREEN_MAXX, SCREEN_MAXY);
    gfx_setMonoFlag(0);
    Log(("DEBUG_AUTOSTART - exiting with code %hd", exitCode[0]));
#ifdef DEBUG
    log_close();
#endif
    exit(exitCode[0]);
#else
    if (gameData->difficulty != DIFFICULTY_DEMO) {
        printMission();
    }
    checkDiskA();
    exitCode[0] = 12;
    restoreCbreakHandler();
    *needSplash = 0;
    gfx_setFadeSteps(8);
    if (gfx_getVal() == 0) {
        openShowPic("f15.spr", 2);
    } else {
        loadPic("f15.spr", commData->gfxInitResult);
    }
    exportWorldToComm("temp.wld");
    commData->setupDone = 3;
    commData->continueFlag = 0;
    commData->restartFlag = 0;
    if (gameData->missionReady > 1) {
        commData->trainingFlag = 1;
    } else {
        commData->trainingFlag = 0;
    }
    misc_clearKeyFlags();
    clearRect(bufPtr, 0, 0, SCREEN_MAXX, SCREEN_MAXY);
    gfx_setMonoFlag(0);
    Log(("exiting with code %hd", exitCode[0]));
#ifdef DEBUG
    log_close();
#endif
    exit(exitCode[0]);
#endif /* !DEBUG_AUTOSTART */
}
