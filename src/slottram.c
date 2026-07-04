/*
 * slot_trampoline.c — Far-call wrapper functions for the virtual overlay.
 */

#include "inttype.h"
#include "pointers.h"
#include "gfx_impl.h"
#include "slot.h"

/* GfxFarFn is defined in gfx_impl.h */

/* Public far-call table populated by setupOverlaySlots() */
GfxFarFn gfxFarTableExported[84] = {0};

/* Slot 0x00: gfx_allocPage */
int16 FAR CDECL gfx_allocPage(int16 pageNum) {
    return ((int16(FAR *)(int16))gfxFarTableExported[0])(pageNum);
}

/* Slot 0x01: gfx_fillDirty */
void FAR CDECL gfx_fillDirty(void) {
    ((void(FAR *)(void))gfxFarTableExported[1])();
}

/* Slot 0x02: gfx_blitTransparent */
void FAR CDECL gfx_blitTransparent(void) {
    ((void(FAR *)(void))gfxFarTableExported[2])();
}

/* Slot 0x03: gfx_blitVariant */
void FAR CDECL gfx_blitVariant(void) {
    ((void(FAR *)(void))gfxFarTableExported[3])();
}

/* Slot 0x04: gfx_copyBlock */
void FAR CDECL gfx_copyBlock(void) {
    ((void(FAR *)(void))gfxFarTableExported[4])();
}

/* Slot 0x05: gfx_drawString */
void FAR CDECL gfx_drawString(int16 *pageNum, const char *string) {
    ((void(FAR *)(int16 *, const char *))gfxFarTableExported[5])(pageNum, string);
}

/* Slot 0x06: gfx_drawStringUnclipped */
void FAR CDECL gfx_drawStringUnclipped(void) {
    ((void(FAR *)(void))gfxFarTableExported[6])();
}

/* Slot 0x07: gfx_clipRight */
void FAR CDECL gfx_clipRight(void) {
    ((void(FAR *)(void))gfxFarTableExported[7])();
}

/* Slot 0x08: gfx_clipTop */
void FAR CDECL gfx_clipTop(void) {
    ((void(FAR *)(void))gfxFarTableExported[8])();
}

/* Slot 0x09: gfx_clipLeft */
void FAR CDECL gfx_clipLeft(void) {
    ((void(FAR *)(void))gfxFarTableExported[9])();
}

/* Slot 0x0a: gfx_clipBottom */
void FAR CDECL gfx_clipBottom(void) {
    ((void(FAR *)(void))gfxFarTableExported[10])();
}

/* Slot 0x0b: gfx_complexRender */
void FAR CDECL gfx_complexRender(void) {
    ((void(FAR *)(void))gfxFarTableExported[11])();
}

/* Slot 0x0c: gfx_initOverlay */
void FAR CDECL gfx_initOverlay(void) {
    ((void(FAR *)(void))gfxFarTableExported[12])();
}

/* Slot 0x0d: gfx_setPage1 */
void FAR CDECL gfx_setPage1(void) {
    ((void(FAR *)(void))gfxFarTableExported[13])();
}

/* Slot 0x0e: gfx_setPageN */
void FAR CDECL gfx_setPageN(uint16 pageNum) {
    ((void(FAR *)(uint16))gfxFarTableExported[14])(pageNum);
}

/* Slot 0x0f: gfx_setCurPageSeg */
void FAR CDECL gfx_setCurPageSeg(void) {
    ((void(FAR *)(void))gfxFarTableExported[15])();
}

/* Slot 0x10: gfx_getCurPageSeg */
int16 FAR CDECL gfx_getCurPageSeg(void) {
    return ((int16(FAR *)(void))gfxFarTableExported[16])();
}

/* Slot 0x11: gfx_blitSprite */
int16 FAR CDECL gfx_blitSprite(struct SpriteParams *spritePtr) {
    return ((int16(FAR *)(struct SpriteParams *))gfxFarTableExported[17])(spritePtr);
}

/* Slot 0x12: gfx_blitCore */
void FAR CDECL gfx_blitCore(void) {
    ((void(FAR *)(void))gfxFarTableExported[18])();
}

/* Slot 0x13: gfx_spriteVariant1 */
void FAR CDECL gfx_spriteVariant1(void) {
    ((void(FAR *)(void))gfxFarTableExported[19])();
}

