/*
 * egsys.c - DOS system services for egame (file I/O, game loop, DAC palette),
 * isolated here so a fork can replace just this file.
 *
 * The file-handle primitives mirror egcode.asm (small model: near buffer/path
 * pointers are DGROUP-relative, so DS is left at the current DGROUP via segread):
 *   openFile/createFile  - INT 21h/3Dh,3Ch; path is a near (DS) pointer
 *   closeFile            - INT 21h/3Eh
 *   readFile1            - INT 21h/3Fh into DGROUP:bufOffset
 *   readFile2            - INT 21h/3Fh into bufSegment:bufOffset
 *   writeFileAtRaw       - INT 21h/40h from bufSegment:(bufOffset+offsetAddend)
 * The ASM also reset the global fileReadPos to 0x200 on open/create for its own
 * buffered PIC reader; the C PIC decoder (shared/picimpl.c) keeps its own buffer
 * position, so that side effect is intentionally dropped here.
 */

#include "egtypes.h"
#include "egcode.h"
#include "egdata.h"
#include "inttype.h"
#include "pointers.h"
#include "slot.h"
#include <dos.h>


/* per-frame work reconstructed in their own TUs (egflight/egtacmap/egframe),
 * not surfaced in a header; declared here for the game loop below. */
void renderFrame(void);
void renderHudFrame(int unused);
void stepFlightModel(void);
void updateFrame(void);

/* gameMainLoop / runGameLoop (egcode.asm). Each iteration composites a frame
 * into the back buffer (renderFrame = 3D world, renderHudFrame = tac map / 2D
 * overlays), draws the dynamic gauges on top (unless a menu key overlay is up),
 * presents the back buffer (gfx_dacAnimate, slot 0x2c), advances the flight
 * model + bookkeeping, and repeats until the mission ends. */
void gameMainLoop(void)
{
    do {
        renderFrame();
        renderHudFrame(0);
        if (keyValue == 0)
            drawInstrumentGaugesFar();
        gfx_dacAnimate();
        g_frameSyncPending = 1;
        stepFlightModel();
        updateFrame();
    } while (g_missionEndedFlag[0] == 0);
}

void runGameLoop(void)
{
    gameMainLoop();
}

int __cdecl openFile(const char *path, int mode)
{
    union REGS r;
    struct SREGS s;
    segread(&s);
    r.h.ah = 0x3D;
    r.h.al = (unsigned char)mode;
    r.x.dx = (uint16)path;          /* near pointer: DS already = DGROUP */
    intdosx(&r, &r, &s);
    return r.x.cflag ? -1 : r.x.ax;
}

int createFile(const char *path, int attr)
{
    union REGS r;
    struct SREGS s;
    segread(&s);
    r.h.ah = 0x3C;
    r.x.cx = attr;
    r.x.dx = (uint16)path;
    intdosx(&r, &r, &s);
    return r.x.cflag ? -1 : r.x.ax;
}

void closeFile(int handle)
{
    union REGS r;
    r.h.ah = 0x3E;
    r.x.bx = handle;
    intdos(&r, &r);
}

int readFile1(int handle, int count, int bufOffset)
{
    union REGS r;
    struct SREGS s;
    segread(&s);                    /* DS = DGROUP: read into DGROUP:bufOffset */
    r.h.ah = 0x3F;
    r.x.bx = handle;
    r.x.cx = count;
    r.x.dx = bufOffset;
    intdosx(&r, &r, &s);
    return r.x.cflag ? -1 : r.x.ax;
}

int readFile2(int handle, int count, int bufOffset, int bufSegment)
{
    union REGS r;
    struct SREGS s;
    segread(&s);
    r.h.ah = 0x3F;
    r.x.bx = handle;
    r.x.cx = count;
    r.x.dx = bufOffset;
    s.ds = (uint16)bufSegment;
    intdosx(&r, &r, &s);
    return r.x.cflag ? -1 : r.x.ax;
}

int writeFileAtRaw(int handle, int count, int bufOffset, int bufSegment, int offsetAddend)
{
    union REGS r;
    struct SREGS s;
    segread(&s);
    r.h.ah = 0x40;
    r.x.bx = handle;
    r.x.cx = count;
    r.x.dx = (uint16)(bufOffset + offsetAddend);
    s.ds = (uint16)bufSegment;
    intdosx(&r, &r, &s);
    return r.x.cflag ? -1 : r.x.ax;
}

/* setupDac (egcode.asm _setupDac) - load the 256-colour palette: dacValues1 →
 * DAC entries 0x10-0x5F, dacValues (otherDacValues at night) → 0x60-0xFF, and
 * unless g_horizonGroundColor==2 the 16-entry ground ramp (g_dacGroundPaletteSrc)
 * is copied over g_dacGroundPalette (= dacValues+0x30) first. */
void setupDac(void)
{
    union REGS r;
    struct SREGS s;
    int i;
    segread(&s);
    s.es = s.ds;                     /* ES:DX = palette table (DGROUP) */
    r.x.ax = 0x1012; r.x.bx = 0x10; r.x.cx = 0x50;
    r.x.dx = (uint16)dacValues1;
    int86x(0x10, &r, &r, &s);
    if (g_horizonGroundColor != 2) {
        for (i = 0; i < 0x30; i++)
            dacValues[0x30 + i] = g_dacGroundPaletteSrc[i];
    }
    r.x.ax = 0x1012; r.x.bx = 0x60; r.x.cx = 0xA0;
    r.x.dx = (uint16)(g_nightMode != 0 ? otherDacValues : dacValues);
    int86x(0x10, &r, &r, &s);
}
