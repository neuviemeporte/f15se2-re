// seg000 debug code (/Zi)
#include "egame.h"
#include "offsets.h"
#include "pointers.h"
#include "debug.h"
#include "slot.h"
#include "const.h"
#include "comm.h"

#include <dos.h>
#include <conio.h>
#include <bios.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>


// TODO: otherKeyDispatch (seg000:3f72-51f8) - large unimplemented function
// Once implemented, try merging from preceding file (if register spill doesn't affect codegen)

void applyRotationDelta(int param_1, int param_2) {
    int p;
    int a;

    var_549++;
    if (!(*(char *)&var_549 & 7)) {
        *(char *)&word_380D8 = 1;
    }
    multiplyMatrix3x3Far(param_1, param_2, unk_380B6);
    memcpy(unk_3806E, unk_380B6, 0x12);
}

// ==== seg000:0x5411 ====
// TODO: computeHudAttitude (seg000:5237-5410) - unimplemented

void rebuildOrientation() {
    buildRotationMatrixFar(unk_3806E, var_542, var_544, var_545);
    *(char *)&word_380D8 = 0;
    var_549 = 0;
}

// ==== seg000:0x543b ====
unsigned signedRatio16(int numerator, int denominator) {
    char p = 1;
    char a = 1;
    long b;
    long d;

    if (numerator < 0) p = -1;
    if (denominator < 0) a = -1;
    b = (long)(numerator < 0 ? -numerator : numerator);
    d = (long)(denominator < 0 ? -denominator : denominator);
    return (unsigned)((unsigned int)((((unsigned long)(unsigned int)b) << 16) / d >> 1)) * (unsigned)(int)p * (unsigned)(int)a;
done:
    ;
}

// ==== seg000:0x54b7 ====
int valueToAngle(int value) {
    int p;
    int a;
    int b;
    int c;

    if (value == (int)0x8000) return (int)0xc000;
    a = abs(value);
    b = (a >> 9) + 1;
    for (; b >= 0; b--) {
        if ((&word_37348)[b] <= a) {
            c = (&word_3734A)[b] - (&word_37348)[b];
            p = (int)((long)(a - (&word_37348)[b]) * 256L / (long)c) + b * 256;
            break;
        }
    }
    if (value < 0) {
        p = -p;
    }
    return p;
}

// ==== seg000:0x5540 ====
int complementAngle(int arg_0) {
    return 0x4000 - valueToAngle(arg_0);
}

int isqrt(int value) {
    int p;
    int a;
    value = abs(value);
    if (value < 4) {
        return 1;
    }
    a = value >> 2;
    do {
        p = value / a;
        a = (a + p) >> 1;
    } while (abs(a - p) > 1);
    return a;
}

