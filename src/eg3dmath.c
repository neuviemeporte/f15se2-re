/*
 * eg3dmath.c - fixed-point math primitives for the egame renderer.
 *
 * Hand-written ASM original: egcode.asm (sine/cosine/fixedMulQ14/shiftLong*).
 * These were never compiled C, so this is a functionally-equivalent
 * reimplementation rather than a 1:1 reconstruction.
 *
 * Angles are 16-bit: the high byte indexes the 256-entry sine table, the low
 * byte is the fraction used for linear interpolation between adjacent entries.
 * The table (g_angleLut, sin(i*2*pi/256) scaled to +-0x7FFF) lives in egdata.c
 * and is shared with the rest of the game; the ASM lookupSine/lookupCosine read
 * the very same table.
 */
#include "egtypes.h"
#include "egcode.h"
#include "egdata.h"
#include "inttype.h"

/* sin/cos via table lookup + linear interpolation.
 * Mirrors sineLookup: idx = angle>>8, frac = angle&0xFF, then
 *   result = lut[idx] + round((lut[idx+1] - lut[idx]) * frac / 256). */
static int sineInterp(unsigned angle)
{
    int idx = (angle >> 8) & 0xFF;
    int frac = angle & 0xFF;
    int v0 = g_angleLut[idx];
    int v1 = g_angleLut[idx + 1];
    long step = (long)(v1 - v0) * frac;
    return v0 + (int)((step + 0x80) >> 8);
}

int sine(int angle)
{
    return sineInterp((unsigned)angle);
}

int cosine(int angle)
{
    /* cos(x) = sin(x + 90deg); a quarter turn is 0x4000 in 16-bit angle space. */
    return sineInterp((unsigned)angle + 0x4000);
}

/* Q15-style fixed multiply: returns round((a*b) >> 15).
 * Replicates the exact shl/rcl/adc sequence of the ASM fixedMulQ14:
 *   P = a*b; result = (P>>15) + (bit14 of P). */
int fixedMulQ14(int a, int b)
{
    long p = (long)a * (long)b;
    return (int)((p >> 15) + ((p >> 14) & 1L));
}

/* In-place 32-bit shifts (pascal: args pushed left-to-right, callee cleans up).
 * The ASM dispatches to the MSC long-shift helpers; >>= on a signed long is the
 * arithmetic shift those helpers perform. */
void pascal shiftLongLeftInPlace(int count, long *ptr)
{
    *ptr <<= count;
}

void pascal shiftLongRightInPlace(int count, long *ptr)
{
    *ptr >>= count;
}
