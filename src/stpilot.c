/* Pilot selection and display */
#include "stcode.h"
#include "stdata.h"
#include "stgen.h"
#include "stmissn.h"
#include "stpilot.h"
#include "stsprit.h"
#include "sttypes.h"
#include "const.h"
#include "gfx.h"
#include "slot.h"
#include "comm.h"
#include "offsets.h"
#include "shared/common.h"
#include "debug.h"

#include <stdio.h>
#include <dos.h>
#include <string.h>

/* Private helpers for this translation unit. */
int doFcbSearch();
void updateHallfame();
void displayPilots(void);
void printPilot(int);
void processPilotInput();
void gameDataToPilot(struct Pilot *pilot);
void pilotToGameData(const uint8 *pilotData);
void pilotNameInput(int16 *, int, int, int, struct Pilot *);
void loadHallfame(void);
void saveHallfame();
int getJoyKey();
int readInputKey();

void pilotSelect(int16 needSplash)
{
    int unused;
    TRACE(("pilotSelect(): entering, needSplash %d", needSplash));
    gfx_waitRetrace();
    loadHallfame();
    TRACE(("pilotSelect(): loaded hallfame"));
    if (needSplash == 0) {
        updateHallfame();
        TRACE(("pilotSelect(): updated hallfame"));
    }
    gfx_setFadeSteps(4);
    loadPic("ArmPiece.Pic", menuSprites);
    TRACE(("pilotSelect(): loaded armpiece"));
    gfx_setFadeSteps(7);
    openShowPic("HiScore.Pic", *screenBuf);
    TRACE(("pilotSelect(): showed hiscore pic"));
    displayPilots();
    TRACE(("pilotSelect(): showed prompt"));
    gfx_setDac(1);
    gfx_flipPage();
    TRACE(("pilotSelect(): retrace done"));
    processPilotInput();
    TRACE(("pilotSelect(): processed pilot input, selected %d", selectedPilotIdx));
    pilotToGameData((uint8*)&hallfameBuf[selectedPilotIdx]);
    TRACE(("pilotSelect(): updated pilot in game data"));
    screenBuf[3] = 0;
    clearRect(screenBuf, 0, 0, SCREEN_MAXX, SCREEN_MAXY);
    TRACE(("pilotSelect(): returning"));
}

void updateHallfame()
{
    int shiftIdx;
    if (gameData->hallOfFameEligible != 0) {
        selectedPilotIdx = HALLFAME_SLOTS - 2;
        for (; selectedPilotIdx >= 0; selectedPilotIdx--) {
            if (hallfameBuf[selectedPilotIdx].total_score >= gameData->totalScore) break;
        }
        selectedPilotIdx++;
        for (shiftIdx = gameData->pilotIdx - 1; shiftIdx >= selectedPilotIdx; shiftIdx--) {
                hallfameBuf[shiftIdx + 1] = hallfameBuf[shiftIdx];
            }
    }
    else {
        selectedPilotIdx = gameData->pilotIdx;
    }
    gameDataToPilot(&hallfameBuf[selectedPilotIdx]);
    if (doFcbSearch() != 0) {
        saveHallfame();
        return;
    }
    screenBuf[3] = 0;
    clearRect(screenBuf, 0, 0, SCREEN_MAXX, SCREEN_MAXY);
    gfx_commitPage();
    screenBuf[2] = COLOR_WHITE;
    drawStringCentered(screenBuf, "Original Disk in drive.  Roster will not be saved.", 0, 100, 320);
    drawStringCentered(screenBuf, "Press a key to continue.", 0, 150, 320);
    screenBuf[2] = COLOR_GRAY;
    gfx_flipPage();
    misc_getKey();
    gfx_waitRetrace();
}

