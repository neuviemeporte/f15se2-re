/*
 * gfx_regshim.c — native/64-bit replacement for regshim.asm.
 *
 * In the DOS f15.exe build, ten gfx slots are register-call shims written in
 * regshim.asm: the overlay engine invokes them with arguments in registers,
 * and the asm glue marshals those into a normal cdecl call to the matching
 * gfx_*_impl() body in gfx_impl.c. The 64-bit build has no asm, so the public
 * symbols those shims export (gfx_setPage1, gfx_clearPage, ...) would be
 * undefined at link time.
 *
 * fillSlotTable() in gfx_impl.c takes the address of each public symbol and
 * casts it to GfxSlotFn (int(*)(void)); the slot.h prototypes are all `()`
 * (= (void) under C++), so that cast resolves to the (void) overload. We
 * provide exactly those (void) symbols here. The bodies forward to the
 * gfx_*_impl() functions — the 64-bit build only links/lints, it never runs
 * the overlay, so the dummy zero arguments are inconsequential.
 *
 * A handful of getter slots (gfx_getDisplayPage/getFreeMem/getVal/getVal2) are
 * defined in gfx_impl.c with argument-taking signatures that likewise don't
 * match slot.h's `()` prototype; fillSlotTable selects the (void) overload for
 * them too, so they are provided here as well.
 */

#include "inttype.h"
#include "pointers.h"
#include "slot.h"

#if !defined(MSDOS)

/* register-call shim bodies (cdecl) live in gfx_impl.c */
extern void gfx_clearPage_impl(uint16 seg);
extern void gfx_setCurPageSeg_impl(uint16 seg);
extern int16 gfx_getRowOffset_impl(int16 y);
extern int16 gfx_getPageSeg_impl(uint16 page);
extern void gfx_fillRow_impl(uint16 rowOffset, uint16 srcBuf, uint16 rowNum);
extern void gfx_copyRow_impl(uint16 rowOffset);
extern int16 gfx_setPage1_impl(uint16 page);
extern int16 gfx_getCurPageSeg_impl(void);
extern void gfx_setFillColor_impl(uint16 color);
extern void gfx_dirtyRectFill_impl(uint16 minBufOff, uint16 yMin, uint16 yMax);
extern void gfx_drawLine_impl(uint16 ux1, uint16 uy1, uint16 ux2, uint16 uy2);
extern void gfx_drawStringClipped_impl(int16 *params, const char *string, int16 mode);
extern void gfx_blitCore_impl(int16 *blk);
extern void gfx_complexRender_impl(int16 bxArg, int16 dxArg, int16 cxArg, int16 siArg);

void FAR CDECL gfx_clearPage(void) { gfx_clearPage_impl(0); }
void FAR CDECL gfx_setCurPageSeg(void) { gfx_setCurPageSeg_impl(0); }
int16 FAR CDECL gfx_getRowOffset(void) { return gfx_getRowOffset_impl(0); }
int16 FAR CDECL gfx_getPageSeg(void) { return gfx_getPageSeg_impl(0); }
void FAR CDECL gfx_fillRow(void) { gfx_fillRow_impl(0, 0, 0); }
void FAR CDECL gfx_copyRow(void) { gfx_copyRow_impl(0); }
void FAR CDECL gfx_setPage1(void) { gfx_setPage1_impl(0); }
int16 FAR CDECL gfx_getCurPageSeg(void) { return gfx_getCurPageSeg_impl(); }
void FAR CDECL gfx_setDrawColor(void) { gfx_setFillColor_impl(0); }
void FAR CDECL gfx_dirtyRect2(void) { gfx_dirtyRectFill_impl(0, 0, 0); }
/* gfx_drawLine is declared with 4 explicit params in slot.h (register-called in
 * DOS); provide the definition here so fillSlotTable can take its address. */
void FAR CDECL gfx_drawLine(uint16 x1, uint16 y1, uint16 x2, uint16 y2) { gfx_drawLine_impl(x1, y1, x2, y2); }

/* Register-called glyph slots (regshim.asm marshals BP=param block, BX=string
 * into gfx_drawStringClipped_impl with a per-slot clip mode). */
void FAR CDECL gfx_fillDirty(void) { gfx_drawStringClipped_impl(0, 0, 2); }
void FAR CDECL gfx_blitTransparent(void) { gfx_drawStringClipped_impl(0, 0, 1); }
void FAR CDECL gfx_blitVariant(void) { gfx_drawStringClipped_impl(0, 0, 1); }
void FAR CDECL gfx_copyBlock(void) { gfx_drawStringClipped_impl(0, 0, 0); }
void FAR CDECL gfx_drawStringUnclipped(void) { gfx_drawStringClipped_impl(0, 0, 3); }
/* Register-called sprite/render slots (regshim.asm marshals registers). */
void FAR CDECL gfx_blitCore(void) { gfx_blitCore_impl(0); }
void FAR CDECL gfx_complexRender(void) { gfx_complexRender_impl(0, 0, 0, 0); }

/* getter slots whose gfx_impl.c definitions take args (no (void) overload) */
/* gfx_getDisplayPage and gfx_getFreeMem are defined (void) in gfx_impl.c — no
 * duplicate needed here */
int16 FAR CDECL gfx_getVal(void) { return 0; }
int16 FAR CDECL gfx_getVal2(void) { return 0; }

#endif /* !MSDOS */
