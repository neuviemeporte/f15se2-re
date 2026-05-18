/* end1.c — compiled with /Gs (stack probes disabled, no debug info) */
#include "pointers.h"
#include "debug.h"
#include "end.h"
#include "util.h"

void closeFileWrapper(int param_1)
{
    TRACE(("closeFileWrapper"));
    routine_125(param_1);
}

void loadPic(char *filename, int segment) {
    int handle;
    TRACE(("loadPic"));
    handle = openFileWrapper(filename, 0);
    decodePic(handle, segment);
    closeFileWrapper(handle);
}

void openShowPic(char *name, int page, int garbage) {
    int handle;
    TRACE(("openShowPic"));
    handle = openFileWrapper(name, 0);
    showPicFile(handle, page, garbage);
    closeFileWrapper(handle);
}

int allocBuffer(int size) {
    int segment;
    TRACE(("allocBuffer"));
    segment = dos_alloc(size);
    if ((unsigned)segment < 0x10) {
        cleanup();
        dos_printstring(str_allocError);
        dosExit(0);
    }
    return segment;
}

void freeBuffer(int segment) {
    TRACE(("freeBuffer"));
    if (dos_free(segment) != 0) {
        cleanup();
        dos_printstring(str_deallocError);
        dosExit(0);
    }
}

void srandInit(int param_1) {
    TRACE(("srandInit"));
    randSeed = param_1;
    randState = 0;
}

int openFileRead(char *name, int mode) {
    TRACE(("openFileRead"));
    return openFileRaw(name, mode);
}

int readFileBlock(int handle, int buf, int size) {
    TRACE(("readFileBlock"));
    return readFileRaw(handle, buf, size);
}

int readFileAt(int handle, int a, int b, int c) {
    TRACE(("readFileAt"));
    return readFileAtRaw(handle, a, b, c);
}

int readFileAtEx(int handle, int a, int b, int c, int d) {
    TRACE(("readFileAtEx"));
    return readFileAtExRaw(handle, a, b, c, d);
}

void closeAndResetFile(p)
register int *p;
{
    TRACE(("closeAndResetFile"));
    if ((((char *)p)[6] & 0x83) && (((char *)p)[6] & 0x08)) {
        markHandleClosed(p[2]);
        ((char *)p)[6] &= 0xf7;
        p[1] = p[2] = p[0] = 0;
    }
}

void markHandleClosed(handle)
int handle;
{
    TRACE(("markHandleClosed"));
    if (handle != 0) {
        ((char *)handle)[-2] |= 0x01;
    }
}

int loadFileSection(char *name, int b, int c) {
    int handle;
    int result;
    TRACE(("loadFileSection"));
    handle = openFileWrapper(name, 0);
    result = readFileAt(handle, -1, b, c);
    closeFileWrapper(handle);
    return result;
}

int loadFileSectionEx(char *name, int b, int c, int d, int e) {
    int handle;
    int result;
    TRACE(("loadFileSectionEx"));
    handle = openFileRead(name, 0);
    result = readFileAtEx(handle, e, b, c, d);
    closeFileWrapper(handle);
    return result;
}

void waitForKeyOrJoy(void) {
    int key;
    TRACE(("waitForKeyOrJoy"));
    if (commData[COMM_SETUP_USEJOY_OFFSET / 2] == 1) {
        do {
            if (misc_jump_5a_keybuf() == 0) {
                break;
            }
        } while (misc_jump_5d_readJoy(0) == 0);
        if (misc_jump_5a_keybuf() != 0) {
            goto done;
        }
    }
    key = misc_jump_5b_getkey();
done:
    if (key == KEYCODE_ALTQ || quitFlag != 0) {
        cleanup();
        if (quitFlag != 0) {
            restoreCbreakHandler();
        }
        dosExit(0);
    }
}

void routine_26(void) {
    TRACE(("routine_26"));
    if (quitFlag != 0) {
        cleanup();
        restoreCbreakHandler();
        dosExit(0);
    }
}

void routine_5(void) {
}

void routine_6(void) {
}

void outportByte(int port, int value) {
    TRACE(("outportByte"));
    outp(port, value);
}

