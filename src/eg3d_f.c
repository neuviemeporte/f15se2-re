#include "egame.h"
#include "slot.h"

// ==== seg000:0x39c0 ====
void setupViewport(char *arg_0) {
    int a, b;
    b = *(int *)(arg_0 + 0x14) - *(int *)(arg_0 + 0x12) + 1;
    a = *(int *)(arg_0 + 0x10) - *(int *)(arg_0 + 0x0e) + 1;
    word_3298C = (b + 1 >> 1) - 1;
    word_3298E = (a + 1 >> 1) - 1;
    if (*(int *)(arg_0 + 0x0e) == 0) {
        word_3298E = *(int *)(arg_0 + 0x10) == 199 ? 0x64 : 0x38;
    }
    gfx_setOvlVal2(b - 1);
    gfx_setBlitOffset(gfx_calcRowAddr(*(int *)(arg_0 + 0x12), *(int *)(arg_0 + 0x0e)));
    var_349 = b - 1;
    var_350 = a - 1;
    word_3C69C = 0x192c;
    word_3C6A2 = 0x194c;
    if (var_456 != 0) {
        word_3C69C += 0x10;
        word_3C6A2 += 0x10;
    }
    if ((char)word_330C2 != 0) {
        word_3C6A2 += 0x20;
    }
}
