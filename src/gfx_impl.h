/*
 * gfx_impl.h — Header for pure-C MGRAPHIC.EXE replacement
 *
 * When NO_ASM is defined, gfx_impl.c provides implementations for all
 * slot functions declared in slot.h. This header provides supporting
 * type definitions and documentation.
 */

#ifndef GFX_IMPL_H
#define GFX_IMPL_H

#include "inttype.h"
#include "pointers.h"

/* Byte offset of GfxState within the virtual overlay block */
#define GFX_STATE_OFFSET 0x2EC

/* Shared gfx state stored in the virtual overlay block.
 * gfx_impl.c functions will migrate to accessing this via far pointer in Phase 2.
 */
typedef struct {
    uint16 rowOffsets[200]; /* replaces g_rowOffsets[] */
    uint16 curPageSeg;      /* replaces g_curPageSeg  */
    int16 blitOffset;       /* replaces g_blitOffset  */
    uint8 modeFlag;         /* replaces g_modeFlag = 1 */
    uint8 fillColor;        /* replaces g_fillColor   */
    uint8 dacCounter;       /* replaces g_dacCounter  */
    uint8 rowOffsetsReady;  /* replaces g_rowOffsetsReady */
    uint16 pageSegs[16];    /* replaces g_pageSegs[]  */
    uint16 f15DataSeg;      /* FP_SEG of f15.exe's DGROUP — see Finding A.
                             * Lets gfx functions reach their own const tables
                             * (palettes, font tables) via far pointer when a
                             * child far-calls in with DS = the child's DGROUP. */
    uint8 displayPage;      /* MGRAPHIC cs:0x1a2 — the back-buffer page index
                             * returned by getDisplayPage (slot 0x2d). The frame
                             * is composited here (page 1) then presented to the
                             * visible page 0 by gfx_dacAnimate (slot 0x2c). */
    uint16 dacPhase;        /* MGRAPHIC data-seg 0x1ccc — the DAC fire-cycle phase
                             * counter advanced by gfx_dacCycle (slot 0x2e) each
                             * frame (LCG x*5+1); seeded 0x4d2 in gfx_buildVirtualOverlay. */
} GfxState;

/* Near function pointer type for the gfx slot table */
typedef int16 (*GfxSlotFn)(void);

/* Far function pointer type for the slot trampoline table */
typedef int16(FAR *GfxFarFn)(void);

/* 84-entry slot table used by f15.exe to call gfx functions directly and to
 * fill the virtual overlay's slot_offsets[] array at startup */
extern GfxSlotFn gfxSlotTable[84];

/* Build the virtual overlay block at ovlSeg: write OvlHeader-compatible fields,
 * fill slot_offsets[] with FP_OFF of each gfx function, init GfxState. */
void gfx_buildVirtualOverlay(uint16 ovlSeg);

/* Build stub MISC (slots 0x5a-0x5f) and SOUND (slots 0x64-0x6d) overlays from
 * f15.exe — removes the dependency on MISC.EXE / NSOUND.EXE. Sound is a no-op
 * (no DOS audio); misc is a placeholder (input reports nothing pending). */
void gfx_buildMiscOverlay(uint16 ovlSeg);
void gfx_buildSoundOverlay(uint16 ovlSeg);

/*
 * Reference structures documenting how the overlay accesses caller data.
 * These CANNOT be used in the asm data segments (which must maintain exact
 * byte layout), but serve as documentation for how the C implementation
 * interprets the data, and can be used with casts in C code.
 */

/* Dirty rectangle tracking buffer pair.
 * The overlay accesses these via hardcoded offset: maxBuf = minBuf + 0x1B8.
 * Each array has 220 entries (one per row-pair, covering 200 visible rows
 * with some padding). Values are X pixel coordinates (0-319).
 *
 * In asm: _dirtyMinBuf and _dirtyMaxBuf must be declared contiguously
 * with exactly 0x1B8 bytes between their starts.
 */
typedef struct {
    int16 minX[220]; /* 0x000: per-row minimum dirty X (0x1B8 bytes = 440 = 220 words) */
    int16 maxX[220]; /* 0x1B8: per-row maximum dirty X */
} DirtyRectBuf;

/* Sprite blit parameter block.
 * Passed to slots 0x11/0x47/0x49 as int16* pointer.
 * The overlay loads BP from the pointer and accesses [bp+N].
 */
typedef struct {
    int16 page;   /* [0] destination page index */
    int16 srcX;   /* [1] source X in sprite sheet */
    int16 srcY;   /* [2] source Y in sprite sheet */
    int16 bufPtr; /* [3] sprite buffer segment */
    int16 dstX;   /* [4] destination X on page */
    int16 dstY;   /* [5] destination Y on page */
    int16 width;  /* [6] sprite width in pixels */
    int16 height; /* [7] sprite height in pixels */
    int16 flags;  /* [8] blit flags (0x10 = transparent) */
} SpriteBlitParams;

#endif /* GFX_IMPL_H */
