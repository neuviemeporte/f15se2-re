#ifndef F15_SE2_EG3DRAST
#define F15_SE2_EG3DRAST
/*
 * eg3drast.c — portable C reimplementation of the egseg1.asm 2D rasterizer and
 * model-display-list decoder (the NO_ASM / noasm-egame renderer). This is the
 * 2D-emission backend of the 3D pipeline: model-stream decode, Cohen-Sutherland
 * edge clip, per-scanline span fill, filled-polygon outline, and the sorted
 * object dispatch. All screen output goes through the gfx_* slot trampolines.
 *
 * Lives in its own far code segment (/NT EG3D_TEXT) because _TEXT is full; every
 * externally-visible entry point is FAR. The routines avoid the C `long`
 * runtime helpers (__aNldiv/__aNlmul/...) — which live in _TEXT and cannot be
 * near-called from a far segment — by doing 32-bit math inline (add/sub/shift by
 * a constant) and the few perspective divides via a manual 16-bit divide.
 */
#include "inttype.h"

/* Per-scanline span buffers used by the rasterizer. The two arrays are one
 * contiguous block: MGRAPHIC's dirtyRect slot assumes maxX sits 0x1b8 bytes
 * after minX. */
struct SpanBuffers {
    int16 minX[220]; /* per-scanline left edge  (reset to 0xFFFF) */
    int16 maxX[220]; /* per-scanline right edge (reset to 0) */
};
extern struct SpanBuffers g_spanBuf;

#endif /* F15_SE2_EG3DRAST */