/* Slot 0x14: gfx_spriteVariant2 */
void FAR CDECL gfx_spriteVariant2(void) {
    ((void(FAR *)(void))gfxFarTableExported[20])();
}

/* Slot 0x15: gfx_nop15 */
void FAR CDECL gfx_nop15(void) {
    ((void(FAR *)(void))gfxFarTableExported[21])();
}

/* Slot 0x16: gfx_nop16 */
void FAR CDECL gfx_nop16(void) {
    ((void(FAR *)(void))gfxFarTableExported[22])();
}

/* Slot 0x17: gfx_getBufSize */
int16 FAR CDECL gfx_getBufSize(void) {
    return ((int16(FAR *)(void))gfxFarTableExported[23])();
}

/* Slot 0x18: gfx_setBlitOffset2 */
void FAR CDECL gfx_setBlitOffset2(void) {
    ((void(FAR *)(void))gfxFarTableExported[24])();
}

/* Slot 0x19: gfx_setBlitOffset3 */
void FAR CDECL gfx_setBlitOffset3(int16 offset) {
    ((void(FAR *)(int16))gfxFarTableExported[25])(offset);
}

/* Slot 0x1a: gfx_setBlitOffset */
void FAR CDECL gfx_setBlitOffset(int16 offset) {
    ((void(FAR *)(int16))gfxFarTableExported[26])(offset);
}

/* Slot 0x1b: gfx_setBlitOffsetReg */
void FAR CDECL gfx_setBlitOffsetReg(void) {
    ((void(FAR *)(void))gfxFarTableExported[27])();
}

/* Slot 0x1c: gfx_getPresetOffset1 */
int16 FAR CDECL gfx_getPresetOffset1(void) {
    return ((int16(FAR *)(void))gfxFarTableExported[28])();
}

/* Slot 0x1d: gfx_getPresetOffset2 */
int16 FAR CDECL gfx_getPresetOffset2(void) {
    return ((int16(FAR *)(void))gfxFarTableExported[29])();
}

/* Slot 0x1e: gfx_getBlitOffset */
int16 FAR CDECL gfx_getBlitOffset(void) {
    return ((int16(FAR *)(void))gfxFarTableExported[30])();
}

/* Slot 0x20: gfx_setDrawColor */
void FAR CDECL gfx_setDrawColor(void) {
    ((void(FAR *)(void))gfxFarTableExported[32])();
}

/* Slot 0x21: gfx_setColor */
void FAR CDECL gfx_setColor(int16 color) {
    ((void(FAR *)(uint8))gfxFarTableExported[33])(color);
}

/* Slot 0x22: gfx_nop22 */
void FAR CDECL gfx_nop22(void) {
    ((void(FAR *)(void))gfxFarTableExported[34])();
}

/* Slot 0x23: gfx_nop23 */
void FAR CDECL gfx_nop23(void) {
    ((void(FAR *)(void))gfxFarTableExported[35])();
}

/* Slot 0x24: gfx_plotPixel */
void FAR CDECL gfx_plotPixel(void) {
    ((void(FAR *)(void))gfxFarTableExported[36])();
}

/* Slot 0x26: gfx_storePageSeg */
void FAR CDECL gfx_storePageSeg(uint16 seg, int16 pageIdx) {
    ((void(FAR *)(uint16, int16))gfxFarTableExported[38])(seg, pageIdx);
}

/* Slot 0x27: gfx_setPageSeg */
void FAR CDECL gfx_setPageSeg(void) {
    ((void(FAR *)(void))gfxFarTableExported[39])();
}

/* Slot 0x28: gfx_dirtyRect2 */
void FAR CDECL gfx_dirtyRect2(void) {
    ((void(FAR *)(void))gfxFarTableExported[40])();
}

/* Slot 0x29: gfx_switchColor */
void FAR CDECL gfx_switchColor(int16 *pageDesc, int16 x1, int16 y1, int16 x2, int16 y2, int16 oldColor, int16 newColor) {
    ((void(FAR *)(int16 *, int16, int16, int16, int16, int16, int16))gfxFarTableExported[41])(pageDesc, x1, y1, x2, y2, oldColor, newColor);
}

/* Slot 0x2a: gfx_copyRect */
void FAR CDECL gfx_copyRect(int16 srcPage, uint16 srcX, uint16 srcY, int16 dstPage, uint16 dstX, uint16 dstY, int16 width, int16 height) {
    ((void(FAR *)(int16, uint16, uint16, int16, uint16, uint16, int16, int16))gfxFarTableExported[42])(srcPage, srcX, srcY, dstPage, dstX, dstY, width, height);
}

