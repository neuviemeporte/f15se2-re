/* enfile.c — file I/O helpers, compiled with /Gs */
#include "pointers.h"
#include "log.h"
#include "endata.h"
#include "endcode.h"
#include "enfile.h"
#include "shared/common.h"

/* Private helpers for this translation unit. */
int loadFileSection(const char *name, int b, int c);
int writeFileSection(const char *name, int b, int c, int d, int e);

void srandInit(int seed) {
    randSeed = seed;
    randState = 0;
}


int loadFileSection(const char *name, int b, int c) {
    int handle;
    int result;
    handle = openFileWrapper(name, 0);
    result = readFileAt(handle, -1, b, c);
    closeFileWrapper(handle);
    return result;
}


int writeFileSection(const char *name, int b, int c, int d, int e) {
    int handle;
    int result;
    handle = createFile(name, 0);
    result = writeFile(handle, e, b, c, d);
    closeFileWrapper(handle);
    return result;
}
