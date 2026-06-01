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
    int16 minX[220];  /* 0x000: per-row minimum dirty X (0x1B8 bytes = 440 = 220 words) */
    int16 maxX[220];  /* 0x1B8: per-row maximum dirty X */
} DirtyRectBuf;

/* Sprite blit parameter block.
 * Passed to slots 0x11/0x47/0x49 as int16* pointer.
 * The overlay loads BP from the pointer and accesses [bp+N].
 */
typedef struct {
    int16 page;       /* [0] destination page index */
    int16 srcX;       /* [1] source X in sprite sheet */
    int16 srcY;       /* [2] source Y in sprite sheet */
    int16 bufPtr;     /* [3] sprite buffer segment */
    int16 dstX;       /* [4] destination X on page */
    int16 dstY;       /* [5] destination Y on page */
    int16 width;      /* [6] sprite width in pixels */
    int16 height;     /* [7] sprite height in pixels */
    int16 flags;      /* [8] blit flags (0x10 = transparent) */
} SpriteBlitParams;

#endif /* GFX_IMPL_H */
