/* Sprite display */
#include "stdata.h"
#include "stsprit.h"
#include "gfx.h"
#include "slot.h"
#include "log.h"

void showSprite(int page, int x, int y, int src_x, int src_y, int width, int height) {
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
}
