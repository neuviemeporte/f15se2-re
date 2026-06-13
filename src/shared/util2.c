/*
 * util2.c - Utility functions shared between start.exe and end.exe
 * Compiled with /Gs (no /Zi)
 */

#include "util.h"
#include "../debug.h"

int openFile(const char *name, int mode);
void fileClose(int handle);
void decodePic(int handle, int segment);

void mystrcpy(char *dest, const char *source) {
    do {
    } while ((*dest++ = *source++) != '\0');
}

int openFileWrapper(const char *filename, int mode)
{
    return openFile(filename, mode);
}

void closeFileWrapper(int handle)
{
    TRACE(("closeFileWrapper"));
    fileClose(handle);
}

#ifdef BUGFIX
void openShowPic(char *name, int page)
#else
void openShowPic(char *name, int page, int garbage)
#endif
{
    int16 fileHandle;
    TRACE(("openShowPic: opening file %s, page %d",name,page));
    fileHandle = openFileWrapper(name, 0);
    TRACE(("openShowPic: showing pic, handle %d",fileHandle));
#ifdef BUGFIX
    showPicFile(fileHandle, page);
#else
    showPicFile(fileHandle, page, garbage);
#endif
    closeFileWrapper(fileHandle);
    TRACE(("openShowPic: file closed, returning"));
}

void loadPic(const char *filename, int segment) {
    int handle;
    handle = openFileWrapper(filename, 0);
    TRACE(("loadPic(): opened %s, loading into segment 0x%x", filename, segment));
    decodePic(handle, segment);
    closeFileWrapper(handle);
}
