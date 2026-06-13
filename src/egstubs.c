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
int16 gfxModeUnset = 0;
int16 f15DgtlResult = 0;
char *regnStr = NULL;
int16 word_330B4 = 0;
int loadF15DgtlBin() { return 0; }
void setupOverlaySlots(uint16 addr) { }
void countermeasures(int kind) { }
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
struct Game far *gameData = 0;

int getTimeOfDay(void)
{
    return 0;
}

/* === Auto-generated link stubs (undefined references in egame build) === */

/* --- data globals --- */
char a0[1];
char a15flt_xxx[1];
char a256left_pic[1];
char a256pit_pic[1];
char a256rear_pic[1];
char a256right_pic[1];
uint8 aA[1];
char aAccel[1];
char aAhead[1];
uint8 aArmed[1];
char aAt[1];
char aAutomaticLandi[1];
char aAutopilot[1];
char aBadGridFileFormat_[1];
char aBadObjFileFormat_[1];
char aBadTileFileFormat_[1];
uint8 aBrakesOn[] = "Brakes on";
char aBrg[1];
char aCockpit_pic[1];
char aColon[1];
char aDash[1];
char aDot[1];
uint8 aEmpty_5950[1];
char aF15StrikeEagle[1];
char aFired[1];
uint8 aFiredBy[1];
uint8 aFiring[] = " firing ";
uint8 aFlogger[1];
uint8 aG[] = "G";
char aGun[1];
char aKm[1];
uint8 aLandingGearRaised[] = "Landing gear raised";
char aLeft[1];
char aLeft_pic[1];
char aMig23[1];
char aMissileLock[1];
uint8 aNc_xxx[] = "nc.xxx";
uint8 aNone[1];
uint8 aNotAvailable[1];
char aObjdataOverflow[1];
char aObjectDataTooBig_[1];
char aOnPatrol[1];
char aOpenErrorOn_3d3[1];
char aOpenErrorOn_3d3_0[1];
char aOpenErrorOn_3dt[1];
char aPhoto_3d3[1];
char aPhoto_3d3_0[1];
char aPleaseInsertF15DiskB[1];
char aPressAnyKeyToP[1];
char aPrimaryTarget_0[1];
char aRange[1];
char aRb[1];
char aRb_0[1];
char aRb_1[1];
char aRb_2[1];
char aRb_3[1];
char aRb_4[1];
char aReadyForTakeof[1];
char aRear[1];
char aRear_pic[1];
char aRight[1];
char aRight_pic[1];
char aSafeLanding[1];
char aSecond_Target[1];
char aStallWarning[1];
char aTakingOff[1];
char aTooManyTiles_[1];
char aTooMuchTileData[1];
char aTrackcam[1];
char aTraining[1];
char aWeaponsRepleni[1];
uint8 a_[] = ".";
char a_3d3[1];
char a_3d3_0[1];
char a_3dg[1];
char a_3dt[1];
int allocSize;
int16 asc_33744[1];
uint8 buf1_3dg[1];
uint8 buf2_3dg[1];
uint8 buf3_3dg[1];
unsigned int buf3d3[1];
uint8 buf3d3_1[1];
uint8 buf3d3_2[1];
uint8 buf3d3_3[1];
uint8 buf4_3dg[1];
uint8 buf_3dt[1];
uint8 byte_32933;
uint8 byte_34197;
uint8 byte_3419A[1];
uint8 byte_3419C[1];
uint8 byte_3419F[1];
uint8 byte_378EE;
uint8 byte_3790C[1];
uint8 byte_37C24;
uint8 byte_37C2F;
int16 byte_383E5;
char byte_3850E;
uint8 byte_38F8C;
uint8 byte_38F8D[1];
char byte_3995A;
uint8 byte_3A900[1];
uint8 byte_3AFAC[1];
uint8 byte_3B23E[1];
struct Unknown3B4E6Record8 byte_3B4E6[1];
uint8 byte_3B7EE;
uint8 byte_3B7EF;
uint8 byte_3B7F0;
uint8 byte_3B7F1[1];
uint8 byte_3B7FC[1];
uint8 byte_3BE3E[1];
uint8 byte_3BE80[1];
uint8 byte_3BEC4[1];
uint8 byte_3BED8[1];
uint8 byte_3BF93[1];
uint8 byte_3BFA4[UNIT_STATE_COUNT];
uint8 byte_3C02A[1];
char byte_3C16E[1];
char byte_3C5A0;
uint8 far *dword_38FE2;
int32 dword_3B1FE;
int32 dword_3B4D4;
int32 g_ViewX;
int32 g_ViewY;
int32 dword_3C01C;
int32 dword_3C024;
uint8 exitCode;
uint8 far *farPointer;
FILE *fileHandle;
int16 flagFarToNear;
uint8 flt15_buf1[1];
uint8 flt15_buf2[1];
size_t flt15_size;
int16 flt15_word1;
int16 frameTick;
int16 gfxBufPtr;
uint8 hercFlag;
uint8 joyAxes[1];
int16 keyScancode;
int16 keyValue;
int16 lineX1;
int16 lineX2;
int16 lineY1;
int16 lineY2;
unsigned int matrix3dt[5][32];
struct Matrix3dEntry7 *matrix3dt_2[5][32];
int16 missileSpecIndex;
struct Missile missiles[20];
struct MissileSpec missleSpec[1];
int16 *off_38334;
int16 *off_3834C;
int16 *off_38364;
int16 g_playerPlaneFlags;
union REGS regs;
struct Sam sams[39];
char *scenarioPlh[1];
int16 sign3d3;
int16 sign3dg;
int16 sign3dt;
size_t size3d3;
unsigned int size3d3_2;
size_t size3d3_3;
size_t size3d3_4;
size_t size3d3_5;
size_t size3d3_6;
size_t size3d3_7;
unsigned int sizes3dt[1];
char strBuf[1];
char string_3C04A[80];
struct MissionTableEntry stru_33402[1];
struct Projectile stru_335C4[1];
struct ViewSnapshot stru_3A95A[1];
struct MapTarget g_planes[1];
struct SimObject stru_3B202[1];
struct SimObject stru_3B208[1];
/* --- data referenced by drawHudWorldOverlay (egui.c) --- */
char aAt_0[] = " at ";
uint8 aDestroyedByGun[] = " destroyed by gunfire";
uint8 aDestroyedByG_0[] = " destroyed by gunfire";
uint8 aHitByGunfire[] = "Hit by gunfire";
uint8 aNoTarget[] = "No Target";
uint8 aNoTarget_0[] = "No Target";
uint8 aPrimaryTarget[] = "Primary Target";
uint8 aSecondaryTarget[] = "Secondary Target";
uint8 aLong[] = "Long";
uint8 aMedium[] = "Medium";
uint8 aShort[] = "Short";
uint8 aRangeRadar[] = " range radar";
uint8 aDetailLevel[] = "Detail Level ";
uint8 aKybdSensitivit[] = "Kybd Sensitivity";
uint8 aMemoryAvailabl[] = "Memory Available:";
uint8 aJiffiesFrame[] = "Jiffies/Frame ";
uint8 aSounds[] = "Sounds ";
uint8 aDirector[] = "Director ";
uint8 aOff[] = "off";
uint8 aWaypointPrimar[] = "Waypoint: Primary Target";
uint8 aWaypointSecond[] = "Waypoint: Secondary Target";
uint8 aWaypointFriend[] = "Waypoint: Friendly Airbase";
uint8 aAutopilotOff[] = "Autopilot off";
uint8 aAutopilotOn[] = "Autopilot on";
uint16 uvar_547;
int16 var_593;
int16 var_675;
int16 var_676;
int16 var_677;
int word_39606;
int16 word_3BEBC;
int16 word_3BEC8;
int16 word_3BECE;
char tempString[80];
uint8 unk_33E1A[1];
char unk_34121[1];
int16 unk_3806E[1];
int16 unk_380B6[1];
int16 unk_38128[1];
int16 unk_3A948[1];
uint8 unk_3BF95;
int16 unk_3BF96;
int16 unk_3BF98;
char unk_3C030[1];
int16 *var_134;
int16 var_135;
int16 var_141;
uint8 var_190;
int16 var_194;
int16 var_195;
int16 var_196;
int16 var_197;
int16 var_198;
char far *var_200;
int16 var_202;
int16 var_203;
int16 var_204;
uint8 var_215;
int16 var_216;
uint8 var_217;
int16 var_218;
int16 var_219;
int16 var_220;
int16 var_224;
int16 var_225;
int16 var_226;
int16 var_227;
int16 var_255;
int16 var_256;
int16 var_257;
int16 var_258;
int16 var_259;
int16 var_260;
int16 var_261;
int16 var_279;
int16 var_282;
int16 var_315;
uint8 var_316;
int16 var_349;
int16 var_350;
uint16 var_383;
int8 var_456;
int16 var_47;
int16 var_48;
int16 var_49;
int16 var_524;
int16 var_525;
int16 var_526;
int16 var_527;
int16 var_528;
int16 var_529;
int16 var_542;
char var_543;
int16 var_544;
int16 var_545;
int16 var_547;
uint16 var_548;
int16 var_549;
char var_550;
int16 var_552;
int16 *var_564;
int16 *var_565;
int16 *var_566;
int16 *var_568;
int16 var_569;
int16 var_570;
int16 var_571;
int16 var_572;
int16 var_573;
int16 var_574;
int16 var_575;
int16 var_576;
int16 var_577;
int16 var_578;
int16 var_579;
int16 var_580;
int16 var_581;
int16 var_582;
int16 var_583;
int16 var_584;
uint8 var_585;
uint8 var_586;
int16 var_588;
int16 var_589;
int16 var_590;
int16 var_591;
int16 var_592;
uint8 var_594;
int16 var_595;
int16 var_596;
int16 var_597;
int16 var_598;
int16 var_599;
int16 var_600;
int16 var_654;
int16 var_657;
int16 var_658;
int16 var_659;
int16 var_660;
int16 var_661;
int16 var_662;
int16 var_663;
int16 var_664;
int16 var_665;
int16 var_666;
int16 var_556;
int16 var_667;
int16 var_668;
int16 var_669;
int16 var_670;
int16 var_671;
int16 var_672;
int16 var_673;
int16 var_674;
int16 var_680;
int16 var_681;
int16 var_682;
int16 var_683;
int16 var_684;
int16 var_685;
int16 var_686;
uint8 var_730;
uint16 var_810;
uint16 var_811;
int8 var_83[1];
int16 waypointIndex;
struct Waypoint waypoints[1];
int16 word_3298A;
int16 word_3298C;
int16 word_3298E;
int16 word_32990;
int16 word_32A34;
int16 word_33096;
int16 word_33098;
int16 word_3309C;
int16 word_3309E;
int16 g_autopilotAltitude;
int16 g_missionStatus;
int16 word_330BA;
int16 word_330BC;
int16 word_330BE;
int16 word_330C2;
int16 g_frameRateScaling;
int16 word_333D2;
int16 word_333D4;
int16 word_333D8;
int16 word_333DA;
int16 word_33442;
int16 word_336E4;
int16 word_336E6;
int16 word_336EA;
int16 word_336EC;
int16 word_336EE;
int16 word_336F0;
int16 word_336F2;
int16 word_336F4;
int16 word_336F6;
int16 word_336F8;
int16 word_336FA;
int16 word_336FC;
int16 word_336FE;
int16 word_33700;
int16 word_33702;
int16 word_33704;
int16 word_33706;
uint16 word_33708;
int16 word_3370A;
int16 word_3370C;
int word_3370E;
int16 word_33710;
int16 word_33712;
int16 word_33714;
int16 word_3374A;
int16 word_339B4[1];
int16 word_339F4;
int16 word_33B74;
int16 word_33B86;
int16 word_33B9C;
int16 word_33BA2;
int16 word_33BAE;
int word_33DD0[1];
int16 word_3401A;
int16 word_34186;
int16 word_3419C[1];
int16 word_34276;
int16 word_34684;
int16 word_34686;
int16 word_34868;
int16 word_34A4C;
int16 word_36B86;
int16 word_37348;
int16 word_3734A;
int16 word_3755D;
int16 word_3755F;
int16 word_37561;
int16 word_37563;
int g_ourHead;
int g_ourPitch;
int g_ourRoll;
int16 g_viewZ;
unsigned int word_380D0;
int16 word_380D8;
int16 word_38126;
int16 word_38152;
int16 word_38202;
int16 word_383AE;
int16 word_383CC;
int16 word_383F2;
int16 word_383F4;
int16 word_38606;
int16 word_38F70;
int word_38F72;
int16 word_38FC4;
int16 word_38FC6;
int16 word_38FC8;
int16 word_38FCC;
int16 word_38FCE;
int word_38FDC;
int16 word_38FDE;
int16 word_38FE0;
int16 word_38FE8;
int16 word_38FEA;
int16 word_38FEC;
int16 word_38FEE;
int16 word_38FF6;
int16 word_38FF8;
int16 word_38FFA;
int16 word_38FFC;
int16 word_39200;
int16 word_39402;
int16 word_39604;
int16* word_39808;
int16 word_3995C;
int16 word_3A940;
int g_velocity;
int16 word_3A946;
int16 g_knots;
int16 word_3AA5C;
int16 word_3AF0C;
int16 word_3AFA4;
int16 word_3AFA8;
int16 word_3AFAA;
int16 word_3B0AC;
int16 word_3B144;
int16 word_3B146;
int16 g_playerTargetIndex;
int word_3B14A[1];
int16 word_3B14C;
int16 word_3B158;
int16 word_3B15A;
int16 word_3B15E;
int16 word_3B22C;
int32 word_3B22E;
int32 word_3B232;
int16 word_3B236;
int16 word_3B240;
int16 word_3B4D8;
int16 word_3B4DC;
int16 word_3B4DE;
int16 word_3B4E0;
int16 word_3B4E4;
int16 word_3B5D6;
int16 word_3B7E0;
int16 word_3B7E2;
int16 word_3B7E4;
int16 word_3B7E8;
struct Matrix3dEntry7 *word_3B7EC;
int16 word_3BE3C;
int16 word_3BE7E;
int16 word_3BE92;
int word_3BE94;
int16 word_3BE96;
int16 word_3BE98;
int16 word_3BE9C;
int16 word_3BEBE;
int16 g_viewX_;
int16 word_3BEC2;
int16 word_3BECC;
int16 g_viewY_;
int16 word_3BED2;
int16 word_3BED4;
int16 word_3BED6;
int16 word_3BF3C;
int16 word_3BF3E;
int16 g_gunHits;
int16 word_3BFA0;
int16 word_3BFA2;
int16 word_3C008;
int16 word_3C00C;
int16 word_3C014;
int16 word_3C016;
int16 word_3C018;
int16 word_3C01A;
int16 word_3C020;
int16 word_3C028;
int16 word_3C02C;
int16 word_3C02E;
int16 word_3C03A;
int16 word_3C03E;
int16 word_3C040;
int16 word_3C042;
int16 word_3C044;
int16 word_3C046;
int16 word_3C048;
int16 word_3C09A;
int16 word_3C09C;
int16 word_3C09E;
int16 word_3C0A0;
char* word_3C0A2[1];
int16 g_closestThreatIndex;
int16 word_3C16C;
int16 g_currentWeaponType;
int16 word_3C45E;
int16 word_3C5A2;
int16 word_3C5A6;
struct Matrix3dEntry7 *word_3C5A8;
int16 word_3C5AA;
int16 word_3C5AC;
int16 word_3C5AE;
int16 word_3C5B0;
int16 word_3C5B2;
int16 word_3C5B4;
int16 word_3C5B6;
int16 word_3C69C;
int16 word_3C69E;
int16 word_3C6A2;
int16 word_3C6A4;
int16 word_3C6AA;
int16 word_3C6AC;
int word_3C6AE;
int16 word_3C8B6;
int16 word_3B4D2;
int16 word_3C00A;
int16 word_3C8B2;

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
void drawModelPoint() { }
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
void redrawTacMap(int, int) { }
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
void updateThreatTargeting() { }
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
uint8 byte_37F98;
uint8 byte_37F99;
uint8 byte_37FEC[128];     /* indexed by (roll>>8)&0x7f */
char  byte_380DD;
uint8 byte_3C6A0[1];
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
int16 g_setThrust;
int16 word_380E2;
int16 word_38602;
int   g_gees;
int16 word_3A8FE;
int16 g_thrust;
int16 word_3B204;
int16 word_3B206;
int16 word_3B4DA;
int   word_3C00E;
int16 word_3C5A4;

int audio_jump_6a(int knots, int thrust) { return 0; }
