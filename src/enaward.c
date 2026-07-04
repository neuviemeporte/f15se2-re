/* enaward.c — memory/pics/awards, compiled with /Gs */
#include "slot.h"
#include "pointers.h"
#include "log.h"
#include "endata.h"
#include "endcode.h"
#include "enaward.h"
#include "eninput.h"
#include "shared/common.h"

/* Private helpers for this translation unit. */
int16 dos_free(int16 segment);
void loadPicFromFile(const char *name, uint16 segment);
void loadPicFromFileAt(const char *name, uint16 segment, int16 off, int16 whence);

uint16 allocBuffer(int16 size) {
    uint16 segment;
    segment = dos_alloc(size);
    if (segment < 0x10) {
        cleanup();
        dos_printstring("Insufficient system memory - AllocBuffer$");
        exit(0);
    }
    return segment;
}

void freeBuffer(uint16 segment) {
    if (dos_free(segment) != 0) {
        cleanup();
        dos_printstring("Buffer dealloc error$");
        exit(0);
    }
}

void loadPicFromFile(const char *name, uint16 segment) {
    int16 handle;
    handle = openFileWrapper(name, 0);
    decodePicRaw(handle, segment);
    closeFileWrapper(handle);
}

void loadPicFromFileAt(const char *name, uint16 segment, int16 off, int16 whence) {
    int16 handle;
    handle = openFileWrapper(name, 0);
    lseek(handle, off, whence);
    decodePic(handle, segment);
    closeFileWrapper(handle);
}

// 1e78
void showPostMissionAwards(void) {
    int16 idx;
    awardPage[3] = 0;
    if (commData->trainingFlag != 0)
        goto done;
    if (gameData->campaignProgress == 1) {
        gfx_setFadeSteps(3);
        openShowPic("desk.pic", *awardPage);
        drawStringCentered(awardPage, "After ditching three very expensive aircraft,", 36, 179, 250);
        drawStringCentered(awardPage, "you are assigned a desk job.", 36, 188, 250);
        // 1ef4
        awardFont = 4;
        awardColor = 0;
        idx = 0;
        // 1f05
        for (; (textBuf[idx] = gameData->pilotName[idx]) != 0; idx++) {}
        drawStringCentered(awardPage, textBuf, 193, 153, 95);
        awardColor = 7;
        awardFont = 1;
        goto show;
    }
    if (gameData->campaignProgress == 2) {
        gfx_setFadeSteps(2);
        openShowPic("death.pic", *awardPage);
        drawStringCentered(awardPage, "In the wake of the horrible crash,", 36, 173, 250);
        drawStringCentered(awardPage, "your family and friends mourn your loss.", 36, 182, 250);
        goto show;
    }
    // 1fa8
    if (((uint16)gameData->rank < 6) && (promoThresholds[gameData->rank] < gameData->totalScore)) {
        gfx_setFadeSteps(6);
        openShowPic("promo.pic", *awardPage);
        awardColor = 1;
        drawStringCentered(awardPage, "For your consistently successful missions,", 36, 174, 250);
        mystrcpy(textBuf, "you have been promoted to ");
        mystrcat(textBuf, rankNames[++gameData->rank]);
        drawStringCentered(awardPage, textBuf, 36, 183, 250);
        gfx_commitPage();
        gfx_flipPage();
        waitForKeyOrJoy();
    }
medals:
    idx = 4;
    for (; idx >= 0; idx--) {
        if (missionScore > medalThresholds[idx])
            break;
    }
    if (idx < 0)
        goto done;
    if (gameData->medals & (1 << (char)idx))
        goto done;
    gfx_waitRetrace();
    gfx_setFadeSteps(10);
    openShowPic("medal.pic", *awardPage);
    awardColor = 0x0f;
    drawStringCentered(awardPage, "For your outstanding performance, you receive", 36, 174, 250);
    mystrcpy(textBuf, "the ");
    mystrcat(textBuf, medalNames[idx]);
    drawStringCentered(awardPage, textBuf, 36, 183, 250);
    gameData->medals |= (1 << (char)idx);
show:
    gfx_commitPage();
    gfx_flipPage();
    waitForKeyOrJoy();
done:
    clearRect(awardPage, 0, 0, 319, 199);
    gfx_flipPage();
}
