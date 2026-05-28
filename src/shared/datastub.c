#include "inttype.h"
#include "pointers.h"

/* Game data variables - from start_rc.asm data segment */
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
uint8  hercFlag = 0;
uint16 commData = 0;
uint16 bufPtr = 0;
uint8  needSplash = 0;
uint16 gfxModeSetPtr = 0;
uint8  exitCode = 0;
uint8  joyReady = 0;
uint16 gameData = 0;
uint8  intRegs[20];
uint16 selectedPilotIdx = 0;
uint8  hallfameBuf[1];
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
int16  fileHandle = 0;
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

/* Misc/audio overlay slot stubs */
void far misc_jump_5a_keybuf(void) {}
void far misc_jump_5b_getkey(void) {}
void far misc_jump_5d_readJoy(void) {}
void far misc_jump_5e_clearKeyFlags(void) {}
void far audio_jump_64(void) {}
void far audio_jump_65(void) {}
void far audio_jump_67(void) {}
