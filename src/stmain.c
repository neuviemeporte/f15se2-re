#include "inttype.h"
#include "offsets.h"
#include "pointers.h"
#include "comm.h"
#include "gfx.h"
#include "slot.h"
#include "const.h"
#include "debug.h"
#include "start.h"
#include "shared/common.h"

#include <dos.h>

int main(void)
{
    uint8 unused[0xe];
    uint8 introStage;
    uint16 FAR *commPtr;
    uint16 difficulty;
    int16 theater;
    uint16 bufSize;
    register bool isPcSpeaker;

    TRACE(("main: entering", difficulty, theater, bufSize));
    /* 0x17 */
    FP_SEG(needSplash) = SEG_LOWMEM;
    FP_OFF(needSplash) = OFF_IACA_NEEDSPLASH;
    FP_SEG(gfxModeSetPtr) = SEG_LOWMEM;
    FP_OFF(gfxModeSetPtr) = OFF_IACA_FLAG2;
    FP_SEG(commPtr) = SEG_LOWMEM;
    FP_OFF(commPtr) = OFF_IACA_START;
    /* 0x39 */
    FP_SEG(commData) = *commPtr;
    FP_OFF(commData) = 0;
    FP_SEG(gameData) = *commPtr;
    FP_OFF(gameData) = COMM_GAMEDATA_OFFSET;
    /* 0x54 */
    TRACE(("main: installing cbreak handler"));
    installCBreakHandler();
    TRACE(("main: setting up overlays"));
    setupOverlaySlots(commData->miscOvlAddr);
    setupOverlaySlots(commData->gfxOvlAddr);
    setupOverlaySlots(commData->sndOvlAddr);
    /* 0x81 */
    TRACE(("main: slot 4b"));
    gfx_storeBufPtr(commData->gfxInitResult, 2);
    hercFlag = commData->setupMono;
    TRACE(("main: init graphics"));
    initGraphics();
    /* 0xa3 */
    TRACE(("main: init audio"));
    audio_shutdown();
    audio_setup(0, 0);
    /* 0xb4 */
#ifndef DEBUG_AUTOSTART
    if (*needSplash == 1) {
        TRACE(("main: doing splash"));
        /* 0xc1 doSplash:  */
        gameData->campaignProgress = 1;
        gameData->difficulty = 0xffff;
        gameData->theater = 0xffff;
        gfx_setFadeSteps(5);
        /* 0xeb */
        TRACE(("main: showing labs"));
        openShowPic(aLabs_pic, 0);
#ifdef DEBUG
        dumpbuf("LABSPIX.BIN", (const char far *)MK_FP(0xA000, 0), 64000UL);
#endif
        gfx_commitPage();
        /* 0xfd */
        TRACE(("main: setting timer irq handler"));
        setTimerIrqHandler();
        /* 0x100 */
        for (timerCounter = 0; timerCounter < MPS_TIMEOUT;) {
            if (misc_checkKeyBuf() == 0) {
                misc_getKey();
                break;
            }
        }
        /* 0x11e */
        if (timerCounter >= MPS_TIMEOUT) { // key was not pressed, show adv.pic
            // 0x125
            gfx_waitRetrace();
            gfx_setFadeSteps(0xf);
            /* 0x13d */
            TRACE(("main: showing adv"));
            openShowPic(aAdv_pic, 0);
            gfx_commitPage();
            gfx_flipPage();
            /* 0x14d */
            for (introStage = 0; introStage < 2; introStage++) {
                for (timerCounter = 0; timerCounter < ADV_TIMEOUT;) {
                    if (misc_checkKeyBuf() == 0) {
                        misc_getKey();
                        goto checkEga;
                    }
                }
            }
        }

        /* 0x17c */
        TRACE(("main: checking ega"));
checkEga:
        if (commData->gfxModeNum >= GFX_MODE_EGA && (*MAKEFAR(uint8, SEG_BDA, OFF_BDA_EGASWITCH) & EGA_SWITCH_MASK) == EGA_SWITCH_VALUE) {
            TRACE(("main: switching to ega for title"));
            /* 0x19c */
            if (commData->gfxModeNum != GFX_MODE_EGA) {
                setupOverlaySlots(loadOverlay(aEgraphic_exe));
            }
            /* 0x1b4 */
            gfx_waitRetrace();
            /* 0x1bd */
            showPic640(aTitle640_pic);
        }
        /* 0x1c5 */
        else
        {
            TRACE(("main: doing 16color title"));
            gfx_setFadeSteps(1);
            gfx_waitRetrace();
            openShowPic(aTitle16_pic, 0);
            gfx_commitPage();
            /* 0x1ec */
            gfx_setDac(commData->gfxModeNum >= GFX_MODE_VGA ? 4 : 3);
        }
        /* 0x204 */
        TRACE(("main: waiting for mda/cga"));
        waitMdaCgaStatus(4);
        /* 0x20e - 0x225 */
        isPcSpeaker = commData->sndOvlName[0] == 'I' || commData->sndOvlName[0] == 'i';
        /* 0x229 */
        TRACE(("main: check pc speaker"));
        if (isPcSpeaker != 0) restoreTimerIrqHandler();
        /* 0x230 */
        TRACE(("main: doing audio thing"));
        audio_playIntro();
        if (isPcSpeaker == 0) restoreTimerIrqHandler();
        /* 0x23c */
        if (commData->gfxModeNum >= GFX_MODE_EGA && (*MAKEFAR(uint8, SEG_BDA, OFF_BDA_EGASWITCH) & EGA_SWITCH_MASK) == EGA_SWITCH_VALUE) {
            TRACE(("main: restoring old overlay after title"));
            gfx_setDac(2);
            /* 0x264 */
            getch();
            /* 0x26f */
            setupOverlaySlots(commData->gfxOvlAddr); /* restore temporarily shadowed overlay? */
            gfx_waitRetrace();
            /* 0x282 */
            gfx_setMode13(commData->setupMono);
        }
        /* 0x28c */
        else
        {
            TRACE(("main: after 16 title"));
            gfx_setDac(0);
            getch();
        }
    }
#endif /* !DEBUG_AUTOSTART */

    TRACE(("main: setting difficulty and theater"));
#ifdef DEBUG_AUTOSTART
    /* Auto-start: skip UI, set hardcoded difficulty/theater, go straight to egame */
    TRACE(("main: DEBUG_AUTOSTART - skipping UI"));
    /* f15.com normally writes copy-protection magic into the COMM MCB; replicate here */
    *(int16 far *)((char far *)commData - 4) = COMM_MCB_VALUE_MAGIC1;
    *(int16 far *)((char far *)commData - 2) = COMM_MCB_VALUE_MAGIC2;
    gameData->difficulty = 0;  /* 0=green (airborne start), 1=veteran, 2=ace, 3=max, 4=demo */
    gameData->theater = 0;     /* 0=Libya, 1=Desert, 2=Europe, 3=Kuril */
    gameData->missionReady = 1;
    gameData->isCampaignMission = 0;
    gameData->campaignProgress = 0;
    gameData->rand = 12345;
    commData->startDone = 1;
    joyAxes[0] = joyAxes[1] = JOY_CENTER;
    srand(gameData->rand);
    missionGenerate();
#else
    /* 0x29a */
    difficulty = gameData->difficulty;
    theater = gameData->theater;
    /* 0x2ac */
    if (commData->gfxModeChar == 0 && gameData->campaignProgress == 0 && gameData->theater < NUM_THEATERS &&
            ++(gameData->theater) == NUM_THEATERS) {
        /* 0x2d8 */
        gameData->theater = 0;
        /* 0x2de */
        if (gameData->difficulty < MAX_DIFFICULTY) {
            /* 0x2e9 */
            gameData->difficulty++;
        }
    }

    TRACE(("main: setting up kbd/joy"));
    /* 0x2ed */
    clearKeybuf();
    /* 0x2f4 */
    if (commData->setupUseJoy == 1) {
        /*
            This data of length 0x14 is copied in su.exe at seg0001(683):d1 from dseg(692):eb4 to COMM:48, then later this copies it from there onto the stack (???)
            1CC2:0CDE     6D 01 6D 01 00 00 00 00 73 01 73 01 00 00 00 00  m.m.....s.s.....\n            1CC2:0CEE     6E 01 6E 01 00 00 00 00 01 00 01 00 00 00 00 00  n.n.............\n        */
       copyJoystickData(commData->joyData);
    }
    /* 0x30e */
    else {
        joyAxes[0] = joyAxes[1] = JOY_CENTER;
    }
    TRACE(("main: init pilot/mission"));
    /* 0x316 */
    joyReady[0] = 1;
    bufSize = gfx_getBufSize();
    /* 0x32a */
    menuSprites = allocBuffer(bufSize);
    pilotSelect(*needSplash);
    TRACE(("main: pilot selected"));
    missionSelect();
    TRACE(("main: mission selected"));
    /* 0x33d */
    gameData->missionReady = 1;
    gameData->isCampaignMission = 1;
    gameData->campaignProgress = 0;
    commData->startDone = 1;
    /* 0x365, check if same diff and thea picked as last time */
    if (gameData->difficulty == difficulty && gameData->theater == theater && missionPick == 0xffff && askRepeatMission() != 0)
        goto doSrand;
    /* 0x38b */
    gameData->rand = rand();
    /* 0x396 */
doSrand:
    TRACE(("main: mission decoding"));
    srand(gameData->rand);
    missionDecode();
    TRACE(("main: mission generation"));
    missionGenerate();
#endif
#ifdef DEBUG_AUTOSTART
    /* Auto-start: skip ONLY the interactive screens (printMission briefing and
       the checkDiskA disk prompt). Everything else must run exactly as the
       normal path below -- in particular the f15.spr sprite-sheet load into
       commData->gfxInitResult, which egame reads as gfxBufPtr for the radar /
       tactical-map / HUD sprites. */
    exitCode[0] = 0xc;
    restoreCbreakHandler();
    *needSplash = 0;
    gfx_setFadeSteps(8);
    TRACE(("main: DEBUG_AUTOSTART - loading sprites"));
    if (gfx_getVal() == 0) {
        openShowPic(aF15_spr, 2);
    }
    else {
        loadPic(aF15_spr_0, commData->gfxInitResult);
    }
    TRACE(("main: DEBUG_AUTOSTART - write world"));
    exportWorldToComm(aTemp_wld);
    commData->setupDone = 3;
    commData->continueFlag = 0;
    commData->restartFlag = 0;
    if (gameData->missionReady > 1) {
        commData->gfxModeChar = 1;
    }
    else {
        commData->gfxModeChar = 0;
    }
    misc_clearKeyFlags();
    clearRect(bufPtr, 0, 0, SCREEN_MAXX, SCREEN_MAXY);
    gfx_setMonoFlag(0);
    TRACE(("main: DEBUG_AUTOSTART - exiting with code %hd", exitCode[0]));
#ifdef DEBUG
    log_close();
#endif
    exit(exitCode[0]);
#else
    /* 0x3aa */
    if (gameData->difficulty != DIFFICULTY_DEMO) {
        TRACE(("main: printing mission"));
        printMission();
    }
    /* 0x3b8 */
    TRACE(("main: checking disk"));
    checkDiskA();
    exitCode[0] = 0xc;
    /* 0x3c0 */
    TRACE(("main: restoring cbreak handler and clearing splash"));
    restoreCbreakHandler();
    *needSplash = 0;
    gfx_setFadeSteps(8);
    /* 0x3d8 */
    TRACE(("main: loading sprites"));
    if (gfx_getVal() == 0) {
        openShowPic(aF15_spr, 2);
    }
    /* 0x3f1 */
    else {
        loadPic(aF15_spr_0, commData->gfxInitResult);
    }
    // 403
    TRACE(("main: write world"));
    exportWorldToComm(aTemp_wld);
    commData->setupDone = 3;
    commData->continueFlag = 0;
    commData->restartFlag = 0;
    /* 0x42f */
    if (gameData->missionReady > 1) {
        /* 0x43a */
        commData->gfxModeChar = 1;
    }
    /* 0x446 */
    else {
        commData->gfxModeChar = 0;
    }
    /* 0x44c */
    TRACE(("main: clearing keyflags and screen"));
    misc_clearKeyFlags();
    // 461
    clearRect(bufPtr, 0, 0, SCREEN_MAXX, SCREEN_MAXY);
    gfx_setMonoFlag(0);
    /* 0x478 */
    TRACE(("main: exiting with code %hd", exitCode[0]));
#ifdef DEBUG
    log_close();
#endif
    exit(exitCode[0]);
#endif /* !DEBUG_AUTOSTART */
    /* 0x482 */
}