/* Slot 0x2b: gfx_clearVga */
void FAR CDECL gfx_clearVga(void) {
    ((void(FAR *)(void))gfxFarTableExported[43])();
}

/* Slot 0x2c: gfx_dacAnimate */
void FAR CDECL gfx_dacAnimate(void) {
    ((void(FAR *)(void))gfxFarTableExported[44])();
}

/* Slot 0x2d: gfx_getDisplayPage */
int16 FAR CDECL gfx_getDisplayPage(void) {
    return ((int16(FAR *)(uint16))gfxFarTableExported[45])(0);
}

/* Slot 0x2e: gfx_dacCycle */
void FAR CDECL gfx_dacCycle(void) {
    ((void(FAR *)(void))gfxFarTableExported[46])();
}

/* Slot 0x2f: gfx_setFont */
int16 FAR CDECL gfx_setFont(uint16 ch, uint16 fontIdx) {
    return ((int16(FAR *)(uint16, uint16))gfxFarTableExported[47])(ch, fontIdx);
}

/* Slot 0x30: gfx_blitToCurrent */
void FAR CDECL gfx_blitToCurrent(int16 pagePtr) {
    ((void(FAR *)(int16))gfxFarTableExported[48])(pagePtr);
}

/* Slot 0x31: gfx_getAuxBufSize */
int16 FAR CDECL gfx_getAuxBufSize(void) {
    return ((int16(FAR *)(void))gfxFarTableExported[49])();
}

/* Slot 0x32: gfx_getFreeMem */
int16 FAR CDECL gfx_getFreeMem(uint16 ch, uint16 fontIdx) {
    return ((int16(FAR *)(uint16, uint16))gfxFarTableExported[50])(ch, fontIdx);
}

/* Slot 0x33: gfx_fillRow */
void FAR CDECL gfx_fillRow(int16 x, int16 y) {
    ((void(FAR *)(int16, int16))gfxFarTableExported[51])(x, y);
}

/* Slot 0x34: gfx_fillRow2 */
void FAR CDECL gfx_fillRow2(int16 x, int16 y) {
    ((void(FAR *)(int16, int16))gfxFarTableExported[52])(x, y);
}

/* Slot 0x35: gfx_copyRow */
void FAR CDECL gfx_copyRow(int16 x, int16 y) {
    ((void(FAR *)(int16, int16))gfxFarTableExported[53])(x, y);
}

/* Slot 0x36: gfx_nop36 */
void FAR CDECL gfx_nop36(void) {
    ((void(FAR *)(void))gfxFarTableExported[54])();
}

/* Slot 0x37: gfx_nop37 */
void FAR CDECL gfx_nop37(void) {
    ((void(FAR *)(void))gfxFarTableExported[55])();
}

/* Slot 0x38: gfx_getPageSeg */
int16 FAR CDECL gfx_getPageSeg(uint16 page) {
    return ((int16(FAR *)(uint16))gfxFarTableExported[56])(page);
}

/* Slot 0x39: gfx_setPageBuf */
void FAR CDECL gfx_setPageBuf(void) {
    ((void(FAR *)(void))gfxFarTableExported[57])();
}

/* Slot 0x3a: gfx_getRowOffset */
int16 FAR CDECL gfx_getRowOffset(int16 y) {
    return ((int16(FAR *)(uint16))gfxFarTableExported[58])(y);
}

/* Slot 0x3b: gfx_clearPage */
void FAR CDECL gfx_clearPage(void) {
    ((void(FAR *)(void))gfxFarTableExported[59])();
}

/* Slot 0x3c: gfx_setMode13 */
void FAR CDECL gfx_setMode13(int16 monoFlag) {
    ((void(FAR *)(int16))gfxFarTableExported[60])(monoFlag);
}

/* Slot 0x3d: gfx_setFadeSteps */
void FAR CDECL gfx_setFadeSteps(int16 steps) {
    ((void(FAR *)(uint16))gfxFarTableExported[61])(steps);
}

/* Slot 0x3e: gfx_calcRowAddr */
int16 FAR CDECL gfx_calcRowAddr(int16 y, int16 x) {
    return ((int16(FAR *)(int16, int16))gfxFarTableExported[62])(y, x);
}

