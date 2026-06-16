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
int16 word_32A34 = 0;
int16 word_33442 = 0;
int16 word_336E4 = 4;
int16 word_336EC = 1;
int16 word_336EE = 0;
int16 word_336F6 = (int16)0xFFFF;
int16 word_336F8 = 1;
int16 word_336FA = 0;
int16 word_33700 = (int16)0xFFFF;
int16 word_33702 = 1;
int16 word_33704 = 1;
int16 word_33706 = 1;
uint16 word_33708 = 0;
int16 word_33710 = 1;
int16 word_33712 = 0;
int16 word_33714 = 0;
int16 word_3374A = 0;

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
int32 g_ViewX;
int32 g_ViewY;

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
uint8 aDestroyedByGun[] = " destroyed by gunfire";
uint8 aHitByGunfire[] = "Hit by gunfire";
uint8 aDestroyedByG_0[] = " destroyed by gunfire";
char aAt_0[] = " at ";
uint8 aPrimaryTarget[] = "Primary Target";
uint8 aSecondaryTarget[] = "Secondary Target";
uint8 aNoTarget[] = "No Target";
uint8 aNoTarget_0[] = "No Target";
char aMissileLock[] = "Missile Lock";
char aRange[] = "Range ";
char aDot[] = ".";
char aKm[] = " km";
char aBrg[] = "BRG ";
uint8 aStoresExhauste[] = "Stores exhausted";
uint8 aFlare[] = "Flare";
uint8 aChaff[] = "Chaff";
uint8 aReleased[] = " released";
uint8 asc_3373D[] = ":";
char aGun[] = "GUN:";
char aOnPatrol[] = " on patrol";
char aF15StrikeEagle[] = "F15 Strike Eagle";
char aAt[] = " at ";
char aSafeLanding[] = "Safe Landing";
char aReadyForTakeof[] = "Ready for takeoff";
char aWeaponsRepleni[] = "Weapons replenished";
char aAutomaticLandi[] = "Automatic Landing Engaged";
uint8 aLandingGearRaised[] = "Landing gear raised";
uint8 aBrakesOn[] = "Brakes on";
uint8 a_[] = ".";
uint8 aG[] = "G";
uint8 aFiring[] = " firing ";
uint8 aFiredBy[] = " fired by ";
char aDash[] = " - ";
char aTakingOff[] = " taking off";
char a0[] = ":0";
char aColon[] = ":";
char aFired[] = " fired";
char aCockpit_pic[] = "cockpit.PIC";
char aRear_pic[] = "Rear.Pic";

int16 word_38FC4;
int word_38FDC;
uint8 far *dword_38FE2;
FILE *fileHandle;
int16 word_38FEA;
int16 word_38FFA;
int16 g_playerPlaneFlags;
int16 word_39604;
int16 g_knots;
struct TargetSlot g_targetSlots[2];
int32 dword_3B1FE;
struct SimObject stru_3B202[20];
int32 dword_3B4D4;
int16 word_3B4DE;
int16 word_3B4E4;
int16 keyValue;
int16 word_3BE92;
int word_3BE94;
int16 word_3BEBE;
int16 g_viewX_;
int16 sign3d3;
int16 g_viewY_;
int16 word_3BED2;
int16 word_3C046;

/* Standalone scalars recovered from egslots.asm (2026-06-15 batches 1-3,
 * minus the word_3B7E0 nearest-tile struct). Each verified via grep '&sym'
 * to have no cross-symbol pointer-arithmetic dependency. */
