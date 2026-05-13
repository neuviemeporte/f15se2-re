/* end1.c — compiled with /Gs (stack probes disabled, no debug info) */
#include "pointers.h"
#include "debug.h"
#include "end.h"

void routine_91(int param_1)
{
    TRACE(("routine_91"));
    routine_125(param_1);
}

void mystrcpy(char *dst, char *src)
{
    TRACE(("mystrcpy"));
    while ((*dst++ = *src++) != 0)
        ;
}

void loadPic(char *filename, int segment) {
    int handle;
    TRACE(("loadPic"));
    handle = openFileWrapper(filename, 0);
    decodePic(handle, segment);
    routine_91(handle);
}

void openShowPic(char *name, int page, int garbage) {
    int handle;
    TRACE(("openShowPic"));
    handle = openFileWrapper(name, 0);
    showPicFile(handle, page, garbage);
    routine_91(handle);
}

int allocBuffer(int size) {
    int segment;
    TRACE(("allocBuffer"));
    segment = dos_alloc(size);
    if ((unsigned)segment < 0x10) {
        cleanup();
        dos_printstring(str_allocError);
        routine_8(0);
    }
    return segment;
}

void routine_64(int segment) {
    TRACE(("routine_64"));
    if (routine_102(segment) != 0) {
        cleanup();
        dos_printstring(str_deallocError);
        routine_8(0);
    }
}

void routine_70(int param_1) {
    TRACE(("routine_70"));
    var_138 = param_1;
    var_139 = 0;
}

int openFileWrapper(char *name, int mode) {
    TRACE(("openFileWrapper"));
    return openFile(name, mode);
}

int FUN_1000_1348(char *name, int mode) {
    TRACE(("FUN_1000_1348"));
    return FUN_1000_1405(name, mode);
}

int FUN_1000_1368(int handle, int buf, int size) {
    TRACE(("FUN_1000_1368"));
    return FUN_1000_147e(handle, buf, size);
}

int FUN_1000_137c(int handle, int a, int b, int c) {
    TRACE(("FUN_1000_137c"));
    return FUN_1000_14a9(handle, a, b, c);
}

int FUN_1000_1394(int handle, int a, int b, int c, int d) {
    TRACE(("FUN_1000_1394"));
    return FUN_1000_1539(handle, a, b, c, d);
}


