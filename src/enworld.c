/* enworld.c — world data reading, compiled with /Gs /Os */
#include <dos.h>
#include <memory.h>
#include "endata.h"
#include "enworld.h"

/* Private helpers for this translation unit. */
void loadWorldData(char* destOffset, int size);
void readFromWorldBuf(char *dest, int size, int count, FILE *bufHandle);
void writeToWorldBuf(char *dest, int size, int count, FILE *bufHandle);

void readWorldData(void) {
    loadWorldData((char*)&worldWaypointCount, 2);
    loadWorldData((char*)&worldObjectCount, 2);
    loadWorldData((char*)&worldRouteTable, 2);
    loadWorldData((char*)&worldRouteCount, 2);
    loadWorldData((char*)&worldObjects, worldObjectCount << 4);
    loadWorldData((char*)&worldSamCount, 2);
    loadWorldData((char*)&worldSamTable, 0x24 * worldSamCount);
    loadWorldData((char*)unitTypeTable, 0x64);
    loadWorldData((char*)&worldUnitFlags, 0x64);
    loadWorldData((char*)worldStringBuf, 0x2ee);
    loadWorldData((char*)gridFlags, 0x100);
    loadWorldData((char*)&worldGridSize, 2);
    loadWorldData((char*)&worldMiscHeader, 2);
    loadWorldData((char*)&weaponDataBlock, 0x10);
    loadWorldData((char*)target1Type, 0x24);
    loadWorldData((char*)flightTimeTable, 0x600);
}

void loadWorldData(char* destOffset, int size) {
    if (worldDataReady != 0) {
        readFromWorldBuf((char *)destOffset, size, 1, worldBufHandle);
    } else {
        writeToWorldBuf((char *)destOffset, size, 1, worldBufHandle);
    }
}

void readFromWorldBuf(char *dest, int size, int count, FILE *bufHandle) {
    char far *farDest;
    register int totalSize;
    farDest = (char far *)dest;
    totalSize = size * count;
    movedata(worldBufSegment, worldBufOffset, FP_SEG(farDest), FP_OFF(farDest), totalSize);
    worldBufOffset += totalSize;
}

void writeToWorldBuf(char *dest, int size, int count, FILE *bufHandle) {
    char far *farDest;
    register int totalSize;
    farDest = (char far *)dest;
    totalSize = size * count;
    movedata(FP_SEG(farDest), FP_OFF(farDest), worldBufSegment, worldBufOffset, totalSize);
    worldBufOffset += totalSize;
}
