/*
 * egregsh.c — native/64-bit replacement for egregsh.asm.
 *
 * In the DOS egame.exe build, egregsh.asm provides the cdecl->register shims the
 * C renderer uses to reach the real register-called MGRAPHIC slots — gfx_drawLine
 * (0x1f), gfx_dirtyRect (0x25), gfx_drawGlyphStr (the 0x01-0x06 glyph engine) and
 * gfx_setCurPageSegReg (0x0f). The 64-bit build has no asm, so the symbols the
 * renderer references would be undefined at link time. This file provides those
 * C stand-ins. It is the egame-side counterpart of gfx_regshim.c, which replaces
 * regshim.asm on the overlay side.
 *
 * The 64-bit build only links/lints — it never runs the overlay — so the bodies
 * forward through the (link-time empty) gfxFarTableExported slot table purely to
 * keep the arguments live (no spurious unused-parameter warnings, which is the
 * whole point of this build) and to document the slot each maps to.
 *
 * gfx_setCurPageSegReg is omitted: its only caller (eghudr.c's fillSpanRect) is
 * itself DOS-only, so the lint never references it.
 */

#include "inttype.h"
#include "pointers.h"
#include "gfx_impl.h"
#include "slot.h"

extern GfxFarFn gfxFarTableExported[84];

void FAR CDECL gfx_drawLine(uint16 x1, uint16 y1, uint16 x2, uint16 y2) { ((void(FAR *)(uint16, uint16, uint16, uint16))gfxFarTableExported[31])(x1, y1, x2, y2); }

void FAR CDECL gfx_dirtyRect(int16 *spanBuf, int16 yMin, int16 yMax) { ((void(FAR *)(int16 *, int16, int16))gfxFarTableExported[37])(spanBuf, yMin, yMax); }

void FAR CDECL gfx_drawGlyphStr(int16 *desc, const char *str, int16 slot) { ((void(FAR *)(int16 *, const char *, int16))gfxFarTableExported[slot])(desc, str, 0); }

void FAR CDECL gfx_setCurPageSegReg(uint16 seg) { ((void(FAR *)(uint16))gfxFarTableExported[15])(seg); }