// ==== seg000:0x55ab ====
// something to do with view switching?
#ifdef DEBUG
extern unsigned int dbg_loc0a09_trips;
#endif
int renderFrame() {
    int var_2, var_4, var_6, var_8, var_A, var_C, var_E;
#ifdef DEBUG
    if (word_38FDC > 1) word_38FDC = 1; /* HACK: level-4 3D data traversal hangs */
#endif
#ifdef DEBUG
    if ((word_336E8 & 0x1f) == 0)  /* periodic, every 32 frames, to keep logs readable */
        TRACE_KEY(("FRAME %d: alt(547)=%d alt(548)=%d head=%04x/%04x/%04x speed=%04x 38FDC=%d 3BECC=%d kv=%d",
            word_336E8, word_380CE, word_380D0, word_380C8, word_380CA, word_380CC,
            word_3A944, word_38FDC, word_3BECC, keyValue));
#endif
    TRACE(("renderFrame: enter"));
    dword_3B1FE = dword_3C01C = dword_3B7DA;
    dword_3B4D4 = dword_3B7F8;
    dword_3C024 = 0x100000 - dword_3B7F8;
    TRACE(("renderFrame: past assigns"));
    word_3B4DE = word_380CE + 0x18;
    word_3C02C = word_380CE;
    var_2 = word_336FE = clampRange(word_336FE, 2, 8);
    TRACE(("renderFrame: past clamp, keyValue=%d", keyValue));
    switch(keyValue) {
    case 0:
    case 0x44:
        word_3C5AA = word_380C8;
        word_3BE94 = word_380CA;
        word_3B4E4 = word_380CC;
        break;
    case 0x41:
        word_3C5AA = word_380C8 + 0x8000;
        word_3BE94 = -word_380CA;
        word_3B4E4 = -word_380CC;
        break;
    case 0x43:
        word_3C5AA = word_380C8 + 0x4000;
        word_3BE94 = -word_380CC;
        word_3B4E4 = word_380CA;
        break;
    case 0x42:
        word_3C5AA = word_380C8 - 0x4000;
        word_3BE94 = word_380CC;
        word_3B4E4 = -word_380CA;
        break;
    case 0x84:
        var_E = (word_336E8 - ((word_330C4  + 1) / 2) - 1) & 0xf;
        word_3C5AA = stru_3A95A[var_E].heading;
        word_3BE94 = stru_3A95A[var_E].pitch;
        word_3B4E4 = stru_3A95A[var_E].roll;
        dword_3B1FE = stru_3A95A[var_E].worldX;
        dword_3B4D4 = stru_3A95A[var_E].worldY;
        word_3B4DE = stru_3A95A[var_E].alt;
        break;
    case 0x85:
        word_3C5AA = word_380C8 - 0x4000;
        word_3BE94 = 0;
        word_3B4E4 = 0;
        dword_3B1FE = sinMul(word_380C8 + 0x4000, 0x18 << var_2) + dword_3B7DA;
        dword_3B4D4 = cosMul(word_380C8 + 0x4000, 0x18 << var_2) + dword_3B7F8;
        break;
    case 0x86:
        word_3C5AA = 0x8000;
        word_3BE94 = 0;
        word_3B4E4 = 0;
        dword_3B4D4 = (0x18 << var_2) + dword_3B7F8;
        break;
    case 0x87:
        word_3C5AA = word_380C8;
        word_3BE94 = 0;
        word_3B4E4 = 0;
        dword_3B1FE = sinMul(word_380C8 + 0x8000, 0x18 << var_2) + dword_3B7DA;
        dword_3B4D4 = cosMul(word_380C8 + 0x8000, 0x18 << var_2) + dword_3B7F8;
        word_3B4DE = (4 << var_2) + word_380CE;
        break;
    case 0x88:
    case 0x89:
    case 0x8b:
        if (keyValue != 0x89) {
            if (word_3C45C == 1) {
                // XXX: test byte ptr word_336F2, 80h -> check which byte is tested, other byte ptr instructions in this routine
                if (!(word_336F2 & 0x80)) word_3C02E = word_336F2 + 0x20;
            }
            else {
                if (!(word_336F4 & 0x80)) word_3C02E = word_336F4 + 0x40;
            }
        }
        else {
            if (word_3370E == 0) word_3C02E = word_3A940;
        }
        var_4 = var_2;
        if (!(word_3C02E & 0x40)) {
            if (!(word_3C02E & 0x20)) {
                if (stru_335C4[word_3C02E].ttl != 0) {
                    dword_3C01C = (uint32)(stru_335C4[word_3C02E].mapX) << 5;
                    dword_3C024 = (uint32)(stru_335C4[word_3C02E].mapY) << 5;
                    word_3C02C = stru_335C4[word_3C02E].alt;
                }
                else {
                    stru_335C4[word_3C02E].worldX = word_380C8;
                    stru_335C4[word_3C02E].worldY = word_380CA;
                    if (word_3370E != 0) keyValue = 0x87;
                }
                var_2 = 5;
            }
            else {
                // .... word_3C02E & 0x1f
                dword_3C01C = stru_3B202[word_3C02E & 0x1f].worldX;
                dword_3C024 = stru_3B202[word_3C02E & 0x1f].worldY;
                word_3C02C = stru_3B202[word_3C02E & 0x1f].alt;
                var_2 = 5;
            }
        }
        else {
            dword_3C01C = (uint32)stru_3AA5E[word_3C02E & 0x3f].mapX << 5;
            dword_3C024 = (uint32)stru_3AA5E[word_3C02E & 0x3f].mapY << 5;
            word_3C02C = stru_3AA5E[word_3C02E & 0x3f].flags & 0x200 ? 0xc8 : 0x32;
            var_2 = 7;
            if (word_336EA != 0 && word_3370C == -1) var_2 = 6;
        }
        if (word_3370E == 0) var_2 = var_4;
        var_A = (dword_3C01C >> 5) - word_3BEC0;
        var_C = (dword_3C024 >> 5) - word_3BED0;
        var_6 = rangeApprox(var_A, var_C);
        word_3C5AA = computeBearing(var_A, -var_C);
        word_3BE94 = -computeBearing((word_3C02C - word_380CE) >> 5, var_6);
        word_3B4E4 = 0;
        var_8 = cosMul(word_3BE94, 0x18 << var_2);
        if (word_3C02E & 0x60 || word_3370E != 0) {
            if (keyValue == 0x88) {
                dword_3B1FE = sinMul(word_3C5AA + 0x8000, var_8) + dword_3B7DA;
                dword_3B4D4 = cosMul(word_3C5AA + 0x8000, var_8) + dword_3B7F8;
                word_3B4DE = sinMul(word_3BE94, 0x18 << var_2) + (4 << var_2) + word_380CE;
                word_3BE94 = -word_3BE94;
            }
            else {
                dword_3B1FE = sinMul(word_3C5AA, var_8) + dword_3C01C;
                dword_3B4D4 = cosMul(word_3C5AA, var_8) - dword_3C024 + 0x100000;
                word_3B4DE = (4 << var_2) - sinMul(word_3BE94, 0x18 << var_2) + word_3C02C;
                if (word_3C02E & 0x40 && stru_3AA5E[word_3C02E & 0x3f].flags & 0x200 && word_3B4DE < 0x84) {
                    word_3B4DE = 0x84;
                }
                word_3C5AA += 0x8000;
            }
        }
        else {
            word_3C5AA = stru_335C4[word_3C02E].worldX;
            word_3BE94 = stru_335C4[word_3C02E].worldY - 0x400;
            var_8 = cosMul(word_3BE94, 0x10 << var_2);
            dword_3B1FE = dword_3C01C - sinMul(word_3C5AA, var_8);
            dword_3B4D4 = 0x100000 - (cosMul(word_3C5AA, var_8) + dword_3C024);
            word_3B4DE = word_3C02C - sinMul(word_3BE94, 0x10 << var_2);
        }
        break;
    case 0x8c:
        word_3BE94 = 0xf400;
        word_3B4E4 = 0;
        dword_3B1FE = (int32)word_3C028 << 5;
        dword_3B4D4 = (0x8000 - (int32)word_3C03A) << 5;
        word_3B4DE = word_3C040;
        break;
    }
    if (abs(word_3BE94) > 0x4000 || word_3BE94 == 0x8000) {
        word_3BE94 = 0x8000 - word_3BE94;
        word_3C5AA += 0x8000;
        word_3B4E4 = 0x8000 - word_3B4E4;
    }
    if (keyValue == 0) {
        memcpy(unk_3A948, unk_3806E, 0x12);
    }
    else {
        buildRotationMatrixFar(unk_3A948, word_3C5AA, word_3BE94, word_3B4E4);
    }
    word_3B4DE = word_3B4DE < 0x10 ? 0x10 : word_3B4DE;
    var_E = word_330C2;
    word_330C2 = (keyValue & 0xc0) == 0;
    if (var_E != word_330C2) {
        gfx_waitRetrace();
        if (word_330C2 != 0) {
            gfx_resetBlitOffset2();
            // the pointer arguments are probably rastports, RectCopy?
            gfx_copyRect(*off_38364, 0, 0x61, *off_38334, 0, 0x61, 0x140, 0x67);
            gfx_copyRect(*off_38364, 0, 0x61, *off_3834C, 0, 0x61, 0x140, 0x67);
            sub_15FDB();
            drawWeaponAmmo();
            drawWeaponSelectMarker(missileSpecIndex);
            if (word_3C09A == 0) {
                redrawTacMap(word_3BEC0, word_3BED0);
            }
            word_336F4 = word_336F2 = 0xffff;
            fillPanelBox(3, 3);
            word_39604 = 0;
        }
        else {
            gfx_copyRect(*off_38334, 0, 0x61, *off_38364, 0, 0x61, 0x140, 0x67);
        }
    }
    if (keyValue != word_38152) {
        if (keyValue == 0x42 || keyValue == 0x43 || keyValue == 0x41) {
            gfx_waitRetrace();
            if (gfx_getModecode() == 3) {
                openBlitClosePic(keyValue == 0x42 ? a256left_pic : keyValue == 0x43 ? a256right_pic : a256rear_pic, *off_38334);
            }
            else {
                openBlitClosePic(keyValue == 0x42 ? aLeft_pic : keyValue == 0x43 ? aRight_pic : aRear_pic, *off_38334);
            }
            gfx_copyRect(*off_38334, 0, 0x61, *off_3834C, 0, 0x61, 0x140, 0x67);
            off_38334[0x10] = off_3834C[0x10] = 0x60;
        }
        else {
            off_38334[0x10] = off_3834C[0x10] = word_330C2 != 0 ? 0x60 : 0xc7;
        }
        word_38152 = keyValue;
    }
    byte_34197 = byte_228D0[0x2f];
    *(uint8*)(&word_3BE98) = 3;
    if (word_38FDC == 0 && commData->gfxModeNum != 0) {
        byte_34197 = 3;
        *(uint8*)(&word_3BE98) = 0x0b;
    }
    copySomeMem(word_330BC);
    *(uint8*)(&word_36B86) = 0;
#if defined(DEBUG) && defined(DISABLE_3D)
    /* Skip the whole 3D render (incl. drawHudWorldOverlay HUD) to get continuous frames. */
#else
    render3DView(-word_3C5AA, word_3BE94, word_3B4E4, dword_3B1FE, dword_3B4D4, (int32)word_3B4DE, 0, 0, 0x140, off_38334[0x10] + 1);
#endif
    byte_3850E = 0;
    byte_3995A = word_36B86;
    if (keyValue == 0x41) {
        drawVectorShape(unk_38128);
        gfx_setColor(0xf);
        word_3755D = 0xf1;
        word_37561 = 0x15;
        word_3755F = 0xfb;
        word_37563 = 0x5e;
        drawClipLineGlobal();
        word_3755D = 0x53;
        word_37561 = 0x15;
        word_3755F = 0x49;
        word_37563 = 0x5e;
        drawClipLineGlobal();
        gfx_resetBlitOffset2();
        var_E = byte_3C5A0;
        byte_3C5A0 = gfx_getDisplayPage();
        blitSprite(0x6b, 0x30, 0xd1, 0, 0x6f, 0x2f, 0);
        blitSprite(0x41, 0x5f, 0x7d, 0x36, 0xc3, 2, 0);
        byte_3C5A0 = var_E;
    }
    gfx_flipPage();
    word_38126 = (word_3C09E == 0x13 || word_3C09A == 1 || word_330C2 == 0) ? 0xc8 : 0x61;
    TRACE(("renderFrame: exit"));
}

