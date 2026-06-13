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


/* stinit_b.c - split from stinit.c, compiled /Gs /Zi */

void clearKeybuf()
{
    while (misc_jump_5a_keybuf() == 0) {
        misc_jump_5b_getkey();
    }
}

void waitJoyKey(void)
{
    while (joyOrKey() == 0) {}
}

int joyOrKey() {
    if (commData->setupUseJoy == 1) {
        if (misc_jump_5d_readJoy(0) != 0) {
            return 1;
        }
    }
    if (cbreakHit != 0) {
        cleanup();
        restoreCbreakHandler();
        exit(0);
    }
    if (misc_jump_5a_keybuf() != 0) {
        return 0;
    }
    // 5b6, alt-q hit check
    if (misc_jump_5b_getkey() == KEYCODE_ALTQ) {
        cleanup();
        exit(0);
    }
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

void drawLine(int16 *pageNum, int x1, int y1, int x2, int y2, int color) {
    gfx_setPageN(*pageNum);
    gfx_setColor(color);
    lineX1 = x1;
    lineY1 = y1;
    lineX2 = x2;
    lineY2 = y2;
    drawLineWrapper();
    gfx_nop23();
}

/* 0x674 */
void showPic640(char* filename)
{
    int fileHandle;
    intRegs[1] = INT_VID_MODESET;
    intRegs[0] = MODE_640_350;
    intDispatch(IRQ_VIDEO, intRegs, intRegs);
    gfx_setDac(4);
    fileHandle = openFileWrapper(filename, 0);
    picBlit(fileHandle, 0);
    closeFileWrapper(fileHandle);
}

/* ---- merged from stmissn.c ---- */
void missionSelect()
{
    int index, count;
    TRACE(("missionSelect(): entering"));
    gfx_setDac(1);
    gfx_setFadeSteps(0);
    openShowPic(aWall_pic, *page1NumPtr);
    TRACE(("missionSelect(): shown wall"));
    clearBriefing();
    TRACE(("missionSelect(): cleared briefing"));
    nearmemset(scenarioFoundArr, 0, 5);
    gameData->difficulty = missionMenuSelect(missDiffLevels, missDiffDesc, aDifficulty, gameData->difficulty);
    TRACE(("missionSelect(): selected difficulty: %d", gameData->difficulty));
selectTheater:
    if (gameData->theater > 4)
        gameData->theater = 4;
    checkDiskA();
    nearmemset(scenarioFoundArr, 0, 5);
    gameData->theater = missionMenuSelect(missTheaNames, missTheaDesc, aTheater, gameData->theater);
    if (gameData->theater == THEATER_OTHER) { // other scenario selected
        for (count = 4, index = 0; index < 4; index++) { // find extra scenarios
            plh3d3Ptr[0] = *scenarioCodePtr[index];
            plh3d3Ptr[1] = *(scenarioCodePtr[index] + 1);

            if ((scenarioFoundArr[index] = ((fileHandle = fopen(plh3d3Ptr, aRb_1)) == NULL))) count--;
            fclose(fileHandle);
        }
        if (count == 0) { // no scenarios found, print message and go back to previous screen
            clearBriefing();
            drawStringCentered(page1NumPtr, aNoScenarioFile, 0x71, 0x3c, 0xb9);
            drawStringCentered(page1NumPtr, aSeeTechnicalSu, 0x71, 0x48, 0xb9);
            enableHighlight = 0;
            timerCounter3 = 6;
            animateArm(armPosition, armPosition);
            waitJoyKey();
            goto selectTheater;
        }
        gameData->theater = missionMenuSelect(missScenarioNames, missScenarioDesc, aTheater, 0) + 4;
        if (gameData->theater == 8) {
            goto selectTheater;
        }
    }

    // show mission type dialog for desert storm
    if (gameData->theater == THEATER_DS && gameData->difficulty != DIFFICULTY_DEMO) {
        scenarioFoundArr[0] = scenarioFoundArr[1] = 0;
        scenarioFoundArr[2] = scenarioFoundArr[3] = scenarioFoundArr[4] = 1;
        if (missionMenuSelect(missTypeNames, missTypeDesc, aMissionType, 0) == 0) {
            nearmemset(scenarioFoundArr, 0, 5);

            do {
                if ((missionPick = missionMenuSelect(missHistorical1Names, missHistorical1Desc, missionStr, 4)) != 4) break;
            } while ((missionPick = missionMenuSelect(missHistorical2Names, missHistorical2Desc, missionStr, 4) + 4) == 8);
        }
    }
    // 909-0x90d
}

int missionMenuSelect(char **names, char **desc, char *title, int selection)
{
    int a, row, act;
    TRACE(("missionMenuSelect(): entering, selection %d", selection));
    enableHighlight = 1;
    page1Desc.color = COLOR_TITLE;
    drawStringCentered(page1NumPtr, title, 113, 14, 185);
    drawLine(page1NumPtr, 173, 22, 235, 22, 1);
    TRACE(("missionMenuSelect(): drawn title %s", title));
    a = 26;
    for (row = 0; row < 5; row++) {
        if (scenarioFoundArr[row] == 0) {
            page1Desc.color = COLOR_TITLE;
            drawStringCentered(page1NumPtr, names[row], 113, a, 185);
            page1Desc.font = FONT_SMALL;
            page1Desc.color = COLOR_BRIEF_DESC_NORMAL;
            drawStringCentered(page1NumPtr, desc[row], 113, a + 8, 185);
            TRACE(("missionMenuSelect(): drawn item %s/%s", names[row], desc[row]));
            page1Desc.font = FONT_NORMAL;
        }
        a += 21;
    }
    TRACE(("missionMenuSelect(): items drawn: %d", row));
    setTimerIrqHandler();
    timerCounter3 = 6;
    animateArm(-1, 6);
    for (row = 5; row >= selection; row--) {
        animateArm(row + 1, row);
    }
    TRACE(("missionMenuSelect(): animated arm"));
    do {
again:
        if ((act = processStoreInput()) != KEYCODE_ENTER) {
            if (act == KEYCODE_UPARROW) {
                if (selection > 0) {
                    timerCounter3 = 6;
                    animateArm(selection, selection - 1);
                    selection--;
                }
            }
            else if (act == KEYCODE_DNARROW && selection < 4) {
                timerCounter3 = 6;
                animateArm(selection, selection + 1);
                selection++;
            }
            goto again;
        }
    } while (scenarioFoundArr[selection] != 0);
    timerCounter3 = 6;
    // animation to lower the arm after accepting?
    for (row = selection + 1; row <= 6; row++) {
        animateArm(row - 1, row);
    }
    restoreTimerIrqHandler();
    clearBriefing();
    return selection;
}

void animateArm(int a, int b)
{
    int j;
    while (timerCounter3 < 6) {}
    timerCounter3 = 0;
    armPosition = b;
    j = armSpriteIndex[b];
    if (a == -1) {
        gfx_copyRect(*page1NumPtr, 0, 0, *page2NumPtr, 0, 0 , SCREEN_WIDTH, SCREEN_HEIGHT);
    }
    if (b != -1) {
        if (b < 5 && enableHighlight != 0) {
            gfx_switchColor(page1NumPtr, 113, b * 21 + 0x22, 297, b * 21 + 0x2a, COLOR_BRIEF_DESC_NORMAL, COLOR_BRIEF_DESC_HL);
        }
        showSprite(*page1NumPtr, armBlitX[j], armBlitY[j], armSrcX[j], armSrcY[j], armBlitW[j], armBlitH[j]);
    }
    if (commData->gfxModeNum == GFX_MODE_MDA || commData->gfxModeNum == GFX_MODE_EGA) { // mda or cga?
        gfx_setMonoFlag(*page1NumPtr);
        waitMdaCgaStatus(1);
        *page1NumPtr ^= 1;
        if (a == -1) {
            gfx_copyRect(*page2NumPtr, 0, 0, *page1NumPtr, 0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        } else {
            gfx_copyRect(*page2NumPtr, spriteBlitX, spriteBlitY, *page1NumPtr, spriteBlitX, spriteBlitY, spriteBlitW, spriteBlitH);
            if (a < 5 && enableHighlight != 0) {
                gfx_switchColor(page1NumPtr, 113, (21 * a) + 0x22, 297, (21 * a) + 0x2a, COLOR_BRIEF_DESC_HL, COLOR_BRIEF_DESC_NORMAL);
            }
        }
        spriteBlitX = armBlitX[j];
        spriteBlitY = armBlitY[j];
        spriteBlitW = armBlitW[j];
        spriteBlitH = armBlitH[j];
    }
    else {
        gfx_setPageN(0);
        gfx_blitToCurrent(page1Ptr);
        spriteBlitX = armBlitX[j];
        spriteBlitY = armBlitY[j];
        spriteBlitW = armBlitW[j];
        spriteBlitH = armBlitH[j];
        gfx_copyRect(*page2NumPtr, spriteBlitX, spriteBlitY, *page1NumPtr, spriteBlitX, spriteBlitY, spriteBlitW, spriteBlitH);
        if (b < 5 && enableHighlight != 0) {
            gfx_switchColor(page1NumPtr, 113, b * 21 + 0x22, 297, b * 21 + 0x2a, COLOR_BRIEF_DESC_HL, COLOR_BRIEF_DESC_NORMAL);
        } //cd9
    }
}

int askRepeatMission() {
    char keycode;
    page1Desc.color = COLOR_BRIEF_DESC_HL;
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

void checkDiskA() {
    while ((fileHandle = fopen(aF15_spr_1, aRb_2)) == NULL) {
        clearBriefing();
        drawStringCentered(page1NumPtr, aPleaseReinsert, 0x71, 0x3d, 0xb9);
        page1NumPtr[6] = FONT_SMALL; // page1Desc.font?
        drawStringCentered(page1NumPtr, aPressSelectorW, 0x71, 0x49, 0xb9);
        page1NumPtr[6] = FONT_NORMAL;
        enableHighlight = 0;
        timerCounter3 = 6;
        animateArm(armPosition, armPosition);
        waitJoyKey();
    }
    fclose(fileHandle);
    clearBriefing();
}

void missionDecode() {
    page1Desc.color = COLOR_BRIEF_DESC_NORMAL;
    drawStringCentered(page1NumPtr, aDecodingMissio, 0x71, 0x42, 0xb9);
    enableHighlight = 0;
    timerCounter3 = 6;
    animateArm(armPosition, armPosition);
}

void printMission() {
    int j;
    clearBriefing();
    page1Desc.color = COLOR_TITLE;
    drawStringCentered(page1NumPtr, aTodaySMission, 0x71, 0x0e, 0xb9);
    drawLine(page1NumPtr, 0xa0, 0x16, 0xf9, 0x16, 1);
    drawStringAt(page1NumPtr, aTakeoffFrom, 0x82, 0x20);
    page1Desc.color = COLOR_BRIEF_DESC_HL;
    placeString(targets[0].baseIdx);
    drawStringCentered(page1NumPtr, todayMissStrBuf, 0x71, 0x2a, 0xb9);
    mystrcpy(todayMissStrBuf, aOnc_2);
    mystrcat(todayMissStrBuf, getItemCoordStr(targets[0].baseIdx));
    page1Desc.font = FONT_SMALL;
    page1Desc.color = COLOR_COORDS;
    drawStringCentered(page1NumPtr, todayMissStrBuf, 0x71, 0x34, 0xb9);
    page1Desc.font = FONT_NORMAL;
    page1Desc.color = COLOR_TITLE;
    drawStringAt(page1NumPtr, aPrimaryTarget, 0x82, 0x40);
    page1Desc.color = COLOR_BRIEF_DESC_HL;
    placeString(targets[0].targetIdx);
    drawStringCentered(page1NumPtr, todayMissStrBuf, 0x71, 0x4a, 0xb9);
    page1Desc.font = FONT_SMALL;
    page1Desc.color = COLOR_COORDS;
    mystrcpy(todayMissStrBuf, aOnc_0);
    mystrcat(todayMissStrBuf, targets[0].coord);
    drawStringCentered(page1NumPtr, todayMissStrBuf, 0x71, 0x54, 0xb9);
    page1Desc.font = FONT_NORMAL;
    page1Desc.color = COLOR_TITLE;
    drawStringAt(page1NumPtr, aSecondaryTarge, 0x82, 0x60);
    page1Desc.color = COLOR_BRIEF_DESC_HL;
    placeString(targets[1].targetIdx);
    drawStringCentered(page1NumPtr, todayMissStrBuf, 0x71, 0x6a, 0xb9);
    page1Desc.font = FONT_SMALL;
    page1Desc.color = COLOR_COORDS;
    mystrcpy(todayMissStrBuf, aOnc_1);
    mystrcat(todayMissStrBuf, targets[1].coord);
    drawStringCentered(page1NumPtr, todayMissStrBuf, 0x71, 0x74, 0xb9);
    page1Desc.font = FONT_NORMAL;
    enableHighlight = 0;
    setTimerIrqHandler();
    timerCounter3 = 6;
    animateArm(-1, 6);
    for (j = 5; j >= 0; j--) {
        animateArm(j + 1, j);
    }
    timerCounter = 0;
    j++;
printMissionAgain:
    if (joyOrKey() == 0) {
        if (timerCounter >= PRINTMISS_TIMESTEP) {
            timerCounter = 0;
            if (j < 5) {
                animateArm(j, j + 1);
                if (++j != 3) {
                    animateArm(j, j + 1);
                }
                j++;
            }
        }
        goto printMissionAgain;
    }
    for (;j <= 5; j++) {
        animateArm(j, j + 1);
    }

    restoreTimerIrqHandler();
    enableHighlight = 1;
}

int processStoreInput() {
    uint16 key;
    char n;
    int l;
    int j;
    j = l = 0;
    n = 0;
    TRACE(("processStoreInput(): entering"));
    if (joyRepeatFlag == 1) {
        timerCounter = 0;
        n = 1;
    }
    if (commData->setupUseJoy == 1) { //10d8
        TRACE(("processStoreInput(): use joy 1"));
        j = misc_jump_5d_readJoy(0);
        l = misc_jump_5d_readJoy(1);
        pollJoystick();
    }
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
        if (commData->setupUseJoy == 1) {
            TRACE(("processStoreInput(): use joy 2"));
            j = misc_jump_5d_readJoy(0);
            l = misc_jump_5d_readJoy(1);
            pollJoystick();
        }
        if (cbreakHit != 0) {
            TRACE(("processStoreInput(): cbreak"));
            cleanup();
            restoreCbreakHandler();
            exit(0);
        }
        // blink cursor on top of current pilot selection
        blinkPilot();
    }
    TRACE(("processStoreInput(): out of while"));
    if (misc_jump_5a_keybuf() == 0) {
        key = misc_jump_5b_getkey();
        TRACE(("processStoreInput(): got key 0x%x", key));
    }
    else if (j == 1) {
        TRACE(("processStoreInput(): setting enter"));
        key = KEYCODE_ENTER;
    }
    else if (joyAxes[1] < JOY_DEADZONE_LO) {
        TRACE(("processStoreInput(): joy up"));
        key = KEYCODE_UPARROW;
        joyRepeatFlag = 1;
    }
    else if (joyAxes[1] > JOY_DEADZONE_HI) {
        TRACE(("processStoreInput(): joy dn"));
        key = KEYCODE_DNARROW;
        joyRepeatFlag = 1;
    }
    else if (joyAxes[0] < JOY_DEADZONE_LO) {
        TRACE(("processStoreInput(): joy left"));
        key = KEYCODE_LEFTARROW;
        joyRepeatFlag = 1;
    }
    else if (joyAxes[0] > JOY_DEADZONE_HI) {
        TRACE(("processStoreInput(): joy right"));
        key = KEYCODE_RIGHTARROW;
        joyRepeatFlag = 1;
    }
    if (((uint8*)&key)[0]) {
        key = key & 0xff;
        TRACE(("processStoreInput(): anded to %u", key));
    }
    if (key == KEYCODE_ALTQ) {
        TRACE(("processStoreInput(): exiting"));
        cleanup();
        restoreCbreakHandler();
        exit(0);
    }
    TRACE(("processStoreInput(): tail returning 0x%x", key));
    return key;
}

void clearBriefing(void)
{
    // clear briefing board
    clearRect(page1NumPtr, 113, 13, 297, 126);
}
