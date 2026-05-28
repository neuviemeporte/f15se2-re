#ifndef SLOT_H
#define SLOT_H

#include "pointers.h"
#include "inttype.h"

/* ---- graphics (first slot 0, 84 used) ---- */
/* dseg:0xab8 */
int FAR CDECL gfx_allocPage(int pageNum);              /* slot 0x00: alloc 64K page, returns seg */
int FAR CDECL gfx_fillDirty();                         /* slot 0x01: fill dirty rects (reg-called) */
int FAR CDECL gfx_blitTransparent();                   /* slot 0x02: blit with transparency */
int FAR CDECL gfx_blitVariant();                       /* slot 0x03: blit variant */
int FAR CDECL gfx_copyBlock();                         /* slot 0x04: copyBlock opaque rect */
int FAR CDECL gfx_drawString(int16 *pageNum, const char *string, int len); /* slot 0x05: draw clipped string */
int FAR CDECL gfx_drawStringUnclipped();               /* slot 0x06: draw string unclipped */
int FAR CDECL gfx_clipRight();                         /* slot 0x07: clip X right */
int FAR CDECL gfx_clipTop();                           /* slot 0x08: clip Y top */
int FAR CDECL gfx_clipLeft();                          /* slot 0x09: clip X left */
int FAR CDECL gfx_clipBottom();                        /* slot 0x0a: clip Y bottom */
int FAR CDECL gfx_complexRender();                     /* slot 0x0b: complex render (terrain?) */
int FAR CDECL gfx_initOverlay();                       /* slot 0x0c: initOverlay - init state */
int FAR CDECL gfx_setPage1();                          /* slot 0x0d: curPage = pageSegs[1] */
/* dseg:0xafe */
int FAR CDECL gfx_setPageN(uint16 pageNum);            /* slot 0x0e: curPage = pageSegs[n] */
int FAR CDECL gfx_getCurPageSeg();                     /* slot 0x0f: returns curPageSeg */
int FAR CDECL gfx_getCurPageSeg2();                    /* slot 0x10: returns curPageSeg */
int FAR CDECL gfx_blitSprite(struct SpriteParams* spritePtr); /* slot 0x11: sprite blit */
int FAR CDECL gfx_blitCore();                          /* slot 0x12: blit core (internal) */
int FAR CDECL gfx_spriteVariant1();                    /* slot 0x13: sprite variant */
int FAR CDECL gfx_spriteVariant2();                    /* slot 0x14: sprite variant */
int FAR CDECL gfx_nop15();                             /* slot 0x15: retf stub */
int FAR CDECL gfx_nop16();                             /* slot 0x16: retf stub */
int FAR CDECL gfx_getBufSize();                        /* slot 0x17: returns 0x5580 */
int FAR CDECL gfx_setBlitOffset2();                    /* slot 0x18: setBlitOffset */
int FAR CDECL gfx_setBlitOffset3();                    /* slot 0x19: setBlitOffset (=0x18) */
int FAR CDECL gfx_setBlitOffset(int offset);           /* slot 0x1a: setBlitOffset */
int FAR CDECL gfx_getAuxSize();                        /* slot 0x1b: returns 0x1950 */
int FAR CDECL gfx_getBlitOffset();                     /* slot 0x1c: returns blitOffset */
int FAR CDECL gfx_setClipVal1();                       /* slot 0x1d: writes ds:0xcc */
int FAR CDECL gfx_setClipVal2();                       /* slot 0x1e: writes ds:0xce */
int FAR CDECL gfx_drawLine();                          /* slot 0x1f: drawLine (Bresenham) */
int FAR CDECL gfx_setPageDirect();                     /* slot 0x20: set curPageSeg from AX */
int FAR CDECL gfx_setColor(int color);                 /* slot 0x21: set fill/draw color */
int FAR CDECL gfx_resetBlitOffset();                   /* slot 0x22: reset blitOffset=0 */
int FAR CDECL gfx_resetBlitOffset2();                  /* slot 0x23: reset blitOffset=0 */
int FAR CDECL gfx_nop24();                             /* slot 0x24: retf (no-op) */
int FAR CDECL gfx_dirtyRect();                         /* slot 0x25: dirtyRect (reg-called) */
int FAR CDECL gfx_storePageSeg();                      /* slot 0x26: store page seg */
int FAR CDECL gfx_setPageSeg();                        /* slot 0x27: pageSegs[idx]=seg */
int FAR CDECL gfx_dirtyRect2();                        /* slot 0x28: dirtyRect2 (=0x25) */
int FAR CDECL gfx_switchColor(int16* pageDesc, int x1, int y1, int x2, int y2, int oldColor, int newColor); /* slot 0x29: replace color in rect */
int FAR CDECL gfx_copyRect(int srcPage, int srcX, int srcY, int dstPage, int dstX, int dstY, int width, int height); /* slot 0x2a: copyRect between pages */
int FAR CDECL gfx_unknown2b();                         /* slot 0x2b: unknown */
int FAR CDECL gfx_dacAnimate();                        /* slot 0x2c: DAC palette animation */
int FAR CDECL gfx_getDisplayPage();                    /* slot 0x2d: getDisplayPage */
int FAR CDECL gfx_unknown2e();                         /* slot 0x2e: unknown */
int FAR CDECL gfx_setFont(uint16 ch, uint16 fontIdx);  /* slot 0x2f: setup font metrics */
int FAR CDECL gfx_blitToCurrent(int16 pagePtr);        /* slot 0x30: copy to curPage */
int FAR CDECL gfx_getAuxBufSize();                     /* slot 0x31: getAuxBufSize */
int FAR CDECL gfx_fontSetup();                         /* slot 0x32: font setup */
int FAR CDECL gfx_fillRow();                           /* slot 0x33: no-op in MCGA */
int FAR CDECL gfx_fillRow2();                          /* slot 0x34: no-op in MCGA */
int FAR CDECL gfx_copyRow();                           /* slot 0x35: retf */
int FAR CDECL gfx_nop36();                             /* slot 0x36: retf */
int FAR CDECL gfx_nop37();                             /* slot 0x37: retf */
int FAR CDECL gfx_getPageSeg();                        /* slot 0x38: returns pageSegs[idx] */
int FAR CDECL gfx_setPageBuf();                        /* slot 0x39: pageSegs[idx]=val */
int FAR CDECL gfx_getRowOffset();                      /* slot 0x3a: returns y*320 */
int FAR CDECL gfx_clearPage();                         /* slot 0x3b: fill curPage with 0 */
/* dseg:0xbe4 */
int FAR CDECL gfx_setMode13(int16 monoFlag);           /* slot 0x3c: INT 10h mode 13h */
int FAR CDECL gfx_setFadeSteps(int steps);             /* slot 0x3d: setFadeSteps */
int FAR CDECL gfx_calcRowAddr(int y, int x);           /* slot 0x3e: calcRowAddr */
/* dseg:0xbf3 */
int FAR CDECL gfx_getModecode();                       /* slot 0x3f: returns 3 (MCGA) */
int FAR CDECL gfx_setOvlVal1();                        /* slot 0x40: writes ds:0xcc */
int FAR CDECL gfx_setOvlVal2();                        /* slot 0x41: writes ds:0xce */
int FAR CDECL gfx_getModeFlag2();                      /* slot 0x42: returns modeFlag */
int FAR CDECL gfx_unknown43();                         /* slot 0x43: unknown */
int FAR CDECL gfx_setDac(uint16 palIdx);               /* slot 0x44: set VGA DAC palette */
int FAR CDECL gfx_waitRetrace();                       /* slot 0x45: wait for vblank */
int FAR CDECL gfx_flipPage();                          /* slot 0x46: vblank + flip to VGA */
int FAR CDECL gfx_blitSpriteClipped(int16* ptr);      /* slot 0x47: sprite variant */
int FAR CDECL gfx_blitSpriteClipped2();                /* slot 0x48: sprite variant */
int FAR CDECL gfx_blitSpriteOpaque(int16* ptr);       /* slot 0x49: sprite blit (=0x11) */
int FAR CDECL gfx_blitSpriteOpaque2();                 /* slot 0x4a: blit core (=0x12) */
/* dseg:0xc2f */
int FAR CDECL gfx_storeBufPtr(uint16 seg, int pageIdx); /* slot 0x4b: pageSegs[idx]=seg */
int FAR CDECL gfx_getModeFlag();                       /* slot 0x4c: getModeFlag */
int FAR CDECL gfx_getVal2();                           /* slot 0x4d: getter */
int FAR CDECL gfx_getVal();                            /* slot 0x4e: getter */
int FAR CDECL gfx_setDacAnimCount(uint16 count);       /* slot 0x4f: setDacAnimCount */
int FAR CDECL gfx_commitPage();                        /* slot 0x50: commitPage */
int FAR CDECL gfx_nop51();                             /* slot 0x51: retf */
int FAR CDECL gfx_setMonoFlag(uint16 mono);            /* slot 0x52: setMonoFlag */
int FAR CDECL gfx_getCurPage();                        /* slot 0x53: returns curPageSeg */
int FAR CDECL gfx_slot54();
int FAR CDECL gfx_slot55();
int FAR CDECL gfx_slot56();
int FAR CDECL gfx_slot57();
int FAR CDECL gfx_slot58();
int FAR CDECL gfx_slot59();
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