uint8 byte_34197 = 6;
uint8 byte_37C2F = 0;
uint8 byte_38F8C;
int32 dword_3C01C;
int32 dword_3C024;
int16 flagFarToNear;
size_t flt15_size = 0;
int16 flt15_word1 = 0;
int16 g_closestThreatIndex;
int16 g_currentWeaponType;
int16 gfxBufPtr;
int g_gees;
int16 g_gunHits;
int16 g_thrust;
int g_velocity;
int16 keyScancode;
uint8 unk_3BF95;
int16 word_3298A = 0xC4;
int word_38F72;
int16 word_38FC6;
int16 word_38FCC;
int16 word_38FCE;
int16 word_38FDE;
int16 word_38FE0;
int16 word_38FE8;
int16 word_38FEC;
int16 word_38FEE;
int16 word_38FF6;
int16 word_38FF8;
int16 word_38FFC;
int16 word_39200;
int16 word_3995C;
int16 word_3A8FE;
int16 word_3A946;
int16 word_3AF0C;
int16 word_3AFA4;
int16 word_3AFA8;
int16 word_3AFAA;
int16 word_3B4D2;
int16 word_3B4DA;
int16 word_3B4DC;
int16 word_3BE3C;
int16 word_3BE7E;
int16 word_3BE96;
int16 word_3BEC2;
int16 word_3BECC;
int16 word_3BED4;
int16 word_3BED6;
int16 word_3BF3C;
int16 word_3BF3E;
int16 word_3BFA0;
int16 word_3BFA2;
int16 word_3C008;
int16 word_3C00A;
int16 word_3C00C;
int word_3C00E;
int16 word_3C014;
int16 word_3C016;
int16 word_3C018;
int16 word_3C01A;
int16 word_3C028;
int16 word_3C02C;
int16 word_3C02E;
int16 word_3C03E;

/* --- migrated scalars from egslots.asm (clean standalone, no EQU alias) --- */
int16 word_3401A = 0;
int16 word_38126 = 0x6C;
int16 word_38152 = 0;
char byte_3995A;
int16 word_3A940;
uint8 hercFlag;
int16 word_3C03A;
int16 word_3C040;
int16 word_3C09A;
int16 word_3C09E;
char byte_3C5A0;
int16 word_3C5A6;
int16 word_3C5AA;
int16 word_3C6A4;
int16 word_3C6AC;
int16 word_3C8B6;

/* --- migrated buffers/strings from egslots.asm (clean fixed-size runs) --- */
int16 word_3BE98;
uint8 buf2_3dg[0x200];
uint8 buf3_3dg[0x200];
uint8 buf4_3dg[0x200];
uint8 buf_3dt[4000];
uint8 byte_3BE3E[0x40];
uint8 byte_3BE80[0x10];
uint8 byte_3BED8[0x64];
char tempString[80];
char string_3C04A[80];

/* --- migrated standalone scalars from egslots.asm (2026-06-16 batch) ---
 * Each verified CLEAN: no &sym pointer-arithmetic dependency, no EQU alias
 * group, no bare PUBLIC, no cross-module bare EXTRN. */
int16 word_33096 = 4;
int16 word_33098 = 0x1388;
int16 word_3309C = 0x0C;
int16 word_3309E = 0x12;
int16 word_330BA = 1;
int16 word_330BE = 0;
int16 word_3C042;
int16 word_3C044;
int16 word_3C048;
int16 word_3C09C;
int16 word_3C0A0;
int16 word_3C45E;
int16 word_3C5A2;
int16 word_3C5A4;
int16 word_3C6AA;
int word_3C6AE;
int16 word_38FC8;
int16 word_3C8B2;

/* BSS arrays: word_3BE9C is a 16-word run (orig 2+30 bytes); word_3C0A2 is a
 * 100-entry near-pointer table (orig dw 64h dup). */
int16 word_3BE9C[16];
char *word_3C0A2[100];

/* --- migrated standalone scalars from egslots.asm (2026-06-16 batch 4) ---
 * Verified CLEAN: scalar reads/writes only (no &sym, no bare array-decay
 * pass-by-address), no foreign EQU alias, single mangled PUBLIC, no
 * cross-module bare EXTRN. */
int16 word_330B4 = 0x28A;
uint8 far *farPointer = 0;

/* --- migrated whole arrays from egslots.asm (2026-06-16 batch 4) ---
 * Contiguous fixed-size arrays (asm head + unlabelled tail bytes), sizes
 * match the address gap to the next symbol exactly. word_341DC/word_341FC
 * decay to word_3C69C/word_3C6A2 but the pointer walks stay bounded within
 * each array (max offset 8 and 24 of 16/32). Bytes reconstructed LE from the
 * asm db stream. */
int16 word_33B74[9] = { 0xFFFF, 1, 1, 0xFFFF, 0, 1, 0, 0xFFFF, 0 };
int16 word_33B86[11] = { 1, 1, 0xFFFF, 0xFFFF, 1, 0, 0xFFFF, 0, 0, 0xE000, 0xF000 };

