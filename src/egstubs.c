#include "egame.h"
#include "inttype.h"
#include "struct.h"
#include "comm.h"
#include "pointers.h"
#include <stdio.h>
#include <dos.h>

char far byte_228D0[] = { 0 };
unsigned char far byte_228FF[] = { 0 };
char far byte_2D6A4[] = { 0 };
int16 word_328B2 = 0;
uint8 unk_328B6[] = { 0 };
char aMsRunTimeLibraryCopyr[] = { 0 };
uint8 unk_328F0[] = { 0 };
uint8 aRegn_xxx[] = { 0 };
char *regnStr = NULL;
int loadF15DgtlBin() { return 0; }
void setupOverlaySlots(uint16 addr) { }
void callLoad3DAll() { }

// === Joystick/Input Stubs ===
int initJoystickCalibration() { return 0; }
void seedJoystickBaseline() { }
int readCalibratedJoystick() { return 0; }
void readJoystickHardware() { }
void computeJoystickAxis() { }
int far restoreJoystickData(uint8 FAR *ptr) { return 0; }
void far copyJoystickData(uint8 FAR *ptr) {}

// === Interrupt/Handler Stubs ===
void installCBreakHandler() {}
void restoreCBreakHandler() { }
int setInt9Handler() { return 0; }
void runGameLoop() { }
void restoreTimerIrqHandler() { }

// Stubs matching undefined references from egmain.c
void setupDac() {}
int gfx_getModeflag() { return 0; }

// Dummy global data placeholders to satisfy linker references
struct GameComm far *commData = 0;

int getTimeOfDay(void)
{
    return 0;
}

/* === Auto-generated link stubs (undefined references in egame build) === */

/* --- data globals --- */
uint8 aA[1];
uint8 aArmed[1];
uint8 aEmpty_5950[1];
uint8 aFlogger[1];
char aMig23[1];
struct AircraftType aircraftTypes[1];
uint8 aNc_xxx[] = "nc.xxx";
struct Weapon aNone[1];
uint8 aNotAvailable[1];
int16 asc_33744[1];
unsigned int buf3d3[1];
uint8 byte_3419A[1];
uint8 byte_3419C[1];
uint8 byte_3419F[1];
uint8 byte_37C24;
uint8 byte_3790C[1];
int g_ourHead;
int g_ourPitch;
int g_ourRoll;
int16 g_viewZ;
int16 byte_383E5;
char byte_3850E;
uint8 byte_38F8D[1];
struct Unknown3B4E6Record8 byte_3B4E6[1];
uint8 byte_3B7EE;
uint8 byte_3B7EF;
uint8 byte_3B7F0;
uint8 byte_3B7F1[1];
uint8 byte_3BF93[1];
char byte_3C16E[1];
uint8 joyAxes[1];
int16 lineX1;
int16 lineX2;
int16 lineY1;
int16 lineY2;
unsigned int matrix3dt[5][32];
struct Matrix3dEntry7 *matrix3dt_2[5][32];
struct Missile missiles[20];
struct MissileSpec missleSpec[1];
int16 *off_38334;
int16 *off_3834C;
int16 *off_38364;
union REGS regs;
struct Sam sams[39];
char *scenarioPlh[1];
size_t size3d3_7;
unsigned int sizes3dt[1];
char strBuf[1];
struct Projectile stru_335C4[1];
struct ViewSnapshot stru_3A95A[1];
struct MapTarget g_planes[1];
/* --- data referenced by updateThreatTargeting (egcombat.c) --- */
uint8 aMisses[] = " misses ";
uint8 aDestroyedBy[] = " destroyed by ";
uint8 aDestroyedBy_0[] = " destroyed by ";
uint8 aGroundImpact[] = " ground impact";
uint8 aHitBy[] = "Hit by ";
uint8 aHitBy_0[] = " hit by ";
uint8 aIneffective[] = "Ineffective";

