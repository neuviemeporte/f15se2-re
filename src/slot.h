#ifndef SLOT_H
#define SLOT_H

#include "pointers.h"
#include "inttype.h"

/* ---- graphics (first slot 0, 84 used) ---- */
/* dseg:0xab8 */
int FAR CDECL gfx_jump_0_alloc(int pageNum);              /* slot 0x00: alloc 64K page, returns seg */
int FAR CDECL gfx_jump_01();                      /* slot 0x01: fill dirty rects (reg-called) */
int FAR CDECL gfx_jump_02();                      /* slot 0x02: blit with transparency */
int FAR CDECL gfx_jump_03();                      /* slot 0x03: blit variant */
int FAR CDECL gfx_jump_04();                      /* slot 0x04: copyBlock opaque rect */
int FAR CDECL gfx_jump_05_drawString(int16 *pageNum, const char *string, int len); /* slot 0x05: draw clipped string */
int FAR CDECL gfx_jump_06();                      /* slot 0x06: draw string unclipped */
int FAR CDECL gfx_jump_07();                      /* slot 0x07: clip X right */
int FAR CDECL gfx_jump_08();                      /* slot 0x08: clip Y top */
int FAR CDECL gfx_jump_09();                      /* slot 0x09: clip X left */
int FAR CDECL gfx_jump_0a();                      /* slot 0x0a: clip Y bottom */
int FAR CDECL gfx_jump_0b();                      /* slot 0x0b: complex render (terrain?) */
int FAR CDECL gfx_initOverlay();                      /* slot 0x0c: initOverlay - init state */
int FAR CDECL gfx_jump_0d_setCurBuf();            /* slot 0x0d: curPage = pageSegs[1] */
/* dseg:0xafe */
int FAR CDECL gfx_jump_0e_setCurBuf(uint16 pageNum);      /* slot 0x0e: curPage = pageSegs[n] */
int FAR CDECL gfx_jump_0f_getBufPtr();            /* slot 0x0f: returns curPageSeg */
int FAR CDECL gfx_jump_10_getCurBuf();            /* slot 0x10: returns curPageSeg */
int FAR CDECL gfx_jump_11_blitSprite(int16* spritePtr); /* slot 0x11: sprite blit */
int FAR CDECL gfx_jump_12();                      /* slot 0x12: blit core (internal) */
int FAR CDECL gfx_jump_13();                      /* slot 0x13: sprite variant */
int FAR CDECL gfx_jump_14();                      /* slot 0x14: sprite variant */
int FAR CDECL gfx_jump_15();                      /* slot 0x15: retf stub */
int FAR CDECL gfx_jump_16();                      /* slot 0x16: retf stub */
int FAR CDECL gfx_jump_17_bufSize();              /* slot 0x17: returns 0x5580 */
int FAR CDECL gfx_jump_18();                      /* slot 0x18: setBlitOffset */
int FAR CDECL gfx_jump_19();                      /* slot 0x19: setBlitOffset (=0x18) */
int FAR CDECL gfx_setBlitOffset(int offset);           /* slot 0x1a: setBlitOffset */
int FAR CDECL gfx_jump_1b();                      /* slot 0x1b: returns 0x1950 */
int FAR CDECL gfx_jump_1c();                      /* slot 0x1c: returns blitOffset */
int FAR CDECL gfx_jump_1d();                      /* slot 0x1d: writes ds:0xcc */
int FAR CDECL gfx_jump_1e();                      /* slot 0x1e: writes ds:0xce */
int FAR CDECL gfx_jump_1f();                      /* slot 0x1f: drawLine (Bresenham) */
int FAR CDECL gfx_jump_20();                      /* slot 0x20: set curPageSeg from AX */
int FAR CDECL gfx_jump_21(int color);             /* slot 0x21: set fill/draw color */
int FAR CDECL gfx_jump_22();                      /* slot 0x22: reset blitOffset=0 */
int FAR CDECL gfx_jump_23();                      /* slot 0x23: reset blitOffset=0 */
int FAR CDECL gfx_jump_24();                      /* slot 0x24: retf (no-op) */
int FAR CDECL gfx_jump_25();                      /* slot 0x25: dirtyRect (reg-called) */
int FAR CDECL gfx_jump_26();                      /* slot 0x26: store page seg */
int FAR CDECL gfx_jump_27();                      /* slot 0x27: pageSegs[idx]=seg */
int FAR CDECL gfx_jump_28();                      /* slot 0x28: dirtyRect2 (=0x25) */
int FAR CDECL gfx_jump_29_switchColor(int16* pageDesc, int x1, int y1, int x2, int y2, int oldColor, int newColor); /* slot 0x29: replace color in rect */
int FAR CDECL gfx_copyRect(int srcPage, int srcX, int srcY, int dstPage, int dstX, int dstY, int width, int height); /* slot 0x2a: copyRect between pages */
int FAR CDECL gfx_jump_2b();                      /* slot 0x2b: unknown */
int FAR CDECL gfx_jump_2c();                      /* slot 0x2c: DAC palette animation */
int FAR CDECL gfx_getDisplayPage();                      /* slot 0x2d: getDisplayPage */
int FAR CDECL gfx_jump_2e();                      /* slot 0x2e: unknown */
int FAR CDECL gfx_jump_2f_charWidth(uint16 ch, uint16 fontIdx); /* slot 0x2f: setup font metrics */
int FAR CDECL gfx_jump_30_blitToCurrent(int16 pagePtr); /* slot 0x30: copy to curPage */
int FAR CDECL gfx_getAuxBufSize();                      /* slot 0x31: getAuxBufSize */
int FAR CDECL gfx_jump_32();                      /* slot 0x32: font setup */
int FAR CDECL gfx_jump_33_fillRow();              /* slot 0x33: no-op in MCGA */
int FAR CDECL gfx_jump_34_fillRow();              /* slot 0x34: no-op in MCGA */
int FAR CDECL gfx_jump_35();                      /* slot 0x35: retf */
int FAR CDECL gfx_jump_36_null();                 /* slot 0x36: retf */
int FAR CDECL gfx_jump_37_null();                 /* slot 0x37: retf */
int FAR CDECL gfx_jump_38_getPageBuf();           /* slot 0x38: returns pageSegs[idx] */
int FAR CDECL gfx_jump_39();                      /* slot 0x39: pageSegs[idx]=val */
int FAR CDECL gfx_jump_3a_getRowOffset();         /* slot 0x3a: returns y*320 */
int FAR CDECL gfx_jump_3b_clearBuf();             /* slot 0x3b: fill curPage with 0 */
/* dseg:0xbe4 */
int FAR CDECL gfx_jump_3c_setMode13(int16 monoFlag);       /* slot 0x3c: INT 10h mode 13h */
int FAR CDECL gfx_setFadeSteps(int steps);              /* slot 0x3d: setFadeSteps */
int FAR CDECL gfx_calcRowAddr(int y, int x); /* slot 0x3e: calcRowAddr */
/* dseg:0xbf3 */
int FAR CDECL gfx_jump_3f_modecode();             /* slot 0x3f: returns 3 (MCGA) */
int FAR CDECL gfx_jump_40();                      /* slot 0x40: writes ds:0xcc */
int FAR CDECL gfx_jump_41();                      /* slot 0x41: writes ds:0xce */
int FAR CDECL gfx_jump_42();                      /* slot 0x42: returns modeFlag */
int FAR CDECL gfx_jump_43();                      /* slot 0x43: unknown */
int FAR CDECL gfx_jump_44_setDac(uint16 palIdx);         /* slot 0x44: set VGA DAC palette */
int FAR CDECL gfx_jump_45_retrace();              /* slot 0x45: wait for vblank */
int FAR CDECL gfx_jump_46_retrace2();             /* slot 0x46: vblank + flip to VGA */
int FAR CDECL gfx_jump_47(int16* ptr);            /* slot 0x47: sprite variant */
int FAR CDECL gfx_jump_48();                      /* slot 0x48: sprite variant */
int FAR CDECL gfx_jump_49(int16* ptr);            /* slot 0x49: sprite blit (=0x11) */
int FAR CDECL gfx_jump_4a();                      /* slot 0x4a: blit core (=0x12) */
/* dseg:0xc2f */
int FAR CDECL gfx_jump_4b_storeBufPtr(uint16 seg, int pageIdx); /* slot 0x4b: pageSegs[idx]=seg */
int FAR CDECL gfx_getModeFlag();                      /* slot 0x4c: getModeFlag */
int FAR CDECL gfx_jump_4d();                      /* slot 0x4d: getter */
int FAR CDECL gfx_jump_4e_getVal();               /* slot 0x4e: getter */
int FAR CDECL gfx_setDacAnimCount(uint16 count);                /* slot 0x4f: setDacAnimCount */
int FAR CDECL gfx_commitPage();                 /* slot 0x50: commitPage */
int FAR CDECL gfx_jump_51_null();                 /* slot 0x51: retf */
int FAR CDECL gfx_setMonoFlag(uint16 mono);                /* slot 0x52: setMonoFlag */
int FAR CDECL gfx_jump_53();                      /* slot 0x53: returns curPageSeg */
int FAR CDECL gfx_jump_54();
int FAR CDECL gfx_jump_55();
int FAR CDECL gfx_jump_56();
int FAR CDECL gfx_jump_57();
int FAR CDECL gfx_jump_58();
int FAR CDECL gfx_jump_59();
/* misc (first slot 0x5a, 6 used) */
int FAR CDECL misc_jump_5a_keybuf(); /* returns 0xffff if no character, 0 if have character */
int FAR CDECL misc_jump_5b_getkey();
int FAR CDECL misc_jump_5c();
int FAR CDECL misc_jump_5d_readJoy(int16);
int FAR CDECL misc_jump_5e_clearKeyFlags();
int FAR CDECL misc_jump_5f();
int FAR CDECL misc_jump_60();
int FAR CDECL misc_jump_61();
int FAR CDECL misc_jump_62();
int FAR CDECL misc_jump_63();
/* sound (first slot 0x64, 10 used) */
int FAR CDECL audio_jump_64(int16, int16);
int FAR CDECL audio_jump_65(void);
int FAR CDECL audio_jump_66(int param);
int FAR CDECL audio_jump_67(); /* intro music? */
int FAR CDECL audio_jump_68();
int FAR CDECL audio_jump_69();
int FAR CDECL audio_jump_6a();
int FAR CDECL audio_jump_6b();
int FAR CDECL audio_jump_6c();
int FAR CDECL audio_jump_6d(int param_1);

#endif /* SLOT_H */
