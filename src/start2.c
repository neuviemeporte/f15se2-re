/* Optimized functions from START.EXE */
#include "start.h"
#include "const.h"
#include "gfx.h"
#include "slot.h"
#include "comm.h"
#include "offsets.h"
#include "debug.h"

#include <string.h>

// 124a
int showSprite(int page, int x, int y, int src_x, int src_y, int width, int height) {
    TRACE(("showSprite(%d, %d, %d, %d, %d, %d, %d)", page, x, y, src_x, src_y, width, height));
    word_17284 = menuSprites;
    word_17286 = src_x;
    word_17288 = src_y;
    word_1728A = page;
    word_1728C = x;
    word_1728E = y;
    word_17290 = width;
    word_17292 = height;
    byte_1729C[0] = 0x10;
    gfx_jump_11_blitSprite(&word_17284);
    TRACE(("showSprite(): returning"));
}

// 0x1b72
void pilotSelect(int16 needSplash)
{
    int unused;
    TRACE(("pilotSelect(): entering, needSplash %d", needSplash));
    gfx_jump_45_retrace();
    // 0x1b7d
    loadHallfame();
    TRACE(("pilotSelect(): loaded hallfame"));
    if (needSplash == 0) {
        // 0x1b86
        updateHallfame();
        TRACE(("pilotSelect(): updated hallfame"));
    }
    // 0x1b8d
    gfx_jump_3d_null(4);
    loadPic(aArmpiece_pic, menuSprites);
    TRACE(("pilotSelect(): loaded armpiece"));
    // 0x1ba7
    gfx_jump_3d_null(7);
    // 0x1bb9
    openShowPic(aHiscore_pic, *screenBuf);
    TRACE(("pilotSelect(): showed hiscore pic"));
    displayPilots();
    TRACE(("pilotSelect(): showed prompt"));
    gfx_jump_44_setDac(1);
    gfx_jump_46_retrace2();
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
int updateHallfame()
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
    gfx_jump_50_null();
    screenBuf[2] = COLOR_WHITE;
    // 1cf4
    drawStringCentered(screenBuf, aOriginalDiskIn, 0, 0x64, 0x140);
    drawStringCentered(screenBuf, aPressAKeyToCon, 0, 0x96, 0x140);
    screenBuf[2] = COLOR_GRAY;
    // 1d1c
    gfx_jump_46_retrace2();
    misc_jump_5b_getkey();
    gfx_jump_45_retrace();
}

// 1d32
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
    textColor = COLOR_WHITE;
    // 1d71
    drawStringCentered(pageNumPtr, aUseSelectorToC, 0, 0xC0, 0x140);
    TRACE(("displayPilots(): drawn prompt"));
    gfx_jump_50_null();
    TRACE(("displayPilots(): exiting"));
}

// 1d80
void printPilot(int pilotIdx) { // pilotIdx: index?
    struct Pilot *pilot;
    int x;
    int p;
    int n;
    int i;
    // 1d90
    pilot = &hallfameBuf[pilotIdx];
    TRACE(("printPilot(): index %d, name %s", pilotIdx, pilot->name));
    // 1da1
    x = (pilotIdx < PILOTS_PER_COLUMN) ? PILOT_COL_LEFT : PILOT_COL_RIGHT;
    // 1db2
    p = ((pilotIdx & (PILOTS_PER_COLUMN - 1)) * PILOT_ROW_HEIGHT) + PILOT_TOP_MARGIN;
    // 1dcc
    clearRect(screenBuf, x, p - 1, x + PILOT_ENTRY_WIDTH, p + 0x20);
    TRACE(("printPilot(): cleared rect"));
    // 1de3
    textColor = (pilotIdx == selectedPilotIdx) ? COLOR_WHITE : COLOR_GRAY;
    // 1df9
    mystrcpy(todayMissStrBuf, ranks[pilot->rank & 0xf]);
    TRACE(("printPilot(): strcpy %s", todayMissStrBuf));
    // 1e06
    mystrcat(todayMissStrBuf, pilot->name);
    TRACE(("printPilot(): strcat %s", todayMissStrBuf));
    // 1e1e
    drawStringCentered(screenBuf, todayMissStrBuf, x, p, 0x90);
    TRACE(("printPilot(): drawn string %s", todayMissStrBuf));
    textColor = COLOR_RED;
    word_173DE = 4;
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
    drawStringCentered(screenBuf, todayMissStrBuf, x, p + 9, 0x90);
    TRACE(("printPilot(): drawn string2"));
    word_173DE = 1;
    // 1e9b
    for (n = 0, i = 0; n < 7; n++) { // 1ea8
        // 1eb8
        if ((pilot->field_1D & (1 << n)) == 0) continue;
        i += (uint8)byte_17422[n] + 4;
    } // 1ed2
    TRACE(("printPilot(): past loop 1, i = %d", i));
    // 1edd
    x += (0x90 - i) / 2;
    p += 0x11;
    n = 0;
    // 1ee9
    // display medals
    do {
        if ((pilot->field_1D & (1 << n)) == 0) continue;
        // 1f21
        showSprite(screenBuf[0], x, p, byte_17412[n], byte_1741A[n], byte_17422[n], 0x10);
        // 1f27
        x += byte_17422[n] + 4;
    } while(++n < 7);
    TRACE(("printPilot(): returning"));
    // 1f42
}

