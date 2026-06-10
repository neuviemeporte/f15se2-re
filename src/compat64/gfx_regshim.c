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
 * A handful of getter slots (gfx_getDisplayPage/fontSetup/getVal/getVal2) are
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
extern int  gfx_getRowOffset_impl(int y);
extern int  gfx_getPageSeg_impl(uint16 page);
extern void gfx_fillRow_impl(uint16 rowOffset, uint16 srcBuf, uint16 rowNum);
extern void gfx_copyRow_impl(uint16 rowOffset);
extern int  gfx_setPage1_impl(uint16 page);
extern int  gfx_getCurPageSeg2_impl(void);
extern void gfx_setFillColor_impl(uint16 color);
extern void gfx_dirtyRectFill_impl(uint16 minBufOff, uint16 yMin, uint16 yMax);

int FAR CDECL gfx_clearPage(void)      { gfx_clearPage_impl(0); return 0; }
int FAR CDECL gfx_getCurPageSeg(void)  { gfx_setCurPageSeg_impl(0); return 0; }
int FAR CDECL gfx_getRowOffset(void)   { return gfx_getRowOffset_impl(0); }
int FAR CDECL gfx_getPageSeg(void)     { return gfx_getPageSeg_impl(0); }
int FAR CDECL gfx_fillRow(void)        { gfx_fillRow_impl(0, 0, 0); return 0; }
int FAR CDECL gfx_copyRow(void)        { gfx_copyRow_impl(0); return 0; }
int FAR CDECL gfx_setPage1(void)       { return gfx_setPage1_impl(0); }
int FAR CDECL gfx_getCurPageSeg2(void) { return gfx_getCurPageSeg2_impl(); }
int FAR CDECL gfx_setPageDirect(void)  { gfx_setFillColor_impl(0); return 0; }
int FAR CDECL gfx_dirtyRect2(void)     { gfx_dirtyRectFill_impl(0, 0, 0); return 0; }

/* getter slots whose gfx_impl.c definitions take args (no (void) overload) */
int FAR CDECL gfx_getDisplayPage(void) { return 0; }
int FAR CDECL gfx_fontSetup(void)      { return 0; }
int FAR CDECL gfx_getVal(void)         { return 0; }
int FAR CDECL gfx_getVal2(void)        { return 0; }

#endif /* !MSDOS */
