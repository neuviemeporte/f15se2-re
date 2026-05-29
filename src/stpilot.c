/* Pilot selection and display */
#include "start.h"
#include "const.h"
#include "gfx.h"
#include "slot.h"
#include "comm.h"
#include "offsets.h"
#include "shared/util.h"
#include "debug.h"

#include <string.h>

// 0x1b72
void pilotSelect(int16 needSplash)
{
    int unused;
    TRACE(("pilotSelect(): entering, needSplash %d", needSplash));
    gfx_waitRetrace();
    // 0x1b7d
    loadHallfame();
    TRACE(("pilotSelect(): loaded hallfame"));
    if (needSplash == 0) {
        // 0x1b86
        updateHallfame();
        TRACE(("pilotSelect(): updated hallfame"));
    }
    // 0x1b8d
    gfx_setFadeSteps(4);
    loadPic(aArmpiece_pic, menuSprites);
    TRACE(("pilotSelect(): loaded armpiece"));
    // 0x1ba7
    gfx_setFadeSteps(7);
    // 0x1bb9
    openShowPic(aHiscore_pic, *screenBuf);
    TRACE(("pilotSelect(): showed hiscore pic"));
    displayPilots();
    TRACE(("pilotSelect(): showed prompt"));
    gfx_setDac(1);
    gfx_flipPage();
    TRACE(("pilotSelect(): retrace done"));
    // 0x1bd3
    processPilotInput();
    TRACE(("pilotSelect(): processed pilot input, selected %d", selectedPilotIdx));
    pilotToGameData((uint8*)&hallfameBuf[selectedPilotIdx]);
    TRACE(("pilotSelect(): updated pilot in game data"));
    // 0x1beb
    screenBuf[3] = 0;
    // 0x1c00
    clearRect(screenBuf, 0, 0, SCREEN_MAXX, SCREEN_MAXY);
    TRACE(("pilotSelect(): returning"));
}

// 0x1c08
void updateHallfame()
{
    int j;
    // 0x1c14
    if (gameData->hallOfFameEligible != 0) {
        selectedPilotIdx = HALLFAME_SLOTS - 2;
        // 0x1c28
        for (; selectedPilotIdx >= 0; selectedPilotIdx--) {
            // 0x1c43
            if (hallfameBuf[selectedPilotIdx].total_score >= gameData->totalScore) break;
        }
        // 0x1c51
        selectedPilotIdx++;
        // 1c55
        for (j = gameData->pilotIdx - 1; j >= selectedPilotIdx; j--) {
                // 1c82
                hallfameBuf[j + 1] = hallfameBuf[j];
            }
    }
    else {
    // 1c88
        selectedPilotIdx = gameData->pilotIdx;
    }
    // 1c9d
    gameDataToPilot(&hallfameBuf[selectedPilotIdx]);
    // 1ca3
    if (doFcbSearch() != 0) {
        saveHallfame();
        return;
    }
    // 1cb8
    screenBuf[3] = 0;
    // 1ccd
    clearRect(screenBuf, 0, 0, SCREEN_MAXX, SCREEN_MAXY);
    gfx_commitPage();
    screenBuf[2] = COLOR_WHITE;
    // 1cf4
    drawStringCentered(screenBuf, aOriginalDiskIn, 0, 0x64, 0x140);
    drawStringCentered(screenBuf, aPressAKeyToCon, 0, 0x96, 0x140);
    screenBuf[2] = COLOR_GRAY;
    // 1d1c
    gfx_flipPage();
    misc_jump_5b_getkey();
    gfx_waitRetrace();
}

// 0x1d32
void displayPilots(void)
{
    int pilotIdx;
    screenBuf[3] = 0;
    pilotIdx = 0;
    do {
        // 1d49
        TRACE(("displayPilots(): iteration %d", pilotIdx));
        printPilot(pilotIdx);
    } while (++pilotIdx < HALLFAME_SLOTS);
    TRACE(("displayPilots(): loop terminating"));
    screenDesc.color = COLOR_WHITE;
    // 1d71
    drawStringCentered(pageNumPtr, aUseSelectorToC, 0, 0xC0, 0x140);
    TRACE(("displayPilots(): drawn prompt"));
    gfx_commitPage();
    TRACE(("displayPilots(): exiting"));
}

// 0x1d80
void printPilot(int pilotIdx) {
    struct Pilot *pilot;
    int x;
    int yPos;
    int medalIdx;
    int totalMedalWidth;
    // 1d90
    pilot = &hallfameBuf[pilotIdx];
    // 1da1
    x = (pilotIdx < PILOTS_PER_COLUMN) ? PILOT_COL_LEFT : PILOT_COL_RIGHT;
    // 1db2
    yPos = ((pilotIdx & (PILOTS_PER_COLUMN - 1)) * PILOT_ROW_HEIGHT) + PILOT_TOP_MARGIN;
    // 1dcc
    clearRect(screenBuf, x, yPos - 1, x + PILOT_ENTRY_WIDTH, yPos + 0x20);
    // 1de3
    screenDesc.color = (pilotIdx == selectedPilotIdx) ? COLOR_WHITE : COLOR_GRAY;
    // 1df9
    mystrcpy(todayMissStrBuf, ranks[pilot->rank & 0xf]);
    TRACE(("printPilot(): strcpy %s", todayMissStrBuf));
    // 1e06
    mystrcat(todayMissStrBuf, pilot->name);
    TRACE(("printPilot(): strcat %s", todayMissStrBuf));
    // 1e1e
    drawStringCentered(screenBuf, todayMissStrBuf, x, yPos, 0x90);
    TRACE(("printPilot(): drawn string %s", todayMissStrBuf));
    screenDesc.color = COLOR_RED;
    screenDesc.font = 4;
    // 1e3d
    my_ltoa(pilot->total_score, todayMissStrBuf);
    TRACE(("printPilot(): ltoa 1 %ld -> %s, about to cat %s", pilot->total_score, todayMissStrBuf, asc_174AC));
    // 1e4b
    mystrcat(todayMissStrBuf, asc_174AC);
    TRACE(("printPilot(): strcat2 %s", todayMissStrBuf));
    // 1e65
    my_itoa(pilot->last_score, &todayMissStrBuf[mystrlen(todayMissStrBuf)]);
    // 1e73
    mystrcat(todayMissStrBuf, asc_174AF);
    TRACE(("printPilot(): strcat3 %s", todayMissStrBuf));
    // 1e8f
    drawStringCentered(screenBuf, todayMissStrBuf, x, yPos + 9, 0x90);
    TRACE(("printPilot(): drawn string2"));
    screenDesc.font = 1;
    // 1e9b
    for (medalIdx = 0, totalMedalWidth = 0; medalIdx < 7; medalIdx++) { // 1ea8
        // 1eb8
        if ((pilot->medals & (1 << medalIdx)) == 0) continue;
        totalMedalWidth += (uint8)medalWidth[medalIdx] + 4;
    } // 1ed2
    TRACE(("printPilot(): past loop 1, totalMedalWidth = %d", totalMedalWidth));
    // 1edd
    x += (0x90 - totalMedalWidth) / 2;
    yPos += 0x11;
    medalIdx = 0;
    // 1ee9
    // display medals
    do {
        if ((pilot->medals & (1 << medalIdx)) == 0) continue;
        // 1f21
        showSprite(screenBuf[0], x, yPos, medalSpriteX[medalIdx], medalSpriteY[medalIdx], medalWidth[medalIdx], 0x10);
        // 1f27
        x += medalWidth[medalIdx] + 4;
    } while(++medalIdx < 7);
    TRACE(("printPilot(): returning"));
    // 1f42
}