// ---- likely module boundary
// 1f44
// XXX: non-linear execution due to optimization
int processPilotInput() {
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
        gfx_jump_29_switchColor(screenBuf, x, y, x + PILOT_ENTRY_WIDTH, y + PILOT_NAME_HEIGHT, COLOR_WHITE, COLOR_GRAY);
        x = (selectedPilotIdx < PILOTS_PER_COLUMN) ? PILOT_COL_LEFT : PILOT_COL_RIGHT;
        y = ((selectedPilotIdx & (PILOTS_PER_COLUMN - 1)) * PILOT_ROW_HEIGHT) + PILOT_TOP_MARGIN;
        gfx_jump_29_switchColor(screenBuf, x, y, x + PILOT_ENTRY_WIDTH, y + PILOT_NAME_HEIGHT, COLOR_GRAY, COLOR_WHITE);
    }
    TRACE(("processPilotInput(): returning, selected %d", selectedPilotIdx));
}

// 210a
int blinkPilot() {
    int16 x, y;
    if (pilotSelectFlag == 0) return;
    waitMdaCgaStatus(6);
    // 2121
    x = selectedPilotIdx < PILOTS_PER_COLUMN ? PILOT_COL_LEFT : PILOT_COL_RIGHT;
    y = ((selectedPilotIdx & (PILOTS_PER_COLUMN - 1)) * PILOT_ROW_HEIGHT) + PILOT_TOP_MARGIN;
    // 2171
    gfx_jump_29_switchColor(screenBuf, x , y, x + PILOT_ENTRY_WIDTH, y + PILOT_NAME_HEIGHT, blinkColors[blinkColorIdx], blinkColors[blinkColorIdx ^ 1]);
    blinkColorIdx ^= 1;
}

// 2182
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
    pilot->rank = (gameData->rankHigh * 64) + gameData->unk2;
    // 2202
    pilot->field_1D = (uint8)((gameData->campaignProgress == 2) ? 0x20 : 0) + (uint8)((gameData->campaignProgress == 1) ? 0x40 : 0) + gameData->unk3;
}

// 2232
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
    gameData->unk2 = *(uint8*)(pilotData + ROSTER_UNK1) & 0xf;
    gameData->unk3 = *(uint8*)(pilotData + ROSTER_UNK2) & 0x1f;
    gameData->rankHigh = *(uint8*)(pilotData + ROSTER_UNK1) >> 6;
    gameData->campaignProgress = 0;
    gameData->pilotIdx = selectedPilotIdx;
}

