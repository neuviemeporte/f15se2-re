/* Pilot selection and display */
#include "start.h"
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
    loadPic(aArmpiece_pic, menuSprites);
    TRACE(("pilotSelect(): loaded armpiece"));
    gfx_setFadeSteps(7);
    openShowPic(aHiscore_pic, *screenBuf);
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
    int j;
    if (gameData->hallOfFameEligible != 0) {
        selectedPilotIdx = HALLFAME_SLOTS - 2;
        for (; selectedPilotIdx >= 0; selectedPilotIdx--) {
            if (hallfameBuf[selectedPilotIdx].total_score >= gameData->totalScore) break;
        }
        selectedPilotIdx++;
        for (j = gameData->pilotIdx - 1; j >= selectedPilotIdx; j--) {
                hallfameBuf[j + 1] = hallfameBuf[j];
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
    drawStringCentered(screenBuf, aOriginalDiskIn, 0, 0x64, 0x140);
    drawStringCentered(screenBuf, aPressAKeyToCon, 0, 0x96, 0x140);
    screenBuf[2] = COLOR_GRAY;
    gfx_flipPage();
    misc_jump_5b_getkey();
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
    drawStringCentered(pageNumPtr, aUseSelectorToC, 0, 0xC0, 0x140);
    TRACE(("displayPilots(): drawn prompt"));
    gfx_commitPage();
    TRACE(("displayPilots(): exiting"));
}

void printPilot(int pilotIdx) {
    struct Pilot *pilot;
    int x;
    int yPos;
    int medalIdx;
    int totalMedalWidth;
    pilot = &hallfameBuf[pilotIdx];
    x = (pilotIdx < PILOTS_PER_COLUMN) ? PILOT_COL_LEFT : PILOT_COL_RIGHT;
    yPos = ((pilotIdx & (PILOTS_PER_COLUMN - 1)) * PILOT_ROW_HEIGHT) + PILOT_TOP_MARGIN;
    clearRect(screenBuf, x, yPos - 1, x + PILOT_ENTRY_WIDTH, yPos + 0x20);
    screenDesc.color = (pilotIdx == selectedPilotIdx) ? COLOR_WHITE : COLOR_GRAY;
    mystrcpy(todayMissStrBuf, ranks[pilot->rank & 0xf]);
    TRACE(("printPilot(): strcpy %s", todayMissStrBuf));
    mystrcat(todayMissStrBuf, pilot->name);
    TRACE(("printPilot(): strcat %s", todayMissStrBuf));
    drawStringCentered(screenBuf, todayMissStrBuf, x, yPos, 0x90);
    TRACE(("printPilot(): drawn string %s", todayMissStrBuf));
    screenDesc.color = COLOR_RED;
    screenDesc.font = 4;
    my_ltoa(pilot->total_score, todayMissStrBuf);
    TRACE(("printPilot(): ltoa 1 %ld -> %s, about to cat %s", pilot->total_score, todayMissStrBuf, asc_174AC));
    mystrcat(todayMissStrBuf, asc_174AC);
    TRACE(("printPilot(): strcat2 %s", todayMissStrBuf));
    my_itoa(pilot->last_score, &todayMissStrBuf[mystrlen(todayMissStrBuf)]);
    mystrcat(todayMissStrBuf, asc_174AF);
    TRACE(("printPilot(): strcat3 %s", todayMissStrBuf));
    drawStringCentered(screenBuf, todayMissStrBuf, x, yPos + 9, 0x90);
    TRACE(("printPilot(): drawn string2"));
    screenDesc.font = 1;
    for (medalIdx = 0, totalMedalWidth = 0; medalIdx < 7; medalIdx++) {
        if ((pilot->medals & (1 << medalIdx)) == 0) continue;
        totalMedalWidth += (uint8)medalWidth[medalIdx] + 4;
    }
    TRACE(("printPilot(): past loop 1, totalMedalWidth = %d", totalMedalWidth));
    x += (0x90 - totalMedalWidth) / 2;
    yPos += 0x11;
    medalIdx = 0;
    // display medals
    do {
        if ((pilot->medals & (1 << medalIdx)) == 0) continue;
        showSprite(screenBuf[0], x, yPos, medalSpriteX[medalIdx], medalSpriteY[medalIdx], medalWidth[medalIdx], 0x10);
        x += medalWidth[medalIdx] + 4;
    } while(++medalIdx < 7);
    TRACE(("printPilot(): returning"));
}

/* ---- merged from stpinp.c ---- */
void processPilotInput() {
    int pilot;
    int x;
    int counter;
    int y;
    pilotSelectFlag = 1;
    setTimerIrqHandler();
    TRACE(("processPilotInput(): set timer irq"));
    while (pilot = selectedPilotIdx, true) switch (pollMenuInput()) {
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
        counter = selectedPilotIdx;
        while (counter < HALLFAME_SLOTS - 1) {
            hallfameBuf[counter] = hallfameBuf[counter + 1];
            counter++;
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
        x = (pilot < PILOTS_PER_COLUMN) ? PILOT_COL_LEFT : PILOT_COL_RIGHT;
        y = ((pilot & (PILOTS_PER_COLUMN - 1)) * PILOT_ROW_HEIGHT) + PILOT_TOP_MARGIN;
        // looks like ChangeColor() from library.h?
        gfx_switchColor(screenBuf, x, y, x + PILOT_ENTRY_WIDTH, y + PILOT_NAME_HEIGHT, COLOR_WHITE, COLOR_GRAY);
        x = (selectedPilotIdx < PILOTS_PER_COLUMN) ? PILOT_COL_LEFT : PILOT_COL_RIGHT;
        y = ((selectedPilotIdx & (PILOTS_PER_COLUMN - 1)) * PILOT_ROW_HEIGHT) + PILOT_TOP_MARGIN;
        gfx_switchColor(screenBuf, x, y, x + PILOT_ENTRY_WIDTH, y + PILOT_NAME_HEIGHT, COLOR_GRAY, COLOR_WHITE);
    }
    TRACE(("processPilotInput(): returning, selected %d", selectedPilotIdx));
}

void blinkPilot() {
    int16 x, y;
    if (pilotSelectFlag == 0) return;
    waitMdaCgaStatus(6);
    x = selectedPilotIdx < PILOTS_PER_COLUMN ? PILOT_COL_LEFT : PILOT_COL_RIGHT;
    y = ((selectedPilotIdx & (PILOTS_PER_COLUMN - 1)) * PILOT_ROW_HEIGHT) + PILOT_TOP_MARGIN;
    gfx_switchColor(screenBuf, x , y, x + PILOT_ENTRY_WIDTH, y + PILOT_NAME_HEIGHT, blinkColors[blinkColorIdx], blinkColors[blinkColorIdx ^ 1]);
    blinkColorIdx ^= 1;
}

void gameDataToPilot(struct Pilot *pilot) {
    //uint16 var_4;
    int j;
    for (j = 0; pilot->name[j] = gameData->pilotName[j]; j++) {
    }
    pilot->total_score = gameData->totalScore;
    pilot->last_score = gameData->lastScore;
    pilot->theater = gameData->theater;
    pilot->difficulty = gameData->difficulty;
    pilot->rank = (gameData->rankHigh * 64) + gameData->rank;
    pilot->medals = (uint8)((gameData->campaignProgress == 2) ? 0x20 : 0) + (uint8)((gameData->campaignProgress == 1) ? 0x40 : 0) + gameData->medals;
}

// TODO: change argument to struct Pilot
void pilotToGameData(uint8 *pilotData)
{
    int counter;
    for (counter = 0; 1; counter++) {
        if ((gameData->pilotName[counter] = pilotData[counter]) == '\0') break;
    }
    gameData->totalScore = *(uint32*)(pilotData + ROSTER_SCORE_LO);
    gameData->lastScore = *(uint16*)(pilotData + ROSTER_LASTSCORE);
    gameData->theater = *(uint8*)(pilotData + ROSTER_THEATER);
    gameData->difficulty = *(uint8*)(pilotData + ROSTER_DIFFICULTY);
    gameData->rank = *(uint8*)(pilotData + ROSTER_UNK1) & 0xf;
    gameData->medals = *(uint8*)(pilotData + ROSTER_UNK2) & 0x1f;
    gameData->rankHigh = *(uint8*)(pilotData + ROSTER_UNK1) >> 6;
    gameData->campaignProgress = 0;
    gameData->pilotIdx = selectedPilotIdx;
}

void pilotNameInput(int16 *page, int a, int b, int c, struct Pilot *pilot) {
    int blinkToggle;
    int x, y;
    int nameLen;
    int cursorX;
    uint16 keyCode;
    int rankWidth;
    blinkToggle = 0;
    TRACE(("pilotNameInput(): entering with page = %d, abc = %d/%d/%d, pilot: %s", *page, a,b,c, pilot->name));
    x = (selectedPilotIdx < PILOTS_PER_COLUMN) ? PILOT_COL_LEFT : PILOT_COL_RIGHT;
    y = ((selectedPilotIdx & (PILOTS_PER_COLUMN - 1)) * PILOT_ROW_HEIGHT) + PILOT_TOP_MARGIN;
    clearRect(page, x, y, x + PILOT_ENTRY_WIDTH, y + 35);
    drawStringAt(page, ranks[0], x, y);
    x += (rankWidth = stringWidth(page, ranks[0]));
    rankWidth = PILOT_ENTRY_WIDTH - rankWidth;
    screenBuf[3] = 0;
    clearRect(page, 15, 192, 303, 197);
    drawStringCentered(pageNumPtr, aMenterYourName, 0xf, 0xc0, 0x121);
    misc_jump_5e_clearKeyFlags();
    keyCode = KEYCODE_CTRLX;
    TRACE(("pilotNameInput(): before loop"));
    do {
        TRACE(("pilotNameInput(): loop iter, keyCode = 0x%x", keyCode));
        switch(keyCode) {
        case KEYCODE_CTRLX:
            TRACE(("pilotNameInput(): case 0x18"));
            nameLen = 0;
            pilot->name[0] = '\0';
            clearRect(page, x, y, x + rankWidth, y + c);
            drawStringAt(page, pilot->name, x, y);
            cursorX = page[4];
            break;
        case 8: // backspace
            TRACE(("pilotNameInput(): case 8"));
            if (nameLen > 0) {
                nameLen--;
                pilot->name[nameLen] = '\0';
                // 2403 - duplicate code block coalesced with above
                clearRect(page, x, y, x + rankWidth, y + c);
                drawStringAt(page, pilot->name, x, y);
                cursorX = page[4];
            }
            break;
        default:
            TRACE(("pilotNameInput(): case default"));
            if (keyCode >= 0x20 && keyCode <= 0x7f && nameLen < a && stringWidth(page, pilot->name) <= 0x90) {
                TRACE(("pilotNameInput(): case default condition true, nameLen = %d", nameLen));
                pilot->name[nameLen++] = keyCode;
                pilot->name[nameLen] = '\0';
                clearRect(page, x, y, x + rankWidth, y + c);
                drawStringAt(page, pilot->name, x, y);
                cursorX = page[4];
            }
            break;
        }
        TRACE(("pilotNameInput(): before input loop"));
        while (getJoyKey() == 0) {
            waitMdaCgaStatus(3);
            gfx_switchColor(page, x, y - 1, x + rankWidth, y + c,
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
            clearRect(page, 0xf, 0xc0, 0x12f, 0xc5);
            return;
        }
    } while( true );
    TRACE(("pilotNameInput(): exiting"));
}


void loadHallfame(void)
{
    int counter;
    FILE *handle;
    TRACE(("loadHallfame(): reading from %s", aHallfame));
    handle = fopen(aHallfame, aRb_3);
    fread(&selectedPilotIdx, 2, 1, handle);
    TRACE(("loadHallfame(): count = %d", selectedPilotIdx));
    counter = 0;
    do {
        fread(hallfameBuf + counter, HALLFAME_RECORDSZ, 1, handle);
        counter++;
    } while (counter < HALLFAME_SLOTS);
    fclose(handle);
}

void saveHallfame() {
    FILE *fp;
    int idx;
    fp = fopen(aHallfame_0, aWb);
    fwrite(&selectedPilotIdx, 2, 1, fp);
    idx = 0;
    do {
        fwrite(&hallfameBuf[idx], HALLFAME_RECORDSZ, 1, fp);
    } while (++idx < HALLFAME_SLOTS);
    fclose(fp);
}

int getJoyKey() {
    if (commData->setupUseJoy == 1) {
        if (misc_jump_5d_readJoy(0) != 0) return 1;
    }
    if (cbreakHit != 0) {
        cleanup();
        restoreCbreakHandler();
        exit(0);
    }
    return misc_jump_5a_keybuf() == 0;
}

/* ---- merged from stinkey.c ---- */
int readInputKey() {
    int key;
    if (commData->setupUseJoy == 1) {
        do {
            if (misc_jump_5a_keybuf() == 0) break;
        } while (misc_jump_5d_readJoy(0) == 0);
        if (misc_jump_5a_keybuf() != 0) {
            key = KEYCODE_ENTER;
            goto checkKey;
        }
    }
    key = misc_jump_5b_getkey();
checkKey:
    if (key == KEYCODE_ALTQ || cbreakHit != 0) {
        cleanup();
        if (cbreakHit != 0) restoreCbreakHandler();
        exit(0);
    }
    return key;
}
