/* Grid/terrain parsing entry point */
#include "stcode.h"
#include "stdata.h"
#include "stparse.h"
#include "const.h"
#include "shared/common.h"
#include "debug.h"

#include <stdio.h>
#include <conio.h>

/* Private helpers for this translation unit. */
void parseTerrain(char *dest);
void parseGrid();
int showMsgWaitKey(const char *);
void replaceExtension(char *dest, char *source);

void parseGridTerrain(void) {
    parseGrid();
    parseTerrain(regnPlhPtr);
    terrainDirtyFlag = 0;
}

void parseTerrain(char *filename) {
    int16 tileIdx, level, tileOffset, entry;
    uint16 tileNum;
    replaceExtension(filename, a_3dt);
    if ((fileHandle = fopen(filename, "rb")) == 0) {
        showMsgWaitKey(aOpenErrorOn_3d);
    }
    else {
        fread(&terrainSignature,2,1,fileHandle);
        if (terrainSignature != TERRAIN_MAGIC) {
            showMsgWaitKey(aBadTileFileFor);
        }
        else {
            fread(terrainBuf1,2,5,fileHandle);
                for (level = 0; level < 5; level++) {
                    if (terrainBuf1[level] > 0x20) {
                    showMsgWaitKey(aTooManyTiles_);
                    return;
                }
                fread(&terrainTileCounts[level],2,terrainBuf1[level], fileHandle);
            }
            tileOffset = 0;
            for (level = 0; level < 5; level = level + 1) {
                for (entry = 0; terrainBuf1[level] > entry; entry++) {
                    terrainTilePtrs[level].entries[entry] = (struct TerrainTile*)((uint8*)terrainTileBlock + tileOffset);
                    for (tileNum = 0; tileNum < terrainTileCounts[level].entries[entry]; tileNum++) {
                        if (tileOffset > 0xdac) {
                            showMsgWaitKey(aTooMuchTileDat);
                            return;
                        }
                        fread(&((struct TerrainTile*)((uint8*)terrainTileBlock + tileOffset))->buf3,2,1,fileHandle);
                        fread(&((struct TerrainTile*)((uint8*)terrainTileBlock + tileOffset))->buf4,2,1,fileHandle);
                        fread(&((struct TerrainTile*)((uint8*)terrainTileBlock + tileOffset))->buf5,2,1,fileHandle);
                        fread(&tileIdx,2,1,fileHandle);
                        ((struct TerrainTile*)((uint8*)terrainTileBlock + tileOffset))->idx = tileIdx;
                        tileOffset += sizeof(struct TerrainTile);
                    }
                }
            }
        }
        fclose(fileHandle);
    }
}

/* ---- merged from stgrid.c ---- */
void parseGrid() {
    int idx;
    replaceExtension(regnPlhPtr, a_3dg);
    if ((fileHandle = fopen(regnPlhPtr, "rb")) == 0) {
        showMsgWaitKey(aOpenErrorOn__0);
        idx = 0;
        do {
            gridBuf1[idx] = idx;
            idx++;
        } while (idx < 0x10);
        nearmemset(gridBuf2, 0, 0x100);
        nearmemset(gridBuf3, 0, 0x200);
        nearmemset(gridBuf4, 0, 0x200);
        nearmemset(gridBuf5, 0, 0x200);
        gridValidFlag = 0;
        return;
    }
    fread(&gridSignature, 2, 1, fileHandle);
    if (gridSignature != GRID_MAGIC) {
        showMsgWaitKey(aBadGridFileFor);
    }
    else {
        fread(gridBuf1, 1, 0x10, fileHandle);
        fread(gridBuf2, 1, 0x100, fileHandle);
        fread(gridBuf3, 1, 0x200, fileHandle);
        fread(gridBuf4, 1, 0x200, fileHandle);
        fread(gridBuf5, 1, 0x200, fileHandle);
    }
    fclose(fileHandle);
}

int showMsgWaitKey(const char *msg) {
    doNothing2(msg, 0, 0x60, 0x0f);
    return getch();
}

void replaceExtension(char *path, char *source) {
    int8 ch;
    for(; (ch = *path) != '.';) {
        if (ch == 0) break;
        path++;
    }
    mystrcpy(path, source);
}