/* --- migrated BSS scratch buffers from egslots.asm (2026-06-16 batch 5) ---
 * Self-contained `db N dup` runs (uninitialised / zero-filled). Each is used
 * only as a size-respecting fread/moveNearFar/indexed buffer (e.g.
 * moveNearFar(byte_3AFAC,0x100) matches its 0x100 dup). word_3AFA8's dead asm
 * `label word` alias was removed with byte_3AFAC (word_3AFA8 already lives in
 * C above). */
uint8 flt15_buf1[0x40];
uint8 flt15_buf2[0x1040];
uint8 buf3d3_1[0x96];
uint8 byte_3AFAC[0x100];
uint8 buf3d3_2[0x96];
uint8 buf3d3_3[0x96];

/* buf1_3dg: 16x16 grid, indexed col+(row<<4) (0..255), fread'd 0x100 — exactly
 * 0x100, the trailing asm `db ?` orphan byte stays in asm. byte_3BFA4: pinned
 * to [UNIT_STATE_COUNT] by egame.h, moveNearFar(,0x64) matches its 0x64 dup. */
uint8 buf1_3dg[0x100];
uint8 byte_3BFA4[UNIT_STATE_COUNT];

/* 3x3 rotation matrix scratch buffers (9 words, 0x12 bytes): written by
 * multiplyMatrix3x3Far/buildRotationMatrixFar, copied via memcpy(,0x12),
 * read as [axis]/[3+axis]/[6+axis]. Self-contained zero-filled runs (no
 * internal labels, no adjacency dependency). NB: unk_3806E stays in asm —
 * it overlays separately-labelled words word_38070..word_3807E. */
int16 unk_380B6[9];
int16 unk_3A948[9];

/* Single-byte values read only at [0] and saved via moveNearFar(,1 byte).
 * Migrated as their full self-contained runs to the next labelled symbol
 * (byte_3BEC4: 1 byte + align/pad to word_3BEC8; byte_3C02A: 1 byte + align
 * to unk_3C030). */
uint8 byte_3BEC4[4];
uint8 byte_3C02A[2];

/* byte_3A900: 8x8 theater terrain grid, memcpy dest (64B) read as
 * [col+(row<<3)] (0..63). Whole 66B run (64 + 2 align pad) to stru_3A95A. */
uint8 byte_3A900[66];

/* gameData: far pointer to the shared Game struct, set at startup; egcode.asm
 * references it via mangled `EXTRN _gameData:DWORD` (resolves to this def).
 * unk_3BF96/unk_3BF98: int16 scalars (tacmap screenX/screenY scratch). */
struct Game far *gameData = 0;
int16 unk_3BF96;
int16 unk_3BF98;

/* word_33444[3][8][8]: terrain/threat lookup, read as [a][r][t]. Exact 384B
 * run ending at stru_335C4. word_39402: scalar flag (=0/=1, compared); its
 * anonymous 512-byte asm tail is unreferenced and stays in asm. */
int16 word_33444[3][8][8] = {
    {
        { 3, 3, 2, 1, 0, 0xFFFF, 0xFFFE, 0xFFFF },
        { 3, 2, 2, 2, 1, 1, 1, 2 },
        { 3, 3, 3, 2, 2, 2, 3, 3 },
        { 3, 3, 3, 3, 3, 0xFFFD, 0xFFFD, 0xFFFD },
        { 3, 3, 3, 0xFFFD, 0xFFFD, 0xFFFD, 0xFFFD, 0xFFFD },
        { 0xFFFD, 0xFFFD, 0xFFFE, 0xFFFE, 0xFFFE, 0xFFFD, 0xFFFD, 0xFFFD },
        { 0xFFFE, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFE, 0xFFFE, 0xFFFE, 0xFFFD },
        { 1, 2, 1, 0, 0xFFFF, 0xFFFE, 0xFFFD, 0xFFFD },
    },
    {
        { 2, 3, 2, 2, 1, 1, 1, 0xFFFE },
        { 4, 4, 3, 2, 1, 4, 4, 4 },
        { 4, 4, 4, 4, 0xFFFE, 4, 4, 4 },
        { 4, 4, 0xFFFC, 0xFFFC, 4, 4, 4, 4 },
        { 0xFFFC, 0xFFFC, 0xFFFC, 0xFFFC, 4, 4, 0xFFFC, 0xFFFC },
        { 0xFFFC, 0xFFFC, 0xFFFC, 2, 0xFFFC, 0xFFFC, 0xFFFC, 0xFFFC },
        { 0xFFFC, 0xFFFC, 0xFFFC, 0xFFFF, 0xFFFD, 0xFFFC, 0xFFFC, 0xFFFC },
        { 2, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFE, 0xFFFE, 0xFFFD, 0xFFFF },
    },
    {
        { 2, 3, 2, 2, 1, 1, 0xFFFF, 0xFFFE },
        { 4, 4, 3, 2, 1, 4, 0xFFFC, 4 },
        { 4, 4, 4, 4, 0x0100, 4, 0x0100, 0x0100 },
        { 0x0100, 4, 0xFFFC, 0xFFFC, 0x0200, 4, 0x0100, 0x0100 },
        { 0x0100, 0x0100, 0xFFFC, 0x0200, 4, 4, 0xFFFC, 0x0100 },
        { 0x0100, 0x0100, 0xFFFC, 4, 0xFFFC, 0xFFFC, 0xFFFC, 0xFFFC },
        { 0xFFFC, 4, 0x0100, 0xFFFF, 0xFFFD, 0xFFFC, 0xFFFC, 0xFFFC },
        { 2, 1, 0xFFFF, 0xFFFF, 0xFFFE, 0xFFFE, 0xFFFD, 0xFFFF },
    },
};int16 word_39402;

