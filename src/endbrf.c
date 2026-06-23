/* endebrief.c — debrief main loop, compiled with /Gs */
#include "slot.h"
#include <stdio.h>
#include "offsets.h"
#include "pointers.h"
#include "debug.h"
#include "shared/common.h"
#include "endata.h"
#include "endcode.h"
#include "enaward.h"
#include "enbrief.h"
#include "endbrf.h"

extern int16 menuItemUnused;
extern char animExitFlag;

void debriefMainLoop(void)
{
    char p[2]; int a; int b; int c; char d[3]; int e; char f[2]; int g; char h[2];

    p[0] = 0x0d; p[1] = 0;
    d[0] = 9; d[1] = 0x0a; d[2] = 0;
    h[0] = 0x8e; h[1] = 0;
    f[0] = 0x8f; f[1] = 0;

    goto open_theater;

insert_scenario:
    clearRect(debriefPage, 0, 0, 0x13f, 0xc7);
    drawStringCentered(debriefPage, str_insertScenario, 0, 0x5a, 0x13f);
    debriefPage[6] = 4;
    drawStringCentered(debriefPage, str_pressKey1, 0, 0x64, 0x13f);
    debriefPage[6] = 1;
    gfx_flipPage();
    misc_getKey();

open_theater:
    worldBufHandle = fopen(theaterSprFiles[gameData->theater], "rb");
    if (!worldBufHandle)
        goto insert_scenario;

    gfx_waitRetrace();
    fclose(worldBufHandle);
    gfx_setFadeSteps(9);
    spriteBufSeg = allocBuffer(gfx_getBufSize());
    loadPic(theaterSprFiles[gameData->theater], spriteBufSeg);
    a = spriteBufSeg;

    goto open_dbicons;

insert_diska:
    clearRect(debriefPage, 0, 0, 0x13f, 0xc7);
    drawStringCentered(debriefPage, str_insertDiskA, 0, 0x5a, 0x13f);
    debriefPage[6] = 4;
    drawStringCentered(debriefPage, str_pressKey2, 0, 0x64, 0x13f);
    debriefPage[6] = 1;
    gfx_flipPage();
    misc_getKey();

open_dbicons:
    worldBufHandle = fopen("dbicons.spr", "rb");
    if (!worldBufHandle)
        goto insert_diska;

    gfx_waitRetrace();
    fclose(worldBufHandle);
    gfx_setFadeSteps(8);
    openShowPic("dbicons.spr", 1);

    spriteMapAreaDef.bufPtr = a;
    spriteStatusBarDef.bufPtr = a;
    spriteAirDef.bufPtr = a;
    spriteAirBlinkDef.bufPtr = a;
    spriteSamDef.bufPtr = a;
    spriteSamBlinkDef.bufPtr = a;
    spriteGroundDef.bufPtr = a;
    spriteGroundBlinkDef.bufPtr = a;
    spriteBombDef.bufPtr = a;
    spriteBombBlinkDef.bufPtr = a;
    spriteWaypointDef.bufPtr = a;
    spriteWaypointBlinkDef.bufPtr = a;

    gfx_waitRetrace();
    clearRect(debriefPage, 0, 0, 0x13f, 0xc7);
    gfx_blitSprite(spriteMapArea);
    gfx_blitSprite(spriteStatusBar);

    debriefPage[2] = 0;
    drawStringAt(debriefPage, str_missionDebrief, 0x6a, 1);
    debriefPage[2] = 6;

    e = 0x96;
    c = 0;
    do {
        drawStringAt(debriefPage, debriefMenuStrings[c], 0xec, e);
        e += 0x0a;
        c++;
    } while (c < 2);

    g = 0;
    ejectedFlag = 1;
    curRecordIdx = 0;
    gfx_commitPage();
    gfx_flipPage();
    setTimerIrqHandler();
    b = 1;

    do {
        debriefMenuItems[g].state = 2;
        processMenuItems(debriefMenuItems, menuItemUnused, 2, 0xfa, g * 10 + 0x97, debriefPage2);
        g = selectMenuItem(debriefMenuItems, menuItemUnused, 2, cursorBoundsPtr, debriefPage2);

        switch (g) {
        case 0:
            animateFlightPath(debriefPage2);
            if (animExitFlag == 1) {
                g = 1;
            }
            break;
        case 1:
            b = 0;
            break;
        }

        if (commData->setupUseJoy == 1) {
            while (misc_readJoystick(0))
                ;
            timerCounter = 0;
            while (timerCounter <= 5)
                ;
            while (misc_readJoystick(0))
                ;
        }
    } while (b);

    restoreTimerIrqHandler();
    gfx_waitRetrace();
    *(long *)&missionScore = calcMissionScore(totalFlightRecords);

    gameData->hallOfFameEligible = 0;

    if (commData->trainingFlag == 0) {
        gameData->hallOfFameEligible = missionScore;

        if ((unsigned long)gameData->lastScore < *(unsigned long *)&missionScore) {
            gameData->lastScore = missionScore;
        }

        gameData->totalScore += *(long *)&missionScore;

        if (commData->landingType == 1) {
            gameData->campaignProgress = 2;
        }

        if (commData->landingType == 2 && commData->bailoutSurvived == 0) {
            if (++gameData->rankHigh >= 3) {
                gameData->campaignProgress = 1;
            }
        }
    }

    freeBuffer(spriteBufSeg);
}
