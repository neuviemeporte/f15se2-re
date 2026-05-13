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


