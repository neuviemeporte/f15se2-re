#include "inttype.h"
#include "offsets.h"
#include "pointers.h"
#include "comm.h"
#include "shared/util.h"
#include "gfx.h"
#include "slot.h"
#include "const.h"

#include "debug.h"
#include "start.h"

#include <stdio.h>
#include <dos.h>

/* 0x4a0 */
void initGraphics()
{
    /* unused stack data eliminated by compiler, but original binary has sub sp,0xe in preamble - ??? */
    uint8 unused[0xe];
    /* 0x4a6 */
    seedRandom();
    /* 0x4ac */
    gfx_setPageN(0);
    gfx_allocPage(0);
    /* 0x4c4 - see f14 gmain.c InitGraphicPages() */
    gfx_storeBufPtr(page1Ptr = gfx_allocPage(1), 1); // 64k framebuffer @ 2cc0:0
    /* 0x4d8 */
    if (*gfxModeSetPtr == 0) {
        /* looks like arg is unused inside driver function, maybe it was in an older version of the overlay? */
        gfx_setMode13(commData->setupMono);
        /* 0x4f2, looks like a gfx mode set flag? */
        *gfxModeSetPtr = 1;
    }
    /* 0x4fb */
    commData->gfxModeNum = gfx_getModecode();
    misc_jump_5e_clearKeyFlags();
}


void clearKeyBuf()
{
    while (misc_jump_5a_keybuf() == 0) {
        misc_jump_5b_getkey();
    }
}

void waitJoyKey(void)
{
    while (joyOrKey() == 0) {}
}

int joyOrKey() {
    if (commData->setupUseJoy == 1) {
        if (misc_jump_5d_readJoy(0) != 0) {
            return 1;
        }
    }
    if (cbreakHit != 0) {
        cleanup();
        restoreCbreakHandler();
        exit(0);
    }
    if (misc_jump_5a_keybuf() != 0) {
        return 0;
    }
    // 5b6, alt-q hit check
    if (misc_jump_5b_getkey() == KEYCODE_ALTQ) {
        cleanup();
        exit(0);
    }
    return 1;
}

/* 0x5d5 */
void waitMdaCgaStatus(int16 iter)
{
    /* 0x5e0 */
    while (iter-- != 0) {
        /* 0x5e2 */
        if (commData->setupMono != 0) {
            while ((inp(PORT_MDA_STATUS) & MDA_STATUS_RETRACE) == 0) {}
            while ((inp(PORT_MDA_STATUS) & MDA_STATUS_RETRACE) != 0) {}
        /* 0x60f */
        }
        else {
            while ((inp(PORT_CGA_STATUS) & CGA_STATUS_RETRACE) == 0) {}
            while ((inp(PORT_CGA_STATUS) & CGA_STATUS_RETRACE) != 0) {}
        }
    /* 0x62f */
    }
    /* 0x634 */
}

void drawLine(int16 *pageNum, int x1, int y1, int x2, int y2, int color) {
    gfx_setPageN(*pageNum);
    gfx_setColor(color);
    lineX1 = x1;
    lineY1 = y1;
    lineX2 = x2;
    lineY2 = y2;
    drawLineWrapper();
    gfx_resetBlitOffset2();
}

/* 0x674 */
void showPic640(char* filename)
{
    int fileHandle;
    intRegs[1] = INT_VID_MODESET;
    intRegs[0] = MODE_640_350;
    intDispatch(IRQ_VIDEO, intRegs, intRegs);
    gfx_setDac(4);
    fileHandle = openFileWrapper(filename, 0);
    picBlit(fileHandle, 0);
    closeFileWrapper(fileHandle);
}
