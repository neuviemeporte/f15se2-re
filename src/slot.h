#ifndef SLOT_H
#define SLOT_H

#include "pointers.h"
#include "inttype.h"

/* ---- graphics (first slot 0, 84 used) ---- */
/* dseg:0xab8 */
int FAR CDECL gfx_allocPage(int pageNum);              /* slot 0x00: alloc 64K page, returns seg */
void FAR CDECL gfx_fillDirty();                         /* slot 0x01: fill dirty rects (reg-called) */
void FAR CDECL gfx_blitTransparent();                   /* slot 0x02: blit with transparency */
void FAR CDECL gfx_blitVariant();                       /* slot 0x03: blit variant */
void FAR CDECL gfx_copyBlock();                         /* slot 0x04: copyBlock opaque rect */
void FAR CDECL gfx_drawString(int16 *pageNum, const char *string); /* slot 0x05: draw clipped string */
void FAR CDECL gfx_drawStringUnclipped();               /* slot 0x06: draw string unclipped */
void FAR CDECL gfx_clipRight();                         /* slot 0x07: clip X right */
void FAR CDECL gfx_clipTop();                           /* slot 0x08: clip Y top */
void FAR CDECL gfx_clipLeft();                          /* slot 0x09: clip X left */
void FAR CDECL gfx_clipBottom();                        /* slot 0x0a: clip Y bottom */
void FAR CDECL gfx_complexRender();                     /* slot 0x0b: complex render (terrain?) */
void FAR CDECL gfx_initOverlay();                       /* slot 0x0c: initOverlay - init state */
void FAR CDECL gfx_setPage1();                          /* slot 0x0d: curPage = pageSegs[1] */
/* dseg:0xafe */
void FAR CDECL gfx_setPageN(uint16 pageNum);            /* slot 0x0e: curPage = pageSegs[n] */
void FAR CDECL gfx_setCurPageSeg();                     /* slot 0x0f: SETTER curPageSeg = AX (register-called) */
int FAR CDECL gfx_getCurPageSeg();                    /* slot 0x10: GETTER returns curPageSeg in AX */
int FAR CDECL gfx_blitSprite(struct SpriteParams* spritePtr); /* slot 0x11: sprite blit */
void FAR CDECL gfx_blitCore();                          /* slot 0x12: blit core (internal) */
void FAR CDECL gfx_spriteVariant1();                    /* slot 0x13: sprite variant */
void FAR CDECL gfx_spriteVariant2();                    /* slot 0x14: sprite variant */
void FAR CDECL gfx_nop15();                             /* slot 0x15: retf stub */
void FAR CDECL gfx_nop16();                             /* slot 0x16: retf stub */
int FAR CDECL gfx_getBufSize();                        /* slot 0x17: returns baked constant 64000 (0xFA00) */
void FAR CDECL gfx_setBlitOffset2();                    /* slot 0x18: setBlitOffset */
void FAR CDECL gfx_setBlitOffset3();                    /* slot 0x19: setBlitOffset (=0x18) */
void FAR CDECL gfx_setBlitOffset(int offset);           /* slot 0x1a: setBlitOffset */
void FAR CDECL gfx_setBlitOffsetReg();                        /* slot 0x1b: register-call tail: blitOffset = AX */
int FAR CDECL gfx_getPresetOffset1();                     /* slot 0x1c: returns baked constant 0x5580 */
int FAR CDECL gfx_getPresetOffset2();                       /* slot 0x1d: returns baked constant 0x1950 */
int FAR CDECL gfx_getBlitOffset();                       /* slot 0x1e: returns live blitOffset (cs:0x1a0) */
void FAR CDECL gfx_drawLine(uint16 x1, uint16 y1, uint16 x2, uint16 y2); /* slot 0x1f: drawLine (Bresenham) */
void FAR CDECL gfx_setDrawColor();                     /* slot 0x20: set draw colour from AH (register-called) */
void FAR CDECL gfx_setColor(int color);                 /* slot 0x21: set fill/draw color */
void FAR CDECL gfx_nop22();                   /* slot 0x22: bare RETF no-op (does NOT reset blitOffset) */
void FAR CDECL gfx_nop23();                  /* slot 0x23: bare RETF no-op */
void FAR CDECL gfx_plotPixel();                             /* slot 0x24: plot pixel at cached position */
void FAR CDECL gfx_dirtyRect(int16 *spanBuf, int yMin, int yMax); /* slot 0x25: dirtyRect (reg-called: BX=spanBuf AX=yMin CX=yMax) */
void FAR CDECL gfx_storePageSeg();                      /* slot 0x26: store page seg */
void FAR CDECL gfx_setPageSeg();                        /* slot 0x27: pageSegs[idx]=seg */
void FAR CDECL gfx_dirtyRect2();                        /* slot 0x28: dirtyRect2 (=0x25) */
void FAR CDECL gfx_switchColor(int16* pageDesc, int x1, int y1, int x2, int y2, int oldColor, int newColor); /* slot 0x29: replace color in rect */
void FAR CDECL gfx_copyRect(int srcPage, uint16 srcX, uint16 srcY, int dstPage, uint16 dstX, uint16 dstY, int width, int height); /* slot 0x2a: copyRect between pages */
void FAR CDECL gfx_clearVga();                         /* slot 0x2b: clear physical VGA 0xA000 */
void FAR CDECL gfx_dacAnimate();                        /* slot 0x2c: DAC palette animation */
int FAR CDECL gfx_getDisplayPage();                    /* slot 0x2d: getDisplayPage */
void FAR CDECL gfx_dacCycle();                         /* slot 0x2e: DAC fire/colour-cycle animation */
int FAR CDECL gfx_setFont(uint16 ch, uint16 fontIdx);  /* slot 0x2f: setup font metrics */
void FAR CDECL gfx_blitToCurrent(int16 pagePtr);        /* slot 0x30: copy to curPage */
int FAR CDECL gfx_getAuxBufSize();                     /* slot 0x31: getAuxBufSize */
int FAR CDECL gfx_getFreeMem();                         /* slot 0x32: DOS free-memory probe */
void FAR CDECL gfx_fillRow();                           /* slot 0x33: no-op in MCGA */
void FAR CDECL gfx_fillRow2();                          /* slot 0x34: no-op in MCGA */
void FAR CDECL gfx_copyRow();                           /* slot 0x35: retf */
void FAR CDECL gfx_nop36();                             /* slot 0x36: retf */
void FAR CDECL gfx_nop37();                             /* slot 0x37: retf */
int FAR CDECL gfx_getPageSeg();                        /* slot 0x38: returns pageSegs[idx] */
void FAR CDECL gfx_setPageBuf();                        /* slot 0x39: pageSegs[idx]=val */
int FAR CDECL gfx_getRowOffset();                      /* slot 0x3a: returns y*320 */
void FAR CDECL gfx_clearPage();                         /* slot 0x3b: fill curPage with 0 */
/* dseg:0xbe4 */
void FAR CDECL gfx_setMode13(int16 monoFlag);           /* slot 0x3c: INT 10h mode 13h */
void FAR CDECL gfx_setFadeSteps(int steps);             /* slot 0x3d: setFadeSteps */
int FAR CDECL gfx_calcRowAddr(int y, int x);           /* slot 0x3e: calcRowAddr */
/* dseg:0xbf3 */
int FAR CDECL gfx_getModecode();                       /* slot 0x3f: returns 3 (MCGA) */
void FAR CDECL gfx_setOvlVal1(int val);                 /* slot 0x40: writes ds:0xcc */
void FAR CDECL gfx_setOvlVal2(int val);                 /* slot 0x41: writes ds:0xce */
int FAR CDECL gfx_getModeFlag2();                      /* slot 0x42: returns modeFlag */
int FAR CDECL gfx_getConst1();                         /* slot 0x43: returns baked constant 1 (cs:0x1d8) */
void FAR CDECL gfx_setDac(uint16 palIdx);              /* slot 0x44: set VGA DAC palette */
void FAR CDECL gfx_waitRetrace();                       /* slot 0x45: wait for vblank */
void FAR CDECL gfx_flipPage();                          /* slot 0x46: vblank + flip to VGA */
void FAR CDECL gfx_blitSpriteClipped(int16* ptr);       /* slot 0x47: sprite variant */
void FAR CDECL gfx_blitSpriteClipped2();                /* slot 0x48: sprite variant */
void FAR CDECL gfx_blitSpriteOpaque(int16* ptr);        /* slot 0x49: sprite blit (=0x11) */
void FAR CDECL gfx_blitSpriteOpaque2();                 /* slot 0x4a: blit core (=0x12) */
/* dseg:0xc2f */
void FAR CDECL gfx_storeBufPtr(uint16 seg, int pageIdx); /* slot 0x4b: pageSegs[idx]=seg */
int FAR CDECL gfx_getModeFlag();                       /* slot 0x4c: getModeFlag */
int FAR CDECL gfx_getVal2();                           /* slot 0x4d: getter */
int FAR CDECL gfx_getVal();                            /* slot 0x4e: getter */
void FAR CDECL gfx_setDacAnimCount(uint16 count);       /* slot 0x4f: setDacAnimCount */
void FAR CDECL gfx_commitPage();                        /* slot 0x50: commitPage */
void FAR CDECL gfx_nop51();                             /* slot 0x51: retf */
void FAR CDECL gfx_setMonoFlag(uint16 mono);            /* slot 0x52: setMonoFlag */
void FAR CDECL gfx_getCurPage(int page);                /* slot 0x53: bare RETF no-op */
int FAR CDECL gfx_slot54();
int FAR CDECL gfx_slot55();
int FAR CDECL gfx_slot56();
int FAR CDECL gfx_slot57();
int FAR CDECL gfx_slot58();
int FAR CDECL gfx_slot59();
/* ---- misc / input (first slot 0x5a, 6 used) ----
 * Swappable input overlay (keyboard + joystick). */

