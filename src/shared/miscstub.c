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

void far copyJoystickData(uint8 *ptr){}

void mystrcat(char *dst, char *src)
{
    strcat(dst, src);
}

void intDispatch(int intnum, uint8 *inreg, uint8 *outreg)
{
    union REGS r;
    /* inreg[0] = AL, inreg[1] = AH based on stinit.c usage */
    r.h.al = inreg[0];
    r.h.ah = inreg[1];
    int86(intnum, &r, &r);
    outreg[0] = r.h.al;
    outreg[1] = r.h.ah;
}

int doNothing2(const char *msg, int a, int b, int c)
{
    return 0;
}

int getTimeOfDay(void)
{
    return 0;
}

int mystrlen(const char *s)
{
    return strlen(s);
}

void nearmemset(void *dst, char val, int count)
{
    memset(dst, val, count);
}

int loadOverlay(const char *filename)
{
    return 0;
}

int doFcbSearch(void)
{
    return -1;
}

#if !defined(MSDOS)
int16 *findNearestTerrain(long a, long b)
{
    return 0;
}

unsigned long scaleCoordByLevel(int level, unsigned long coord)
{
    return coord;
}

uint16 dos_alloc(int size)
{
    return 0;
}
#endif