void displayPilots(void)
{
    int pilotIdx;
    screenBuf[3] = 0;
    pilotIdx = 0;
    do {
        TRACE(("displayPilots(): iteration %d", pilotIdx));
        printPilot(pilotIdx);
    } while (++pilotIdx < HALLFAME_SLOTS);
    TRACE(("displayPilots(): loop terminating"));
    screenDesc.color = COLOR_WHITE;
    drawStringCentered(pageNumPtr, "Use SELECTOR to choose pilot,  ESC to enter new pilot.", 0, 192, 320);
    TRACE(("displayPilots(): drawn prompt"));
    gfx_commitPage();
    TRACE(("displayPilots(): exiting"));
}

void printPilot(int pilotIdx) {
    struct Pilot *pilot;
    int xPos;
    int yPos;
    int medalIdx;
    int totalMedalWidth;
    pilot = &hallfameBuf[pilotIdx];
    xPos = (pilotIdx < PILOTS_PER_COLUMN) ? PILOT_COL_LEFT : PILOT_COL_RIGHT;
    yPos = ((pilotIdx & (PILOTS_PER_COLUMN - 1)) * PILOT_ROW_HEIGHT) + PILOT_TOP_MARGIN;
    clearRect(screenBuf, xPos, yPos - 1, xPos + PILOT_ENTRY_WIDTH, yPos + 32);
    screenDesc.color = (pilotIdx == selectedPilotIdx) ? COLOR_WHITE : COLOR_GRAY;
    mystrcpy(todayMissStrBuf, ranks[pilot->rank & 0xf]);
    TRACE(("printPilot(): strcpy %s", todayMissStrBuf));
    mystrcat(todayMissStrBuf, pilot->name);
    TRACE(("printPilot(): strcat %s", todayMissStrBuf));
    drawStringCentered(screenBuf, todayMissStrBuf, xPos, yPos, 144);
    TRACE(("printPilot(): drawn string %s", todayMissStrBuf));
    screenDesc.color = COLOR_RED;
    screenDesc.font = 4;
    my_ltoa(pilot->total_score, todayMissStrBuf);
    TRACE(("printPilot(): ltoa 1 %ld -> %s, about to cat %s", pilot->total_score, todayMissStrBuf, " ("));
    mystrcat(todayMissStrBuf, " (");
    TRACE(("printPilot(): strcat2 %s", todayMissStrBuf));
    my_itoa(pilot->last_score, &todayMissStrBuf[mystrlen(todayMissStrBuf)]);
    mystrcat(todayMissStrBuf, ")");
    TRACE(("printPilot(): strcat3 %s", todayMissStrBuf));
    drawStringCentered(screenBuf, todayMissStrBuf, xPos, yPos + 9, 144);
    TRACE(("printPilot(): drawn string2"));
    screenDesc.font = 1;
    for (medalIdx = 0, totalMedalWidth = 0; medalIdx < 7; medalIdx++) {
        if ((pilot->medals & (1 << medalIdx)) == 0) continue;
        totalMedalWidth += medalWidth[medalIdx] + 4;
    }
    TRACE(("printPilot(): past loop 1, totalMedalWidth = %d", totalMedalWidth));
    xPos += (144 - totalMedalWidth) / 2;
    yPos += 17;
    medalIdx = 0;
    // display medals
    do {
        if ((pilot->medals & (1 << medalIdx)) == 0) continue;
        showSprite(screenBuf[0], xPos, yPos, medalSpriteX[medalIdx], medalSpriteY[medalIdx], medalWidth[medalIdx], 16);
        xPos += medalWidth[medalIdx] + 4;
    } while(++medalIdx < 7);
    TRACE(("printPilot(): returning"));
}

