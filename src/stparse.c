/* Grid/terrain parsing entry point */
#include "start.h"
#include "const.h"
#include "shared/util.h"
#include "debug.h"

#include <stdio.h>

// 0x3b8a
void parseGridTerrain(void) {
    parseGrid();
    parseTerrain(regnPlhPtr);
    terrainDirtyFlag = 0;
}

// 0x3b9e
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