void loadPicFromFile(char *name, int segment) {
    int handle;
    TRACE(("loadPicFromFile"));
    handle = openFileWrapper(name, 0);
    decodePicRaw(handle, segment);
    closeFileWrapper(handle);
}

void loadPicFromFileAt(char *name, int segment, int off, int whence) {
    int handle;
    TRACE(("loadPicFromFileAt"));
    handle = openFileWrapper(name, 0);
    fileSeek(handle, off, whence, 0);
    decodePic(handle, segment);
    closeFileWrapper(handle);
}

void loadWorldStrings(void) {
    int p;
    int a;
    TRACE(("loadWorldStrings"));
    setupWorldBufPtr();
    worldDataReady = 1;
    readWorldData();
    worldStrings[0] = worldStringBuf;
    p = 1;
    a = 0;
    while (a < 0x2ee) {
        if (worldStringBuf[a] == '\0' && p < 100) {
            worldStrings[p++] = &worldStringBuf[a + 1];
        }
        a++;
    }
}

void routine_71(int param_1, int param_2) {
    if (worldDataReady != 0) {
        routine_108(param_1, param_2, 1, worldBufHandle);
    } else {
        routine_109(param_1, param_2, 1, worldBufHandle);
    }
}

// 1e78
void routine_27(void) {
    int p;
    var_86[3] = 0;
    if (commData[0x30 / 2] != 0)
        goto done;
    if (gameData[0x4e / 2] == 1) {
        gfx_jump_3d_null(3);
        openShowPic(str_deskPic, *var_86);
        drawStringCentered((int *)var_86, str_deskMsg1, 0x24, 0xb3, 0xfa);
        drawStringCentered((int *)var_86, str_deskMsg2, 0x24, 0xbc, 0xfa);
        // 1ef4
        var_85 = 4;
        var_84 = 0;
        p = 0;
        // 1f05
        for (; (var_176[p] = ((char far *)gameData)[p + 2]) != 0 ; p++) {}
        drawStringCentered((int *)var_86, var_176, 0xc1, 0x99, 0x5f);
        var_84 = 7;
        var_85 = 1;
        goto show;
    }
    if (gameData[0x4e / 2] == 2) {
        gfx_jump_3d_null(2);
        openShowPic(str_deathPic, *var_86);
        drawStringCentered((int *)var_86, str_deathMsg1, 0x24, 0xad, 0xfa);
        drawStringCentered((int *)var_86, str_deathMsg2, 0x24, 0xb6, 0xfa);
        goto show;
    }
    // 1fa8
    if (((unsigned)gameData[0x20 / 2] < 6) && (*(long *)&var_89[gameData[0x20 / 2]] < *(long far *)&gameData[0x32 / 2])) {
        gfx_jump_3d_null(6);
        openShowPic(str_promoPic, *var_86);
        var_84 = 1;
        drawStringCentered((int *)var_86, str_promoMsg1, 0x24, 0xae, 0xfa);
        mystrcpy(var_176, str_promoMsg2);
        gameData[0x20 / 2]++;
        mystrcat(var_176, var_87[gameData[0x20 / 2]]);
        drawStringCentered((int *)var_86, var_176, 0x24, 0xb7, 0xfa);
        gfx_jump_50();
        gfx_jump_46_retrace2();
        waitForKeyOrJoy();
    }
medals:
    p = 4;
    for (; p >= 0; p--) {
        if (*(long *)&missionScore > *(long *)&var_92[p * 2])
            break;
    }
    if (p < 0)
        goto done;
    if (gameData[0x22 / 2] & (1 << (char)p))
        goto done;
    gfx_jump_45_retrace();
    gfx_jump_3d_null(0x0a);
    openShowPic(str_medalPic, *var_86);
    var_84 = 0x0f;
    drawStringCentered((int *)var_86, str_medalMsg1, 0x24, 0xae, 0xfa);
    mystrcpy(var_176, str_medalMsg2);
    mystrcat(var_176, var_90[p]);
    drawStringCentered((int *)var_86, var_176, 0x24, 0xb7, 0xfa);
    gameData[0x22 / 2] |= (1 << (char)p);
show:
    gfx_jump_50();
    gfx_jump_46_retrace2();
    waitForKeyOrJoy();
done:
    clearRect((int *)var_86, 0, 0, 0x13f, 0xc7);
    gfx_jump_46_retrace2();
}