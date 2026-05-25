#include "inttype.h"
#include "offsets.h"
#include "pointers.h"
#include "comm.h"
#include "shared/util.h"
#include "gfx.h"
#include "slot.h"
#include "const.h"

#include "debug.h"
#include "start.h"

#include <stdio.h>
#include <dos.h>

/* 0x4a0 */
void initGraphics()
{
    /* unused stack data eliminated by compiler, but original binary has sub sp,0xe in preamble - ??? */
    uint8 unused[0xe];
    /* 0x4a6 */
    seedRandom();
    /* 0x4ac */
    gfx_jump_0e_setCurBuf(0);
    gfx_jump_0_alloc(0);
    /* 0x4c4 - see f14 gmain.c InitGraphicPages() */
    gfx_jump_4b_storeBufPtr(page1Ptr = gfx_jump_0_alloc(1), 1); // 64k framebuffer @ 2cc0:0
    /* 0x4d8 */
    if (*gfxModeSetPtr == 0) {
        /* looks like arg is unused inside driver function, maybe it was in an older version of the overlay? */
        gfx_jump_3c_setMode13(commData->setupMono);
        /* 0x4f2, looks like a gfx mode set flag? */
        *gfxModeSetPtr = 1;
    }
    /* 0x4fb */
    commData->gfxModeNum = gfx_jump_3f_modecode();
    misc_jump_5e_clearKeyFlags();
}


// 54a
void clearKeyBuf()
{
    while (misc_jump_5a_keybuf() == 0) {
        misc_jump_5b_getkey();
    }
}

// 0x561
void waitJoyKey(void)
{
    while (joyOrKey() == 0) {}
}

// 571
int joyOrKey() {
    // 578
    if (commData->setupUseJoy == 1) { // 57f
        // 582
        if (misc_jump_5d_readJoy(0) != 0) { // 58e
            return 1;
        }
    }
    // 593
    if (cbreakHit != 0) { // 59a
        cleanup();
        restoreCbreakHandler();
        exit(0);
    } // 5a9
    if (misc_jump_5a_keybuf() != 0) { // 5b2
        return 0;
    } // 5b6
    // 5b6, alt-q hit check
    if (misc_jump_5b_getkey() == KEYCODE_ALTQ) { // 5c0
        cleanup();
        exit(0);
    }
    // 5cc
    return 1;
}

/* 0x5d5 */
void waitMdaCgaStatus(int16 iter)
{
    /* 0x5e0 */
    while (iter-- != 0) {
        /* 0x5e2 */
        if (commData->setupMono != 0) {
            while ((inp(PORT_MDA_STATUS) & MDA_STATUS_RETRACE) == 0) {}
            while ((inp(PORT_MDA_STATUS) & MDA_STATUS_RETRACE) != 0) {}
        /* 0x60f */
        }
        else {
            while ((inp(PORT_CGA_STATUS) & CGA_STATUS_RETRACE) == 0) {}
            while ((inp(PORT_CGA_STATUS) & CGA_STATUS_RETRACE) != 0) {}
        }
    /* 0x62f */
    }
    /* 0x634 */
}

// 635
void drawLine(int16 *pageNum, int x1, int y1, int x2, int y2, int color) {
    gfx_jump_0e_setCurBuf(*pageNum);
    gfx_jump_21(color);
    lineX1 = x1;
    lineY1 = y1;
    lineX2 = x2;
    lineY2 = y2;
    drawLineWrapper();
    gfx_jump_23();
    // 673
}

/* 0x674 */
int showPic640(char* filename)
{
    int fileHandle;
    intRegs[1] = INT_VID_MODESET;
    intRegs[0] = MODE_640_350;
    intDispatch(IRQ_VIDEO, intRegs, intRegs);
    gfx_jump_44_setDac(4);
    fileHandle = openFileWrapper(filename, 0);
    picBlit(fileHandle, 0);
    closeFileWrapper(fileHandle);
}

