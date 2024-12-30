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
int sub_1124A(int arg_0, int arg_2, int arg_4, int arg_6, int arg_8, int arg_A, int arg_C) {
    word_17284 = (int16)bufAddr;
    word_17286 = arg_6;
    word_17288 = arg_8;
    word_1728A = arg_0;
    word_1728C = arg_2;
    word_1728E = arg_4;
    word_17290 = arg_A;
    word_17292 = arg_C;
    byte_1729C[0] = 0x10;
    gfx_jump_11(&word_17284);
}

// 0x1b72
void pilotSelect(int16 needSplash) 
{
    int unused;
    gfx_jump_45_retrace();
    // 0x1b7d
    loadHallfame();
    if (needSplash == 0) {
        // 0x1b86
        updateHallfame();
    }
    // 0x1b8d
    gfx_jump_3d_null(4);
    loadPic(aArmpiece_pic, bufAddr);
    // 0x1ba7
    gfx_jump_3d_null(7);
    // 0x1bb9
    openShowPic(aHiscore_pic, *screenBuf);
    choosePilotPrompt();
    gfx_jump_44_setDac(1);
    gfx_jump_46_retrace2();
    // 0x1bd3
    processPilotInput();
    pilotToGameData((uint8*)&hallfameBuf[hallfameCount]);
    // 0x1beb
    screenBuf[3] = 0;
    // 0x1c00    
    clearRect(screenBuf, 0, 0, SCREEN_MAXX, SCREEN_MAXY);
}

// 0x1c08
int updateHallfame()
{
    int var_2;
    // 0x1c14
    if (gameData->unk1 != 0) {
        hallfameCount = 6;
        // 0x1c28
        for (; hallfameCount >= 0; hallfameCount--) {
            // 0x1c43
            if (hallfameBuf[hallfameCount].field_16 >= gameData->totalScore) break;
        }
        // 0x1c51
        hallfameCount++;
        // 1c55
        for (var_2 = gameData->pilotIdx - 1; var_2 >= hallfameCount; var_2--) {
            // 1c82
            hallfameBuf[var_2 + 1] = hallfameBuf[var_2];
        }
    }
    else {
    // 1c88
        hallfameCount = gameData->pilotIdx;
    }
    // 1c9d
    gameDataToPilot(&hallfameBuf[hallfameCount]);
    // 1ca3
    if (sub_11ADC() != 0) {
        saveHallfame();
        return;
    }
    screenBuf[6] = 0;
    clearRect(screenBuf, 0, 0, SCREEN_MAXX, SCREEN_MAXY);
    gfx_jump_50_null();
    screenBuf[4] = 0xf;
    drawString(screenBuf, aOriginalDiskIn, 0, 0x64, 0x140);
    drawString(screenBuf, aPressAKeyToCon, 0, 0x96, 0x140);
    screenBuf[4] = 7;
    gfx_jump_46_retrace2();
    misc_jump_5b_getkey();
    gfx_jump_45_retrace();
}

// 1d32
void choosePilotPrompt(void) 
{
    int var_2;
    screenBuf[3] = 0;
    var_2 = 0;
    do {
        // 1d49
        sub_11D80(var_2);
    } while (++var_2 < 8);
    word_173D6 = 0xf;
    // 1d71
    drawString(pageNumPtr, aUseSelectorToC, 0, 0xC0, 0x140);
    gfx_jump_50_null();
}

// 1d80 - print pilot?
void sub_11D80(int arg_0) { // arg_0: index?
    struct Pilot *var_2;
    int x;
    int var_8;
    int var_6;
    int var_A;
    // 1d90
    var_2 = &hallfameBuf[arg_0];
    // 1da1
    x = (arg_0 < 4) ? 0x10 : 0xa0;
    // 1db2
    var_8 = ((arg_0 & 3) * 0x2c) + 0x14;
    // 1dcc
    clearRect(screenBuf, x, var_8 - 1, x + 0x8f, var_8 + 0x20);
    // 1de3
    word_173D6 = (arg_0 == hallfameCount) ? 0xf : 7;
    // 1df9
    mystrcpy(todayMissStrBuf, ranks[var_2->field_1C & 0xf]);
    // 1e06
    mystrcat(todayMissStrBuf, var_2->field_0);
    // 1e1e
    drawString(screenBuf, todayMissStrBuf, x, var_8, 0x90);
    word_173D6 = 0xc;
    word_173DE = 4;
    // 1e3d
    my_ltoa(var_2->field_16, todayMissStrBuf);
    // 1e4b
    mystrcat(todayMissStrBuf, asc_174AC);
    // 1e65
    my_itoa(var_2->field_1A, &todayMissStrBuf[mystrlen(todayMissStrBuf)]);
    // 1e73
    mystrcat(todayMissStrBuf, asc_174AF);
    // 1e8f
    drawString(screenBuf, todayMissStrBuf, x, var_8 + 9, 0x90);
    word_173DE = 1;
    // 1e9b
    for (var_6 = 0, var_A = 0; var_6 < 7; var_6++) { // 1ea8
        // 1eb8
        if ((var_2->field_1D & (1 << var_6)) == 0) continue;
        var_A += (uint8)byte_17422[var_6] + 4; 
    } // 1ed2
    // 1edd
    x += (0x90 - var_A) / 2;
    var_8 += 0x11;
    var_6 = 0;
    // 1ee9
    do {
        if ((var_2->field_1D & (1 << var_6)) == 0) continue;
        // 1f21
        sub_1124A(screenBuf[0], x, var_8, byte_17412[var_6], byte_1741A[var_6], byte_17422[var_6], 0x10);
        // 1f27
        x += byte_17422[var_6] + 4;
    } while(++var_6 < 7);
    // 1f42
}