// 22ec
int pilotNameInput(int *page, int a, int b, int c, struct Pilot *pilot) {
    int k;
    int x, y;
    int h;
    int n;
    uint16 l;
    int j;
    k = 0;
    TRACE(("pilotNameInput(): entering with page = %d, abc = %d/%d/%d, pilot: %s", *page, a,b,c, pilot->name));
    // 2307
    x = (selectedPilotIdx < PILOTS_PER_COLUMN) ? PILOT_COL_LEFT : PILOT_COL_RIGHT;
    y = ((selectedPilotIdx & (PILOTS_PER_COLUMN - 1)) * PILOT_ROW_HEIGHT) + PILOT_TOP_MARGIN;
    // 232f
    clearRect(page, x, y, x + PILOT_ENTRY_WIDTH, y + 35);
    drawStringAt(page, ranks[0], x, y);
    x += (j = stringWidth(page, ranks[0]));
    j = PILOT_ENTRY_WIDTH - j;
    screenBuf[3] = 0;
    // 2380
    clearRect(page, 15, 192, 303, 197);
    // 239a
    drawStringCentered(pageNumPtr, aMenterYourName, 0xf, 0xc0, 0x121);
    misc_jump_5e_clearKeyFlags();
    l = KEYCODE_CTRLX;
    TRACE(("pilotNameInput(): before loop"));
    do {
        // 23aa
        TRACE(("pilotNameInput(): loop iter, l = 0x%x", l));
        switch(l) {
        // 23b5
        case KEYCODE_CTRLX:
            TRACE(("pilotNameInput(): case 0x18"));
            // 23f8
            h = 0;
            pilot->name[0] = '\0';
            // 2403
            clearRect(page, x, y, x + j, y + c);
            drawStringAt(page, pilot->name, x, y);
            n = page[4];
            break;
        // 23ad
        case 8: // backspace
            TRACE(("pilotNameInput(): case 8"));
            // 2498
            if (h > 0) {
                h--;
                // 23eb
                pilot->name[h] = '\0';
                // 2403 - duplicate code block coalesced with above
                clearRect(page, x, y, x + j, y + c);
                drawStringAt(page, pilot->name, x, y);
                n = page[4];
            }
            break;
        default:
            TRACE(("pilotNameInput(): case default"));
            // 23ba
            if (l >= 0x20 && l <= 0x7f && h < a && stringWidth(page, pilot->name) <= 0x90) {
                TRACE(("pilotNameInput(): case default condition true, h = %d", h));
                // 23e9
                pilot->name[h++] = l;
                // 23eb
                pilot->name[h] = '\0';
                // 2403
                clearRect(page, x, y, x + j, y + c);
                drawStringAt(page, pilot->name, x, y);
                n = page[4];
            }
            break;
        }
        // 243b
        TRACE(("pilotNameInput(): before input loop"));
        while (getJoyKey() == 0) {
            waitMdaCgaStatus(3);
            gfx_jump_29_switchColor(page, x, y - 1, x + j, y + c,
                pilotNameInputColors[k], pilotNameInputColors[k ^ 1]);
            k ^= 1;
            page[3] = pilotNameInputColors[k];
        }
        TRACE(("pilotNameInput(): after input loop"));
        // 24a4
        l = readInputKey();
        if ((l & 0xff) != 0) {
            l &= 0xff;
        }
        TRACE(("pilotNameInput(): after sub_125e4, l = 0x%x", l));
        // 24b4
        if (l == KEYCODE_ENTER) { // 24bd
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

// 2542
int saveHallfame() {
    FILE *j;
    int l;
    // 2550
    j = fopen(aHallfame_0, aWb);
    // 2566
    fwrite(&selectedPilotIdx, 2, 1, j);
    l = 0;
    do {
        fwrite(&hallfameBuf[l], HALLFAME_RECORDSZ, 1, j);
    } while (++l < HALLFAME_SLOTS);
    fclose(j);
}

// 25a0
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

// 25e4
int readInputKey() {
    int j;
    if (commData->setupUseJoy == 1) { // 25f5
        do {
            if (misc_jump_5a_keybuf() == 0) break;
        } while (misc_jump_5d_readJoy(0) == 0);
        // 260d
        if (misc_jump_5a_keybuf() != 0) { // 2616
            j = KEYCODE_ENTER;
            goto checkKey;
        }
    }
    // 261e
    j = misc_jump_5b_getkey();
    // 2626
checkKey:
    if (j == KEYCODE_ALTQ || cbreakHit != 0) { // 262d
        cleanup();
        if (cbreakHit != 0) restoreCbreakHandler();
        // 2644
        exit(0);
    }
    // 264a
    return j;
}

// 0x30a2
int openFileWrapper(char *filename,int mode)
{
    return openFile(filename, mode);
}

// 0x30c6
int closeFileWrapper(int handle)
{
    fileClose(handle);
}

// 0x3312
void openShowPic(char *name, int16 page, int16 garbage)
{
    // 0x3315
    int16 fileHandle;
    // 0x3324
    TRACE(("openShowPic: opening file %s, page %d",name,page));
    fileHandle = openFileWrapper(name, 0);
    // 0x332e
    TRACE(("openShowPic: showing pic, handle %d",fileHandle));
    showPicFile(fileHandle, page, garbage);
    // 0x3337
    closeFileWrapper(fileHandle);
    TRACE(("openShowPic: file closed, returning"));
    // 0x333d
}

// 0x3368
void loadPic(char *filename, uint16 segment) {
    int handle;
    handle = openFileWrapper(filename, 0);
    TRACE(("loadPic(): opened %s, loading into segment 0x%x", filename, segment));
    decodePic(handle, segment);
    closeFileWrapper(handle);
}

// 3758
uint16 allocBuffer(int size) {
    uint16 segment;
    TRACE(("allocBuffer(): Allocating buffer of size %u", size));
    if ((segment = dos_alloc(size)) < DOS_ERROR_RMDIR) {
        cleanup();
        dos_printstring(aInsufficientSy);
        exit(0);
    }
    TRACE(("allocBuffer(): Allocated @ 0x%x", segment));
    return segment;
}

// 3b8a
void parseGridTerrain(void) {
    parseGrid();
    parseTerrain(regnPlhPtr);
    terrainDirtyFlag = 0;
}

// 3b9e
int parseTerrain(char *filename) {
    int16 j, l, n, p;
    uint16 i;
    replaceExtension(filename, a_3dt);
    if ((fileHandle = fopen(filename, aRb)) == 0) {
        showMsgWaitKey(aOpenErrorOn_3d);
    }
    else {
        fread(&terrainSignature,2,1,fileHandle);
        // 3be6
        if (terrainSignature != TERRAIN_MAGIC) { // 3bee
            showMsgWaitKey(aBadTileFileFor);
        }
        else { // 3bfc
            fread(terrainBuf1,2,5,fileHandle);
                for (l = 0; l < 5; l++) {
                    // 3c4a
                    if (terrainBuf1[l] > 0x20) { // 3c51
                    showMsgWaitKey(aTooManyTiles_);
                    return;
                }
                // 3c36
                fread(&terrainBuf2[l],2,terrainBuf1[l], fileHandle);
            }
            // 3c58
            n = 0;
            for (l = 0; l < 5; l = l + 1) {
                for (p = 0; terrainBuf1[l] > p; p++) {
                // 3d20
                    terrainPtrUnk[l].field_0[p] = terrainBuf3 + n;
                    // 3ce7
                    for (i = 0; i < (uint16)terrainBuf2[l].field_0[p]; i++) {
                        // 3ced
                        if (n > 0xdac) { // 3cf7
                            showMsgWaitKey(aTooMuchTileDat);
                            return;
                        } // 3c66
                        fread(terrainBuf3 + n,2,1,fileHandle);
                        fread(terrainBuf4 + n,2,1,fileHandle);
                        fread(terrainBuf5 + n,2,1,fileHandle);
                        fread(&j,2,1,fileHandle);
                        // 3cca
                        terrainIdxBuf[n] = j;
                        n += 7;
                    }
                }
            }
        }
        // 3d40
        fclose(fileHandle);
    }
}

// 3d4c
int parseGrid() {
    int j;
    replaceExtension(regnPlhPtr, a_3dg);
    // 3d71
    if ((fileHandle = fopen(regnPlhPtr, aRb_0)) == 0) { // 3d75
        showMsgWaitKey(aOpenErrorOn__0);
        j = 0;
        // 3d84
        do {
            gridBuf1[j] = j;
            j++;
        } while (j < 0x10);
        // 3d97
        nearmemset(gridBuf2, 0, 0x100);
        nearmemset(gridBuf3, 0, 0x200);
        nearmemset(gridBuf4, 0, 0x200);
        nearmemset(gridBuf5, 0, 0x200);
        // 3ddb
        gridValidFlag = 0;
        return;
    }
    // 3de6
    fread(&gridSignature, 2, 1, fileHandle);
    // 3dfc
    if (gridSignature != GRID_MAGIC) {
        // 3e08
        showMsgWaitKey(aBadGridFileFor);
    }
    else { // 3e10
        fread(gridBuf1, 1, 0x10, fileHandle);
        fread(gridBuf2, 1, 0x100, fileHandle);
        fread(gridBuf3, 1, 0x200, fileHandle);
        fread(gridBuf4, 1, 0x200, fileHandle);
        fread(gridBuf5, 1, 0x200, fileHandle);
    }
    // 3e82
    fclose(fileHandle);
}

// 3e8c
int showMsgWaitKey(char *msg) {
    doNothing2(msg, 0, 0x60, 0x0f);
    return getch();
}

// 3ea8
int replaceExtension(char *path, char *source) {
    int8 j;
    for(; (j = *path) != '.';) {
        if (j == 0) break;
        path++;
    }
    mystrcpy(path, source);
}

void mystrcpy(char *dest, const char *source) {
    do {
    } while ((*dest++ = *source++) != '\0');
}
