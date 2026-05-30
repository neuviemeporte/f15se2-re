/* endebrief.c — debrief main loop, compiled with /Gs */
#include "offsets.h"
#include "pointers.h"
#include "debug.h"
#include "shared/util.h"
#include "end.h"

extern int var_205;
extern char var_180;



void debriefMainLoop(void)
{
    char p[2]; int a; int b; int c; char d[3]; int e; char f[2]; int g; char h[2];

    p[0] = 0x0d; p[1] = 0;
    d[0] = 9; d[1] = 0x0a; d[2] = 0;
    h[0] = 0x8e; h[1] = 0;
    f[0] = 0x8f; f[1] = 0;

    goto open_theater;

insert_scenario:
    clearRect(var_99, 0, 0, 0x13f, 0xc7);
    drawStringCentered(var_99, str_insertScenario, 0, 0x5a, 0x13f);
    var_99[6] = 4;
    drawStringCentered(var_99, str_pressKey1, 0, 0x64, 0x13f);
    var_99[6] = 1;
    gfx_flipPage();
    misc_jump_5b_getkey();

open_theater:
    worldBufHandle = (int)fopen(var_117[gameData->theater], str_modeRb1);
    if (!worldBufHandle)
        goto insert_scenario;

    gfx_waitRetrace();
    fclose((FILE *)worldBufHandle);
    gfx_setFadeSteps(9);
    spriteBufSeg = allocBuffer(gfx_getBufSize());
    loadPic(var_117[gameData->theater], spriteBufSeg);
    a = spriteBufSeg;

    goto open_dbicons;

insert_diska:
    clearRect(var_99, 0, 0, 0x13f, 0xc7);
    drawStringCentered(var_99, str_insertDiskA, 0, 0x5a, 0x13f);
    var_99[6] = 4;
    drawStringCentered(var_99, str_pressKey2, 0, 0x64, 0x13f);
    var_99[6] = 1;
    gfx_flipPage();
    misc_jump_5b_getkey();

open_dbicons:
    worldBufHandle = (int)fopen(str_dbicons1, str_modeRb2);
    if (!worldBufHandle)
        goto insert_diska;

    gfx_waitRetrace();
    fclose((FILE *)worldBufHandle);
    gfx_setFadeSteps(8);
    openShowPic(str_dbicons2, 1);

    ps_101.bufPtr = a;
    ps_103.bufPtr = a;
    ps_105.bufPtr = a;
    ps_106.bufPtr = a;
    ps_107.bufPtr = a;
    ps_108.bufPtr = a;
    ps_109.bufPtr = a;
    ps_110.bufPtr = a;
    ps_111.bufPtr = a;
    ps_112.bufPtr = a;
    ps_113.bufPtr = a;
    ps_114.bufPtr = a;

    gfx_waitRetrace();
    clearRect(var_99, 0, 0, 0x13f, 0xc7);
    gfx_blitSprite(var_102);
    gfx_blitSprite(var_104);

    var_99[2] = 0;
    drawStringAt(var_99, str_missionDebrief, 0x6a, 1);
    var_99[2] = 6;

    e = 0x96;
    c = 0;
    do {
        drawStringAt(var_99, var_118[c], 0xec, e);
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
        dat_21e4[g].state = 2;
        processMenuItems(dat_21e4, var_205, 2, 0xfa, g * 10 + 0x97, var_100);
        g = selectMenuItem(dat_21e4, var_205, 2, var_116, var_100);

        switch (g) {
        case 0:
            animateFlightPath(var_100);
            if (var_180 == 1) {
                g = 1;
            }
            break;
        case 1:
            b = 0;
            break;
        }

        if (commData->setupUseJoy == 1) {
            while (misc_jump_5d_readJoy(0))
                ;
            timerCounter = 0;
            while (timerCounter <= 5)
                ;
            while (misc_jump_5d_readJoy(0))
                ;
        }
    } while (b);

    restoreTimerIrqHandler();
    gfx_waitRetrace();
    *(long *)&missionScore = calcMissionScore(var_192);

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
