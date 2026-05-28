/* Pilot input handling */
#include "start.h"
#include "const.h"
#include "gfx.h"
#include "slot.h"
#include "comm.h"
#include "offsets.h"
#include "shared/util.h"
#include "debug.h"

#include <stdio.h>
#include <dos.h>
#include <string.h>

// 0x1f44
// XXX: non-linear execution due to optimization
void processPilotInput() {
    int pilot;
    int x;
    int counter;
    int y;
    pilotSelectFlag = 1;
    // 1f51
    setTimerIrqHandler();
    TRACE(("processPilotInput(): set timer irq"));
    // 1f54
    while (pilot = selectedPilotIdx, true) switch (processStoreInput()) {
    // 1f84
    case KEYCODE_ENTER:
        TRACE(("processPilotInput(): enter"));
        if ((hallfameBuf[selectedPilotIdx].field_1D & 0x60) == 0) {
            // 1f98
            restoreTimerIrqHandler();
            pilotSelectFlag = 0;
            TRACE(("processPilotInput(): accepted %d", selectedPilotIdx));
            return;
        }
        // 1fa6
        putch(CHAR_BELL);
        continue;
    // 1f56
    case KEYCODE_ESC:
        TRACE(("processPilotInput(): esc"));
        // 1fb2
        hallfameBuf[selectedPilotIdx].theater
            = hallfameBuf[selectedPilotIdx].difficulty
            = hallfameBuf[selectedPilotIdx].total_score
            = hallfameBuf[selectedPilotIdx].last_score
            = hallfameBuf[selectedPilotIdx].field_1D
            = hallfameBuf[selectedPilotIdx].rank
            = 0;
        // 1fef
        pilotNameInput(screenBuf, MAX_PILOT_NAME_LEN, PILOT_NAME_HEIGHT, PILOT_NAME_HEIGHT, &hallfameBuf[selectedPilotIdx]);
        // 2000
        pilotToGameData((uint8*)&hallfameBuf[selectedPilotIdx]);
        // 2006
        counter = selectedPilotIdx;
        // 2029
        while (counter < HALLFAME_SLOTS - 1) { // 200e
            hallfameBuf[counter] = hallfameBuf[counter + 1];
            // 2026
            counter++;
        }
        // 2033
        gameDataToPilot(&hallfameBuf[HALLFAME_SLOTS - 1]);
        selectedPilotIdx = HALLFAME_SLOTS - 1;
        displayPilots();
        // 2042
        if (doFcbSearch() != 0) {
            saveHallfame();
        }
        // 204f
        continue;
    // 1f5b
    case KEYCODE_UPARROW:
        TRACE(("processPilotInput(): up"));
        // 2052
        selectedPilotIdx--;
        goto handleArrow;
    // 1f73
    case KEYCODE_DNARROW:
        TRACE(("processPilotInput(): down"));
        // 2058
        selectedPilotIdx++;
        goto handleArrow;
    // 1f63
    case KEYCODE_LEFTARROW:
        TRACE(("processPilotInput(): left"));
        // 205e
        selectedPilotIdx -= PILOTS_PER_COLUMN;
        goto handleArrow;
    // 1f68
    case KEYCODE_RIGHTARROW:
        TRACE(("processPilotInput(): right"));
        // 2066
        selectedPilotIdx += PILOTS_PER_COLUMN;
handleArrow:
        // 206b
        selectedPilotIdx &= HALLFAME_SLOTS - 1;
        x = (pilot < PILOTS_PER_COLUMN) ? PILOT_COL_LEFT : PILOT_COL_RIGHT;
        y = ((pilot & (PILOTS_PER_COLUMN - 1)) * PILOT_ROW_HEIGHT) + PILOT_TOP_MARGIN;
        // 20b3
        // looks like ChangeColor() from library.h?
        gfx_switchColor(screenBuf, x, y, x + PILOT_ENTRY_WIDTH, y + PILOT_NAME_HEIGHT, COLOR_WHITE, COLOR_GRAY);
        x = (selectedPilotIdx < PILOTS_PER_COLUMN) ? PILOT_COL_LEFT : PILOT_COL_RIGHT;
        y = ((selectedPilotIdx & (PILOTS_PER_COLUMN - 1)) * PILOT_ROW_HEIGHT) + PILOT_TOP_MARGIN;
        gfx_switchColor(screenBuf, x, y, x + PILOT_ENTRY_WIDTH, y + PILOT_NAME_HEIGHT, COLOR_GRAY, COLOR_WHITE);
    }
    TRACE(("processPilotInput(): returning, selected %d", selectedPilotIdx));
}

