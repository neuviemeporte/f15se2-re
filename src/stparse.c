/* Grid/terrain parsing entry point */
#include "start.h"
#include "const.h"
#include "shared/util.h"
#include "debug.h"

#include <stdio.h>

void parseGridTerrain(void) {
    parseGrid();
    parseTerrain(regnPlhPtr);
    terrainDirtyFlag = 0;
}

void parseTerrain(char *filename) {
    int16 tmp, level, tileOffset, entry;
    uint16 i;
    replaceExtension(filename, a_3dt);
    if ((fileHandle = fopen(filename, aRb)) == 0) {
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
                    for (i = 0; i < (uint16)terrainTileCounts[level].entries[entry]; i++) {
                        if (tileOffset > 0xdac) {
                            showMsgWaitKey(aTooMuchTileDat);
                            return;
                        }
                        fread(&((struct TerrainTile*)((uint8*)terrainTileBlock + tileOffset))->buf3,2,1,fileHandle);
                        fread(&((struct TerrainTile*)((uint8*)terrainTileBlock + tileOffset))->buf4,2,1,fileHandle);
                        fread(&((struct TerrainTile*)((uint8*)terrainTileBlock + tileOffset))->buf5,2,1,fileHandle);
                        fread(&tmp,2,1,fileHandle);
                        ((struct TerrainTile*)((uint8*)terrainTileBlock + tileOffset))->idx = tmp;
                        tileOffset += sizeof(struct TerrainTile);
                    }
                }
            }
        }
        fclose(fileHandle);
    }
}
