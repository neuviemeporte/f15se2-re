/* Sprite display */
#include "start.h"
#include "gfx.h"
#include "slot.h"
#include "debug.h"

void showSprite(int page, int x, int y, int src_x, int src_y, int width, int height) {
    TRACE(("showSprite(%d, %d, %d, %d, %d, %d, %d)", page, x, y, src_x, src_y, width, height));
    spriteParams.bufPtr = menuSprites;
    spriteParams.srcX = src_x;
    spriteParams.srcY = src_y;
    spriteParams.page = page;
    spriteParams.dstX = x;
    spriteParams.dstY = y;
    spriteParams.width = width;
    spriteParams.height = height;
    spriteParams.flags = 0x10;
    gfx_blitSprite(&spriteParams);
    TRACE(("showSprite(): returning"));
}
