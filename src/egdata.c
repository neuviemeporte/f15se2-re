/*
 * Variables are kept in the SAME ORDER as they appear in egslots.asm so the
 * produced binary stays close to the original layout and is easy to align
 * later.
 */
#include "egame.h"
#include "inttype.h"

int16 gfxModeUnset = 0;
int16 f15DgtlResult = 0;
uint8 byte_32933 = 0;
uint8 exitCode = 0x81;
int allocSize = 0;
int16 waypointIndex = 0;
int16 missileSpecIndex = 0;
int16 g_autopilotAltitude = 0;
int16 word_330BC = 0;
int16 word_330C2 = 1;
int16 g_frameRateScaling = 4;
int16 word_336E6 = (int16)0xFFFF;
int16 frameTick = 0;
int16 word_336EA = 0;
int16 word_336F2 = (int16)0xFFFF;
int16 word_336F4 = (int16)0xFFFF;
int16 word_336FC = (int16)0xFFFF;
int16 word_336FE = 4;
int16 word_3370A = 1;
int16 word_3370C = (int16)0xFFFF;
int word_3370E = 0;

/* 3D loader size/sign scalars (separated by buf/matrix arrays that
 * stay in asm). word_33DD0 and sizes3dt are arrays - left in asm. */

size_t size3d3 = 1;
unsigned int size3d3_2 = 0;
int16 sign3dt = 0x3131;
size_t size3d3_4 = 0;
size_t size3d3_5 = 0;
size_t size3d3_6 = 0;
size_t size3d3_3 = 0;
int16 sign3dg = 0x3232;
