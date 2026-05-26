/* Optimized functions from START.EXE */
#include "start.h"
#include "const.h"
#include "gfx.h"
#include "slot.h"
#include "comm.h"
#include "offsets.h"
#include "shared/util.h"
#include "debug.h"

#include <string.h>

// 124a
void showSprite(int page, int x, int y, int src_x, int src_y, int width, int height) {
    TRACE(("showSprite(%d, %d, %d, %d, %d, %d, %d)", page, x, y, src_x, src_y, width, height));
    spriteParams.bufPtr = menuSprites;
    spriteParams.srcX = src_x;
    spriteParams.srcY = src_y;
    spriteParams.page = page;
    spriteParams.dstX = x;
    spriteParams.dstY = y;
    spriteParams.width = width;
    spriteParams.height = height;
    spriteParams.flags = 0x10;
    gfx_jump_11_blitSprite(&spriteParams);
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
    screenDesc.color = COLOR_WHITE;
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
    int yPos;
    int medalIdx;
    int medalWidth;
    // 1d90
    pilot = &hallfameBuf[pilotIdx];
    TRACE(("printPilot(): index %d, name %s", pilotIdx, pilot->name));
    // 1da1
    x = (pilotIdx < PILOTS_PER_COLUMN) ? PILOT_COL_LEFT : PILOT_COL_RIGHT;
    // 1db2
    yPos = ((pilotIdx & (PILOTS_PER_COLUMN - 1)) * PILOT_ROW_HEIGHT) + PILOT_TOP_MARGIN;
    // 1dcc
    clearRect(screenBuf, x, yPos - 1, x + PILOT_ENTRY_WIDTH, yPos + 0x20);
    TRACE(("printPilot(): cleared rect"));
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
    for (medalIdx = 0, medalWidth = 0; medalIdx < 7; medalIdx++) { // 1ea8
        // 1eb8
        if ((pilot->field_1D & (1 << medalIdx)) == 0) continue;
        medalWidth += (uint8)byte_17422[medalIdx] + 4;
    } // 1ed2
    TRACE(("printPilot(): past loop 1, medalWidth = %d", medalWidth));
    // 1edd
    x += (0x90 - medalWidth) / 2;
    yPos += 0x11;
    medalIdx = 0;
    // 1ee9
    // display medals
    do {
        if ((pilot->field_1D & (1 << medalIdx)) == 0) continue;
        // 1f21
        showSprite(screenBuf[0], x, yPos, byte_17412[medalIdx], byte_1741A[medalIdx], byte_17422[medalIdx], 0x10);
        // 1f27
        x += byte_17422[medalIdx] + 4;
    } while(++medalIdx < 7);
    TRACE(("printPilot(): returning"));
    // 1f42
}

// ---- likely module boundary
// 1f44
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
        gfx_jump_29_switchColor(screenBuf, x, y, x + PILOT_ENTRY_WIDTH, y + PILOT_NAME_HEIGHT, COLOR_WHITE, COLOR_GRAY);
        x = (selectedPilotIdx < PILOTS_PER_COLUMN) ? PILOT_COL_LEFT : PILOT_COL_RIGHT;
        y = ((selectedPilotIdx & (PILOTS_PER_COLUMN - 1)) * PILOT_ROW_HEIGHT) + PILOT_TOP_MARGIN;
        gfx_jump_29_switchColor(screenBuf, x, y, x + PILOT_ENTRY_WIDTH, y + PILOT_NAME_HEIGHT, COLOR_GRAY, COLOR_WHITE);
    }
    TRACE(("processPilotInput(): returning, selected %d", selectedPilotIdx));
}

// 210a
void blinkPilot() {
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
    pilot->rank = (gameData->rankHigh * 64) + gameData->rank;
    // 2202
    pilot->field_1D = (uint8)((gameData->campaignProgress == 2) ? 0x20 : 0) + (uint8)((gameData->campaignProgress == 1) ? 0x40 : 0) + gameData->medals;
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
    gameData->rank = *(uint8*)(pilotData + ROSTER_UNK1) & 0xf;
    gameData->medals = *(uint8*)(pilotData + ROSTER_UNK2) & 0x1f;
    gameData->rankHigh = *(uint8*)(pilotData + ROSTER_UNK1) >> 6;
    gameData->campaignProgress = 0;
    gameData->pilotIdx = selectedPilotIdx;
}

// 22ec
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
            gfx_jump_29_switchColor(page, x, y - 1, x + rankWidth, y + c,
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

// 2542
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
    int key;
    if (commData->setupUseJoy == 1) { // 25f5
        do {
            if (misc_jump_5a_keybuf() == 0) break;
        } while (misc_jump_5d_readJoy(0) == 0);
        // 260d
        if (misc_jump_5a_keybuf() != 0) { // 2616
            key = KEYCODE_ENTER;
            goto checkKey;
        }
    }
    // 261e
    key = misc_jump_5b_getkey();
    // 2626
checkKey:
    if (key == KEYCODE_ALTQ || cbreakHit != 0) { // 262d
        cleanup();
        if (cbreakHit != 0) restoreCbreakHandler();
        // 2644
        exit(0);
    }
    // 264a
    return key;
}

// 3758
uint16 allocBuffer(int size) {
    uint16 segment;
    TRACE(("allocBuffer(): Allocating buffer of size %u", size));
    if ((segment = dos_alloc(size)) < DOS_ERROR_RMDIR) {
        cleanup();
        dos_printstring(str_allocError);
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
void parseTerrain(char *filename) {
    int16 tmp, level, tileOffset, entry;
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
                for (level = 0; level < 5; level++) {
                    // 3c4a
                    if (terrainBuf1[level] > 0x20) { // 3c51
                    showMsgWaitKey(aTooManyTiles_);
                    return;
                }
                // 3c36
                fread(&terrainBuf2[level],2,terrainBuf1[level], fileHandle);
            }
            // 3c58
            tileOffset = 0;
            for (level = 0; level < 5; level = level + 1) {
                for (entry = 0; terrainBuf1[level] > entry; entry++) {
                // 3d20
                    terrainPtrUnk[level].field_0[entry] = terrainBuf3 + tileOffset;
                    // 3ce7
                    for (i = 0; i < (uint16)terrainBuf2[level].field_0[entry]; i++) {
                        // 3ced
                        if (tileOffset > 0xdac) { // 3cf7
                            showMsgWaitKey(aTooMuchTileDat);
                            return;
                        } // 3c66
                        fread(terrainBuf3 + tileOffset,2,1,fileHandle);
                        fread(terrainBuf4 + tileOffset,2,1,fileHandle);
                        fread(terrainBuf5 + tileOffset,2,1,fileHandle);
                        fread(&tmp,2,1,fileHandle);
                        // 3cca
                        terrainIdxBuf[tileOffset] = tmp;
                        tileOffset += 7;
                    }
                }
            }
        }
        // 3d40
        fclose(fileHandle);
    }
}

// 3d4c
void parseGrid() {
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
int showMsgWaitKey(const char *msg) {
    doNothing2(msg, 0, 0x60, 0x0f);
    return getch();
}

// 3ea8
void replaceExtension(char *path, char *source) {
    int8 ch;
    for(; (ch = *path) != '.';) {
        if (ch == 0) break;
        path++;
    }
    mystrcpy(path, source);
}