// 0x210a
void blinkPilot() {
    int16 x, y;
    if (pilotSelectFlag == 0) return;
    waitMdaCgaStatus(6);
    // 2121
    x = selectedPilotIdx < PILOTS_PER_COLUMN ? PILOT_COL_LEFT : PILOT_COL_RIGHT;
    y = ((selectedPilotIdx & (PILOTS_PER_COLUMN - 1)) * PILOT_ROW_HEIGHT) + PILOT_TOP_MARGIN;
    // 2171
    gfx_switchColor(screenBuf, x , y, x + PILOT_ENTRY_WIDTH, y + PILOT_NAME_HEIGHT, blinkColors[blinkColorIdx], blinkColors[blinkColorIdx ^ 1]);
    blinkColorIdx ^= 1;
}

// 0x2182
void gameDataToPilot(struct Pilot *pilot) {
    //uint16 var_4;
    int j;
    // 2189
    for (j = 0; pilot->name[j] = gameData->pilotName[j]; j++) {
    } // 21a9
    pilot->total_score = gameData->totalScore;
    pilot->last_score = gameData->lastScore;
    pilot->theater = gameData->theater;
    pilot->difficulty = gameData->difficulty;
    pilot->rank = (gameData->rankHigh * 64) + gameData->rank;
    // 2202
    pilot->field_1D = (uint8)((gameData->campaignProgress == 2) ? 0x20 : 0) + (uint8)((gameData->campaignProgress == 1) ? 0x40 : 0) + gameData->medals;
}

// 0x2232
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

