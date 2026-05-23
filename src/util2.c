/*
 * util2.c - Utility functions shared between start.exe and end.exe
 * Compiled with /Gs (no /Zi)
 */

#include "util.h"
#include "debug.h"

int openFile(char *name, int mode);

int openFileWrapper(char *filename, int mode)
{
    return openFile(filename, mode);
}

void mystrcpy(char *dest, const char *source) {
    do {
    } while ((*dest++ = *source++) != '\0');
}

int closeFileWrapper(int handle)
{
    TRACE(("closeFileWrapper"));
    fileClose(handle);
}

void loadPic(char *filename, uint16 segment) {
    int handle;
    handle = openFileWrapper(filename, 0);
    TRACE(("loadPic(): opened %s, loading into segment 0x%x", filename, segment));
    decodePic(handle, segment);
    closeFileWrapper(handle);
}

void openShowPic(char *name, int16 page, int16 garbage)
{
    int16 fileHandle;
    TRACE(("openShowPic: opening file %s, page %d",name,page));
    fileHandle = openFileWrapper(name, 0);
    TRACE(("openShowPic: showing pic, handle %d",fileHandle));
    showPicFile(fileHandle, page, garbage);
    closeFileWrapper(fileHandle);
    TRACE(("openShowPic: file closed, returning"));
}
