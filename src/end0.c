/* end0.c — compiled with /Gs /Zi (stack probes disabled, debug info) */
#include "pointers.h"
#include "debug.h"
#include "end.h"

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

int my_ltoa(int32 arg_0, int8* arg_4) {
    int8 var_A, var_C;
    int8 *var_8;
    int8 var_6[6];
    var_8 = arg_4;
    if (arg_0 < 0) {
        arg_0 = -arg_0;
        *var_8 = '-';
        var_8++;
    }
    var_6[0] = arg_0 % 0xa;
    arg_0 /= 0xa;
    var_6[1] = arg_0 % 0xa;
    arg_0 /= 0xa;
    var_6[2] = arg_0 % 0xa;
    arg_0 /= 0xa;
    var_6[3] = arg_0 % 0xa;
    arg_0 /= 0xa;
    var_6[4] = arg_0 % 0xa;
    arg_0 /= 0xa;
    var_6[5] = arg_0 % 0xa;
    var_A = 0;
    for (var_C = 5; var_C > 0; var_C--) {
        if (var_6[var_C] != 0) break;
    }
    do {
        if (var_C == 2 && var_A == 1) {
            *var_8 = ',';
            var_8++;
        }
        *var_8 = var_6[var_C] + '0';
        var_A = 1;
        var_8++;
    } while (--var_C >= 0);
    *var_8 = '\0';
}

