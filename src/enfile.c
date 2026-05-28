/* enfile.c — file I/O helpers, compiled with /Gs */
#include "pointers.h"
#include "debug.h"
#include "end.h"
#include "shared/util.h"

void srandInit(int seed) {
    TRACE(("srandInit"));
    randSeed = seed;
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


void closeAndResetFile(register int *p)
{
    TRACE(("closeAndResetFile"));
    if ((((char *)p)[6] & 0x83) && (((char *)p)[6] & 0x08)) {
        markHandleClosed(p[2]);
        ((char *)p)[6] &= 0xf7;
        p[1] = p[2] = p[0] = 0;
    }
}


void markHandleClosed(int handle)
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