/* --- data referenced by drawHudWorldOverlay (egui.c) --- */
char aMap[1];
uint16 uvar_547;
int16 var_593;
char unk_34121[1];
int16 unk_38128[1];
char unk_3C030[1];
int16 *var_134;
int16 var_135;
int16 var_141;
uint8 var_190;
int16 var_198;
char far *var_200;
int16 var_202;
int16 var_203;
int16 var_204[4];
uint8 var_215;
uint8 var_217;
int16 var_220;
int16 var_224;
int16 var_225;
int16 var_226;
int16 var_227;
int16 var_257;
int16 var_258;
int16 var_279;
int16 var_282;
uint8 var_316;
int16 var_349;
int16 var_350;
uint16 var_383;
int8 var_456;
int16 var_47;
int16 var_48;
int16 var_49;
int16 var_542;
char var_543;
int16 var_544;
int16 var_545;
int16 var_547;
uint16 var_548;
int16 var_549;
char var_550;
int16 *var_564;
int16 *var_565;
int16 *var_566;
char *var_567;
int16 *var_568;
uint8 var_594;
int16 var_598;
int16 var_599;
int16 var_600;
uint8 var_730;
uint16 var_810;
uint16 var_811;
int8 var_83[1];
struct Waypoint waypoints[1];
int16 word_3298C;
int16 word_3298E;
int16 word_32990;
int16 g_missionStatus;
struct MapEvent mapEvents[1];
int16 word_339B4[1];
int16 word_339F4;
int16 word_33B9C[64];
int16 word_33BA2[64];
int16 word_33BAE[64];
int word_33DD0[1];
int16 word_34186[64];
int16 word_3419C[1];
int16 word_34276;
int16 word_34684[64];
int16 word_34686[64];
int16 word_34868;
int16 word_34A4C;
int16 word_37348[64];
int16 word_3734A[64];
int16 word_3755D;
int16 word_3755F;
int16 word_37561;
int16 word_37563;
unsigned int word_380D0;
int16 word_380D8;
int16 word_38202;
int16 word_38606[64];
int16 word_3AA5C[64];
int16 word_3B7E0;
int16 word_3B7E2;
int16 word_3B7E4;
int16 word_3B7E8;
struct Matrix3dEntry7 *word_3B7EC;
struct Matrix3dEntry7 *word_3C5A8;
int16 word_3C69E;

/* --- functions declared in egame.h --- */
int far advanceModelPointerLod() { return 0; }
int far buildRotationMatrixFar(int16* param_1, int param_2, int param_3, int param_4) { return 0; }
int far clipAndRasterizeEdge() { return 0; }
void closeFile(int arg_0) { }
int cosine(int) { return 0; }
int createFile(const char *arg_0, int arg_1) { return 0; }
int __cdecl drawCenteredLabelBox(int, char *) { return 0; }
int far drawClipLineGlobal() { return 0; }
int far drawModelDisplayList() { return 0; }
int far drawPolygonOutline(int, int, int*, int) { return 0; }
int far fillSpanRect(int16* param_1, int param_2, int param_3, int param_4, int param_5) { return 0; }
int fixedMulQ14(int arg_0, int arg_2) { return 0; }
int far flushSpanDirtyRect() { return 0; }
int far multiplyMatrix3x3Far(int param_1, int param_2, int16* param_3) { return 0; }
int __cdecl openFile(const char *, int) { return 0; }
void picBlit(int handle, int unk) {}
int far projectModelEdgesFar() { return 0; }
void far projectSceneObject(char *, int, int, int, int, int, int) {}
int readAxisInput(int param_1) { return 0; }
int readFile1(int arg_0, int arg_1, int arg_2) { return 0; }
int readFile2(int arg_0, int arg_1, int arg_2, int arg_3) { return 0; }
int far resetScanlineSpans() { return 0; }
int far restoreInt9Handler() { return 0; }
void setTimerIrqHandler() { }
void pascal shiftLongLeftInPlace(int count, long *ptr) {}
void pascal shiftLongRightInPlace(int count, long *ptr) {}
int sine(int arg_0) { return 0; }
int far sub_1FEEC(int) { return 0; }
int far sub_202C7(int, int, int) { return 0; }
int far sub_2044A() { return 0; }
int far sub_20658() { return 0; }
void __cdecl __far sub_21A7E() {}
int writeFileAtRaw(int arg_0, int arg_1, int arg_2, int arg_3, int arg_4) { return 0; }
int far sub_202F6() { return 0; }

/* --- slot.h overlay jump stubs (egame doesn't link shared/ovlstub.c) --- */
int misc_jump_5b_getkey() { return 0; }
int misc_jump_5d_readJoy(int16 a) { return 0; }
int audio_jump_64(int16 a, int16 b) { return 0; }
int audio_jump_65(void) { return 0; }
int audio_jump_66(int a) { return 0; }
int audio_jump_68() { return 0; }
int audio_jump_69() { return 0; }
int audio_jump_6d(int a) { return 0; }

/* projectObjects: eg3dview.c calls the 8-int form; eg3dproj.c defines a
   different (int,int,long,long,long) overload. Stub the called form. */
void projectObjects(int a,int b,int c,int d,int e,int f,int g,int h) {}

/* --- Data symbols referenced by stepFlightModel (moved from egame_rc.asm
   to C in egflight.c). The DOS build defines these in egame_rc.asm's DATA
   segment; the 64-bit stub build needs C definitions to link. --- */
uint8 byte_37FEC[128];     /* indexed by (roll>>8)&0x7f */
char  byte_380DD;
uint8 joyAxes_2[1];
uint8 unk_38092[64];
uint8 unk_38FD0[32];       /* g-meter string buffer */
int16 word_38080;
int16 word_38084;
int16 word_3808C;
int16 word_38090;
int16 word_3809A;
int16 word_3809C;
int16 word_380A0;
int16 word_380A2;
int16 word_380A4;
int16 word_380A6;
int16 word_380AA;
int16 word_380AC;

int audio_jump_6a(int knots, int thrust) { return 0; }
