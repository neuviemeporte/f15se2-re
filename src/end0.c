/* end0.c — compiled with /Gs /Zi (stack probes disabled, debug info) */
#include "pointers.h"
#include "debug.h"
#include "end.h"

/* ===== Duplicate functions from START.EXE =====
 *
 * The functions below are byte-identical to START versions (mzdup distance 0).
 * When reconstructing sequentially and you reach one of these, grab the C
 * code START's source file and adapt the calls.
 *
 * my_ltoa (0x077b)            see start1.c
 * my_itoa (0x08b6)            see start1.c
 *
 * cleanup (0x0185)            see start1.c. Calls restoreTimerIrqHandler,
 *                             routine_72 (intDispatch), routine_15 (misc_jump_5e).
 *                             Needs global label at data offset 0x19ff (timerHandlerInstalled).
 *
 * actualDrawString (0x0442)   see start1.c. Calls routine_93 (gfx_jump_05_drawString).
 *
 * drawString (0x0701)         see start1.c:633. Calls stringWidth, actualDrawString.
 *
 * stringWidth (0x0738)        see start1.c:642. Calls routine_111 (gfx_jump_2f_charWidth).
 *
 * openShowPic (0x15a6)        see start2.c:538. Calls routine_89 (openFileWrapper),
 *                             showPicFile, routine_91 (fileClose).
 *
 * loadPic (0x15fc)            see start2.c:555. Calls routine_89 (openFileWrapper),
 *                             decodePic, routine_91 (fileClose).
 *
 * allocBuffer (0x19ec)        see start2.c:564. Calls dos_alloc, cleanup,
 *                             routine_45 (dos_printstring), routine_8 (exit).
 *                             Also needs aInsufficientSy string.
 */

void actualDrawString(int *pageNum, const char *string, int x, int y) {
    TRACE(("actualDrawString"));
    pageNum[4] = x;
    pageNum[5] = y;
    gfx_jump_05_drawString(pageNum, string);
}

int stringWidth(int *page, const char *str) {
    int var_6;
    const uint8* var_4;
    int var_2;
    TRACE(("stringWidth"));
    var_4 = str;
    var_2 = page[6];
    var_6 = 0;
    while (*var_4 != '\0') {
        var_6 += gfx_jump_2f_charWidth(*(var_4++), var_2);
    }
    return var_6;
}

void drawString(int *page, const char *str, int startx, int y, int endx) {
    int width;
    TRACE(("drawString"));
    width = stringWidth(page, str);
    actualDrawString(page, str, (endx - width) / 2 + startx, y);
}

void cleanup(void) {
    char regs[0xe];
    TRACE(("cleanup"));
    if (var_69 == 1) {
        restoreTimerIrqHandler();
    }
    regs[1] = 0;
    regs[0] = 3;
    intDispatch(0x10, regs, regs);
    misc_jump_5e_clearKeyFlags();
}

void routine_34(void) {
    TRACE(("routine_34"));
    routine_70(routine_69());
}

int routine_137(unsigned char param_1) {
    TRACE(("routine_137"));
    return ((unsigned int)param_1 << 7) / 0x92;
}

int routine_136(unsigned char param_1) {
    TRACE(("routine_136"));
    return ((unsigned int)param_1 << 7) / 0xC3;
}

void routine_160(int x1, int y1, int x2, int y2) {
    TRACE(("routine_160"));
    routine_138(x1, y1, x2, y2, var_93, var_95, var_94, var_96, 1);
}

void routine_157(int x, int y) {
    TRACE(("routine_157"));
    routine_160(x, y, x, y);
}