// 6c8
void missionSelect()
{
    int index, count;
    TRACE(("missionSelect(): entering"));
    // 6d3
    gfx_jump_44_setDac(1);
    // 6de
    gfx_jump_3d_null(0);
    // 6f0
    openShowPic(aWall_pic, *page1NumPtr);
    TRACE(("missionSelect(): shown wall"));
    // 6f6
    clearBriefing();
    TRACE(("missionSelect(): cleared briefing"));
    // 704
    nearmemset(scenarioFoundArr, 0, 5);
    // 71e
    gameData->difficulty = missionMenuSelect(missDiffLevels, missDiffDesc, aDifficulty, gameData->difficulty);
    TRACE(("missionSelect(): selected difficulty: %d", gameData->difficulty));
    // 72c
selectTheater:
    if (gameData->theater > 4)
        gameData->theater = 4;
    // 73d
    checkDiskA();
    // 74b
    nearmemset(scenarioFoundArr, 0, 5);
    // 765
    gameData->theater = missionMenuSelect(missTheaNames, missTheaDesc, aTheater, gameData->theater);
    // 76b
    if (gameData->theater == THEATER_OTHER) { // other scenario selected
        // 781
        for (count = 4, index = 0; index < 4; index++) { // find extra scenarios
            plh3d3Ptr[0] = *scenarioCodePtr[index];
            plh3d3Ptr[1] = *(scenarioCodePtr[index] + 1);
            // 7c2

            if ((scenarioFoundArr[index] = ((fileHandle = fopen(plh3d3Ptr, aRb_1)) == NULL))) count--;
            // 7e4
            fclose(fileHandle);
        }
        // 7ec
        if (count == 0) { // no scenarios found, print message and go back to previous screen
            clearBriefing();
            drawStringCentered(page1NumPtr, aNoScenarioFile, 0x71, 0x3c, 0xb9);
            drawStringCentered(page1NumPtr, aSeeTechnicalSu, 0x71, 0x48, 0xb9);
            enableHighlight = 0;
            timerCounter3 = 6;
            animateArm(armPosition, armPosition);
            waitJoyKey();
            // 845
            goto selectTheater;
        }
        // 857
        gameData->theater = missionMenuSelect(missScenarioNames, missScenarioDesc, aTheater, 0) + 4;
        if (gameData->theater == 8) {
            goto selectTheater;
        }
    }

    // 876
    // show mission type dialog for desert storm
    if (gameData->theater == THEATER_DS && gameData->difficulty != DIFFICULTY_DEMO) {
        // 890
        scenarioFoundArr[0] = scenarioFoundArr[1] = 0;
        // 895
        scenarioFoundArr[2] = scenarioFoundArr[3] = scenarioFoundArr[4] = 1;
        // 8ad
        if (missionMenuSelect(missTypeNames, missTypeDesc, aMissionType, 0) == 0) {
            // 8c2
            nearmemset(scenarioFoundArr, 0, 5);

            // 8c8
            do {
                // 8d8
                if ((missionPick = missionMenuSelect(missHistorical1Names, missHistorical1Desc, missionStr, 4)) != 4) break;
                // 8f8
            } while ((missionPick = missionMenuSelect(missHistorical2Names, missHistorical2Desc, missionStr, 4) + 4) == 8);
        }
    }
    // 909-0x90d
}

// 90e
int missionMenuSelect(char **names, char **desc, char *title, int selection)
{
    int a, row, act;
    TRACE(("missionMenuSelect(): entering, selection %d", selection));
    enableHighlight = 1;
    drawColor = COLOR_TITLE;
    // 934
    drawStringCentered(page1NumPtr, title, 113, 14, 185);
    // 952
    drawLine(page1NumPtr, 173, 22, 235, 22, 1);
    TRACE(("missionMenuSelect(): drawn title %s", title));
    a = 26;
    // 95d
    for (row = 0; row < 5; row++) {
        if (scenarioFoundArr[row] == 0) {
            drawColor = COLOR_TITLE;
            // 993
            drawStringCentered(page1NumPtr, names[row], 113, a, 185);
            fontIndex = FONT_SMALL;
            drawColor = COLOR_BRIEF_DESC_NORMAL;
            // 9c2
            drawStringCentered(page1NumPtr, desc[row], 113, a + 8, 185);
            TRACE(("missionMenuSelect(): drawn item %s/%s", names[row], desc[row]));
            fontIndex = FONT_NORMAL;
        }
        a += 21;
    }
    TRACE(("missionMenuSelect(): items drawn: %d", row));
    // 9d4
    setTimerIrqHandler();
    timerCounter3 = 6;
    // 9e4
    animateArm(-1, 6);
    for (row = 5; row >= selection; row--) {
        // a04
        animateArm(row + 1, row);
    }
    TRACE(("missionMenuSelect(): animated arm"));
    // a0c
    do {
again:
        // a12
        if ((act = processStoreInput()) != KEYCODE_ENTER) {
            // a17
            if (act == KEYCODE_UPARROW) {
                // a1c
                if (selection > 0) {
                    timerCounter3 = 6;
                    // a2f
                    animateArm(selection, selection - 1);
                    selection--;
                }
                // a38
            }
            // a3a
            else if (act == KEYCODE_DNARROW && selection < 4) {
                timerCounter3 = 6;
                // a54
                animateArm(selection, selection + 1);
                selection++;
            }
            // a5d
            goto again;
        }
    // a5f
    } while (scenarioFoundArr[selection] != 0);
    timerCounter3 = 6;
    // a71
    // animation to lower the arm after accepting?
    for (row = selection + 1; row <= 6; row++) {
        // a87
        animateArm(row - 1, row);
    }
    restoreTimerIrqHandler();
    clearBriefing();
    return selection;
}