/* Slot 0x3f: gfx_getModecode */
int16 FAR CDECL gfx_getModecode(void) {
    return ((int16(FAR *)(void))gfxFarTableExported[63])();
}

/* Slot 0x40: gfx_setOvlVal1 */
void FAR CDECL gfx_setOvlVal1(int16 val) {
    ((void(FAR *)(uint16))gfxFarTableExported[64])(val);
}

/* Slot 0x41: gfx_setOvlVal2 */
void FAR CDECL gfx_setOvlVal2(int16 val) {
    ((void(FAR *)(uint16))gfxFarTableExported[65])(val);
}

/* Slot 0x42: gfx_getModeFlag2 */
int16 FAR CDECL gfx_getModeFlag2(void) {
    return ((int16(FAR *)(void))gfxFarTableExported[66])();
}

/* Slot 0x43: gfx_getConst1 */
int16 FAR CDECL gfx_getConst1(void) {
    return ((int16(FAR *)(void))gfxFarTableExported[67])();
}

/* Slot 0x44: gfx_setDac */
void FAR CDECL gfx_setDac(uint16 palIdx) {
    ((void(FAR *)(uint16))gfxFarTableExported[68])(palIdx);
}

/* Slot 0x45: gfx_waitRetrace */
void FAR CDECL gfx_waitRetrace(void) {
    ((void(FAR *)(void))gfxFarTableExported[69])();
}

/* Slot 0x46: gfx_flipPage */
void FAR CDECL gfx_flipPage(void) {
    ((void(FAR *)(void))gfxFarTableExported[70])();
}

/* Slot 0x47: gfx_blitSpriteClipped */
void FAR CDECL gfx_blitSpriteClipped(int16 *ptr) {
    ((void(FAR *)(int16 *))gfxFarTableExported[71])(ptr);
}

/* Slot 0x48: gfx_blitSpriteClipped2 */
void FAR CDECL gfx_blitSpriteClipped2(void) {
    ((void(FAR *)(void))gfxFarTableExported[72])();
}

/* Slot 0x49: gfx_blitSpriteOpaque */
void FAR CDECL gfx_blitSpriteOpaque(int16 *ptr) {
    ((void(FAR *)(int16 *))gfxFarTableExported[73])(ptr);
}

/* Slot 0x4a: gfx_blitSpriteOpaque2 */
void FAR CDECL gfx_blitSpriteOpaque2(void) {
    ((void(FAR *)(void))gfxFarTableExported[74])();
}

/* Slot 0x4b: gfx_storeBufPtr */
void FAR CDECL gfx_storeBufPtr(uint16 seg, int16 pageIdx) {
    ((void(FAR *)(uint16, int16))gfxFarTableExported[75])(seg, pageIdx);
}

/* Slot 0x4c: gfx_getModeFlag */
int16 FAR CDECL gfx_getModeFlag(void) {
    return ((int16(FAR *)(void))gfxFarTableExported[76])();
}

/* Slot 0x4d: gfx_getVal2 */
int16 FAR CDECL gfx_getVal2(int16 *p) {
    return ((int16(FAR *)(int16 *))gfxFarTableExported[77])(p);
}

/* Slot 0x4e: gfx_getVal */
int16 FAR CDECL gfx_getVal(void) {
    return ((int16(FAR *)(void))gfxFarTableExported[78])();
}

/* Slot 0x4f: gfx_setDacAnimCount */
void FAR CDECL gfx_setDacAnimCount(uint16 count) {
    ((void(FAR *)(uint16))gfxFarTableExported[79])(count);
}

/* Slot 0x50: gfx_commitPage */
void FAR CDECL gfx_commitPage(void) {
    ((void(FAR *)(uint16))gfxFarTableExported[80])(0);
}

/* Slot 0x51: gfx_nop51 */
void FAR CDECL gfx_nop51(void) {
    ((void(FAR *)(void))gfxFarTableExported[81])();
}

/* Slot 0x52: gfx_setMonoFlag */
void FAR CDECL gfx_setMonoFlag(uint16 mono) {
    ((void(FAR *)(uint16))gfxFarTableExported[82])(mono);
}

/* Slot 0x53: gfx_getCurPage */
void FAR CDECL gfx_getCurPage(int16 page) {
    ((void(FAR *)(uint16))gfxFarTableExported[83])(page);
}
