#include "egame.h"
#include "slot.h"

// ==== seg000:0x39c0 ====
void setupViewport(char *rect) {
    int a, b;
    b = *(int *)(rect + 0x14) - *(int *)(rect + 0x12) + 1;
    a = *(int *)(rect + 0x10) - *(int *)(rect + 0x0e) + 1;
    word_3298C = (b + 1 >> 1) - 1;
    word_3298E = (a + 1 >> 1) - 1;
    if (*(int *)(rect + 0x0e) == 0) {
        word_3298E = *(int *)(rect + 0x10) == 199 ? 0x64 : 0x38;
    }
    gfx_setOvlVal2(b - 1);
    gfx_setBlitOffset(gfx_calcRowAddr(*(int *)(rect + 0x12), *(int *)(rect + 0x0e)));
    word_37557 = b - 1;
    word_37559 = a - 1;
    word_3C69C = word_341DC;
    word_3C6A2 = word_341FC;
    if (byte_37C24 != 0) {
        word_3C69C += 8;
        word_3C6A2 += 8;
    }
    if ((char)word_330C2 != 0) {
        word_3C6A2 += 0x10;
    }
}
