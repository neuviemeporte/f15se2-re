/*
 * util2.c - Utility functions shared between start.exe and end.exe
 * Compiled with /Gs (no /Zi)
 */

#include "util.h"

int openFile(char *name, int mode);

int openFileWrapper(char *filename, int mode)
{
    return openFile(filename, mode);
}

void mystrcpy(char *dest, const char *source) {
    do {
    } while ((*dest++ = *source++) != '\0');
}
