/* Grid parsing and utility */
#include "start.h"
#include "const.h"
#include "shared/util.h"
#include "debug.h"

#include <stdio.h>
#include <conio.h>

// 0x3d4c
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

// 0x3e8c
int showMsgWaitKey(const char *msg) {
    doNothing2(msg, 0, 0x60, 0x0f);
    return getch();
}

// 0x3ea8
void replaceExtension(char *path, char *source) {
    int8 ch;
    for(; (ch = *path) != '.';) {
        if (ch == 0) break;
        path++;
    }
    mystrcpy(path, source);
}
