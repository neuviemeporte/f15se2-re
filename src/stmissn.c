#include "inttype.h"
#include "offsets.h"
#include "pointers.h"
#include "comm.h"
#include "shared/common.h"
#include "gfx.h"
#include "slot.h"
#include "const.h"

#include "log.h"
#include "stcode.h"
#include "stdata.h"
#include "stgen.h"
#include "stmissn.h"
#include "stpilot.h"
#include "stsprit.h"
#include "sttypes.h"

#include <stdio.h>
#include <dos.h>

/* Private helpers for this translation unit. */
void waitJoyKey(void);
int joyOrKey();
void drawLine(const int16 *pageNum, int x1, int y1, int x2, int y2, int color);
int missionMenuSelect(const char **names, const char **desc, const char *title, int s);
void animateArm(int, int);
void clearBriefing(void);

void clearKeybuf()
{
    while (misc_checkKeyBuf() == 0) {
        misc_getKey();
    }
}

void waitJoyKey(void)
{
    while (joyOrKey() == 0) {}
}

int joyOrKey() {
    if (commData->setupUseJoy == 1) {
        if (misc_readJoystick(0) != 0) {
            return 1;
        }
    }
    if (cbreakHit != 0) {
        cleanup();
        restoreCbreakHandler();
        exit(0);
    }
    if (misc_checkKeyBuf() != 0) {
        return 0;
    }
    // alt-q hit check
    if (misc_getKey() == KEYCODE_ALTQ) {
        cleanup();
        exit(0);
    }
    return 1;
}

void waitMdaCgaStatus(int16 iter)
{
    while (iter-- != 0) {
        if (commData->setupMono != 0) {
            while ((inp(PORT_MDA_STATUS) & MDA_STATUS_RETRACE) == 0) {}
            while ((inp(PORT_MDA_STATUS) & MDA_STATUS_RETRACE) != 0) {}
        }
        else {
            while ((inp(PORT_CGA_STATUS) & CGA_STATUS_RETRACE) == 0) {}
            while ((inp(PORT_CGA_STATUS) & CGA_STATUS_RETRACE) != 0) {}
        }
    }
}

void drawLine(const int16 *pageNum, int x1, int y1, int x2, int y2, int color) {
    gfx_setPageN(*pageNum);
    gfx_setColor(color);
    lineX1 = x1;
    lineY1 = y1;
    lineX2 = x2;
    lineY2 = y2;
    drawLineWrapper();
    gfx_nop23();
}

void showPic640(const char* filename)
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
    gfx_setDac(1);
    gfx_setFadeSteps(0);
    openShowPic("Wall.Pic", *page1NumPtr);
    clearBriefing();
    nearmemset(scenarioFoundArr, 0, 5);
    gameData->difficulty = missionMenuSelect(missDiffLevels, missDiffDesc, "DIFFICULTY", gameData->difficulty);
    Log(("missionSelect(): selected difficulty: %d", gameData->difficulty));
selectTheater:
    if (gameData->theater > 4)
        gameData->theater = 4;
    checkDiskA();
    nearmemset(scenarioFoundArr, 0, 5);
    gameData->theater = missionMenuSelect(missTheaNames, missTheaDesc, "THEATER", gameData->theater);
    if (gameData->theater == THEATER_OTHER) { // other scenario selected
        for (count = 4, index = 0; index < 4; index++) { // find extra scenarios
            plh3d3Ptr[0] = *scenarioCodePtr[index];
            plh3d3Ptr[1] = *(scenarioCodePtr[index] + 1);

            if ((scenarioFoundArr[index] = ((fileHandle = fopen(plh3d3Ptr, "rb")) == NULL))) count--;
            fclose(fileHandle);
        }
        if (count == 0) { // no scenarios found, print message and go back to previous screen
            clearBriefing();
            drawStringCentered(page1NumPtr, "No scenario files found", 113, 60, 185);
            drawStringCentered(page1NumPtr, "See Technical Supplement", 113, 72, 185);
            enableHighlight = 0;
            timerCounter3 = 6;
            animateArm(armPosition, armPosition);
            waitJoyKey();
            goto selectTheater;
        }
        gameData->theater = missionMenuSelect(missScenarioNames, missScenarioDesc, "THEATER", 0) + 4;
        if (gameData->theater == 8) {
            goto selectTheater;
        }
    }

    // show mission type dialog for desert storm
    if (gameData->theater == THEATER_DS && gameData->difficulty != DIFFICULTY_DEMO) {
        scenarioFoundArr[0] = scenarioFoundArr[1] = 0;
        scenarioFoundArr[2] = scenarioFoundArr[3] = scenarioFoundArr[4] = 1;
        if (missionMenuSelect(missTypeNames, missTypeDesc, "MISSION TYPE", 0) == 0) {
            nearmemset(scenarioFoundArr, 0, 5);

            do {
                if ((missionPick = missionMenuSelect(missHistorical1Names, missHistorical1Desc, missionStr, 4)) != 4) break;
            } while ((missionPick = missionMenuSelect(missHistorical2Names, missHistorical2Desc, missionStr, 4) + 4) == 8);
        }
    }
}

