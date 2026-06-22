/*
 * eginput.c - DOS keyboard input for the egame C renderer (NO_ASM build).
 *
 * Functional C port of the hand-written keyboard IRQ handler in egseg3.asm
 * (seg003: setInt9Handler / restoreInt9Handler / kbdInt9Handler). It hooks INT 09h
 * and turns the arrow / numeric-keypad keys into a virtual analog stick:
 * it writes the raw axes to g_joyRawX (pitch, up/down) and g_joyRawY (roll,
 * left/right), which stepFlightModel (egflight.c) reads when no real joystick
 * is configured, scales by g_kbdSensitivity, and stores in joyAxes[]. Without
 * this handler the noasm build left g_joyRawX/Y pinned at centre (0x80), so the
 * plane could not be flown from the keyboard.
 *
 * The handler still chains to the original BIOS INT 09h so ordinary keystrokes
 * reach the BIOS buffer: stepFlightModel's command dispatch reads them via
 * kbhit()/_bios_keybrd() (throttle, pause, quit, etc.). Before chaining it
 * de-duplicates consecutive identical keys already queued in the BIOS buffer,
 * exactly as the original did, to keep auto-repeat from flooding the queue.
 *
 * Joystick hardware stays out of scope (stubbed in egstubs.c). This file lives
 * in the shared _TEXT segment (no /NT) so it can near-call the MSC runtime
 * interrupt helpers (_dos_getvect/_dos_setvect/_chain_intr); its far entry
 * points setInt9Handler/restoreInt9Handler are far-called from egmain.c.
 */
#include "egtypes.h"
#include "egcode.h"
#include "egdata.h"
#include "inttype.h"
#include "pointers.h"
#include <dos.h>

/* Keyboard scancode -> direction-key bitmask table (egslots.asm
 * g_kbdDirKeyTable). Indexed by (scancode & 0x7f) - 0x29, range 0..0x28.
 * bit0 = Left, bit1 = Right, bit2 = Up, bit3 = Down (0x80 = centre key, no
 * direction). The non-zero entries are the numeric-keypad / arrow scancodes. */
static unsigned char kbdDirKeyTable[41] = {
    1, 0, 4,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0,            /* 27 zero entries (idx 3..29) */
    5, 1, 9, 2, 4, 0x80, 8, 8, 6, 2, 0x0A
};

/* ISR-private state (egslots.asm globals in the ASM build). */
static unsigned char kbdActiveScan = 0;   /* direction mask of the held key */
static unsigned int  kbdLastTick = 0;      /* BIOS tick at last press */
static unsigned char kbdPrevScan = 0;      /* previous raw scancode (E0/E1 prefix) */
static unsigned char kbdLastDirKey = 0;    /* last direction mask seen */
static unsigned char kbdDelayCounter = 0;  /* skip N bytes after an E0/E1 prefix */

static void (interrupt far *oldInt9)(void);

static void interrupt far kbdInt9Handler(void)
{
    unsigned char far *biosb = (unsigned char far *)MK_FP(0x40, 0);
    unsigned int  far *biosw = (unsigned int  far *)MK_FP(0x40, 0);
    unsigned char scan, key, mask, bl, bh;
    unsigned int head;

    if (kbdDelayCounter != 0) {
        kbdDelayCounter--;
        goto flush;
    }

    scan = (unsigned char)inp(0x60);
    if (kbdPrevScan == 0xE0) {
        /* extended-key prefix consumed last time; this is the real scancode */
        kbdPrevScan = scan;
        goto processKey;
    }
    kbdPrevScan = scan;
    /* E0/E1 are multi-byte-key prefixes. egseg3 routes both through a shared
     * @@delayKey that does `dec ah` BEFORE storing, so the E0 case (ah=1) leaves
     * the skip counter at 0 — it skips NOTHING; the prefix is remembered only via
     * kbdPrevScan so the following byte is processed as the real key. The E1 case
     * (ah=3) leaves 2. Setting the E0 counter to 1 here (as the first cut did)
     * skipped the next scancode — the real extended-arrow key and, critically, its
     * RELEASE — so the stick never recentred and keys felt stuck. */
    if (scan == 0xE0) { goto flush; }
    if (scan == 0xE1) { kbdDelayCounter = 2; goto flush; }
    {
        /* When NumLock xor Shift is active the numeric keypad types digits, so
         * ignore it as a direction stick (matches the asm's parity test). */
        unsigned char t = 0;
        if (biosb[0x17] & 0x20) t ^= 1;   /* NumLock */
        if (biosb[0x17] & 0x03) t ^= 1;   /* Shift */
        if (t != 0) goto flush;
    }

processKey:
    key = scan & 0x7F;
    if (key > 0x51 || key < 0x29) goto flush;
    mask = kbdDirKeyTable[key - 0x29];
    if (mask == 0) goto flush;

    if (scan & 0x80) {
        /* key release: only the currently-held direction recentres the stick */
        if (kbdActiveScan != mask) goto flush;
        kbdActiveScan = 0;
        g_joyRawX = 0x80;
        g_joyRawY = 0x80;
        goto flush;
    }

    /* key press: one direction held at a time */
    if (kbdActiveScan != 0) goto flush;
    kbdActiveScan = mask;
    if (kbdLastDirKey == mask &&
        (unsigned int)(biosw[0x6C / 2] - kbdLastTick) < 5) {
        /* same key tapped again quickly -> full deflection */
        bh = 0x7F;
    } else {
        /* first press / slow repeat -> partial deflection */
        bh = 0x5A;
    }
    kbdLastDirKey = mask;
    bl = (unsigned char)(0x80 - bh);
    bh = (unsigned char)(bh + 0x80);
    if (mask & 1) g_joyRawY = bl;   /* left  */
    if (mask & 2) g_joyRawY = bh;   /* right */
    if (mask & 4) g_joyRawX = bl;   /* up    */
    if (mask & 8) g_joyRawX = bh;   /* down  */
    kbdLastTick = biosw[0x6C / 2];

flush:
    /* Drop consecutive duplicate keys queued in the BIOS buffer (typeahead). */
    head = biosw[0x1A / 2];
    if (head != biosw[0x1C / 2]) {
        unsigned int firstKey = biosw[head / 2];
        for (;;) {
            head += 2;
            if (head >= biosw[0x82 / 2]) head = biosw[0x80 / 2];
            if (head == biosw[0x1C / 2]) break;
            if (firstKey != biosw[head / 2]) break;
            biosw[0x1A / 2] = head;   /* advance read head past the duplicate */
        }
    }

    _chain_intr(oldInt9);
}

int far setInt9Handler(void)
{
    unsigned char far *biosFlags = (unsigned char far *)MK_FP(0x40, 0x17);
    *biosFlags &= 0xDF;               /* force NumLock off */
    kbdActiveScan = 0;
    kbdLastTick = 0;
    kbdPrevScan = 0;
    kbdLastDirKey = 0;
    kbdDelayCounter = 0;
    g_joyRawX = 0x80;
    g_joyRawY = 0x80;
    oldInt9 = _dos_getvect(0x09);
    _dos_setvect(0x09, kbdInt9Handler);
    return 0;
}

int far restoreInt9Handler(void)
{
    _dos_setvect(0x09, oldInt9);
    return 0;
}