/* ---- merged from stpinp.c ---- */
void processPilotInput() {
    int prevIdx;
    int xPos;
    int shiftIdx;
    int yPos;
    pilotSelectFlag = 1;
    setTimerIrqHandler();
    TRACE(("processPilotInput(): set timer irq"));
    while (prevIdx = selectedPilotIdx, true) switch (pollMenuInput()) {
    case KEYCODE_ENTER:
        TRACE(("processPilotInput(): enter"));
        if ((hallfameBuf[selectedPilotIdx].medals & 0x60) == 0) {
            restoreTimerIrqHandler();
            pilotSelectFlag = 0;
            TRACE(("processPilotInput(): accepted %d", selectedPilotIdx));
            return;
        }
        putch(CHAR_BELL);
        continue;
    case KEYCODE_ESC:
        TRACE(("processPilotInput(): esc"));
        hallfameBuf[selectedPilotIdx].theater
            = hallfameBuf[selectedPilotIdx].difficulty
            = hallfameBuf[selectedPilotIdx].total_score
            = hallfameBuf[selectedPilotIdx].last_score
            = hallfameBuf[selectedPilotIdx].medals
            = hallfameBuf[selectedPilotIdx].rank
            = 0;
        pilotNameInput(screenBuf, MAX_PILOT_NAME_LEN, PILOT_NAME_HEIGHT, PILOT_NAME_HEIGHT, &hallfameBuf[selectedPilotIdx]);
        pilotToGameData((uint8*)&hallfameBuf[selectedPilotIdx]);
        shiftIdx = selectedPilotIdx;
        while (shiftIdx < HALLFAME_SLOTS - 1) {
            hallfameBuf[shiftIdx] = hallfameBuf[shiftIdx + 1];
            shiftIdx++;
        }
        gameDataToPilot(&hallfameBuf[HALLFAME_SLOTS - 1]);
        selectedPilotIdx = HALLFAME_SLOTS - 1;
        displayPilots();
        if (doFcbSearch() != 0) {
            saveHallfame();
        }
        continue;
    case KEYCODE_UPARROW:
        TRACE(("processPilotInput(): up"));
        selectedPilotIdx--;
        goto handleArrow;
    case KEYCODE_DNARROW:
        TRACE(("processPilotInput(): down"));
        selectedPilotIdx++;
        goto handleArrow;
    case KEYCODE_LEFTARROW:
        TRACE(("processPilotInput(): left"));
        selectedPilotIdx -= PILOTS_PER_COLUMN;
        goto handleArrow;
    case KEYCODE_RIGHTARROW:
        TRACE(("processPilotInput(): right"));
        selectedPilotIdx += PILOTS_PER_COLUMN;
handleArrow:
        selectedPilotIdx &= HALLFAME_SLOTS - 1;
        xPos = (prevIdx < PILOTS_PER_COLUMN) ? PILOT_COL_LEFT : PILOT_COL_RIGHT;
        yPos = ((prevIdx & (PILOTS_PER_COLUMN - 1)) * PILOT_ROW_HEIGHT) + PILOT_TOP_MARGIN;
        // looks like ChangeColor() from library.h?
        gfx_switchColor(screenBuf, xPos, yPos, xPos + PILOT_ENTRY_WIDTH, yPos + PILOT_NAME_HEIGHT, COLOR_WHITE, COLOR_GRAY);
        xPos = (selectedPilotIdx < PILOTS_PER_COLUMN) ? PILOT_COL_LEFT : PILOT_COL_RIGHT;
        yPos = ((selectedPilotIdx & (PILOTS_PER_COLUMN - 1)) * PILOT_ROW_HEIGHT) + PILOT_TOP_MARGIN;
        gfx_switchColor(screenBuf, xPos, yPos, xPos + PILOT_ENTRY_WIDTH, yPos + PILOT_NAME_HEIGHT, COLOR_GRAY, COLOR_WHITE);
    }
    TRACE(("processPilotInput(): returning, selected %d", selectedPilotIdx));
}

