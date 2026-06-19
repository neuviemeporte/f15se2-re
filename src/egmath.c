// seg000 optimized code (/Ot)
#include "egame.h"
#include "offsets.h"
#include "pointers.h"
#include "debug.h"
#include "slot.h"
#include "const.h"

#include <dos.h>
#include <memory.h>


// ==== seg000:0xc8de ====

void load15Flt3d3() {
    int var_A, var_C;
    struct SREGS var_8;
    char FAR *var_10;
    TRACE(("load15Flt3d3: a15flt_xxx=%s", a15flt_xxx));
    strcpyFromDot(a15flt_xxx, a_3d3_0);
    TRACE(("load15Flt3d3: after strcpyFromDot=%s", a15flt_xxx));
    fileHandle = fopen(a15flt_xxx, aRb_4);
    TRACE(("load15Flt3d3: fopen returned %d", (int)fileHandle));
    if (fileHandle == NULL) {
        printError(aOpenErrorOn_3d3_0);
        return;
    }
    fread(&flt15_word1, 2, 1, fileHandle);
    fread(&flt15_size, 2, 1, fileHandle);
    fread(flt15_buf1, 2, flt15_size, fileHandle);
    fread(&var_A, 2, 1, fileHandle);
    TRACE(("load15Flt3d3: var_A=%d", var_A));
    segread(&var_8);
    var_10 = byte_2D6A4;
    TRACE(("load15Flt3d3: DS=%04x var_10=%04x:%04x", var_8.ds, FP_SEG(var_10), FP_OFF(var_10)));
    while(var_A > 0) {
        var_C = var_A <= 0x800 ? var_A : 0x800;
        fread(flt15_buf2, 1, var_C, fileHandle);
        movedata(var_8.ds, (uint16)flt15_buf2, FP_SEG(var_10), FP_OFF(var_10), var_C);
        var_A -= 0x800;
        FP_OFF(var_10) += 0x800;
    }
    TRACE(("load15Flt3d3: loop done"));
    fclose(fileHandle);
    TRACE(("load15Flt3d3: done"));
}

void drawWorldObject(int shapeId, long worldX, long worldY, int altitude, int param_5, int param_6, int param_7, int scaleShift)
{
    int p;
    int a;
    long c;
    long e;
    int f;
    int g;

    a = shapeDataOffset(shapeId);
    p = (byte_3C5A0 == 0) ? (int)off_38334 : (int)off_3834C;
    c = worldX - g_ViewX;
    e = worldY + g_ViewY - 0x01000000L;
    f = altitude - g_viewZ;
    if ((keyValue & 0x80) != 0) {
        c += g_ViewX - dword_3B1FE;
        e += dword_3B4D4 - g_ViewY;
        f += g_viewZ - word_3B4DE;
    }
    scaleShift = (byte_37C24 != 0) ? (scaleShift - 2) : (scaleShift - 3);
    if (scaleShift > 0) {
        shiftLongLeftInPlace(scaleShift, &c);
        shiftLongLeftInPlace(scaleShift, &e);
        f <<= (char)scaleShift;
    }
    if (scaleShift < 0) {
        *(char *)&g = -scaleShift;
        shiftLongRightInPlace(g, &c);
        shiftLongRightInPlace(g, &e);
        f >>= (char)g;
    }
    if ((long)(int)labs(c) < (long)0x7FFF) {
        if ((long)(int)labs(e) < (long)0x7FFF) {
            setViewPosition(0, 0, -f);
            word_3C16C = 1;
            projectSceneObject(byte_228D0 + a, -param_5, param_6, param_7, (int)c, -(int)e, altitude != 0);
        }
    }
}