// 0x22ec
void pilotNameInput(int16 *page, int a, int b, int c, struct Pilot *pilot) {
    int blinkToggle;
    int x, y;
    int nameLen;
    int cursorX;
    uint16 keyCode;
    int rankWidth;
    blinkToggle = 0;
    TRACE(("pilotNameInput(): entering with page = %d, abc = %d/%d/%d, pilot: %s", *page, a,b,c, pilot->name));
    // 2307
    x = (selectedPilotIdx < PILOTS_PER_COLUMN) ? PILOT_COL_LEFT : PILOT_COL_RIGHT;
    y = ((selectedPilotIdx & (PILOTS_PER_COLUMN - 1)) * PILOT_ROW_HEIGHT) + PILOT_TOP_MARGIN;
    // 232f
    clearRect(page, x, y, x + PILOT_ENTRY_WIDTH, y + 35);
    drawStringAt(page, ranks[0], x, y);
    x += (rankWidth = stringWidth(page, ranks[0]));
    rankWidth = PILOT_ENTRY_WIDTH - rankWidth;
    screenBuf[3] = 0;
    // 2380
    clearRect(page, 15, 192, 303, 197);
    // 239a
    drawStringCentered(pageNumPtr, aMenterYourName, 0xf, 0xc0, 0x121);
    misc_jump_5e_clearKeyFlags();
    keyCode = KEYCODE_CTRLX;
    TRACE(("pilotNameInput(): before loop"));
    do {
        // 23aa
        TRACE(("pilotNameInput(): loop iter, keyCode = 0x%x", keyCode));
        switch(keyCode) {
        // 23b5
        case KEYCODE_CTRLX:
            TRACE(("pilotNameInput(): case 0x18"));
            // 23f8
            nameLen = 0;
            pilot->name[0] = '\0';
            // 2403
            clearRect(page, x, y, x + rankWidth, y + c);
            drawStringAt(page, pilot->name, x, y);
            cursorX = page[4];
            break;
        // 23ad
        case 8: // backspace
            TRACE(("pilotNameInput(): case 8"));
            // 2498
            if (nameLen > 0) {
                nameLen--;
                // 23eb
                pilot->name[nameLen] = '\0';
                // 2403 - duplicate code block coalesced with above
                clearRect(page, x, y, x + rankWidth, y + c);
                drawStringAt(page, pilot->name, x, y);
                cursorX = page[4];
            }
            break;
        default:
            TRACE(("pilotNameInput(): case default"));
            // 23ba
            if (keyCode >= 0x20 && keyCode <= 0x7f && nameLen < a && stringWidth(page, pilot->name) <= 0x90) {
                TRACE(("pilotNameInput(): case default condition true, nameLen = %d", nameLen));
                // 23e9
                pilot->name[nameLen++] = keyCode;
                // 23eb
                pilot->name[nameLen] = '\0';
                // 2403
                clearRect(page, x, y, x + rankWidth, y + c);
                drawStringAt(page, pilot->name, x, y);
                cursorX = page[4];
            }
            break;
        }
        // 243b
        TRACE(("pilotNameInput(): before input loop"));
        while (getJoyKey() == 0) {
            waitMdaCgaStatus(3);
            gfx_switchColor(page, x, y - 1, x + rankWidth, y + c,
                pilotNameInputColors[blinkToggle], pilotNameInputColors[blinkToggle ^ 1]);
            blinkToggle ^= 1;
            page[3] = pilotNameInputColors[blinkToggle];
        }
        TRACE(("pilotNameInput(): after input loop"));
        // 24a4
        keyCode = readInputKey();
        if ((keyCode & 0xff) != 0) {
            keyCode &= 0xff;
        }
        TRACE(("pilotNameInput(): after sub_125e4, keyCode = 0x%x", keyCode));
        // 24b4
        if (keyCode == KEYCODE_ENTER) { // 24bd
            screenBuf[3] = 0;
            clearRect(page, 0xf, 0xc0, 0x12f, 0xc5);
            return;
        }
    } while( true );
    TRACE(("pilotNameInput(): exiting"));
}


// 0x24e4
void loadHallfame(void)
{
    int counter;
    FILE *handle;
    TRACE(("loadHallfame(): reading from %s", aHallfame));
    // 24f2
    handle = fopen(aHallfame, aRb_3);
    // 2508
    fread(&selectedPilotIdx, 2, 1, handle);
    TRACE(("loadHallfame(): count = %d", selectedPilotIdx));
    // 250e
    counter = 0;
    do {
        // 2529
        fread(hallfameBuf + counter, HALLFAME_RECORDSZ, 1, handle);
        counter++;
        // 2532
    } while (counter < HALLFAME_SLOTS);
    fclose(handle);
}

// 0x2542
void saveHallfame() {
    FILE *fp;
    int idx;
    // 2550
    fp = fopen(aHallfame_0, aWb);
    // 2566
    fwrite(&selectedPilotIdx, 2, 1, fp);
    idx = 0;
    do {
        fwrite(&hallfameBuf[idx], HALLFAME_RECORDSZ, 1, fp);
    } while (++idx < HALLFAME_SLOTS);
    fclose(fp);
}

// 0x25a0
int getJoyKey() {
    if (commData->setupUseJoy == 1) { // 25ab
        if (misc_jump_5d_readJoy(0) != 0) return 1;
    } // 25be
    if (cbreakHit != 0) { // 25c5
        cleanup();
        restoreCbreakHandler();
        exit(0);
    } // 25d4
    return misc_jump_5a_keybuf() == 0;
}
