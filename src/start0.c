#include "inttype.h"
#include "offsets.h"
#include "pointers.h"
#include "comm.h"
#include "gfx.h"
#include "slot.h"
#include "const.h"
#include "debug.h"
#include "start.h"

#include <dos.h>

int main(void) 
{
    /* TODO: fix stack frame layout
    uint16 pad1; // 0
    uint16 var_4; // 4
    uint16 theater; // 6
    uint16 pad2; // 8
    uint16 pad3; // a
    uint16 difficulty; // c
    uint16 pad4; // e
    struct FarPointer iacaPtr; //12
    uint16 pad5; // 14
    uint8 pad6; // 15
    uint8 var_16; // 16
    uint16 pad7; // 18
    uint16 pad8; // 1a
    register int i; 
    */
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
    FP_SEG(iacaSuFlag0Ptr) = SEG_LOWMEM;
    FP_OFF(iacaSuFlag0Ptr) = OFF_IACA_FLAG2;
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
    gfx_jump_4b_storeBufPtr(commData->gfxInitResult, 2);
    hercFlag = commData->setupMono;
    TRACE(("main: init graphics"));
    initGraphics();
    /* 0xa3 */
    TRACE(("main: init audio"));
    audio_jump_65();
    audio_jump_64(0, 0);
    /* 0xb4 */
    if (*needSplash == 1) {
        TRACE(("main: doing splash"));
        /* 0xc1 doSplash:  */
        gameData->flag1 = 1;
        gameData->difficulty = 0xffff;
        gameData->theater = 0xffff;
        gfx_jump_3d_null(5);
        /* 0xeb */
        TRACE(("main: showing labs"));
        openShowPic(aLabs_pic, 0);
        gfx_jump_50_null();
        /* 0xfd */
        TRACE(("main: setting timer irq handler"));
        setTimerIrqHandler();
        /* 0x100 */
        for (timerCounter = 0; timerCounter < MPS_TIMEOUT;) {
            if (misc_jump_5a_keybuf() == 0) {
                misc_jump_5b_getkey();
                break;
            }
        }
        /* 0x11e */
        if (timerCounter >= MPS_TIMEOUT) { // key was not pressed, show adv.pic
            // 0x125
            gfx_jump_45_retrace();
            gfx_jump_3d_null(0xf);
            /* 0x13d */
            TRACE(("main: showing adv"));
            openShowPic(aAdv_pic, 0);
            gfx_jump_50_null();
            gfx_jump_46_retrace2();
            /* 0x14d */
            for (introStage = 0; introStage < 2; introStage++) {
                for (timerCounter = 0; timerCounter < ADV_TIMEOUT;) {
                    if (misc_jump_5a_keybuf() == 0) {
                        misc_jump_5b_getkey();
                        goto checkEga;
                    }
                }
            }
        }

        /* 0x17c */
        TRACE(("main: checking ega"));
        checkEga:
        if (commData->gfxModeNum >= 2 && (*MAKEFAR(uint8, SEG_BDA, OFF_BDA_EGASWITCH) & 0xf) == 9) {
            TRACE(("main: switching to ega for title"));
            /* 0x19c */
            if (commData->gfxModeNum != 2) {
                setupOverlaySlots(loadOverlay(aEgraphic_exe));
            }
            /* 0x1b4 */
            gfx_jump_45_retrace();
            /* 0x1bd */
            showPic640(aTitle640_pic);
        }
        /* 0x1c5 */
        else {
            TRACE(("main: doing 16color title"));
            gfx_jump_3d_null(1);
            gfx_jump_45_retrace();
            openShowPic(aTitle16_pic, 0);
            gfx_jump_50_null();
            /* 0x1ec */
            gfx_jump_44_setDac(commData->gfxModeNum >= 3 ? 4 : 3);
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
        audio_jump_67();
        if (isPcSpeaker == 0) restoreTimerIrqHandler();
        /* 0x23c */
        if (commData->gfxModeNum >= 2 && (*MAKEFAR(uint8, SEG_BDA, OFF_BDA_EGASWITCH) & 0xf) == 9) {
            TRACE(("main: restoring old overlay after title"));
            gfx_jump_44_setDac(2);
            /* 0x264 */
            getch();
            /* 0x26f */
            setupOverlaySlots(commData->gfxOvlAddr); /* restore temporarily shadowed overlay? */
            gfx_jump_45_retrace();
            /* 0x282 */
            gfx_jump_3c_setMode13(commData->setupMono);
        }
        /* 0x28c */
        else {
            TRACE(("main: after 16 title"));
            gfx_jump_44_setDac(0);
            getch();
        }
    }

    TRACE(("main: setting difficulty and theater"));
    /* 0x29a */
    difficulty = gameData->difficulty;
    theater = gameData->theater;
    /* 0x2ac */
    if (commData->gfxModeNum == 0 && gameData->flag1 == 0 && gameData->theater < 4 &&
            ++(gameData->theater) == 4) {
        /* 0x2d8 */
        gameData->theater = 0;
        /* 0x2de */
        if (gameData->difficulty < 3) {
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
            1CC2:0CDE     6D 01 6D 01 00 00 00 00 73 01 73 01 00 00 00 00  m.m.....s.s.....
            1CC2:0CEE     6E 01 6E 01 00 00 00 00 01 00 01 00 00 00 00 00  n.n.............
        */
       copyJoystickData(commData->joyData);
    }
    /* 0x30e */
    else {
        noJoy80[0] = noJoy80[1] = 0x80;
    }
    TRACE(("main: init pilot/mission"));
    /* 0x316 */
    joyDone[0] = 1;
    bufSize = gfx_jump_17_bufSize();
    /* 0x32a */
    bufAddr = allocBuffer(bufSize);
    pilotSelect(*needSplash);
    missionSelect();
    /* 0x33d */
    gameData->flag3 = 1;
    gameData->flag4 = 1;
    gameData->flag1 = 0;
    commData->setup1 = 1;
    /* 0x365, check if same diff and thea picked as last time */
    if (gameData->difficulty == difficulty && gameData->theater == theater && missionPick == 0xffff && askRepeatMission() != 0) 
        goto doSrand;
    /* 0x38b */
    gameData->rand = rand();
    /* 0x396 */
doSrand:
    TRACE(("main: mission generation"));
    srand(gameData->rand);
    missionDecode();
    missionGenerate();
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
    gfx_jump_3d_null(8);
    /* 0x3d8 */
    TRACE(("main: loading sprites"));
    if (gfx_jump_4e_getVal() == 0) {
        openShowPic(aF15_spr, 2);
    }
    /* 0x3f1 */
    else {
        loadPic(aF15_spr_0, (uint8*)commData->gfxInitResult);
    }
    // 403
    TRACE(("main: write world"));
    writeWorld(aTemp_wld);
    commData->setupDone = 3;
    commData->unk2 = 0;
    commData->unk3 = 0;
    /* 0x42f */
    if (gameData->flag3 > 1) {
        /* 0x43a */
        commData->gfxModeNum = 1;
    }
    /* 0x446 */
    else {
        commData->gfxModeNum = 0;
    }
    /* 0x44c */
    TRACE(("main: clearing keyflags and screen"));
    misc_jump_5e_clearKeyFlags();
    // 461
    clearRect((int*)bufPtr, 0, 0, SCREEN_MAXX, SCREEN_MAXY);
    gfx_jump_52(0);
    /* 0x478 */
    TRACE(("main: exiting with code %d", exitCode[0]));
    exit(exitCode[0]);
    /* 0x482 */
}