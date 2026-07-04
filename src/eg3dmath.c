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
static int16 sineInterp(uint16 angle) {
    int16 idx = (angle >> 8) & 0xFF;
    int16 frac = angle & 0xFF;
    int16 v0 = g_angleLut[idx];
    int16 v1 = g_angleLut[idx + 1];
    int32 step = (int32)(v1 - v0) * frac;
    return v0 + (int16)((step + 0x80) >> 8);
}

int16 sine(int16 angle) {
    return sineInterp(angle);
}

int16 cosine(int16 angle) {
    /* cos(x) = sin(x + 90deg); a quarter turn is 0x4000 in 16-bit angle space. */
    return sineInterp((uint16)angle + 0x4000);
}

/* Q15-style fixed multiply: returns round((a*b) >> 15).
 * Replicates the exact shl/rcl/adc sequence of the ASM fixedMulQ14:
 *   P = a*b; result = (P>>15) + (bit14 of P). */
int16 fixedMulQ14(int16 a, int16 b) {
    int32 p = (int32)a * (int32)b;
    return (int16)((p >> 15) + ((p >> 14) & 1L));
}

/* In-place 32-bit shifts (pascal: args pushed left-to-right, callee cleans up).
 * The ASM dispatches to the MSC long-shift helpers; >>= on a signed int32 is the
 * arithmetic shift those helpers perform. */
void pascal shiftLongLeftInPlace(int16 count, int32 *ptr) {
    *ptr <<= count;
}

void pascal shiftLongRightInPlace(int16 count, int32 *ptr) {
    *ptr >>= count;
}