// ==== seg000:0xcb42 ====
void drawTargetView(int shapeId, int worldX, int worldY, int altitude, int param_5, int param_6, int param_7, int mode, int shift)
{
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
    char n;

    word_39402 = 1;
    if (mode == 1 && word_38FDC == 0 && *(char*)&gfxModeUnset != 0 && (frameTick & 3) != 0) {
        return;
    }

    g = shapeDataOffset(shapeId);
    if (byte_3C5A0 == 0) {
        *var_568 = 0;
    } else {
        *var_568 = 1;
    }

    if (mode < 2) {
        var_685 = 0;
        k = worldX - g_viewX_;
        l = worldY - g_viewY_;
        m = (altitude - g_viewZ) >> 5;
        b = computeBearing(k, -l);
        f = computeBearing(m, rangeApprox(k, l));
        c = rangeApprox(m, rangeApprox(k, l));

        if (mode == 1) {
            var_680 = c;
            var_682 = (c >> 4) + 0x190;
            var_683 = (var_682 << 5) / (c + 1);
            c = var_682 << 2;
            var_681 = b;
            var_684 = f;
        } else {
            var_683 = (var_680 << 5) / (c + 1);
            if (var_683 > 0x100) {
                var_683 = 0x100;
            }
            if (var_683 < 4) {
                var_683 = 4;
            }
            j = ((b - var_681) >> 5) * var_683;
            d = ((f - var_684) >> 5) * var_683;
            if (abs(j) > 0x1000) {
                return;
            }
            if (abs(d) > 0x1000) {
                return;
            }
            b = (j << 2) + var_681;
            f = (d << 2) + var_684;
            c = (var_682 << 5) / var_683 << 2;
        }

        i = cosMul(f, c);
        byte_3850E = 2;
        if (shift < 0) {
            byte_3850E = (uint8)(shift + 2);
            shift = 0;
        }
        k = sinMul(b, i) >> (char)shift;
        l = -(cosMul(b, i)) >> (char)shift;
        m = sinMul(f, c) >> (char)shift;
    } else {
        k = (worldX - g_viewX_) << 4;
        l = (worldY - g_viewY_) << 4;
        m = (altitude - g_viewZ) >> 1;
        var_681 = g_ourHead;
        var_684 = word_38FCE;
        var_685 = g_ourRoll;
        var_683 = 0x20;
        byte_3850E = 2;
    }
    if (mode == 1 || mode == 3) {
        a = (int)((long)var_683 * (long)((int)var_684 >> 2) >> 5) + 0x9c;
        if (a < 0x80 || (int)var_684 < (int)0xe800) {
            a = 0x80;
        }
        if (a > 0xb8 || (int)var_684 > 0x1800) {
            a = 0xb8;
        }
        *(var_568 + 2) = (int)byte_3419A[0];
        if (a != 0x80) {
            fillSpanRect(var_568, 0xe8, 0x80, 0x130, a);
        }
        h = byte_228D0[0x2f];
        e = (int)(signed char)byte_3BFA4[shapeId & 0x7f];
        if (e & 0x10) {
            h = 8;
        }
        n = (char)(e & 0xf);
        if (n == 0xc || n == 9 || n == 0xb) {
            h = 1;
        }
        *(var_568 + 2) = (int)byte_3419C[h];
        if (a != 0xb8) {
            fillSpanRect(var_568, 0xe8, a, 0x130, 0xb8);
        }
    }

    var_316 = 1;
    setup3DTransform((char*)var_568, -var_681, var_684, var_685, 0, 0, 0, 0);
    projectSceneObject(byte_228D0 + g, -param_5, param_6, param_7, k, -l, m);
    rasterize3DWorld();
    var_316 = 0;

    if (mode == 1) {
        strcpy(strBuf, (char*)aBrg);
        strcat(strBuf, itoa((unsigned int)var_681 / 0xb6, unk_3C030, 10));
        drawStringActivePage(strBuf, 0xf8, 0xb0, 0xf);
    }
    byte_3850E = 0;
}

// ==== seg000:0xcf32 ====
int shapeDataOffset(int param)
{
    if (param & 0x100) {
        return buf3d3[param & 0x7f];
    }
    return (int)(&byte_2D6A4[((int *)flt15_buf1)[param]] - byte_228D0);
}

// ==== seg000:0xcf64 clamp ====
int clampRange(int value, int minVal, int maxVal) {
    if (value > maxVal) {
        return maxVal;
    }
    if (value >= minVal) {
        return value;
    }
    if (value <= -0x4000) {
        return maxVal;
    }
    return minVal;
}

// ==== seg000:0xcf8e ====
int clampValue(int value, int min, int max) {
    if (value > max) {
        return max;
    }
    if (value < min) {
        return min;
    }
    return value;
}

// ==== seg000:0xcfa6 ====
int rangeApprox(int dx, int dy) {
    long a;
    dx = abs(dx);
    dy = abs(dy);
    if (dx > dy)
        a = (long)(dy >> 1) + (long)dx;
    else
        a = (long)(dx >> 1) + (long)dy;
    if (a > 0x7FFF) a = 0x7FFF;
    return (int)a;
}

// ==== seg000:0xd008 ====
int computeBearing(int deltaX, int deltaY) {
    int p, a;
    long b;
    int d, e, f;

    if (deltaX == 0) {
        if (deltaY > 0) return 0;
        return BEARING_SOUTH;
    }
    if (deltaY == 0) {
        if (deltaX > 0) return BEARING_EAST;
        return BEARING_WEST;
    }
    if (abs(deltaX) > abs(deltaY)) {
        b = (long)abs(deltaY) << 0xe;
        d = abs(deltaX);
        e = 1;
    }
    else {
        b = (long)abs(deltaX) << 0xe;
        d = abs(deltaY);
        e = 0;
    }
    f = b / (long)d;
    p = ((0x2800L - (((long)abs(0x1333 - f) * 0xB00L) >> 0xe)) * (long)f) >> 0xe;
    if (deltaX > 0) {
        if (deltaY > 0)
            a = e ? BEARING_EAST - p : p;
        else
            a = e ? p + BEARING_EAST : BEARING_SOUTH - p;
    }
    else {
        if (deltaY > 0)
            a = e ? p + BEARING_WEST : -p;
        else
            a = e ? BEARING_WEST - p : p + BEARING_SOUTH;
    }
}

// ==== seg000:0xd178 sinMul ====
int sinMul(int angle, int value) {
    return fixedMulQ14(sine(angle), value);
}

// ==== seg000:0xd190 cosMul ====
int cosMul(int angle, int value) {
    return sinMul(angle + 0x4000, value);
}

// ==== seg000:0xd1c8 ====
int signOf(int value) {
    if (value == 0) {
        return 0;
    }
    if (value > 0) {
        return 1;
    }
    return -1;
}

void seedRng(void) {
    if (word_330BE == 0) {
        var_686 = getTimeOfDay();
    }
    srand(var_686);
}

// ==== seg000:0xd200 randomRange ====
int randomRange(int maxVal) {
    return (int)(((long)rand() * (long)maxVal) >> 15);
}

// ==== seg000:0xd21e ====
int16 readAxisInput(int16 axisIdx)
{
    int16 p;

    if (word_330BE) {
        p = 0;
    } else {
        p = ((commData->setupUseJoy) ? misc_readJoystick(axisIdx) : 0) + word_38606[axisIdx];
    }
    return p;
}