int my_itoa(int arg_0, int8 *arg_2) {
    int8 var_6[6];
    int8 var_A, var_C;
    int8 *var_8;
    var_8 = arg_2;
    if (arg_0 < 0) {
        arg_0 = -arg_0;
        *var_8 = 0x2d;
        var_8++;
    }
    var_6[0] = arg_0 % 0xa;
    arg_0 /= 0xa;
    var_6[1] = arg_0 % 0xa;
    arg_0 /= 0xa;
    var_6[2] = arg_0 % 0xa;
    arg_0 /= 0xa;
    var_6[3] = arg_0 % 0xa;
    arg_0 /= 0xa;
    var_6[4] = arg_0 % 0xa;
    arg_0 /= 0xa;
    var_6[5] = arg_0 % 0xa;
    var_A = 0;
    for (var_C = 5; var_C > 0; var_C--) {
        if (var_6[var_C] != 0) break;
    }
    do {
        if (var_C == 2 && var_A == 1) {
            *var_8 = 0x2c;
            var_8++;
        }
        *var_8 = var_6[var_C] + 0x30;
        var_A = 1;
        var_8++;
    } while (--var_C >= 0);
    *var_8 = 0;
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

void routine_66(void);

void routine_65(int param_1)
{
    char local_18[22];
    int pad;

    if (var_214 == 1) {
        gfx_jump_2a(1, 0, 0x96, 0, var_227, var_228, 0x30, 0x28);
        var_214 = 0;
    }
    clearRect((int *)param_1, 0xe9, 0x1e, 0x13f, 0x45);
    actualDrawString((int *)param_1, str_inFlight, 0xf0, 0x26);
loop_top:
        var_190++;
        if (flightRecords[var_190].status & 0x3f) {
            if ((flightRecords[var_190].status & 0x3f) == 9) {
        clearRect((int *)param_1, 0xf0, 0x1e, 0x13f, 0x25);
        mystrcpy(dat_4824, str_timeLabel);
        mystrcat(dat_4824, routine_106(*((int *)&flightRecords[var_190] - 1), local_18));
        actualDrawString((int *)param_1, dat_4824, 0xf0, 0x1e);
        gfx_jump_21(0);
        if (var_209 == 0 && var_213 == 0) {
            routine_105((int)var_194, (int)var_195, (int)flightRecords[var_190].cx, (int)flightRecords[var_190].cy);
            var_209 = (int)flightRecords[var_190].cx;
            var_213 = (int)flightRecords[var_190].cy;
        } else {
            var_208 = (int)flightRecords[var_190].cx;
            var_211 = (int)flightRecords[var_190].cy;
            routine_105(var_208, var_211, var_209, var_213);
            var_209 = var_208;
            var_213 = var_211;
        }
        *(long *)&var_219 = routine_63(var_190);
        mystrcpy(dat_4824, str_timeZeros);
        my_ltoa(*(long *)&var_219, local_18);
        mystrcat(dat_4824, local_18);
        clearRect((int *)param_1, 0xe8, 0x56, 0x13f, 0x5e);
        drawString((int *)param_1, dat_4824, 0xe8, 0x56, 0x57);
        var_81 = 0;
wait_loop:
        if ((unsigned char)var_81 <= 5) goto wait_loop;
                goto loop_top;
            }
        }
done:
    if (!(flightRecords[var_190].status & 0x3f)) {
        var_190--;
    }
    gfx_jump_21(0);
    if (var_209 == 0 && var_213 == 0) {
        routine_105((int)var_194, (int)var_195, (int)flightRecords[var_190].cx, (int)flightRecords[var_190].cy);
        var_209 = (int)flightRecords[var_190].cx;
        var_213 = (int)flightRecords[var_190].cy;
    } else {
        var_208 = (int)flightRecords[var_190].cx;
        var_211 = (int)flightRecords[var_190].cy;
        routine_105(var_208, var_211, var_209, var_213);
        var_209 = var_208;
        var_213 = var_211;
    }
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

void routine_157(int x, int y, int color) {
    TRACE(("routine_157"));
    routine_160(x, y, x, y);
}

void routine_147(int x, int y, int color) {
    int sx;
    int sy;
    TRACE(("routine_147"));
    sx = routine_137(x);
    sy = routine_136(y);
    if (color != -1 &&
        (unsigned)sx >= (unsigned)var_93 &&
        (unsigned)sx < (unsigned)var_95 &&
        (unsigned)sy >= (unsigned)var_94 &&
        (unsigned)sy < (unsigned)var_96) {
        routine_157(sx, sy, color);
    }
}

void FUN_1000_0990(unsigned int ticks) {
    TRACE(("FUN_1000_0990"));
    var_81 = 0;
    setTimerIrqHandler();
    while (ticks >= (unsigned char)var_81)
        ;
    restoreTimerIrqHandler();
}

void FUN_1000_041a(int *s, char far *str, int x, int y) {
    TRACE(("FUN_1000_041a"));
    s[4] = x;
    s[5] = y;
    FUN_1000_0469(s, str);
}

void FUN_1000_0469(int *s, char far *str) {
    char buf[200];
    TRACE(("FUN_1000_0469"));
    FUN_1000_0a74(buf, str);
    gfx_jump_05_drawString(s, buf);
}

int routine_97(unsigned int *p)
{
    TRACE(("routine_97"));
    if (p[0] <= var_210 && p[2] >= var_210 && p[1] <= var_212 && p[3] >= var_212)
        return 1;
    else
        return 0;
}

void routine_105(int p1, int p2, int p3, int p4)
{
    TRACE(("routine_105"));
    routine_138(routine_137(p1), routine_136(p2), routine_137(p3), routine_136(p4), var_93, var_95, var_94, var_96, 1);
}

int routine_135(int param_1)
{
    TRACE(("routine_135"));
    switch (flightRecords[param_1].status & 0x3f) {
    case 1:
    case 12:
        dat_20C2[4] = routine_137(flightRecords[param_1].cx) + var_93 - 2;
        dat_20C2[5] = routine_136(flightRecords[param_1].cy) + var_94 - 2;
        if (var_183[(flightRecords[var_190].pad & 0x7f) * 16] & 8) {
            dat_20C2[1] = 0x11e;
        } else {
            dat_20C2[1] = 0x12d;
        }
        return gfx_jump_11_blitSprite((int)dat_20C2);
    case 2:
        dat_2142[4] = routine_137(flightRecords[param_1].cx) + var_93 - 2;
        dat_2142[5] = routine_136(flightRecords[param_1].cy) + var_94 - 2;
        return gfx_jump_11_blitSprite((int)dat_2142);
    case 3:
        dat_2102[4] = routine_137(flightRecords[param_1].cx) + var_93 - 2;
        dat_2102[5] = routine_136(flightRecords[param_1].cy) + var_94 - 2;
        return gfx_jump_11_blitSprite((int)dat_2102);
    case 5:
        dat_21C2[4] = routine_137(flightRecords[param_1].cx) + var_93;
        dat_21C2[5] = routine_136(flightRecords[param_1].cy) + var_94;
        return gfx_jump_11_blitSprite((int)dat_21C2);
    case 8:
        dat_2102[4] = routine_137(flightRecords[param_1].cx) + var_93 - 2;
        dat_2102[5] = routine_136(flightRecords[param_1].cy) + var_94 - 2;
        return gfx_jump_11_blitSprite((int)dat_2102);
    case 10:
        dat_21C2[4] = routine_137(flightRecords[param_1].cx) + var_93;
        dat_21C2[5] = routine_136(flightRecords[param_1].cy) + var_94;
        return gfx_jump_11_blitSprite((int)dat_21C2);
    }
}
