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

char a_3d3[] = ".3D3";
char aRb[] = "rb";
char aOpenErrorOn_3d3[] = "Open Error on *.3D3";
char aBadObjFileFormat_[] = "Bad Obj file format.";
char aObjectDataTooBig_[] = "Object data too big.";
char aRb_0[] = "rb";
char aPhoto_3d3[] = "photo.3d3";
char aPleaseInsertF15DiskB[] = "Please insert F15 Disk B";
char aRb_1[] = "rb";
char aPhoto_3d3_0[] = "photo.3d3";
char aObjdataOverflow[] = "ObjData overflow";
char a_3dt[] = ".3dT";
char aRb_2[] = "rb";
char aOpenErrorOn_3dt[] = "Open Error on *.3DT";
char aBadTileFileFormat_[] = "Bad Tile file format.";
char aTooManyTiles_[] = "Too many tiles.";
char aTooMuchTileData[] = "Too much tile data";
char a_3dg[] = ".3dG";
char aRb_3[] = "rb";
char aBadGridFileFormat_[] = "Bad Grid file format.";
char a256pit_pic[] = "256pit.PIC";
char a256left_pic[] = "256Left.Pic";
char a256right_pic[] = "256Right.Pic";
char a256rear_pic[] = "256Rear.Pic";
char aLeft_pic[] = "Left.Pic";
char aRight_pic[] = "Right.Pic";
char aSecond_Target[] = "Second. target";
char aPrimaryTarget_0[] = "Primary target";
char aStallWarning[] = "stall warning";
char aAccel[] = "ACCEL";
char aTraining[] = "TRAINING";
char aAutopilot[] = "AUTOPILOT";
char aPressAnyKeyToP[] = "Press any key to play";
char aTrackcam[] = "TrackCam ";
char aAhead[] = "Ahead";
char aRear[] = "Rear";
char aRight[] = "Right";
char aLeft[] = "Left";
char a_3d3_0[] = ".3D3";
char aRb_4[] = "rb";
char aOpenErrorOn_3d3_0[] = "Open Error on *.3D3";
char a15flt_xxx[] = "15FLT.xxx";
