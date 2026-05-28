/*
 * ststub.c - start.exe-specific data variable stubs for NO_ASM build.
 * These are normally defined in start_rc.asm's data segment.
 */

#include "inttype.h"
#include "pointers.h"

/* Graphics/terrain buffers */
uint16 gridBuf1[1];
uint16 gridBuf2[1];
uint16 gridBuf3[1];
uint16 gridBuf4[1];
uint16 gridBuf5[1];
uint16 page1Ptr = 0;
uint16 terrainBuf1[1];
uint16 terrainBuf2[1];
uint16 terrainBuf3[1];
uint16 terrainBuf4[1];
uint16 terrainBuf5[1];
uint16 terrainPtrUnk[1];
uint16 terrainIdxBuf[1];
uint16 planes[1];

/* Misc game state */
int16 *bufPtr = 0;
int far *needSplash = 0;
int far *gfxModeSetPtr = 0;
uint8  joyReady[2] = {0};
uint8  intRegs[20];
uint16 selectedPilotIdx = 0;
uint8  hallfameBuf[1];

/* Unnamed/unresearched variables */
uint8  byte_1B100 = 0;
uint8  byte_1B0FF = 0;
uint16 word_19294 = 0;
uint16 word_192EC = 0;
uint8  stru_18FC0[1];
uint8  byte_192FC = 0;
uint16 target2[1];
uint16 targets[1];
uint16 word_192A4 = 0;
uint8  stru_1892E[1];
uint16 word_192F4 = 0;
uint16 word_19324 = 0;
uint16 off_19304[1];
uint16 off_19314[1];
uint16 word_1B960 = 0;
uint8  scenarioFoundArr[1];
uint8  difficultySaved = 0;
uint8  todayMissStrBuf[64];
uint16 readItemSize = 0;
uint16 wldReadBuf5Size = 0;
uint16 wldReadBuf1[1];
uint16 wldReadBuf2[1];
uint16 wldReadBuf3[1];
uint16 wldReadBuf4[1];
uint16 wldReadBuf6[1];
uint16 wldReadBuf7[1];
uint16 wldReadBuf8[1];
uint16 wldReadBuf9[1];
uint16 wldReadBuf10[1];
uint16 wldReadBuf11[1];
uint16 wldOffsets[1];