void blinkPilot() {
    int16 xPos, yPos;
    if (pilotSelectFlag == 0) return;
    waitMdaCgaStatus(6);
    xPos = selectedPilotIdx < PILOTS_PER_COLUMN ? PILOT_COL_LEFT : PILOT_COL_RIGHT;
    yPos = ((selectedPilotIdx & (PILOTS_PER_COLUMN - 1)) * PILOT_ROW_HEIGHT) + PILOT_TOP_MARGIN;
    gfx_switchColor(screenBuf, xPos , yPos, xPos + PILOT_ENTRY_WIDTH, yPos + PILOT_NAME_HEIGHT, blinkColors[blinkColorIdx], blinkColors[blinkColorIdx ^ 1]);
    blinkColorIdx ^= 1;
}

void gameDataToPilot(struct Pilot *pilot) {
    //uint16 var_4;
    int charIdx;
    for (charIdx = 0; (pilot->name[charIdx] = gameData->pilotName[charIdx]); charIdx++) {
    }
    pilot->total_score = gameData->totalScore;
    pilot->last_score = gameData->lastScore;
    pilot->theater = gameData->theater;
    pilot->difficulty = gameData->difficulty;
    pilot->rank = (gameData->rankHigh * 64) + gameData->rank;
    pilot->medals = (uint8)((gameData->campaignProgress == 2) ? 0x20 : 0) + (uint8)((gameData->campaignProgress == 1) ? 0x40 : 0) + gameData->medals;
}

// TODO: change argument to struct Pilot
void pilotToGameData(const uint8 *pilotData)
{
    int charIdx;
    for (charIdx = 0; 1; charIdx++) {
        if ((gameData->pilotName[charIdx] = pilotData[charIdx]) == '\0') break;
    }
    gameData->totalScore = *(const uint32*)(pilotData + ROSTER_SCORE_LO);
    gameData->lastScore = *(const uint16*)(pilotData + ROSTER_LASTSCORE);
    gameData->theater = *(pilotData + ROSTER_THEATER);
    gameData->difficulty = *(pilotData + ROSTER_DIFFICULTY);
    gameData->rank = *(pilotData + ROSTER_UNK1) & 0xf;
    gameData->medals = *(pilotData + ROSTER_UNK2) & 0x1f;
    gameData->rankHigh = *(pilotData + ROSTER_UNK1) >> 6;
    gameData->campaignProgress = 0;
    gameData->pilotIdx = selectedPilotIdx;
}

