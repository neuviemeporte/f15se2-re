/* end0.c — compiled with /Gs /Zi (stack probes disabled, debug info) */
#include "offsets.h"
#include "pointers.h"
#include "debug.h"
#include "end.h"

void main(void) {
    int p;
    int a;
    int b;
    uint16 far *d;
    int e;
    register int seg;

    (void)a; (void)e;

    FP_SEG(d) = SEG_LOWMEM;
    FP_OFF(d) = OFF_IACA_START;
    seg = *d;
    FP_SEG(var_222) = seg;
    FP_OFF(var_222) = 0;
    FP_SEG(var_178) = seg;
    FP_OFF(var_178) = COMM_GAMEDATA_OFFSET;
    routine_14(((int far *)var_222)[0x1a / 2]);
    routine_14(((int far *)var_222)[0x1e / 2]);
    misc_jump_5e_clearKeyFlags();
    routine_16();
    var_191 = ((char far *)var_222)[0x24];
    installCBreakHandler();
    routine_18();
    if (((int far *)var_222)[0x72 / 2] == 1) {
        copyJoystickData((char far *)var_222 + 0x48);
    } else {
        var_55 = var_56 = 0x80;
    }
    routine_20();
    b = gfx_jump_31();
    p = gfx_jump_17_bufSize();
    var_226 = allocBuffer(b);
    if (var_189 == 1) {
        var_230 = allocBuffer(0x3c8c);
        var_232 = var_230;
        var_231 = 0;
    }
    var_229 = allocBuffer(p);
    var_201 = 3;
    if (((int far *)var_222)[0x26 / 2] == 2) {
        routine_24();
    }
    routine_16();
    routine_25();
    routine_26();
    routine_16();
    routine_27();
    routine_28();
    routine_8(0x23);
}

