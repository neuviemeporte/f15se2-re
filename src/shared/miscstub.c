/*
 * misc_noasm.c - C stub implementations for shared miscellaneous routines.
 * Only compiled for the NO_ASM build.
 */

#include "inttype.h"
#include "pointers.h"
#include <dos.h>
#include <string.h>
#include <stdio.h>

static void miscdbg(const char *msg)
{
    FILE *f = fopen("NOASM.LOG", "a");
    if (f) { fputs(msg, f); fputs("\r\n", f); fclose(f); }
}

void installCBreakHandler(void)
{
}

void restoreCbreakHandler(void)
{
}

void pollJoystick(void)
{
}

void copyJoystickData(void)
{
}

void mystrcat(char *dst, const char *src)
{
    strcat(dst, src);
}

void intDispatch(int16 intnum, uint8 *inreg, uint8 *outreg)
{
    union REGS r;
    /* inreg[0] = AL, inreg[1] = AH based on stinit.c usage */
    r.h.al = inreg[0];
    r.h.ah = inreg[1];
    int86(intnum, &r, &r);
    outreg[0] = r.h.al;
    outreg[1] = r.h.ah;
}

void setupOverlaySlots(int param)
{
    miscdbg("setupOverlaySlots called");
}

void doNothing2(void)
{
}

void getTimeOfDay(uint8 *regs)
{
}

int mystrlen(const char *s)
{
    return strlen(s);
}

void nearmemset(char *dst, int val, int count)
{
    memset(dst, val, count);
}

int loadOverlay(const char *filename)
{
    return 0;
}

int doFcbSearch(void *fcb)
{
    return -1;
}
