/* enaward.c — memory/pics/awards, compiled with /Gs */
#include "pointers.h"
#include "debug.h"
#include "end.h"
#include "shared/common.h"

uint16 allocBuffer(int size) {
    int segment;
    TRACE(("allocBuffer"));
    segment = dos_alloc(size);
    if ((unsigned)segment < 0x10) {
        cleanup();
        dos_printstring(str_allocError);
        exit(0);
    }
    return segment;
}


void freeBuffer(int segment) {
    TRACE(("freeBuffer"));
    if (dos_free(segment) != 0) {
        cleanup();
        dos_printstring(str_deallocError);
        exit(0);
    }
}


void loadPicFromFile(char *name, int segment) {
    int handle;
    TRACE(("loadPicFromFile"));
    handle = openFileWrapper(name, 0);
    decodePicRaw(handle, segment);
    closeFileWrapper(handle);
}


void loadPicFromFileAt(char *name, int segment, int off, int whence) {
    int handle;
    TRACE(("loadPicFromFileAt"));
    handle = openFileWrapper(name, 0);
    lseek(handle, off, whence);
    decodePic(handle, segment);
    closeFileWrapper(handle);
}


// 1e78
void showPostMissionAwards(void) {
    int p;
    awardPage[3] = 0;
    if (commData->gfxModeChar != 0)
        goto done;
    if (gameData->campaignProgress == 1) {
        gfx_setFadeSteps(3);
        openShowPic(str_deskPic, *awardPage);
        drawStringCentered(awardPage, str_deskMsg1, 0x24, 0xb3, 0xfa);
        drawStringCentered(awardPage, str_deskMsg2, 0x24, 0xbc, 0xfa);
        // 1ef4
        awardFont = 4;
        awardColor = 0;
        p = 0;
        // 1f05
        for (; (textBuf[p] = gameData->pilotName[p]) != 0 ; p++) {}
        drawStringCentered(awardPage, textBuf, 0xc1, 0x99, 0x5f);
        awardColor = 7;
        awardFont = 1;
        goto show;
    }
    if (gameData->campaignProgress == 2) {
        gfx_setFadeSteps(2);
        openShowPic(str_deathPic, *awardPage);
        drawStringCentered(awardPage, str_deathMsg1, 0x24, 0xad, 0xfa);
        drawStringCentered(awardPage, str_deathMsg2, 0x24, 0xb6, 0xfa);
        goto show;
    }
    // 1fa8
    if (((unsigned)gameData->rank < 6) && (*(long *)&promoThresholds[gameData->rank] < gameData->totalScore)) {
        gfx_setFadeSteps(6);
        openShowPic(str_promoPic, *awardPage);
        awardColor = 1;
        drawStringCentered(awardPage, str_promoMsg1, 0x24, 0xae, 0xfa);
        mystrcpy(textBuf, str_promoMsg2);
        mystrcat(textBuf, rankNames[++gameData->rank]);
        drawStringCentered(awardPage, textBuf, 0x24, 0xb7, 0xfa);
        gfx_commitPage();
        gfx_flipPage();
        waitForKeyOrJoy();
    }
medals:
    p = 4;
    for (; p >= 0; p--) {
        if (*(long *)&missionScore > *(long *)&medalThresholds[p])
            break;
    }
    if (p < 0)
        goto done;
    if (gameData->medals & (1 << (char)p))
        goto done;
    gfx_waitRetrace();
    gfx_setFadeSteps(0x0a);
    openShowPic(str_medalPic, *awardPage);
    awardColor = 0x0f;
    drawStringCentered(awardPage, str_medalMsg1, 0x24, 0xae, 0xfa);
    mystrcpy(textBuf, str_medalMsg2);
    mystrcat(textBuf, medalNames[p]);
    drawStringCentered(awardPage, textBuf, 0x24, 0xb7, 0xfa);
    gameData->medals |= (1 << (char)p);
show:
    gfx_commitPage();
    gfx_flipPage();
    waitForKeyOrJoy();
done:
    clearRect(awardPage, 0, 0, 0x13f, 0xc7);
    gfx_flipPage();
}