/* unk_33E1A: 8-theater terrain-type table (8*64 + 2 pad = 514B), read only
 * via memcpy(byte_3A900, unk_33E1A + (theater&7)*64, 64). Self-contained. */
uint8 unk_33E1A[514] = {
    0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x10,
    0x10, 0x10, 0x00, 0x01, 0x02, 0x03, 0x10, 0x10, 0x10, 0x10, 0x04, 0x05, 0x06, 0x07, 0x10, 0x10,
    0x10, 0x10, 0x08, 0x09, 0x0A, 0x0B, 0x11, 0x11, 0x11, 0x11, 0x0C, 0x0D, 0x0E, 0x0F, 0x11, 0x11,
    0x11, 0x11, 0x11, 0x11, 0x11, 0x10, 0x10, 0x10, 0x11, 0x10, 0x10, 0x11, 0x11, 0x10, 0x10, 0x10,
    0x10, 0x10, 0x10, 0x10, 0x10, 0x11, 0x11, 0x11, 0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x11, 0x11,
    0x10, 0x10, 0x00, 0x01, 0x02, 0x03, 0x11, 0x11, 0x10, 0x10, 0x04, 0x05, 0x06, 0x07, 0x10, 0x10,
    0x10, 0x10, 0x08, 0x09, 0x0A, 0x0B, 0x10, 0x10, 0x10, 0x10, 0x0C, 0x0D, 0x0E, 0x0F, 0x10, 0x10,
    0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x10,
    0x11, 0x11, 0x11, 0x11, 0x11, 0x11, 0x11, 0x11, 0x11, 0x11, 0x11, 0x11, 0x11, 0x11, 0x11, 0x11,
    0x11, 0x11, 0x00, 0x01, 0x02, 0x03, 0x11, 0x11, 0x10, 0x11, 0x04, 0x05, 0x06, 0x07, 0x11, 0x10,
    0x10, 0x11, 0x08, 0x09, 0x0A, 0x0B, 0x11, 0x11, 0x10, 0x10, 0x0C, 0x0D, 0x0E, 0x0F, 0x10, 0x10,
    0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x10,
    0x11, 0x11, 0x11, 0x11, 0x11, 0x10, 0x11, 0x10, 0x11, 0x11, 0x11, 0x11, 0x10, 0x10, 0x10, 0x10,
    0x10, 0x11, 0x00, 0x01, 0x02, 0x03, 0x10, 0x10, 0x10, 0x11, 0x04, 0x05, 0x06, 0x07, 0x10, 0x10,
    0x10, 0x10, 0x08, 0x09, 0x0A, 0x0B, 0x10, 0x10, 0x10, 0x10, 0x0C, 0x0D, 0x0E, 0x0F, 0x10, 0x10,
    0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x10,
    0x11, 0x11, 0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x11, 0x10, 0x10, 0x10, 0x10, 0x10, 0x10,
    0x10, 0x10, 0x00, 0x01, 0x02, 0x03, 0x10, 0x10, 0x10, 0x10, 0x04, 0x05, 0x06, 0x07, 0x10, 0x10,
    0x11, 0x10, 0x08, 0x09, 0x0A, 0x0B, 0x11, 0x11, 0x11, 0x11, 0x0C, 0x0D, 0x0E, 0x0F, 0x11, 0x11,
    0x11, 0x11, 0x11, 0x11, 0x11, 0x11, 0x11, 0x11, 0x11, 0x11, 0x11, 0x11, 0x11, 0x11, 0x11, 0x11,
    0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x10,
    0x10, 0x10, 0x00, 0x01, 0x02, 0x03, 0x10, 0x10, 0x10, 0x10, 0x04, 0x05, 0x06, 0x07, 0x10, 0x10,
    0x11, 0x11, 0x08, 0x09, 0x0A, 0x0B, 0x10, 0x10, 0x11, 0x11, 0x0C, 0x0D, 0x0E, 0x0F, 0x10, 0x10,
    0x10, 0x11, 0x11, 0x10, 0x11, 0x11, 0x11, 0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x11, 0x10, 0x10,
    0x10, 0x11, 0x11, 0x11, 0x10, 0x10, 0x10, 0x10, 0x11, 0x11, 0x10, 0x10, 0x10, 0x10, 0x10, 0x10,
    0x11, 0x10, 0x00, 0x01, 0x02, 0x03, 0x10, 0x10, 0x11, 0x10, 0x04, 0x05, 0x06, 0x07, 0x11, 0x11,
    0x10, 0x10, 0x08, 0x09, 0x0A, 0x0B, 0x10, 0x10, 0x10, 0x10, 0x0C, 0x0D, 0x0E, 0x0F, 0x10, 0x10,
    0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x11, 0x10, 0x10, 0x11, 0x11, 0x10, 0x10, 0x10,
    0x11, 0x11, 0x11, 0x10, 0x10, 0x11, 0x11, 0x10, 0x11, 0x11, 0x11, 0x11, 0x10, 0x11, 0x11, 0x11,
    0x11, 0x11, 0x00, 0x01, 0x02, 0x03, 0x11, 0x11, 0x11, 0x11, 0x04, 0x05, 0x06, 0x07, 0x10, 0x10,
    0x11, 0x10, 0x08, 0x09, 0x0A, 0x0B, 0x10, 0x10, 0x11, 0x11, 0x0C, 0x0D, 0x0E, 0x0F, 0x10, 0x10,
    0x11, 0x11, 0x11, 0x11, 0x11, 0x11, 0x10, 0x10, 0x11, 0x11, 0x11, 0x11, 0x11, 0x11, 0x11, 0x10,
    0x00, 0x00
};