/* Return 0 when an event is queued, 0xFFFF otherwise. */
int FAR CDECL misc_checkKeyBuf(void);

/* Pop the next key event, return scancode<<8 | ascii. */
int FAR CDECL misc_getKey(void);
int FAR CDECL misc_slot5c(void);

/* Return the joystick axis value for the requested axis. */
int FAR CDECL misc_readJoystick(int16 axis);

/* Flush the event queue / reset modifier state. */
void FAR CDECL misc_clearKeyFlags(void);

/* slots 0x5f-0x63: unknown/unused input slots. */
int FAR CDECL misc_slot5f(void);
int FAR CDECL misc_slot60(void);
int FAR CDECL misc_slot61(void);
int FAR CDECL misc_slot62(void);
int FAR CDECL misc_slot63(void);
/* Init the driver. sampleDataSeg = segment holding the digitized
 * voice/sample blob (stored for later sample playback); variantSel selects how
 * many sample variants are valid (1/2/3, derived from the digitized-sound caps). */
int FAR CDECL audio_setup(int16 sampleDataSeg, int16 variantSel);

/* Stop all playing channels and reset mixer state. */
int FAR CDECL audio_shutdown(void);

/* play the sample/effect mapped to soundId. */
int FAR CDECL audio_playSound(int soundId);

/* Start the title music track. */
int FAR CDECL audio_playIntro(void);

/* Start/unpause the looping engine sound. */
int FAR CDECL audio_engineDroneOn(void);

/* Stop/pause the looping engine sound. */
int FAR CDECL audio_engineDroneOff(void);

/* Update the engine loop's playback rate/pitch from knots+thrust. */
int FAR CDECL audio_setEnginePitch(int knots, int thrust);

/* Advance the sequencer one tick. */
int FAR CDECL audio_timerTick(void);

/* Apply per-tick noise/modulation to active channels. */
int FAR CDECL audio_noiseTick(void);

/* Play the sample for sampleIdx. */
int FAR CDECL audio_playSample(int sampleIdx);

#endif /* SLOT_H */
