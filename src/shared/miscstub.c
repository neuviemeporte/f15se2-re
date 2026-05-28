/*
 * misc_noasm.c - C stub implementations for shared miscellaneous routines.
 * Only compiled for the NO_ASM build.
 */

#include "inttype.h"
#include "pointers.h"
#include <dos.h>
#include <string.h>

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

void mystrcat(dst, src)
char *dst;
const char *src;
{
    strcat(dst, src);
}

void intDispatch(intnum, inreg, outreg)
int16 intnum;
uint8 *inreg;
uint8 *outreg;
{
}

void setupOverlaySlots(void)
{
}

void doNothing2(void)
{
}

void getTimeOfDay(regs)
uint8 *regs;
{
}

int mystrlen(s)
const char *s;
{
    return strlen(s);
}

void nearmemset(dst, val, count)
char *dst;
int val;
int count;
{
    memset(dst, val, count);
}

int loadOverlay(filename)
const char *filename;
{
    return 0;
}

int doFcbSearch(fcb)
void *fcb;
{
    return -1;
}