// ---- likely module boundary
// 1f44
// XXX: non-linear execution due to optimization
int processPilotInput() {
    int var_2;
    int var_4;
    int var_6;
    int var_A;
    pilotSelectFlag = 1;
    // 1f51
    setTimerIrqHandler();
    // 1f54
    while (var_2 = hallfameCount, true) switch (processStoreInput()) {
    // 1f84
    case KEYCODE_ENTER: 
        if ((hallfameBuf[hallfameCount].field_1D & 0x60) == 0) {
            // 1f98
            restoreTimerIrqHandler();
            pilotSelectFlag = 0;
            return;
        }
        // 1fa6 
        putch(7);
        continue;
    // 1f56
    case KEYCODE_ESC: 
        // 1fb2
        hallfameBuf[hallfameCount].field_1E 
            = hallfameBuf[hallfameCount].field_1F 
            = hallfameBuf[hallfameCount].field_16 
            = hallfameBuf[hallfameCount].field_1A 
            = hallfameBuf[hallfameCount].field_1D 
            = hallfameBuf[hallfameCount].field_1C 
            = 0;
        // 1fef
        pilotNameInput(screenBuf, 0x14, 8, 8, &hallfameBuf[hallfameCount]);
        // 2000
        pilotToGameData(&hallfameBuf[hallfameCount]);
        // 2006
        var_6 = hallfameCount;
        // 2029
        while (var_6 < 7) { // 200e
            hallfameBuf[var_6] = hallfameBuf[var_6+1];
            // 2026
            var_6++;
        }
        // 2033
        gameDataToPilot(&hallfameBuf[7]);
        hallfameCount = 7;
        choosePilotPrompt();
        // 2042
        if (sub_11ADC() != 0) {
            saveHallfame();
        }
        // 204f
        continue;
    // 1f5b
    case KEYCODE_UPARROW:
        // 2052
        hallfameCount--;
        goto handleArrow;
    // 1f73
    case KEYCODE_DNARROW:
        // 2058
        hallfameCount++;
        goto handleArrow;
    // 1f63
    case KEYCODE_LEFTARROW:
        // 205e
        hallfameCount -= 4;
        goto handleArrow;
    // 1f68
    case KEYCODE_RIGHTARROW:
        // 2066
        hallfameCount += 4;
handleArrow:    
        // 206b
        hallfameCount &= 7;
        var_4 = (var_2 < 4) ? 0x10 : 0xa0;
        var_A = ((var_2 & 3) * 0x2c) + 0x14;
        // 20b3
        gfx_jump_29_switchColor(screenBuf, var_4, var_A, var_4 + 0x8f, var_A + 8, 0xf, 0x7);
        var_4 = (hallfameCount < 4) ? 0x10 : 0xa0;
        var_A = ((hallfameCount & 3) * 0x2c) + 0x14;
        gfx_jump_29_switchColor(screenBuf, var_4, var_A, var_4 + 0x8f, var_A + 8, 0x7, 0xf);
    }
}

// 210a
int sub_1210A() {
    int16 var_2, var_4;
    if (pilotSelectFlag == 0) return;
    waitMdaCgaStatus(6);
    // 2131
    var_2 = hallfameCount < 4 ? 0x10 : 0x160;
    var_4 = ((hallfameCount & 3) * 0x2c) + 0x14;
    // 2171
    gfx_jump_29_switchColor(screenBuf, var_2 , var_4, var_2 + 0x8f, var_4 + 8, word_174B2[word_174B6], word_174B2[word_174B6 ^ 1]);
    word_174B6 ^= 1;
}

