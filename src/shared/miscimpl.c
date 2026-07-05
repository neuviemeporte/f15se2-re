/*
 * miscimpl.c - C implementations of shared miscellaneous routines.
 * Only compiled for the NO_ASM build.
 */

#include "inttype.h"
#include "pointers.h"
#include <dos.h>
#include <string.h>
#include <stdio.h>

static void miscdbg(const char *msg) {
    FILE *f = fopen("NOASM.LOG", "a");
    if (f) {
        fputs(msg, f);
        fputs("\r\n", f);
        fclose(f);
    }
}

void installCBreakHandler(void) {
}

void restoreCbreakHandler(void) {
}

void pollJoystick(void) {
}

void FAR copyJoystickData(uint8 *ptr) {}

void mystrcat(char *dst, const char *src) {
    strcat(dst, src);
}

void intDispatch(int16 intnum, uint8 *inreg, uint8 *outreg) {
    union REGS r;
    /* inreg[0] = AL, inreg[1] = AH based on stinit.c usage */
    r.h.al = inreg[0];
    r.h.ah = inreg[1];
    int86(intnum, &r, &r);
    outreg[0] = r.h.al;
    outreg[1] = r.h.ah;
}

void doNothing2(const char *msg, int16 a, int16 b, int16 c) {
}

int16 getTimeOfDay(void) {
    return 0;
}

int16 mystrlen(const char *s) {
    return strlen(s);
}

void nearmemset(void *dst, char val, int16 count) {
    memset(dst, val, count);
}

int16 loadOverlay(const char *filename) {
    return 0;
}

int16 doFcbSearch(void) {
    return -1;
}

#if !defined(MSDOS)
uint16 dos_alloc(int16 size) {
    return 0;
}
#endif
