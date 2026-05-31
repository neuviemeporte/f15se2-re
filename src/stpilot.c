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