int missionMenuSelect(const char **names, const char **desc, const char *title, int selection)
{
    int yPos, row, action;
    Log(("missionMenuSelect(): entering, selection %d", selection));
    enableHighlight = 1;
    page1Desc.color = COLOR_TITLE;
    drawStringCentered(page1NumPtr, title, 113, 14, 185);
    drawLine(page1NumPtr, 173, 22, 235, 22, 1);
    Log(("missionMenuSelect(): drawn title %s", title));
    yPos = 26;
    for (row = 0; row < 5; row++) {
        if (scenarioFoundArr[row] == 0) {
            page1Desc.color = COLOR_TITLE;
            drawStringCentered(page1NumPtr, names[row], 113, yPos, 185);
            page1Desc.font = FONT_SMALL;
            page1Desc.color = COLOR_BRIEF_DESC_NORMAL;
            drawStringCentered(page1NumPtr, desc[row], 113, yPos + 8, 185);
            Log(("missionMenuSelect(): drawn item %s/%s", names[row], desc[row]));
            page1Desc.font = FONT_NORMAL;
        }
        yPos += 21;
    }
    Log(("missionMenuSelect(): items drawn: %d", row));
    setTimerIrqHandler();
    timerCounter3 = 6;
    animateArm(-1, 6);
    for (row = 5; row >= selection; row--) {
        animateArm(row + 1, row);
    }
    do {
again:
        if ((action = pollMenuInput()) != KEYCODE_ENTER) {
            if (action == KEYCODE_UPARROW) {
                if (selection > 0) {
                    timerCounter3 = 6;
                    animateArm(selection, selection - 1);
                    selection--;
                }
            }
            else if (action == KEYCODE_DNARROW && selection < 4) {
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
    int spriteIdx;
    while (timerCounter3 < 6) {}
    timerCounter3 = 0;
    armPosition = b;
    spriteIdx = armSpriteIndex[b];
    if (a == -1) {
        gfx_copyRect(*page1NumPtr, 0, 0, *page2NumPtr, 0, 0 , SCREEN_WIDTH, SCREEN_HEIGHT);
    }
    if (b != -1) {
        if (b < 5 && enableHighlight != 0) {
            gfx_switchColor(page1NumPtr, 113, b * 21 + 34, 297, b * 21 + 42, COLOR_BRIEF_DESC_NORMAL, COLOR_BRIEF_DESC_HL);
        }
        showSprite(*page1NumPtr, armBlitX[spriteIdx], armBlitY[spriteIdx], armSrcX[spriteIdx], armSrcY[spriteIdx], armBlitW[spriteIdx], armBlitH[spriteIdx]);
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
                gfx_switchColor(page1NumPtr, 113, (21 * a) + 34, 297, (21 * a) + 42, COLOR_BRIEF_DESC_HL, COLOR_BRIEF_DESC_NORMAL);
            }
        }
        spriteBlitX = armBlitX[spriteIdx];
        spriteBlitY = armBlitY[spriteIdx];
        spriteBlitW = armBlitW[spriteIdx];
        spriteBlitH = armBlitH[spriteIdx];
    }
    else {
        gfx_setPageN(0);
        gfx_blitToCurrent(page1Ptr);
        spriteBlitX = armBlitX[spriteIdx];
        spriteBlitY = armBlitY[spriteIdx];
        spriteBlitW = armBlitW[spriteIdx];
        spriteBlitH = armBlitH[spriteIdx];
        gfx_copyRect(*page2NumPtr, spriteBlitX, spriteBlitY, *page1NumPtr, spriteBlitX, spriteBlitY, spriteBlitW, spriteBlitH);
        if (b < 5 && enableHighlight != 0) {
            gfx_switchColor(page1NumPtr, 113, b * 21 + 34, 297, b * 21 + 42, COLOR_BRIEF_DESC_HL, COLOR_BRIEF_DESC_NORMAL);
        }
    }
}

int askRepeatMission() {
    char keycode;
    page1Desc.color = COLOR_BRIEF_DESC_HL;
    drawStringCentered(page1NumPtr, "Repeat last mission ? (y/n)", 113, 66, 185);
    enableHighlight = 0;
    timerCounter3 = 6;
    animateArm(armPosition, armPosition);
    clearBriefing();
    keycode = misc_getKey();
    if (keycode == 'Y' || keycode == 'y') {
        return 1;
    }
    return 0;
}

void checkDiskA() {
    while ((fileHandle = fopen("F15.spr", "rb")) == NULL) {
        clearBriefing();
        drawStringCentered(page1NumPtr, "Please reinsert F15 Disk A", 113, 61, 185);
        page1NumPtr[6] = FONT_SMALL; // page1Desc.font?
        drawStringCentered(page1NumPtr, "<Press selector when ready>", 113, 73, 185);
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
    drawStringCentered(page1NumPtr, "decoding mission...", 113, 66, 185);
    enableHighlight = 0;
    timerCounter3 = 6;
    animateArm(armPosition, armPosition);
}

void printMission() {
    int armStep;
    clearBriefing();
    page1Desc.color = COLOR_TITLE;
    drawStringCentered(page1NumPtr, "TODAY'S MISSION", 113, 14, 185);
    drawLine(page1NumPtr, 160, 22, 249, 22, 1);
    drawStringAt(page1NumPtr, "Takeoff from:", 130, 32);
    page1Desc.color = COLOR_BRIEF_DESC_HL;
    buildTargetLabel(targets[0].baseIdx);
    drawStringCentered(page1NumPtr, todayMissStrBuf, 113, 42, 185);
    mystrcpy(todayMissStrBuf, "ONC ");
    mystrcat(todayMissStrBuf, getItemCoordStr(targets[0].baseIdx));
    page1Desc.font = FONT_SMALL;
    page1Desc.color = COLOR_COORDS;
    drawStringCentered(page1NumPtr, todayMissStrBuf, 113, 52, 185);
    page1Desc.font = FONT_NORMAL;
    page1Desc.color = COLOR_TITLE;
    drawStringAt(page1NumPtr, "Primary Target:", 130, 64);
    page1Desc.color = COLOR_BRIEF_DESC_HL;
    buildTargetLabel(targets[0].targetIdx);
    drawStringCentered(page1NumPtr, todayMissStrBuf, 113, 74, 185);
    page1Desc.font = FONT_SMALL;
    page1Desc.color = COLOR_COORDS;
    mystrcpy(todayMissStrBuf, "ONC ");
    mystrcat(todayMissStrBuf, targets[0].coord);
    drawStringCentered(page1NumPtr, todayMissStrBuf, 113, 84, 185);
    page1Desc.font = FONT_NORMAL;
    page1Desc.color = COLOR_TITLE;
    drawStringAt(page1NumPtr, "Secondary Target:", 130, 96);
    page1Desc.color = COLOR_BRIEF_DESC_HL;
    buildTargetLabel(targets[1].targetIdx);
    drawStringCentered(page1NumPtr, todayMissStrBuf, 113, 106, 185);
    page1Desc.font = FONT_SMALL;
    page1Desc.color = COLOR_COORDS;
    mystrcpy(todayMissStrBuf, "ONC ");
    mystrcat(todayMissStrBuf, targets[1].coord);
    drawStringCentered(page1NumPtr, todayMissStrBuf, 113, 116, 185);
    page1Desc.font = FONT_NORMAL;
    enableHighlight = 0;
    setTimerIrqHandler();
    timerCounter3 = 6;
    animateArm(-1, 6);
    for (armStep = 5; armStep >= 0; armStep--) {
        animateArm(armStep + 1, armStep);
    }
    timerCounter = 0;
    armStep++;
printMissionAgain:
    if (joyOrKey() == 0) {
        if (timerCounter >= PRINTMISS_TIMESTEP) {
            timerCounter = 0;
            if (armStep < 5) {
                animateArm(armStep, armStep + 1);
                if (++armStep != 3) {
                    animateArm(armStep, armStep + 1);
                }
                armStep++;
            }
        }
        goto printMissionAgain;
    }
    for (;armStep <= 5; armStep++) {
        animateArm(armStep, armStep + 1);
    }

    restoreTimerIrqHandler();
    enableHighlight = 1;
}

int pollMenuInput() {
    uint16 key;
    char repeatHold;
    int joy1;
    int joy0;
    joy0 = joy1 = 0;
    repeatHold = 0;
    if (joyRepeatFlag == 1) {
        timerCounter = 0;
        repeatHold = 1;
    }
    if (commData->setupUseJoy == 1) {
        joy0 = misc_readJoystick(0);
        joy1 = misc_readJoystick(1);
        pollJoystick();
    }
    while ((misc_checkKeyBuf() != 0 && joy0 == 0 && joy1 == 0
        && joyAxes[0] >= JOY_DEADZONE_LO && joyAxes[0] <= JOY_DEADZONE_HI
        && joyAxes[1] >= JOY_DEADZONE_LO && joyAxes[1] <= JOY_DEADZONE_HI)
        || repeatHold == 1) {
        // XXX: case study for instruction skipping in mzdiff, change above while condition to true and uncomment, run mzdiff with refskip 1 tgtskip 2 to repro
        // if ((((((misc_checkKeyBuf() == 0) || (var_2 != 0)) || (var_4 != 0)) ||
        //     ((joyAxes[0] < 0x4e || (joyAxes[0] > 0xb2)))) ||
        //     ((joyAxes[1] < 0x4e || (joyAxes[1] > 0xb2)))) && (var_6 != 1)) break;
        if ((joyRepeatFlag == 1) && (15 < timerCounter)) { //113f
            repeatHold = 0;
            joyRepeatFlag = 0;
        }
        if (commData->setupUseJoy == 1) {
            joy0 = misc_readJoystick(0);
            joy1 = misc_readJoystick(1);
            pollJoystick();
        }
        if (cbreakHit != 0) {
            cleanup();
            restoreCbreakHandler();
            exit(0);
        }
        // blink cursor on top of current pilot selection
        blinkPilot();
    }
    if (misc_checkKeyBuf() == 0) {
        key = misc_getKey();
        Log(("pollMenuInput(): got key 0x%x", key));
    }
    else if (joy0 == 1) {
        key = KEYCODE_ENTER;
    }
    else if (joyAxes[1] < JOY_DEADZONE_LO) {
        key = KEYCODE_UPARROW;
        joyRepeatFlag = 1;
    }
    else if (joyAxes[1] > JOY_DEADZONE_HI) {
        key = KEYCODE_DNARROW;
        joyRepeatFlag = 1;
    }
    else if (joyAxes[0] < JOY_DEADZONE_LO) {
        key = KEYCODE_LEFTARROW;
        joyRepeatFlag = 1;
    }
    else if (joyAxes[0] > JOY_DEADZONE_HI) {
        key = KEYCODE_RIGHTARROW;
        joyRepeatFlag = 1;
    }
    if (((uint8*)&key)[0]) {
        key = key & 0xff;
        Log(("pollMenuInput(): anded to %u", key));
    }
    if (key == KEYCODE_ALTQ) {
        cleanup();
        restoreCbreakHandler();
        exit(0);
    }
    Log(("pollMenuInput(): tail returning 0x%x", key));
    return key;
}

void clearBriefing(void)
{
    // clear briefing board
    clearRect(page1NumPtr, 113, 13, 297, 126);
}
