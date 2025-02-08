#include "inttype.h"
#include "offsets.h"
#include "pointers.h"
#include "comm.h"
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
    if (*iacaSuFlag0Ptr == 0) {
        /* looks like arg is unused inside driver function, maybe it was in an older version of the overlay? */
        gfx_jump_3c_setMode13(commData->setupMono);
        /* 0x4f2, looks like a gfx mode set flag? */
        *iacaSuFlag0Ptr = 1;
    }
    /* 0x4fb */
    commData->gfxModeNum = gfx_jump_3f_modecode();
    misc_jump_5e_clearKeyFlags();
}

// 511
int cleanup() 
{
    char regs[0xe];
    if (timerHandlerInstalled == 1) {
        restoreTimerIrqHandler();
    }
    regs[1] = 0; // func 0
    regs[0] = 3; // mode 3 (80x25)
    intDispatch(IRQ_VIDEO, regs, regs);
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
    if (misc_jump_5b_getkey() == 0x1000) { // 5c0 
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
void drawLine(int *pageNum, int x1, int y1, int x2, int y2, int color) {
    gfx_jump_0e_setCurBuf(*pageNum);
    gfx_jump_21(color);
    word_1786F = x1;
    word_17873 = y1;
    word_17871 = x2;
    word_17875 = y2;
    sub_12DEA();
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
            drawString(page1NumPtr, aNoScenarioFile, 0x71, 0x3c, 0xb9);
            drawString(page1NumPtr, aSeeTechnicalSu, 0x71, 0x48, 0xb9);
            enableHighlight = 0;
            timerCounter3 = 6;
            animateArm(word_19656, word_19656);
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
    int var_y, var_counter, var_input;
    TRACE(("missionMenuSelect(): entering, selection %d", selection));
    enableHighlight = 1;
    drawColor = 1;
    // 934
    drawString(page1NumPtr, title, 113, 14, 185);
    // 952
    drawLine(page1NumPtr, 173, 22, 235, 22, 1);
    TRACE(("missionMenuSelect(): drawn title %s", title));
    var_y = 26;
    // 95d
    for (var_counter = 0; var_counter < 5; var_counter++) {
        if (scenarioFoundArr[var_counter] == 0) {
            drawColor = 1;
            // 993
            drawString(page1NumPtr, names[var_counter], 113, var_y, 185);
            fontIndex = 4;
            drawColor = 7;
            // 9c2
            drawString(page1NumPtr, desc[var_counter], 113, var_y + 8, 185);
            TRACE(("missionMenuSelect(): drawn item %s/%s", names[var_counter], desc[var_counter]));
            fontIndex = 1;
        }
        var_y += 21;
    }
    TRACE(("missionMenuSelect(): items drawn: %d", var_counter));
    // 9d4
    setTimerIrqHandler();
    timerCounter3 = 6;
    // 9e4
    animateArm(-1, 6);
    for (var_counter = 5; var_counter >= selection; var_counter--) {
        // a04
        animateArm(var_counter + 1, var_counter);
    }
    TRACE(("missionMenuSelect(): animated arm"));
    // a0c
    do {
again:
        // a12
        if ((var_input = processStoreInput()) != KEYCODE_ENTER) {
            // a17
            if (var_input == KEYCODE_UPARROW) {
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
            else if (var_input == KEYCODE_DNARROW && selection < 4) {
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
    for (var_counter = selection + 1; var_counter <= 6; var_counter++) {
        // a87
        animateArm(var_counter - 1, var_counter);
    }
    restoreTimerIrqHandler();
    clearBriefing();
    return selection;
}

// 0xa9f
void animateArm(int a, int b)
{
    int var_2;
    while (timerCounter3 < 6) {}
    timerCounter3 = 0;
    word_19656 = b;
    var_2 = word_171B2[b];
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
        showSprite(*page1NumPtr, word_1716A[var_2], word_1717A[var_2], word_1714A[var_2], word_1715A[var_2], word_1718A[var_2], word_1719A[var_2]);
    }
    // b55
    if (commData->gfxModeNum == 1 || commData->gfxModeNum == 2) { // mda or cga?
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
            gfx_jump_2a(*page2NumPtr, word_19658, word_1965A, *page1NumPtr, word_19658, word_1965A, word_1965C, word_1965E);
            // bdf
            if (a < 5 && enableHighlight != 0) {
                // c10
                gfx_jump_29_switchColor(page1NumPtr, 113, (21 * a) + 0x22, 297, (21 * a) + 0x2a, COLOR_BRIEF_DESC_HL, COLOR_BRIEF_DESC_NORMAL);
            } // c18
        }
        word_19658 = word_1716A[var_2];
        word_1965A = word_1717A[var_2];
        word_1965C = word_1718A[var_2];
        word_1965E = word_1719A[var_2];
    }
    else { // c3c
        gfx_jump_0e_setCurBuf(0);
        // c4b
        gfx_jump_30_blitToCurrent(page1Ptr);
        word_19658 = word_1716A[var_2];
        word_1965A = word_1717A[var_2];
        word_1965C = word_1718A[var_2];
        word_1965E = word_1719A[var_2];
        // c95
        gfx_jump_2a(*page2NumPtr, word_19658, word_1965A, *page1NumPtr, word_19658, word_1965A, word_1965C, word_1965E);
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
    drawColor = 8;
    drawString(page1NumPtr, aRepeatLastMiss, 0x71, 0x42, 0xb9);
    enableHighlight = 0;
    timerCounter3 = 6;
    animateArm(word_19656, word_19656);
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
        drawString(page1NumPtr, aPleaseReinsert, 0x71, 0x3d, 0xb9);
        page1NumPtr[6] = 4; // fontIndex?
        // d8c
        drawString(page1NumPtr, aPressSelectorW, 0x71, 0x49, 0xb9);
        page1NumPtr[6] = 1;
        enableHighlight = 0;
        timerCounter3 = 6;
        // dae
        animateArm(word_19656, word_19656);
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
    drawColor = 7;
    drawString(page1NumPtr, aDecodingMissio, 0x71, 0x42, 0xb9);
    enableHighlight = 0;
    timerCounter3 = 6;
    animateArm(word_19656, word_19656);
}

// e0a
void printMission() {
    int var_2;
    // e10
    clearBriefing();
    drawColor = 1;
    // e2d
    drawString(page1NumPtr, aTodaySMission, 0x71, 0x0e, 0xb9);
    // e4b
    drawLine(page1NumPtr, 0xa0, 0x16, 0xf9, 0x16, 1);
    // e61
    actualDrawString(page1NumPtr, aTakeoffFrom, 0x82, 0x20);
    drawColor = 8;
    // e71
    sub_154A1(targets[0].field_4);
    // e8b
    drawString(page1NumPtr, todayMissStrBuf, 0x71, 0x2a, 0xb9);
    // e99
    mystrcpy(todayMissStrBuf, aOnc_2);
    // eae
    mystrcat(todayMissStrBuf, sub_152F4(targets[0].field_4));
    fontIndex = 4;
    drawColor = 3;
    // ed4
    drawString(page1NumPtr, todayMissStrBuf, 0x71, 0x34, 0xb9);
    fontIndex = 1;
    drawColor = 1;
    // ef6
    actualDrawString(page1NumPtr, aPrimaryTarget, 0x82, 0x40);
    drawColor = 8;
    // f06
    sub_154A1(targets[0].field_2);
    // f20
    drawString(page1NumPtr, todayMissStrBuf, 0x71, 0x4a, 0xb9);
    fontIndex = 4;
    drawColor = 3;
    // f3a
    mystrcpy(todayMissStrBuf, aOnc_0);
    // f48
    mystrcat(todayMissStrBuf, targets[0].coord);
    // f62
    drawString(page1NumPtr, todayMissStrBuf, 0x71, 0x54, 0xb9);
    fontIndex = 1;
    drawColor = 1;
    // f84
    actualDrawString(page1NumPtr, aSecondaryTarge, 0x82, 0x60);
    drawColor = 8;
    // f94
    sub_154A1(target2.field_2);
    // fae
    drawString(page1NumPtr, todayMissStrBuf, 0x71, 0x6a, 0xb9);
    fontIndex = 4;
    drawColor = 3;
    // fc8
    mystrcpy(todayMissStrBuf, aOnc_1);
    // fd6
    mystrcat(todayMissStrBuf, target2.coord);
    // ff0
    drawString(page1NumPtr, todayMissStrBuf, 0x71, 0x74, 0xb9);
    fontIndex = 1;
    enableHighlight = 0;
    // 1002
    setTimerIrqHandler();
    timerCounter3 = 6;
    // 1012
    animateArm(-1, 6);
    // 1018
    for (var_2 = 5; var_2 >= 0; var_2--) {
        animateArm(var_2 + 1, var_2);
    }
    timerCounter = 0;
    var_2++;
    // 1040
printMissionAgain:
    if (joyOrKey() == 0) {
        if (timerCounter >= PRINTMISS_TIMESTEP) {
            timerCounter = 0;
            if (var_2 < 5) {
                // 1061
                animateArm(var_2, var_2 + 1);
                if (++var_2 != 3) {
                    // 1078
                    animateArm(var_2, var_2 + 1);
                }
                var_2++;
            }
        }
        goto printMissionAgain;
    }
    // 1088
    for (;var_2 <= 5; var_2++) {
        // 1096
        animateArm(var_2, var_2 + 1);
    }

    // 109e
    restoreTimerIrqHandler();
    enableHighlight = 1;
}

// 10ab
int processStoreInput() {
    uint16 var_A;
    char var_6;
    int var_4;
    int var_2;
    var_2 = var_4 = 0;
    var_6 = 0;
    // 10bd
    TRACE(("processStoreInput(): entering"));
    if (word_17282 == 1) { // 10c4
        timerCounter = 0;
        var_6 = 1;
    }
    // 10d1
    if (commData->setupUseJoy == 1) { //10d8
        TRACE(("processStoreInput(): use joy 1"));
        var_2 = misc_jump_5d_readJoy(0);
        var_4 = misc_jump_5d_readJoy(1);
        sub_16A7F();
    } // 10fa
    while ((misc_jump_5a_keybuf() != 0 && var_2 == 0 && var_4 == 0 
        && noJoy80[0] >= 0x4e && noJoy80[0] <= 0xb2 
        && noJoy80[1] >= 0x4e && noJoy80[1] <= 0xb2) 
        || var_6 == 1) {
        // XXX: case study for instruction skipping in mzdiff, change above while condition to true and uncomment, run mzdiff with refskip 1 tgtskip 2 to repro
        // if ((((((misc_jump_5a_keybuf() == 0) || (var_2 != 0)) || (var_4 != 0)) ||
        //     ((noJoy80[0] < 0x4e || (noJoy80[0] > 0xb2)))) ||
        //     ((noJoy80[1] < 0x4e || (noJoy80[1] > 0xb2)))) && (var_6 != 1)) break;
        if ((word_17282 == 1) && (0xf < timerCounter)) { //113f
            TRACE(("processStoreInput(): cond 1"));
            var_6 = 0;
            word_17282 = 0;
        }
        // 1149
        if (commData->setupUseJoy == 1) { // 1154
            TRACE(("processStoreInput(): use joy 2"));
            var_2 = misc_jump_5d_readJoy(0);
            var_4 = misc_jump_5d_readJoy(1);
            sub_16A7F();
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
        var_A = misc_jump_5b_getkey();
        TRACE(("processStoreInput(): got key 0x%x", var_A));
    }
    // 11a5
    else if (var_2 == 1) {
        TRACE(("processStoreInput(): setting enter"));
        var_A = 0xd;
    }
    // 11b2
    else if (noJoy80[1] < 0x4e) {
        TRACE(("processStoreInput(): joy up"));
        var_A = KEYCODE_UPARROW;
        word_17282 = 1;
    }
    // 11c6
    else if (noJoy80[1] > 0xb2) {
        TRACE(("processStoreInput(): joy dn"));
        var_A = KEYCODE_DNARROW;
        word_17282 = 1;
    }
    // 11da
    else if (noJoy80[0] < 0x4e) {
        TRACE(("processStoreInput(): joy left"));
        var_A = KEYCODE_LEFTARROW;
        word_17282 = 1;
    }
    // 11ee
    else if (noJoy80[0] > 0xb2) {
        TRACE(("processStoreInput(): joy right"));
        var_A = KEYCODE_RIGHTARROW;
        word_17282 = 1;
    }
    // 1200
    if (((uint8*)&var_A)[0]) {
        var_A = var_A & 0xff;
        TRACE(("processStoreInput(): anded to %u", var_A));
    }
    // 120a
    if (var_A == 0x1000) {
        TRACE(("processStoreInput(): exiting"));
        cleanup();
        restoreCbreakHandler();
        exit(0);
    }
    TRACE(("processStoreInput(): tail returning 0x%x", var_A));
    return var_A;
}

// 1229
void clearBriefing(void)
{
    // clear briefing board
    clearRect(page1NumPtr, 113, 13, 297, 126);
}

// 12b8
void actualDrawString(int *pageNum, const char *string, int x, int y) {
    pageNum[4] = x;
    pageNum[5] = y;
    gfx_jump_05_drawString(pageNum, string);
}

// 1577
void drawString(int *page, const char *str, int startx, int y, int endx) {
    int width;
    // 1538
    width = stringWidth(page, str);
    // 15a4
    actualDrawString(page, str, (endx - width) / 2 + startx, y);
}

// 15ae
int stringWidth(int *page, const char *str) {
    int var_6;
    const uint8* var_4;
    int var_2;
    var_4 = str;
    var_2 = page[6];
    var_6 = 0;
    // 15cb
    while (*var_4 != '\0') {
        // 15db
        var_6 += gfx_jump_2f_charWidth(*(var_4++), var_2);
        // 15e6
    } // 15e8
    return var_6;
}

// 15f1
int my_ltoa(int32 arg_0, int8* arg_4) {
    int8 var_A, var_C;
    int8 *var_8;
    int8 var_6[6];
    var_8 = arg_4;
    if (arg_0 < 0) { // 1604
        arg_0 = -arg_0;
        *var_8 = '-';
        var_8++;
    } // 1620
    // 162f
    var_6[0] = arg_0 % 0xa;
    // 163c
    arg_0 /= 0xa;
    // 164e
    var_6[1] = arg_0 % 0xa;
    // 165b
    arg_0 /= 0xa;
    // 166d
    var_6[2] = arg_0 % 0xa;
    // 167a
    arg_0 /= 0xa;
    // 168c
    var_6[3] = arg_0 % 0xa;
    // 1699
    arg_0 /= 0xa;
    // 16ab
    var_6[4] = arg_0 % 0xa;
    // 16b8
    arg_0 /= 0xa;
    // 16ca
    var_6[5] = arg_0 % 0xa;
    // 16cd
    var_A = 0;
    // 16d1
    for (var_C = 5; var_C > 0; var_C--) { // 16e0
        if (var_6[var_C] != 0) break;
    } // 16f0
    do {
        if (var_C == 2 && var_A == 1) { // 16f6
            *var_8 = ',';
            var_8++;
        } // 1705
        *var_8 = var_6[var_C] + '0';
        var_A = 1;
        var_8++;
    } while (--var_C >= 0);
    // 1724
    *var_8 = '\0';
    TRACE(("my_ltoa: exiting: %s", arg_4));
}

// 172c
int my_itoa(int arg_0, int8 *arg_2) {
    int8 var_6[6];
    int8 var_A, var_C;
    int8 *var_8;
    var_8 = arg_2;
    if (arg_0 < 0) { // 173f
        arg_0 = -arg_0;
        *var_8 = 0x2d; // minus sign
        var_8++;
    } // 1750
    var_6[0] = arg_0 % 0xa;
    arg_0 /= 0xa;
    var_6[1] = arg_0 % 0xa;
    arg_0 /= 0xa;
    var_6[2] = arg_0 % 0xa;
    arg_0 /= 0xa;
    var_6[3] = arg_0 % 0xa;
    arg_0 /= 0xa;
    var_6[4] = arg_0 % 0xa;
    arg_0 /= 0xa;
    var_6[5] = arg_0 % 0xa;
    // 17a7
    var_A = 0;
    for (var_C = 5; var_C > 0; var_C--) {
        if (var_6[var_C] != 0) break;
    } // 16f0
    do {
        if (var_C == 2 && var_A == 1) {
            *var_8 = 0x2c;
            var_8++;
        }
        *var_8 = var_6[var_C] + 0x30;
        var_A = 1;
        var_8++;
    } while (--var_C >= 0);
    // 17fe
    *var_8 = 0;
}

// 1824
int seedRandom() {
    srand(getTimeOfDay());
}

// 1835
int randMul(uint16 arg) {
    return (rand() * (long)arg) >> 0xf;
}