// ==== seg000:0x5fdb ====
void sub_15FDB(void) {
    if (word_330C2 != 0) {
        setDrawColor(0);
#ifdef BUGFIX
        fillRectBoth(0xd4, 0x7f, 0xde, 0xaf);
#else
        fillRectBoth(0xd4, 0x7f, 0xde, 0xaf, 0xc4);
#endif
        setDrawColor(0x0c);
        fillRectBoth(0xd4, -(var_552 / 3 - 0xaf), 0xde, 0xaf);
        if (100 < var_552) {
            setDrawColor(0x0e);
            fillRectBoth(0xd4, -(var_552 / 3 - 0xaf), 0xde, 0x8e);
        }
    }
}
// ==== seg000:0x606c ====
void drawFuelGauge(void) {
    if (word_330C2 == 0) {
        return;
    }
    setDrawColor(0);
    fillRectBoth(5, 0x6d, 0x0a, 0x98);
    setDrawColor(word_33098 > 2000 ? 2 : 14);
    fillRectBoth(5, -(word_33098 / 250 - 0x98), 0x0a, 0x98);
}

// ==== seg000:0x60d3 ====
void drawVectorShape(int16 *shapeData) {
    while (*shapeData != -1) {
        gfx_setColor(((uint8 *)word_3419C)[*shapeData++]);
        resetScanlineSpans();
        shapeData += 2;
        while (*shapeData != -1) {
            var_351 = shapeData[-2];
            var_353 = shapeData[-1];
            var_352 = *shapeData++;
            var_354 = *shapeData++;
            clipAndRasterizeEdge();
        }
        flushSpanDirtyRect();
        shapeData++;
    }
}

// ==== seg000:0x613b ====
void waitForKeyPress(void) {
    int p;

    audio_jump_69();
    p = var_383;
loop:
    while (kbhit() == 0)
        ;
    if (_bios_keybrd(0) == 0x1900)
        goto loop;
    sub_1DA8D();
    var_383 = p;
}

// TODO: updateThreatSites (seg000:6172-6345) - unimplemented
// Once implemented, try merging egame1g.c + egame2d.c (if register spill doesn't affect codegen)