// 0xa9f
void animateArm(int a, int b)
{
    int j;
    while (timerCounter3 < 6) {}
    timerCounter3 = 0;
    armPosition = b;
    j = word_171B2[b];
    // ac2
    if (a == -1) {
        // ae5
        gfx_jump_2a(*page1NumPtr, 0, 0, *page2NumPtr, 0, 0 , SCREEN_WIDTH, SCREEN_HEIGHT);
    }
    // aed
    if (b != -1) {
        // af3
        if (b < 5 && enableHighlight != 0) {
            // b24
            gfx_jump_29_switchColor(page1NumPtr, 113, b * 21 + 0x22, 297, b * 21 + 0x2a, COLOR_BRIEF_DESC_NORMAL, COLOR_BRIEF_DESC_HL);
        }
        // b2c
        showSprite(*page1NumPtr, word_1716A[j], word_1717A[j], word_1714A[j], word_1715A[j], word_1718A[j], word_1719A[j]);
    }
    // b55
    if (commData->gfxModeNum == GFX_MODE_MDA || commData->gfxModeNum == GFX_MODE_EGA) { // mda or cga?
        // b70
        gfx_jump_52(*page1NumPtr);
        // b7c
        waitMdaCgaStatus(1);
        // ba9
        *page1NumPtr ^= 1;
        // b89
        if (a == -1) {
            // ba9
            gfx_jump_2a(*page2NumPtr, 0, 0, *page1NumPtr, 0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        } else {// bb3
            // bd7
            gfx_jump_2a(*page2NumPtr, spriteBlitX, spriteBlitY, *page1NumPtr, spriteBlitX, spriteBlitY, spriteBlitW, spriteBlitH);
            // bdf
            if (a < 5 && enableHighlight != 0) {
                // c10
                gfx_jump_29_switchColor(page1NumPtr, 113, (21 * a) + 0x22, 297, (21 * a) + 0x2a, COLOR_BRIEF_DESC_HL, COLOR_BRIEF_DESC_NORMAL);
            } // c18
        }
        spriteBlitX = word_1716A[j];
        spriteBlitY = word_1717A[j];
        spriteBlitW = word_1718A[j];
        spriteBlitH = word_1719A[j];
    }
    else { // c3c
        gfx_jump_0e_setCurBuf(0);
        // c4b
        gfx_jump_30_blitToCurrent(page1Ptr);
        spriteBlitX = word_1716A[j];
        spriteBlitY = word_1717A[j];
        spriteBlitW = word_1718A[j];
        spriteBlitH = word_1719A[j];
        // c95
        gfx_jump_2a(*page2NumPtr, spriteBlitX, spriteBlitY, *page1NumPtr, spriteBlitX, spriteBlitY, spriteBlitW, spriteBlitH);
        // c9d
        if (b < 5 && enableHighlight != 0) {
            // cce
            gfx_jump_29_switchColor(page1NumPtr, 113, b * 21 + 0x22, 297, b * 21 + 0x2a, COLOR_BRIEF_DESC_HL, COLOR_BRIEF_DESC_NORMAL);
        } //cd9
    }
}

// cdb
int askRepeatMission() {
    char keycode;
    drawColor = COLOR_BRIEF_DESC_HL;
    drawStringCentered(page1NumPtr, aRepeatLastMiss, 0x71, 0x42, 0xb9);
    enableHighlight = 0;
    timerCounter3 = 6;
    animateArm(armPosition, armPosition);
    clearBriefing();
    keycode = misc_jump_5b_getkey();
    if (keycode == 'Y' || keycode == 'y') {
        return 1;
    }
    return 0;
}

// d3a
void checkDiskA() {
    while ((fileHandle = fopen(aF15_spr_1, aRb_2)) == NULL) {
        // d52
        clearBriefing();
        // d69
        drawStringCentered(page1NumPtr, aPleaseReinsert, 0x71, 0x3d, 0xb9);
        page1NumPtr[6] = FONT_SMALL; // fontIndex?
        // d8c
        drawStringCentered(page1NumPtr, aPressSelectorW, 0x71, 0x49, 0xb9);
        page1NumPtr[6] = FONT_NORMAL;
        enableHighlight = 0;
        timerCounter3 = 6;
        // dae
        animateArm(armPosition, armPosition);
        // db4
        waitJoyKey();
    }
    // dbd
    fclose(fileHandle);
    // dc3
    clearBriefing();
}

// dca
void missionDecode() {
    drawColor = COLOR_BRIEF_DESC_NORMAL;
    drawStringCentered(page1NumPtr, aDecodingMissio, 0x71, 0x42, 0xb9);
    enableHighlight = 0;
    timerCounter3 = 6;
    animateArm(armPosition, armPosition);
}

// e0a
void printMission() {
    int j;
    // e10
    clearBriefing();
    drawColor = COLOR_TITLE;
    // e2d
    drawStringCentered(page1NumPtr, aTodaySMission, 0x71, 0x0e, 0xb9);
    // e4b
    drawLine(page1NumPtr, 0xa0, 0x16, 0xf9, 0x16, 1);
    // e61
    drawStringAt(page1NumPtr, aTakeoffFrom, 0x82, 0x20);
    drawColor = COLOR_BRIEF_DESC_HL;
    // e71
    placeString(targets[0].baseIdx);
    // e8b
    drawStringCentered(page1NumPtr, todayMissStrBuf, 0x71, 0x2a, 0xb9);
    // e99
    mystrcpy(todayMissStrBuf, aOnc_2);
    // eae
    mystrcat(todayMissStrBuf, getItemCoordStr(targets[0].baseIdx));
    fontIndex = FONT_SMALL;
    drawColor = COLOR_COORDS;
    // ed4
    drawStringCentered(page1NumPtr, todayMissStrBuf, 0x71, 0x34, 0xb9);
    fontIndex = FONT_NORMAL;
    drawColor = COLOR_TITLE;
    // ef6
    drawStringAt(page1NumPtr, aPrimaryTarget, 0x82, 0x40);
    drawColor = COLOR_BRIEF_DESC_HL;
    // f06
    placeString(targets[0].targetIdx);
    // f20
    drawStringCentered(page1NumPtr, todayMissStrBuf, 0x71, 0x4a, 0xb9);
    fontIndex = FONT_SMALL;
    drawColor = COLOR_COORDS;
    // f3a
    mystrcpy(todayMissStrBuf, aOnc_0);
    // f48
    mystrcat(todayMissStrBuf, targets[0].coord);
    // f62
    drawStringCentered(page1NumPtr, todayMissStrBuf, 0x71, 0x54, 0xb9);
    fontIndex = FONT_NORMAL;
    drawColor = COLOR_TITLE;
    // f84
    drawStringAt(page1NumPtr, aSecondaryTarge, 0x82, 0x60);
    drawColor = COLOR_BRIEF_DESC_HL;
    // f94
    placeString(target2.targetIdx);
    // fae
    drawStringCentered(page1NumPtr, todayMissStrBuf, 0x71, 0x6a, 0xb9);
    fontIndex = FONT_SMALL;
    drawColor = COLOR_COORDS;
    // fc8
    mystrcpy(todayMissStrBuf, aOnc_1);
    // fd6
    mystrcat(todayMissStrBuf, target2.coord);
    // ff0
    drawStringCentered(page1NumPtr, todayMissStrBuf, 0x71, 0x74, 0xb9);
    fontIndex = FONT_NORMAL;
    enableHighlight = 0;
    // 1002
    setTimerIrqHandler();
    timerCounter3 = 6;
    // 1012
    animateArm(-1, 6);
    // 1018
    for (j = 5; j >= 0; j--) {
        animateArm(j + 1, j);
    }
    timerCounter = 0;
    j++;
    // 1040
printMissionAgain:
    if (joyOrKey() == 0) {
        if (timerCounter >= PRINTMISS_TIMESTEP) {
            timerCounter = 0;
            if (j < 5) {
                // 1061
                animateArm(j, j + 1);
                if (++j != 3) {
                    // 1078
                    animateArm(j, j + 1);
                }
                j++;
            }
        }
        goto printMissionAgain;
    }
    // 1088
    for (;j <= 5; j++) {
        // 1096
        animateArm(j, j + 1);
    }

    // 109e
    restoreTimerIrqHandler();
    enableHighlight = 1;
}

// 10ab
int processStoreInput() {
    uint16 key;
    char n;
    int l;
    int j;
    j = l = 0;
    n = 0;
    // 10bd
    TRACE(("processStoreInput(): entering"));
    if (joyRepeatFlag == 1) { // 10c4
        timerCounter = 0;
        n = 1;
    }
    // 10d1
    if (commData->setupUseJoy == 1) { //10d8
        TRACE(("processStoreInput(): use joy 1"));
        j = misc_jump_5d_readJoy(0);
        l = misc_jump_5d_readJoy(1);
        pollJoystick();
    } // 10fa
    while ((misc_jump_5a_keybuf() != 0 && j == 0 && l == 0
        && joyAxes[0] >= JOY_DEADZONE_LO && joyAxes[0] <= JOY_DEADZONE_HI
        && joyAxes[1] >= JOY_DEADZONE_LO && joyAxes[1] <= JOY_DEADZONE_HI)
        || n == 1) {
        // XXX: case study for instruction skipping in mzdiff, change above while condition to true and uncomment, run mzdiff with refskip 1 tgtskip 2 to repro
        // if ((((((misc_jump_5a_keybuf() == 0) || (var_2 != 0)) || (var_4 != 0)) ||
        //     ((joyAxes[0] < 0x4e || (joyAxes[0] > 0xb2)))) ||
        //     ((joyAxes[1] < 0x4e || (joyAxes[1] > 0xb2)))) && (var_6 != 1)) break;
        if ((joyRepeatFlag == 1) && (0xf < timerCounter)) { //113f
            TRACE(("processStoreInput(): cond 1"));
            n = 0;
            joyRepeatFlag = 0;
        }
        // 1149
        if (commData->setupUseJoy == 1) { // 1154
            TRACE(("processStoreInput(): use joy 2"));
            j = misc_jump_5d_readJoy(0);
            l = misc_jump_5d_readJoy(1);
            pollJoystick();
        } // 1176
        if (cbreakHit != 0) {
            TRACE(("processStoreInput(): cbreak"));
            cleanup();
            restoreCbreakHandler();
            exit(0);
        }
        // blink cursor on top of current pilot selection
        blinkPilot();
    } // 1192
    TRACE(("processStoreInput(): out of while"));
    if (misc_jump_5a_keybuf() == 0) {
        key = misc_jump_5b_getkey();
        TRACE(("processStoreInput(): got key 0x%x", key));
    }
    // 11a5
    else if (j == 1) {
        TRACE(("processStoreInput(): setting enter"));
        key = KEYCODE_ENTER;
    }
    // 11b2
    else if (joyAxes[1] < JOY_DEADZONE_LO) {
        TRACE(("processStoreInput(): joy up"));
        key = KEYCODE_UPARROW;
        joyRepeatFlag = 1;
    }
    // 11c6
    else if (joyAxes[1] > JOY_DEADZONE_HI) {
        TRACE(("processStoreInput(): joy dn"));
        key = KEYCODE_DNARROW;
        joyRepeatFlag = 1;
    }
    // 11da
    else if (joyAxes[0] < JOY_DEADZONE_LO) {
        TRACE(("processStoreInput(): joy left"));
        key = KEYCODE_LEFTARROW;
        joyRepeatFlag = 1;
    }
    // 11ee
    else if (joyAxes[0] > JOY_DEADZONE_HI) {
        TRACE(("processStoreInput(): joy right"));
        key = KEYCODE_RIGHTARROW;
        joyRepeatFlag = 1;
    }
    // 1200
    if (((uint8*)&key)[0]) {
        key = key & 0xff;
        TRACE(("processStoreInput(): anded to %u", key));
    }
    // 120a
    if (key == KEYCODE_ALTQ) {
        TRACE(("processStoreInput(): exiting"));
        cleanup();
        restoreCbreakHandler();
        exit(0);
    }
    TRACE(("processStoreInput(): tail returning 0x%x", key));
    return key;
}

// 1229
void clearBriefing(void)
{
    // clear briefing board
    clearRect(page1NumPtr, 113, 13, 297, 126);
}


// 1824
int seedRandom() {
    srand(getTimeOfDay());
}

// 1835
int randMul(uint16 arg) {
    return (rand() * (long)arg) >> 0xf;
}