void drawStringAt(int *pageNum, const char *string, int x, int y) {
    TRACE(("drawStringAt"));
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

void drawStringCentered(int *page, const char *str, int startx, int y, int endx) {
    int width;
    TRACE(("drawStringCentered"));
    width = stringWidth(page, str);
    drawStringAt(page, str, (endx - width) / 2 + startx, y);
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

char *routine_106(int timeValue, char *buffer) {
    int p;
    int a;
    int b;
    int c;

    a = var_186[0] + var_188[0];
    var_24 = ((char)a & 3) == 0;
    if (var_185[0] == 1 || var_187[0] == 1) {
        var_24 = 0;
    }
    if (var_185[0] == 4 || var_187[0] == 4) {
        var_24 = 1;
    }
    timeValue += (a & 0xF) << 8;
    mystrcpy(buffer, str_timeFormat);
    p = (unsigned)timeValue / 0x708;
    buffer[0] += var_24 + 1;
    buffer[1] += p % 10;
    b = ((unsigned)timeValue / 30) % 60;
    buffer[3] += b / 10;
    buffer[4] += b % 10;
    c = ((unsigned)timeValue * 2) % 60;
    buffer[6] += c / 10;
    buffer[7] += c % 10;
    return buffer;
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
    drawStringAt((int *)param_1, str_inFlight, 0xf0, 0x26);
loop_top:
        var_190++;
        if (flightRecords[var_190].status & 0x3f) {
            if ((flightRecords[var_190].status & 0x3f) == 9) {
        clearRect((int *)param_1, 0xf0, 0x1e, 0x13f, 0x25);
        mystrcpy(dat_4824, str_timeLabel);
        mystrcat(dat_4824, routine_106(*((int *)&flightRecords[var_190] - 1), local_18));
        drawStringAt((int *)param_1, dat_4824, 0xf0, 0x1e);
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
        drawStringCentered((int *)param_1, dat_4824, 0xe8, 0x56, 0x57);
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

void routine_130(int *page, char *str, unsigned int maxWidth, int x, int y, int lineHeight) {
    int p;
    char *a;
    uint8 *b;
    int c;
    int d;
    char *e;
    int8 f;
    unsigned int g;
    char buf[1000];

    e = str;
    a = str;
    b = str;
    p = page[6];
    page[5] = y;
    f = 1;
    do {
        if (f == 0) {
            return;
        }
        g = c = 0;
        while (g < maxWidth && *b != '\0' && *b != '\r' && *b != '\n') {
            g += gfx_jump_2f_charWidth(*b++, p);
            c++;
        }
        if (g >= maxWidth) {
            b--;
            c--;
        }
        while (*b != ' ' && *b != '\0' &&
               *b != '\r' && *b != '\n' && *b != '-' &&
               b > e) {
            b--;
            c--;
        }
        if (*b == '-') {
            c++;
        }
        if (*b == '\0') {
            f = 0;
        }
        if (c != 0) {
            routine_146(buf, a, c);
            buf[c] = 0;
            page[4] = x;
            gfx_jump_05_drawString(page, buf);
            page[5] += lineHeight;
            if (*b == '\r') {
                page[5] += 2;
            }
        }
        b++;
        a = b;
    } while (1);
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

long routine_63(int param) {
    int p;
    int a;
    int b;
    int c;
    long e;
    int f;
    int g;

    var_181 = var_199 = var_182 = var_200 = var_224 = var_225 = var_215 = var_221 = c = 0;
    g = 1;
    e = 0;

    p = ((int far *)var_222)[0x40 / 2];
    if (p > 15) {
        p = 15;
    }

    for (b = 0; (unsigned)b <= (unsigned)param && flightRecords[207 + b].status; b++) {
        f = flightRecords[207 + b].pad;
        switch (flightRecords[207 + b].status & 0x3f) {
        case 8:
            if (b != 0) {
                c = 1;
            }
            break;
        case 1:
        case 12:
            if (flightRecords[207 + b].status & 0x80) {
                var_215 = 1;
                var_224++;
            } else if (flightRecords[207 + b].status & 0x40) {
                var_221 = 1;
                var_224++;
            } else if (var_204[f & 0x7f] & 0x40) {
                var_225++;
            } else if (!(*(int *)&var_183[f * 16] & 0x500)) {
                var_224++;
            } else {
                var_225++;
            }
            break;
        case 3:
            if (flightRecords[207 + b].status & 0x80) {
                var_215 = 1;
                var_181++;
            } else if (flightRecords[207 + b].status & 0x40) {
                var_221 = 1;
                var_181++;
            } else if (*(int *)&var_23[(f & 0x7f) * 0x20] == -1) {
                var_182++;
            } else {
                var_181++;
            }
            break;
        case 2:
            if (flightRecords[207 + b].status & 0x80) {
                var_215 = 1;
                var_199++;
            } else if (flightRecords[207 + b].status & 0x40) {
                var_221 = 1;
                var_199++;
            } else if (var_204[f & 0x7f] & 0x40) {
                var_200++;
            } else {
                if (!((var_184[(((flightRecords[207 + b].cy & 0xff) >> 4) << 4) + ((unsigned char)flightRecords[207 + b].cx >> 4)]) & 3)) {
                    var_199++;
                } else {
                    var_200++;
                }
            }
            break;
        case 10:
            g++;
            break;
        }
    }

    e = (long)((var_224 - var_225 * 2) * p * 25)
      + (long)((var_181 - var_182 * 2) * (((int far *)var_178)[0x3e / 2] + 1) * 50)
      + (long)((var_199 - var_200 * 2) * p * 20)
      + (long)(p * var_215 * 200)
      + (long)(p * var_221 * 100);

    e = e * 2 / (g + 1);

    if (c != 0) {
        if (e < 0) {
            e = 0;
        }
        switch (((int far *)var_222)[0x26 / 2]) {
        case 1:
            e /= 2;
            break;
        case 2:
            e = e * 3 / 4;
            break;
        }
    }

    return e;
}

unsigned int routine_132(int param_1, unsigned int param_2) {
    int p;
    int a;
    int b;
    int c;
    int d;
    int e;
    int f;
    int g;
    int h;
    int i;
    int j;
    int k;
    int l;
    int m;
    int n;
    (void)e; (void)f; (void)g; (void)h; (void)i;
    (void)j; (void)k; (void)l; (void)m; (void)n; (void)p;
    a = -1;
    while (++a, (flightRecords[a].status & 0x3f) != 0 && (unsigned)a <= param_2) {
        gfx_jump_21(0);
        if (a == 0) {
            routine_147((int)flightRecords[0].cx, (int)flightRecords[0].cy, 0, 0);
            b = (int)flightRecords[0].cx;
            d = (int)flightRecords[0].cy;
        } else {
            p = (int)flightRecords[a].cx;
            c = (int)flightRecords[a].cy;
            routine_105(p, c, b, d);
            b = p;
            d = c;
        }
    }
    a = -1;
    while (++a, (flightRecords[a].status & 0x3f) != 0 && (unsigned)a <= param_2) {
        if ((flightRecords[a].status & 0x3f) != 9) {
            routine_135(a);
        }
    }
    a--;
    return a;
}

void routine_131(void) {
    int p;
    int a;

    (void)p;

    if (var_214 == 1) {
        gfx_jump_2a(1, 0, 0x96, 0, var_227, var_228, 0x30, 0x28);
        var_214 = 0;
    }
    a = flightRecords[var_190].status & 0x3f;
    switch (a) {
    case 1:
        if (var_183[(flightRecords[var_190].pad & 0x7f) * 16] & 8) {
            a = 0xf;
        } else {
            a = 0;
        }
        break;
    case 2:
        a = 2;
        break;
    case 12:
        a = 1;
        break;
    case 3:
        a = 2;
        break;
    case 5:
        a = 3;
        break;
    case 8:
        if (var_190 == 0) {
            a = 8;
        } else {
            if (((int far *)var_222)[0x26 / 2] == 3) {
                var_207 = 1;
                a = 7;
            } else if (((int far *)var_222)[0x26 / 2] == 1) {
                var_207 = 1;
                a = 0xe;
            } else if (var_201 == 0) {
                var_207 = 1;
                a = 0xb;
            } else {
                var_207 = 1;
                a = 0xd;
            }
        }
        break;
    case 10:
        a = 0xa;
        break;
    }
    if ((unsigned)(routine_137(flightRecords[var_190].cx) + var_93) < 0x73 &&
        (unsigned)(routine_136(flightRecords[var_190].cy) + var_94) < 0x59) {
        var_227 = routine_137(flightRecords[var_190].cx) + var_93 + 10;
        var_228 = routine_136(flightRecords[var_190].cy) + var_94 + 10;
    } else if ((unsigned)(routine_137(flightRecords[var_190].cx) + var_93) >= 0x73 &&
               (unsigned)(routine_136(flightRecords[var_190].cy) + var_94) < 0x59) {
        var_227 = routine_137(flightRecords[var_190].cx) + var_93 - 0x3a;
        var_228 = routine_136(flightRecords[var_190].cy) + var_94 + 10;
    } else if ((unsigned)(routine_137(flightRecords[var_190].cx) + var_93) >= 0x73 &&
               (unsigned)(routine_136(flightRecords[var_190].cy) + var_94) >= 0x59) {
        var_227 = routine_137(flightRecords[var_190].cx) + var_93 - 0x3a;
        var_228 = routine_136(flightRecords[var_190].cy) + var_94 - 0x28;
    } else {
        var_227 = routine_137(flightRecords[var_190].cx) + var_93 + 10;
        var_228 = routine_136(flightRecords[var_190].cy) + var_94 - 0x28;
    }
    gfx_jump_2a(0, var_227, var_228, 1, 0, 0x96, 0x30, 0x28);
    gfx_jump_2a(1, var_98[a], var_97[a], 0, var_227, var_228, 0x30, 0x28);
    var_214 = 1;
}

void routine_95(int *param_1, int param_2) {
    int p;
    int a;
    int b;
    int c;
    TRACE(("routine_95"));
    (void)a;
    (void)c;
    if (param_1[0x17] == 0) {
        param_1[0x17] = 1;
        b = (unsigned)param_1[9] >> 4;
        p = param_1[9] & 0xF;
        if (param_1[9] != 0) {
            gfx_jump_29_switchColor(param_2, param_1[4], param_1[5], param_1[6], param_1[7], b, p);
        }
    } else {
        param_1[0x17] = 0;
        b = param_1[9] & 0xF;
        p = (unsigned)param_1[9] >> 4;
    }
    if (param_1[9] != 0) {
        gfx_jump_29_switchColor(param_2, param_1[4], param_1[5], param_1[6], param_1[7], b, p);
    }
}

void routine_98(int *param_1, int *param_2, int param_3) {
    int a;
    int b;
    int c;
    int d;
    int e;
    char f;
    int g;
    int h;
    int i;
    TRACE(("routine_98"));
    (void)a;
    (void)g;
    (void)i;

    var_169 = param_2[8] * 14 + (int)dat_1c8e;
    var_82 = 0;
    d = e = 0;
    var_170 = var_202 = var_175 = f = 0;
    if (var_173 == 1) {
        var_81 = 0;
        f = 1;
    }

    /* pre-loop joystick read */
    if (var_222[0x39] == 1) {
        d = misc_jump_5d_readJoy(0);
        e = misc_jump_5d_readJoy(1);
        routine_134();
    }

    /* main loop */
    for (;;) {
        if ((char)misc_jump_5a_keybuf() == 0
            || d != 0
            || e != 0
            || (unsigned char)var_55 < 0x4E
            || (unsigned char)var_55 > 0xB2
            || (unsigned char)var_56 < 0x4E
            || (unsigned char)var_56 > 0xB2) {
            if (f != 1)
                break;
        }
        /* joystick repeat handling */
        if (var_173 == 1) {
            if ((unsigned char)var_81 > 0x0F) {
                f = 0;
                var_173 = 0;
            }
        }

        /* re-read joystick */
        if (var_222[0x39] == 1) {
            d = misc_jump_5d_readJoy(0);
            e = misc_jump_5d_readJoy(1);
            routine_134();
        }

        /* quit check */
        if (var_57 != 0) {
            cleanup();
            routine_28();
            routine_8(0);
        }

        /* animation */
        if (var_172 == 1) {
            if ((unsigned char)var_82 > 6) {
                var_82 = 0;
                c = ((unsigned int *)var_169)[var_171 + 1] >> 4;
                b = ((unsigned int *)var_169)[var_171 + 1] & 0xF;
                gfx_jump_29_switchColor(param_3, param_2[4], param_2[5], param_2[6], param_2[7], c, b);
                var_171++;
                var_171 = (unsigned)var_171 % *(unsigned int *)var_169;
            }
        }

        /* sprite section */
        if (!(param_2[0x18] & 0x800)) goto skip_sprite;
        if (!(param_2[0x18] & 0x1000)) goto skip_sprite;
        if ((unsigned char)var_83 <= 0x12) goto skip_sprite;
        var_83 = 0;
        if (var_174 != 0) {
            switch (flightRecords[var_190].status & 0x3F) {
            case 1:
            case 12:
                dat_20E2[4] = routine_137((char)flightRecords[var_190].cx) + var_93 - 2;
                dat_20E2[5] = routine_136((char)flightRecords[var_190].cy) + var_94 - 2;
                if (var_183[(flightRecords[var_190].unk4 & 0x7F) << 4] & 8) {
                    dat_20E2[1] = 0x11E;
                } else {
                    dat_20E2[1] = 0x12D;
                }
                gfx_jump_11_blitSprite((int)dat_20E2);
                break;
            case 3:
                dat_2122[4] = routine_137((char)flightRecords[var_190].cx) + var_93 - 2;
                dat_2122[5] = routine_136((char)flightRecords[var_190].cy) + var_94 - 2;
                gfx_jump_11_blitSprite((int)dat_2122);
                break;
            case 2:
                dat_2162[4] = routine_137((char)flightRecords[var_190].cx) + var_93 - 2;
                dat_2162[5] = routine_136((char)flightRecords[var_190].cy) + var_94 - 2;
                gfx_jump_11_blitSprite((int)dat_2162);
                break;
            case 5:
                dat_21E2[4] = routine_137((char)flightRecords[var_190].cx) + var_93;
                dat_21E2[5] = routine_136((char)flightRecords[var_190].cy) + var_94;
                gfx_jump_11_blitSprite((int)dat_21E2);
                break;
            case 8:
                dat_2122[4] = routine_137((char)flightRecords[var_190].cx) + var_93 - 2;
                dat_2122[5] = routine_136((char)flightRecords[var_190].cy) + var_94 - 2;
                gfx_jump_11_blitSprite((int)dat_2122);
                break;
            case 10:
                dat_21E2[4] = routine_137((char)flightRecords[var_190].cx) + var_93;
                dat_21E2[5] = routine_136((char)flightRecords[var_190].cy) + var_94;
                gfx_jump_11_blitSprite((int)dat_21E2);
                break;
            }
        } else {
            routine_135(var_190);
        }
        var_174 = (var_174 == 0);
skip_sprite:
        ;
    }

    /* post-loop input handling */
    if ((char)misc_jump_5a_keybuf() == 0) {
        h = misc_jump_5b_getkey();
    } else {
        if (d == 1) {
            h = 0x0D;
        } else if (e == 1) {
            h = 0x1B;
        } else if ((unsigned char)var_55 < 0x4E) {
            h = 0x4B00;
            var_173 = 1;
        } else if ((unsigned char)var_55 > 0xB2) {
            h = 0x4D00;
            var_173 = 1;
        } else if ((unsigned char)var_56 < 0x4E) {
            h = 0x4800;
            var_173 = 1;
        } else if ((unsigned char)var_56 > 0xB2) {
            h = 0x5000;
            var_173 = 1;
        }
    }

    /* process key */
    if ((char)h == 0x0D) {
        var_202 = 1;
    }
    if (h == 0x1000) {
        var_57 = 1;
        var_202 = 1;
    }
    if (h == 0x4800) {
        var_212 -= param_1[1];
        if ((int)param_1[4] > (int)var_212) {
            var_212 = param_1[4];
        }
        var_170 = 1;
    }
    if (h == 0x5000) {
        var_212 += param_1[1];
        if (var_212 > (unsigned)param_1[5]) {
            var_212 = param_1[5];
        }
        var_170 = 1;
    }
    if (h == 0x4D00) {
        var_210 += param_1[0];
        if (var_210 > (unsigned)param_1[3]) {
            var_210 = param_1[3];
        }
        var_170 = 1;
    }
    if (h == 0x4B00) {
        var_210 -= param_1[0];
        if ((int)param_1[2] > (int)var_210) {
            var_210 = param_1[2];
        }
        if ((int)param_1[4] > (int)var_212) {
            var_210 += param_1[0];
        }
        var_170 = 1;
    }

    /* final cleanup */
    if (param_2[0x18] & 0x800) {
        if (param_2[0x18] & 0x1000) {
            routine_135(var_190);
        }
    }
}