// 2182
void gameDataToPilot(struct Pilot *arg_0) {
    //uint16 var_4;
    int var_2;
    // 2189
    for (var_2 = 0; arg_0->field_0[var_2] = gameData->pilotName[var_2]; var_2++) {
    } // 21a9
    arg_0->field_16 = gameData->totalScore;
    arg_0->field_1A = gameData->lastScore;
    arg_0->field_1E = gameData->theater;
    arg_0->field_1F = gameData->difficulty;
    arg_0->field_1C = (gameData->flag2 * 64) + gameData->unk2;
    // 2202
    arg_0->field_1D = (uint8)((gameData->flag1 == 2) ? 0x20 : 0) + (uint8)((gameData->flag1 == 1) ? 0x40 : 0) + gameData->unk3;
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
    gameData->flag2 = *(uint8*)(pilotData + ROSTER_UNK1) >> 6;
    gameData->flag1 = 0;
    gameData->pilotIdx = hallfameCount;
}

// 22ec
int pilotNameInput(int *page, int a, int b, int c, struct Pilot *pilot) {
    int var_C;
    int x, y;
    int var_10;
    int var_6;
    uint16 var_4;
    int var_2;
    var_C = 0;
    // 2307
    x = (hallfameCount < 4) ? 0x10 : 0xa0;
    y = ((hallfameCount & 3) * 44) + 20;
    // 232f
    clearRect(page, x, y, x + 143, y + 35);
    actualDrawString(page, ranks[0], x, y);
    x += (var_2 = stringWidth(page, ranks[0]));
    var_2 = 0x8f - var_2;
    screenBuf[3] = 0;
    // 2380
    clearRect(page, 15, 192, 303, 197);
    // 239a
    drawString(pageNumPtr, aMenterYourName, 0xf, 0xc0, 0x121);
    misc_jump_5e_clearKeyFlags();
    var_4 = 0x18;
    do {
        // 23aa
        switch(var_4) {
        // 23b5
        case 0x18:
            // 23f8
            var_10 = 0;
            pilot->field_0[0] = '\0';
            // 2403
            clearRect(page, x, y, x + var_2, y + c);
            actualDrawString(page, pilot->field_0, x, y);
            var_6 = page[4];
            break;
        // 23ad
        case 8: 
            // 2498
            if (var_10 > 0) {
                var_10--;
                // 23eb
                pilot->field_0[var_10] = '\0';
                // 2403 - duplicate code block coalesced with above
                clearRect(page, x, y, x + var_2, y + c);
                actualDrawString(page, pilot->field_0, x, y);
                var_6 = page[4];
            }
            break;
        default: 
            // 23ba
            if (var_4 >= 0x20 && var_4 <= 0x7f && var_10 < a && stringWidth(page, pilot->field_0) <= 0x90) {
                // 23e9
                pilot->field_0[var_10++] = var_4;
                // 23eb
                pilot->field_0[var_10] = '\0';
                // 2403
                clearRect(page, x, y, x + var_2, y + c);
                actualDrawString(page, pilot->field_0, x, y);
                var_6 = page[4];
            }
            break;
        }
        // 243b
        while (getJoyKey() == 0) {
            waitMdaCgaStatus(3);
            gfx_jump_29_switchColor(page, x, y - 1, x + var_2, y + c, 
                pilotNameInputColors[var_C], pilotNameInputColors[var_C ^ 1]);
            var_C ^= 1;
            page[6] = pilotNameInputColors[var_C];
        }
        // 24a4
        var_4 = sub_125E4();
        if ((var_4 & 0xff) != 0) {
            var_4 &= 0xff00;
        }
        // 24b4
        if (var_4 == 0xd) { // 24bd
            screenBuf[3] = 0;
            clearRect(page, 0xf, 0xc0, 0x12f, 0xc5);
            return;
        }
    } while( true );
}


// 0x24e4
void loadHallfame(void)
{
    int counter;
    FILE *handle;
    handle = fopen(aHallfame, aRb_3);
    fread(&hallfameCount, 2, 1, handle);
    counter = 0;
    do {
        fread(hallfameBuf + counter * HALLFAME_RECORDSZ, HALLFAME_RECORDSZ, 1, handle);
        counter++;
    } while (counter < HALLFAME_SLOTS);
    fclose(handle);
}

