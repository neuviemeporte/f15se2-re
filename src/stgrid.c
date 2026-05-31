/* Grid parsing and utility */
#include "start.h"
#include "const.h"
#include "shared/util.h"
#include "debug.h"

#include <stdio.h>
#include <conio.h>

void parseGrid() {
    int j;
    replaceExtension(regnPlhPtr, a_3dg);
    if ((fileHandle = fopen(regnPlhPtr, aRb_0)) == 0) {
        showMsgWaitKey(aOpenErrorOn__0);
        j = 0;
        do {
            gridBuf1[j] = j;
            j++;
        } while (j < 0x10);
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
