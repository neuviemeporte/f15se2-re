/*
 * egsys.c - DOS system services for the egame C renderer.
 *
 * The egame file layer (egfileio.c) wraps six low-level primitives that the
 * verify-matched DOS build provides in egcode.asm (raw INT 21h file handles).
 * The NO_ASM build does not link egcode.asm, so they are reimplemented here in
 * C over MSC's intdosx(). These are genuinely hardware-bound (DOS handle I/O),
 * so per the renderer plan they live outside the renderer, isolated here so a
 * fork can replace just this file.
 *
 * Semantics mirror egcode.asm exactly (small model: near buffer/path pointers
 * are DGROUP-relative, so DS is left at the current DGROUP via segread):
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

/* === game loop (egcode.asm gameMainLoop / runGameLoop) ===
 * Originally compiled C in seg000; the NO_ASM build does not link egcode.asm so
 * it needs a C definition. Each iteration composites a frame into the back
 * buffer (renderFrame = 3D world, renderHudFrame = tac map / 2D overlays), draws
 * the dynamic instrument gauges on top (skipped while a menu key overlay is up,
 * keyValue != 0), then presents the back buffer (gfx_dacAnimate, slot 0x2c),
 * advances the flight model and bookkeeping, and repeats until the mission ends. */
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

#ifdef MSDOS
/* === setupDac (egcode.asm _setupDac) ===
 * Loads the game's 256-colour VGA DAC palette.
 * dacValues1 fills DAC entries 0x10-0x5F, dacValues (or otherDacValues at night)
 * fills 0x60-0xFF, and unless g_horizonGroundColor==2 the 16-entry ground ramp
 * (g_dacGroundPaletteSrc) is copied over g_dacGroundPalette (= dacValues+0x30)
 * first. Both blocks are uploaded via INT 10h/AX=1012h (set block of DAC
 * registers, ES:DX = RGB triples). Without this the cockpit PIC shows with mode
 * 13h's default palette (the pink/green/cyan tint). */

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
#endif /* MSDOS */
