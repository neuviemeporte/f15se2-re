/* enworld.c — world data reading, compiled with /Gs /Os */
#include "end.h"

void readWorldData(void) {
    loadWorldData((int)&dat_4246, 2);
    loadWorldData((int)&var_203, 2);
    loadWorldData((int)&dat_4040, 2);
    loadWorldData((int)&dat_5ab4, 2);
    loadWorldData((int)&dat_424e, var_203 << 4);
    loadWorldData((int)&var_216, 2);
    loadWorldData((int)&dat_4a2a, 0x24 * var_216);
    loadWorldData((int)unitTypeTable, 0x64);
    loadWorldData((int)&dat_5512, 0x64);
    loadWorldData((int)worldStringBuf, 0x2ee);
    loadWorldData((int)gridFlags, 0x100);
    loadWorldData((int)&dat_55de, 2);
    loadWorldData((int)&dat_4034, 2);
    loadWorldData((int)&dat_0042, 0x10);
    loadWorldData((int)target1Type, 0x24);
    loadWorldData((int)var_193, 0x600);
}

void loadWorldData(int destOffset, int size) {
    if (worldDataReady != 0) {
        readFromWorldBuf((char *)destOffset, size, 1, worldBufHandle);
    } else {
        readFromWorldFile((char *)destOffset, size, 1, worldBufHandle);
    }
}

void readFromWorldBuf(char *dest, int size, int count, int bufHandle) {
    char far *farDest;
    register int totalSize;
    farDest = (char far *)dest;
    totalSize = size * count;
    routine_140(var_152, var_151, FP_SEG(farDest), FP_OFF(farDest), totalSize);
    var_151 += totalSize;
}

void readFromWorldFile(char *dest, int size, int count, int bufHandle) {
    char far *farDest;
    register int totalSize;
    farDest = (char far *)dest;
    totalSize = size * count;
    routine_140(FP_SEG(farDest), FP_OFF(farDest), var_152, var_151, totalSize);
    var_151 += totalSize;
}