// 2542
int saveHallfame() {
    FILE *var_2;
    int var_4;
    // 2550
    var_2 = fopen(aHallfame_0, aWb);
    // 2566
    fwrite(&hallfameCount, 2, 1, var_2);
    var_4 = 0;
    do {
        fwrite(&hallfameBuf[var_4], HALLFAME_RECORDSZ, 1, var_2);
    } while (++var_4 < 8);
    fclose(var_2);
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
int sub_125E4() {
    int var_2;
    if (commData->setupUseJoy == 1) { // 25f5
        do {
            if (misc_jump_5a_keybuf() == 0) break;
        } while (misc_jump_5d_readJoy(0) == 0);
        // 260d
        if (misc_jump_5a_keybuf() != 0) { // 2616
            var_2 = 0xd;
            goto checkKey;
        }
    }
    // 261e
    var_2 = misc_jump_5b_getkey();
    // 2626
checkKey:
    if (var_2 == 0x1000 || cbreakHit != 0) { // 262d
        cleanup();
        if (cbreakHit != 0) restoreCbreakHandler();
        // 2644
        exit(0);
    }
    // 264a
    return var_2;
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
    TRACE(("openShowPic: opening file"));
    fileHandle = openFileWrapper(name, 0);
    // 0x332e
    TRACE(("openShowPic: showing pic"));
    showPicFile(fileHandle, page, garbage);
    // 0x3337
    TRACE(("openShowPic: closing file"));
    closeFileWrapper(fileHandle);
    // 0x333d
}

// 0x3368
void loadPic(char *filename,char *buffer) {
    int handle;
    handle = openFileWrapper(filename, 0);
    decodePic(handle, buffer);
    closeFileWrapper(handle);
}

// 3758
char* allocBuffer(int size) {
    char *ret;
    if ((ret = dos_alloc(size)) < (uint8*)DOS_ERROR_RMDIR) {
        cleanup();
        dos_printstring(aInsufficientSy);
        exit(0);
    }
    return ret;
}

// 3b8a
void parseGridTerrain(void) {
    parseGrid();
    parseTerrain(regnPlhPtr);
    word_18186 = 0;
}

// 3b9e
int parseTerrain(char *arg_0) {
    int16 var_2, var_4, var_6, var_8;
    uint16 var_A;
    sub_13EA8(arg_0, a_3dt);
    if ((fileHandle = fopen(arg_0, aRb)) == 0) {
        subReadKey(aOpenErrorOn_3d);
    }
    else {
        fread(&terrainSignature,2,1,fileHandle);
        // 3be6
        if (terrainSignature != TERRAIN_MAGIC) { // 3bee
            subReadKey(aBadTileFileFor);
        }
        else { // 3bfc
            fread(terrainBuf1,2,5,fileHandle);
            for (var_4 = 0; var_4 < 5; var_4++) {
                // 3c4a
                if (terrainBuf1[var_4] > 0x20) { // 3c51
                    subReadKey(aTooManyTiles_);
                    return;
                }
                // 3c36
                fread(&terrainBuf2[var_4 << 6],2,terrainBuf1[var_4], fileHandle);
            }
            // 3c58
            var_6 = 0;
            for (var_4 = 0; var_4 < 5; var_4 = var_4 + 1) {
                for (var_8 = 0; terrainBuf1[var_4] > var_8; var_8++) {
                // 3d20
                    terrainPtrUnk[var_4].field_0[var_8] = terrainBuf3 + var_6;
                    // 3ce7
                    for (var_A = 0; var_A < (uint16)terrainBuf2[var_4].field_0[var_8]; var_A++) {
                        // 3ced
                        if (var_6 > 0xdac) { // 3cf7
                            subReadKey(aTooMuchTileDat);
                            return;
                        } // 3c66
                        fread(terrainBuf3 + var_6,2,1,fileHandle);
                        fread(terrainBuf4 + var_6,2,1,fileHandle);
                        fread(terrainBuf5 + var_6,2,1,fileHandle);
                        fread(&var_2,2,1,fileHandle);
                        // 3cca
                        terrainIdxBuf[var_6] = var_2;
                        var_6 += 7;
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
    int var_2;
    sub_13EA8(regnPlhPtr, a_3dg);
    // 3d71
    if ((fileHandle = fopen(regnPlhPtr, aRb_0)) == 0) { // 3d75
        subReadKey(aOpenErrorOn__0);
        var_2 = 0;
        // 3d84
        do {
            gridBuf1[var_2] = var_2;
            var_2++;
        } while (var_2 < 0x10);
        // 3d97
        nearmemset(gridBuf2, 0, 0x100);
        nearmemset(gridBuf3, 0, 0x200);
        nearmemset(gridBuf4, 0, 0x200);
        nearmemset(gridBuf5, 0, 0x200);
        // 3ddb
        word_18188 = 0;
        return;
    }
    // 3de6
    fread(&gridSignature, 2, 1, fileHandle);
    // 3dfc
    if (gridSignature != GRID_MAGIC) {
        // 3e08
        subReadKey(aBadGridFileFor);
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
int subReadKey(char *arg_0) {
    doNothing2(arg_0, 0, 0x60, 0x0f);
    return getch();
}

// 3ea8
int sub_13EA8(char *arg_0, char *source) {
    int8 var_2;
    for(; (var_2 = *arg_0) != '.';) {
        if (var_2 == 0) break;
        arg_0++;
    } 
    mystrcpy(arg_0, source);
}