void pilotNameInput(int16 *page, int a, int b, int c, struct Pilot *pilot) {
    int blinkToggle;
    int xPos, yPos;
    int nameLen;
    int cursorX;
    uint16 keyCode;
    int rankWidth;
    blinkToggle = 0;
    TRACE(("pilotNameInput(): entering with page = %d, abc = %d/%d/%d, pilot: %s", *page, a,b,c, pilot->name));
    xPos = (selectedPilotIdx < PILOTS_PER_COLUMN) ? PILOT_COL_LEFT : PILOT_COL_RIGHT;
    yPos = ((selectedPilotIdx & (PILOTS_PER_COLUMN - 1)) * PILOT_ROW_HEIGHT) + PILOT_TOP_MARGIN;
    clearRect(page, xPos, yPos, xPos + PILOT_ENTRY_WIDTH, yPos + 35);
    drawStringAt(page, ranks[0], xPos, yPos);
    xPos += (rankWidth = stringWidth(page, ranks[0]));
    rankWidth = PILOT_ENTRY_WIDTH - rankWidth;
    screenBuf[3] = 0;
    clearRect(page, 15, 192, 303, 197);
    drawStringCentered(pageNumPtr, "\376ENTER YOUR NAME !", 15, 192, 289);
    misc_clearKeyFlags();
    keyCode = KEYCODE_CTRLX;
    TRACE(("pilotNameInput(): before loop"));
    do {
        TRACE(("pilotNameInput(): loop iter, keyCode = 0x%x", keyCode));
        switch(keyCode) {
        case KEYCODE_CTRLX:
            TRACE(("pilotNameInput(): case 0x18"));
            nameLen = 0;
            pilot->name[0] = '\0';
            clearRect(page, xPos, yPos, xPos + rankWidth, yPos + c);
            drawStringAt(page, pilot->name, xPos, yPos);
            cursorX = page[4];
            break;
        case 8: // backspace
            TRACE(("pilotNameInput(): case 8"));
            if (nameLen > 0) {
                nameLen--;
                pilot->name[nameLen] = '\0';
                // 2403 - duplicate code block coalesced with above
                clearRect(page, xPos, yPos, xPos + rankWidth, yPos + c);
                drawStringAt(page, pilot->name, xPos, yPos);
                cursorX = page[4];
            }
            break;
        default:
            TRACE(("pilotNameInput(): case default"));
            if (keyCode >= 0x20 && keyCode <= 0x7f && nameLen < a && stringWidth(page, pilot->name) <= 144) {
                TRACE(("pilotNameInput(): case default condition true, nameLen = %d", nameLen));
                pilot->name[nameLen++] = keyCode;
                pilot->name[nameLen] = '\0';
                clearRect(page, xPos, yPos, xPos + rankWidth, yPos + c);
                drawStringAt(page, pilot->name, xPos, yPos);
                cursorX = page[4];
            }
            break;
        }
        TRACE(("pilotNameInput(): before input loop"));
        while (getJoyKey() == 0) {
            waitMdaCgaStatus(3);
            gfx_switchColor(page, xPos, yPos - 1, xPos + rankWidth, yPos + c,
                pilotNameInputColors[blinkToggle], pilotNameInputColors[blinkToggle ^ 1]);
            blinkToggle ^= 1;
            page[3] = pilotNameInputColors[blinkToggle];
        }
        TRACE(("pilotNameInput(): after input loop"));
        keyCode = readInputKey();
        if ((keyCode & 0xff) != 0) {
            keyCode &= 0xff;
        }
        TRACE(("pilotNameInput(): after sub_125e4, keyCode = 0x%x", keyCode));
        if (keyCode == KEYCODE_ENTER) {
            screenBuf[3] = 0;
            clearRect(page, 15, 192, 303, 197);
            return;
        }
    } while( true );
    TRACE(("pilotNameInput(): exiting"));
}


void loadHallfame(void)
{
    int slotIdx;
    FILE *handle;
    TRACE(("loadHallfame(): reading from %s", "HallFame"));
    handle = fopen("HallFame", "rb");
    fread(&selectedPilotIdx, 2, 1, handle);
    TRACE(("loadHallfame(): count = %d", selectedPilotIdx));
    slotIdx = 0;
    do {
        fread(hallfameBuf + slotIdx, HALLFAME_RECORDSZ, 1, handle);
        slotIdx++;
    } while (slotIdx < HALLFAME_SLOTS);
    fclose(handle);
}

void saveHallfame() {
    FILE *fp;
    int idx;
    fp = fopen("HallFame", "wb");
    fwrite(&selectedPilotIdx, 2, 1, fp);
    idx = 0;
    do {
        fwrite(&hallfameBuf[idx], HALLFAME_RECORDSZ, 1, fp);
    } while (++idx < HALLFAME_SLOTS);
    fclose(fp);
}

int getJoyKey() {
    if (commData->setupUseJoy == 1) {
        if (misc_readJoystick(0) != 0) return 1;
    }
    if (cbreakHit != 0) {
        cleanup();
        restoreCbreakHandler();
        exit(0);
    }
    return misc_checkKeyBuf() == 0;
}

/* ---- merged from stinkey.c ---- */
int readInputKey() {
    int key;
    if (commData->setupUseJoy == 1) {
        do {
            if (misc_checkKeyBuf() == 0) break;
        } while (misc_readJoystick(0) == 0);
        if (misc_checkKeyBuf() != 0) {
            key = KEYCODE_ENTER;
            goto checkKey;
        }
    }
    key = misc_getKey();
checkKey:
    if (key == KEYCODE_ALTQ || cbreakHit != 0) {
        cleanup();
        if (cbreakHit != 0) restoreCbreakHandler();
        exit(0);
    }
    return key;
}