int16 word_341DC[16] = { 2, 0x2C, 0xAC, 0x158, 0x2AD, 0x558, 0xAB0, 0x1560,
                         2, 0x1E, 0x75, 0xE9, 0x1D1, 0x3A1, 0x741, 0xE82 };
int16 word_341FC[32] = { 3, 0x32, 0xC5, 0x18A, 0x312, 0x622, 0xC43, 0x1886,
                         2, 0x1A, 0x65, 0xCA, 0x193, 0x325, 0x649, 0xC91,
                         4, 0x53, 0x145, 0x28A, 0x511, 0xA1E, 0x143B, 0x2876,
                         2, 0x1F, 0x78, 0xF0, 0x1DE, 0x3BB, 0x776, 0xEEC };

/* var_315 (aka word_36B86): scalar flag, byte[0] written/read only. */
int16 var_315 = 0;

/* var_654 / var_657..672: standalone int16 flags, collapsed from
 * word_38CD2/word_38CD8.. EQU aliases (canonical = var_N). */
int16 var_654 = 0;
int16 var_657 = 0;
int16 var_658 = 0;
int16 var_659 = 0;
int16 var_660 = 0;
int16 var_661 = 0;
int16 var_662 = 0;
int16 var_663 = 0;
int16 var_664 = 0;
int16 var_665 = 0;
int16 var_666 = 0;
int16 var_667 = 0;
int16 var_668 = 0;
int16 var_671 = 0;
int16 var_672 = 0;

/* EQU-alias collapse (canonical var_N), batch [10:14] */
int16 var_255 = 0;
int16 var_256 = 0;
int16 var_259 = 0;
int16 var_260 = 0;
