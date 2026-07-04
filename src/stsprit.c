/* Sprite display */
#include "stdata.h"
#include "stsprit.h"
#include "gfx.h"
#include "slot.h"
#include "log.h"

void showSprite(int16 page, int16 x, int16 y, int16 src_x, int16 src_y, int16 width, int16 height) {
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
