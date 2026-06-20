/* enfile.c — file I/O helpers, compiled with /Gs */
#include "pointers.h"
#include "debug.h"
#include "endata.h"
#include "endcode.h"
#include "enfile.h"
#include "shared/common.h"

/* Private helpers for this translation unit. */
int loadFileSection(char *name, int b, int c);
int writeFileSection(char *name, int b, int c, int d, int e);

void srandInit(int seed) {
    TRACE(("srandInit"));
    randSeed = seed;
    randState = 0;
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


int writeFileSection(char *name, int b, int c, int d, int e) {
    int handle;
    int result;
    TRACE(("writeFileSection"));
    handle = createFile(name, 0);
    result = writeFile(handle, e, b, c, d);
    closeFileWrapper(handle);
    return result;
}
