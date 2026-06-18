/*
 * Variables are kept in the same order as in egslots.asm so the produced
 * binary stays close to the original memory layout.
 */
#include "egame.h"
#include "inttype.h"
#include <dos.h>

/* Scenario region-data filenames (head of the original .DATA segment).
 * regnStr points at the regn.xxx buffer (the strcpy/fopen target that gets
 * overwritten with the per-theater region file). scenarioPlh[theater] selects
 * the per-theater .xxx region file; aNc_xxx is also passed (cast to int) to
 * gfx_copyRect by egflight.c. */
uint8 aRegn_xxx[] = "regn.xxx";
uint8 aLb_xxx[] = "lb.xxx";
uint8 aPg_xxx[] = "pg.xxx";
uint8 aVn_xxx[] = "vn.xxx";
uint8 aMe_xxx[] = "me.xxx";
uint8 aNc_xxx[] = "nc.xxx";
uint8 aCe_xxx[] = "ce.xxx";
uint8 aJp_xxx[] = "jp.xxx";
uint8 aNa_xxx[] = "na.xxx";
char *regnStr = (char *)aRegn_xxx;
char *scenarioPlh[8] = {
    (char *)aLb_xxx, (char *)aPg_xxx, (char *)aVn_xxx, (char *)aMe_xxx,
    (char *)aNc_xxx, (char *)aCe_xxx, (char *)aJp_xxx, (char *)aNa_xxx
};

/* aEmpty_5950: empty string passed to drawPanelText to clear a panel label. */
uint8 aEmpty_5950[] = "";

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
int16 word_336E6 = -1;
int16 frameTick = 0;
int16 word_336EA = 0;
int16 word_336F2 = -1;
int16 word_336F4 = -1;
int16 word_336FC = -1;
int16 word_336FE = 4;
int16 word_3370A = 1;
int16 word_3370C = -1;
int word_3370E = 0;
int16 word_32A34 = 0;
int16 word_33442 = 0;
int16 word_336E4 = 4;
int16 word_336EC = 1;
int16 word_336EE = 0;
int16 word_336F6 = -1;
int16 word_336F8 = 1;
int16 word_336FA = 0;
int16 word_33700 = -1;
int16 word_33702 = 1;
int16 word_33704 = 1;
int16 word_33706 = 1;
uint16 word_33708 = 0;
int16 word_33710 = 1;
int16 word_33712 = 0;
int16 word_33714 = 0;
int16 word_3374A = 0;

/* asc_33744: 3 weapon-indicator box X-coordinates, read as asc_33744[weaponIdx]. */
int16 asc_33744[3] = { 76, 40, 115 };

/* stru_33402: 8-entry smoke/marker ring table (struc_9 records, stride 8). */
struct struc_9 stru_33402[8];

/* sams[39]: threat/weapon spec table — name, field_8 (radar/detect range),
 * field_A (engagement range), field_C (signed target-class index, -1 = none),
 * field_E, field_10 (category). Indexed by threat/weapon id. */
struct Sam sams[39] = {
    { "None",    0,    0,     0,  1, 0x13 },
    { "SA-2",    0x7D, 0x7D0,  1,  4, 0x13 },
    { "SA-5",    0x96, 0x708,  1,  1, 0x13 },
    { "SA-8B",   0x41, 0x4B0,  2,  3, 0x13 },
    { "SA-10",   0x7D, 0x708,  3,  2, 0x13 },
    { "SA-11",   0x64, 0x5DC,  2,  3, 0x13 },
    { "SA-12",   0x96, 0x7D0,  3,  2, 0x13 },
    { "SA-13",   0x41, 0x384,  0,  4, 0x13 },
    { "SA-N-4",  0x1E, 0x4B0,  2,  3, 0x13 },
    { "SA-N-5",  0x1E, 0x384, -1,  4, 0x13 },
    { "SA-N-6",  0x7D, 0x708,  3,  2, 0x13 },
    { "SA-N-7",  0x64, 0x5DC,  2,  3, 0x13 },
    { "Hawk",    0x7D, 0x384,  2,  3, 0x13 },
    { "Rapier",  0x41, 0x4B0,  2,  4, 0x13 },
    { "Tiger",   0x1E, 0x384,  1,  3, 0x13 },
    { "Seacat",  0x1E, 0x384,  1,  3, 0x13 },
    { "AA-2",    0x0E, 0x5DC, -1,  4, 0x13 },
    { "AA-8",    0x0C, 0x708,  0,  5, 0x13 },
    { "AA-6",    0x32, 0x960,  2,  2, 0x13 },
    { "AA-7",    0x22, 0x708,  2,  2, 0x13 },
    { "AA-9",    0x52, 0x7D0,  2,  3, 0x13 },
    { "AA-10",   0x40, 0x7D0,  3,  4, 0x13 },
    { "AIM120",  0x20, 0x960,  7,  4, 1    },
    { "AIM-9",   0x11, 0x7D0,  7,  8, 1    },
    { "HARM",    0x14, 0x4B0,  4,  2, 1    },
    { "Penguin", 0x20, 0x1F4,  5,  2, 0x13 },
    { "Harpoon", 0x3C, 0x1F4,  5,  2, 0x13 },
    { "AGM-65",  0x20, 0x320,  6,  2, 0x0D },
    { "LGBOMB",  0x0A, 0,     0x1C, 2, 0x0F },
    { "RTBOMB",  0,    0,     0x1D, 2, 0x0F },
    { "FFBOMB",  0,    0,     0x1E, 2, 0x0F },
    { "AIM-7W",  0x2C, 0x960,  2,  4, 1    },
    { "AIM-9W",  0x0C, 0x7D0,  0,  5, 1    },
    { "SA-14",   0x10, 0x384,  0,  5, 1    },
    { "AA-6",    0x32, 0x960, -1,  2, 0x13 },
    { "AA-7",    0x22, 0x708, -1,  2, 0x13 },
    { "AA-9",    0x52, 0x7D0, -1,  3, 0x13 },
    { "AA-10",   0x40, 0x7D0,  0,  4, 0x13 },
    { "Equip.",  0,    0,     0x1D, 0, 0x0E },
};

/* aircraftTypes[19]: enemy/AI aircraft catalogue indexed by SimObject.spec —
 * name (+0), altName (" "+NATO reporting name, +7), then speed/turn/model fields.
 * field_18 == -1 marks a type with no 3D model; field_1A/field_1C are read as a
 * 2-element pair (egtarget.c). */
struct AircraftType aircraftTypes[19] = {
    { "MIG-23", " Flogger", 0, 740, 560, 3, 17, 10, 2, 0 },
    { "MIG-25", " Foxbat", 0, 570, 700, 2, 18, 0, 2, 0 },
    { "MIG-29", " Fulcrum", 0, 700, 400, 5, 19, 20, 2, 0 },
    { "F-1", " Mirage", 0, 790, 930, 3, 20, 0, 2, 0 },
    { "Su-27", " Flanker", 0, 725, 715, 4, 19, 20, 2, 0 },
    { "IL-76", " Mainstay", 0, 400, 4000, 1, 16, 12, 2, 0 },
    { "F-4E", " Phantom", 0, 800, 520, 4, 18, 11, 2, 0 },
    { "F-14", " Tomcat", 0, 800, 800, 4, 19, 8, 2, 0 },
    { "F-18", " Hornet", 0, 660, 461, 5, -1, 0, 2, 0 },
    { "An-72", " Coaler", 0, 350, 620, 2, 0, 9, 2, 0 },
    { "F-18", " Hornet", 0, 660, 461, 5, -1, 4, 2, 0 },
    { "MIG-23", " Flogger", 0, 740, 560, 3, 0, 4, 2, 0 },
    { "F-14", " Tomcat", 0, 800, 800, 4, -1, 8, 2, 0 },
    { "F-4E", " Phantom", 0, 800, 520, 4, -1, 11, 2, 0 },
    { "MIG-17", " Fresco", 0, 550, 300, 3, 17, 16, 2, 0 },
    { "Tu-95", " Bear", 0, 410, 5100, 1, 0, 18, 2, 0 },
    { "Mi-24", " Hind", 0, 200, 300, 1, 17, 19, 2, 0 },
    { "F-5", " Tiger", 0, 500, 250, 3, 22, 22, 2, 0 },
    { "767", " Boeing", 0, 400, 1000, 1, -1, 18, 2, 0 },
};

/* aNone[23]: threat/weapon lethality table indexed by threat type — name,
 * field_8 (base lethality/range), field_A (damage tier), field_C (flags;
 * bit 0 read by egthreat.c). Used to score incoming-threat danger. */
struct Weapon aNone[23] = {
    { "None",   0,   0, 0 },
    { "SA-2",   200, 3, 0 },
    { "SA-5",   350, 2, 0 },
    { "SA-8B",  125, 5, 0 },
    { "SA-10",  320, 7, 1 },
    { "SA-11",  200, 5, 0 },
    { "SA-12",  290, 6, 1 },
    { "SA-13",  125, 3, 0 },
    { "SA-N-4", 200, 4, 1 },
    { "SA-N-5", 150, 3, 0 },
    { "SA-N-6", 320, 6, 1 },
    { "SA-N-7", 200, 5, 0 },
    { "Hawk",   175, 6, 1 },
    { "Rapier", 75,  8, 0 },
    { "Tiger",  65,  4, 0 },
    { "Seacat", 200, 2, 0 },
    { "IL76",   200, 8, 3 },
    { "",       50,  5, 0 },
    { "",       70,  6, 0 },
    { "",       80,  7, 1 },
    { "",       100, 8, 1 },
    { "OTH",    500, 5, 1 },
    { "",       40,  3, 0 },
};

/* missleSpec[4]: per-loadout-slot {weaponIdx, ammo}; populated at mission start
 * from commData, indexed by missileSpecIndex. */
struct MissileSpec missleSpec[4] = { {0, 4}, {1, 4}, {5, 6}, {0, 0} };

/* missiles[20]: player weapon catalogue — short name, long name, field_16
 * (signed sams[] index, -1/-2 = non-threat stores), field_18 (category). */
struct Missile missiles[20] = {
    { "AIM-9M",  "Sidewinder", 0x17, 4 },
    { "AIM-120", "AMRAAM ",    0x16, 4 },
    { "AGM-88A", "HARM",       0x18, 4 },
    { "AIM-7M",  "Sparrow",    0x16, 4 },
    { "AGM-86A", "Harpoon",    0x1A, 1 },
    { "AGM-65D", "Maverick",   0x1B, 6 },
    { "GBU-12",  "Paveway",    0x1C, 8 },
    { "Mk 20",   "Rockeye",    0x1D, 2 },
    { "Dndl",    "Durandal",   0x1D, 2 },
    { "Mk 82-0", "Slick",      0x1E, 3 },
    { "Mk 82-1", "Snakeye",    0x1D, 3 },
    { "Mk 20",   "Rockeye II", 0x1C, 4 },
    { "Mk 122",  "Fireeye",    0x1E, 2 },
    { "CBU-72",  "Fuel-Air",   0x1C, 2 },
    { "Mk 35",   "IN Cluster", 0x1D, 2 },
    { "ISC B-1", "Minelets",   0x1D, 1 },
    { "135 mm",  "Camera",     -1,   1 },
    { "1900lbs", "Extra Fuel", -2,   1 },
    { "20 mm",   "Guns",       0,    1 },
    { "Special", "Equip",      0x26, 1 },
};

/* 3D loader size/sign scalars. */

size_t size3d3 = 1;
unsigned int size3d3_2 = 0;
int16 sign3dt = 0x3131;
size_t size3d3_4 = 0;
size_t size3d3_5 = 0;
size_t size3d3_6 = 0;
size_t size3d3_3 = 0;
int16 sign3dg = 0x3232;

/* 3D-loader buffers/sizes (was _buf3d3/_sizes3dt/_matrix3dt in egslots.asm).
 * buf3d3: shape->offset table, fread up to size3d3 words. sizes3dt: per-LOD
 * vertex counts (5 entries, each <=0x20). matrix3dt: 5 LODs x 32 vertex words. */
unsigned int buf3d3[100] = { 0 };
unsigned int sizes3dt[5] = { 0x20, 0x20, 0x20, 0x20, 0x20 };
unsigned int matrix3dt[5][32] = { 0 };
/* matrix3dt_2: per-LOD x per-vertex model-data pointers (parallels matrix3dt). */
struct Matrix3dEntry7 *matrix3dt_2[5][32];
/* size3d3_7: vertex count for the secondary (word_33DD0) loader buffer. */
size_t size3d3_7;

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
uint8 aArmed[] = " armed";

/* voiceCueThresholds[0..2]: per-weapon digital-voice-cue thresholds (vs f15DgtlResult).
   playVoiceCue also indexes [4] (weaponIdx can be 4), an over-read. */
int16 voiceCueThresholds[3] = { 0x31F3, 0x4796, 0x5C92 };
uint8 byte_3862A = 0;
uint8 byte_3862B = 0;
uint8 picBuf[0x200] = { 0 };

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
/* stru_335C4: in-flight projectile/missile table (player rounds + threat
 * shots), 12 entries. stru_3A95A: 16-entry camera/view replay snapshot ring. */
struct Projectile stru_335C4[12];
struct ViewSnapshot stru_3A95A[16];
int32 dword_3B1FE;
struct SimObject stru_3B202[20];
int32 dword_3B4D4;
int16 word_3B4DE;
int16 word_3B4E4;
/* Model/shape LOD cache (754 reserved bytes = 94 8-byte records). eg3dmap
 * appends entries with memcpy (word_38FF8 is the live count) and scans
 * backwards for a key match. */
struct Unknown3B4E6Record8 byte_3B4E6[94];
int16 keyValue;
int16 word_3BE92;
int word_3BE94;
int16 word_3BEBE;
int16 g_viewX_;
int16 sign3d3;
int16 g_viewY_;
int16 word_3BED2;
int16 word_3C046;

uint8 byte_34197 = 6;
uint8 byte_37C2F = 0;
uint8 byte_38F8C;
uint8 byte_38F8D[1];
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
/* regs: shared int86/int86x register union for INT 10h/16h calls. */
union REGS regs;
uint8 unk_3BF95;
int16 word_3298A = 0xC4;
int16 word_3298C = 0xA0;
int16 word_3298E = 0x64;
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

int16 word_3401A = 0;
/* off_38334/3834C/38364: near-pointers to the three gfx page/viewport descriptors
   (unk_3831E, unk_38336, word_3834E). Read through the
   pointer as an int16[] descriptor (clip rect, color, page base) and dereferenced
   for the page base address. */
int16 *off_38334 = unk_3831E;
int16 *off_3834C = unk_38336;
int16 *off_38364 = word_3834E;
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

int16 word_3BE98;
uint8 buf2_3dg[0x200];
uint8 buf3_3dg[0x200];
uint8 buf4_3dg[0x200];
uint8 buf_3dt[4000];
uint8 byte_3BE3E[0x40];
uint8 byte_3BE80[0x10];
uint8 byte_3BED8[0x64];
char tempString[80];
/* unk_3C030: itoa scratch buffer for assembling HUD/MFD numeric strings. */
char unk_3C030[12];
char string_3C04A[80];

int16 word_33096 = 4;
int16 word_33098 = 0x1388;
/* Countermeasure ammo counters, indexed by kind in countermeasures():
 * [1] = flare, [2] = chaff. word_3309A[0] is unused. */
int16 word_3309A[3] = {0, 0x0C, 0x12};
int16 g_missionStatus = 1;
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

int16 word_3BE9C[16];
char *word_3C0A2[100];

int16 word_330B4 = 0x28A;
uint8 far *farPointer = 0;

/* byte_339B2: a one-byte toggle flag (eg3dview flips it each call). */
uint8 byte_339B2 = 0;

int16 word_33B74[9] = { -1, 1, 1, -1, 0, 1, 0, -1, 0 };
int16 word_33B86[11] = { 1, 1, -1, -1, 1, 0, -1, 0, 0, -8192, -4096 };

/* Scratch buffers (fread / moveNearFar / indexed scratch). */
uint8 flt15_buf1[0x40];
uint8 flt15_buf2[0x1040];
uint8 buf3d3_1[0x96];
uint8 byte_3AFAC[0x100];
uint8 buf3d3_2[0x96];
uint8 buf3d3_3[0x96];

/* buf1_3dg: 16x16 grid, indexed col+(row<<4) (0..255). */
uint8 buf1_3dg[0x100];
uint8 byte_3BFA4[UNIT_STATE_COUNT];

/* 3x3 rotation matrix scratch buffers (9 words): written by
 * multiplyMatrix3x3Far/buildRotationMatrixFar, read as [axis]/[3+axis]/[6+axis]. */
int16 unk_380B6[9];
int16 unk_3A948[9];

/* Single-byte values (only [0] is used); the extra bytes are trailing pad
 * up to the next symbol. */
uint8 byte_3BEC4[4];
uint8 byte_3C02A[2];

/* byte_3A900: 8x8 theater terrain grid, read as [col+(row<<3)] (0..63);
 * [66] = 64 grid bytes + 2 pad. */
uint8 byte_3A900[66];

/* gameData: far pointer to the shared Game struct, set at startup.
 * unk_3BF96/unk_3BF98: tacmap screenX/screenY scratch. */
struct Game far *gameData = 0;
int16 unk_3BF96;
int16 unk_3BF98;

/* word_33444[3][8][8]: terrain/threat lookup, read as [a][r][t].
 * word_39402: scalar flag (compared against 0/1). */
int16 word_33444[3][8][8] = {
    {
        { 3, 3, 2, 1, 0, -1, -2, -1 },
        { 3, 2, 2, 2, 1, 1, 1, 2 },
        { 3, 3, 3, 2, 2, 2, 3, 3 },
        { 3, 3, 3, 3, 3, -3, -3, -3 },
        { 3, 3, 3, -3, -3, -3, -3, -3 },
        { -3, -3, -2, -2, -2, -3, -3, -3 },
        { -2, -1, -1, -1, -2, -2, -2, -3 },
        { 1, 2, 1, 0, -1, -2, -3, -3 },
    },
    {
        { 2, 3, 2, 2, 1, 1, 1, -2 },
        { 4, 4, 3, 2, 1, 4, 4, 4 },
        { 4, 4, 4, 4, -2, 4, 4, 4 },
        { 4, 4, -4, -4, 4, 4, 4, 4 },
        { -4, -4, -4, -4, 4, 4, -4, -4 },
        { -4, -4, -4, 2, -4, -4, -4, -4 },
        { -4, -4, -4, -1, -3, -4, -4, -4 },
        { 2, -1, -1, -1, -2, -2, -3, -1 },
    },
    {
        { 2, 3, 2, 2, 1, 1, -1, -2 },
        { 4, 4, 3, 2, 1, 4, -4, 4 },
        { 4, 4, 4, 4, 0x0100, 4, 0x0100, 0x0100 },
        { 0x0100, 4, -4, -4, 0x0200, 4, 0x0100, 0x0100 },
        { 0x0100, 0x0100, -4, 0x0200, 4, 4, -4, 0x0100 },
        { 0x0100, 0x0100, -4, 4, -4, -4, -4, -4 },
        { -4, 4, 0x0100, -1, -3, -4, -4, -4 },
        { 2, 1, -1, -1, -2, -2, -3, -1 },
    },
};int16 word_39402;

/* unk_33E1A: 8-theater terrain-type table ([514] = 8*64 + 2 pad), read via
 * memcpy(byte_3A900, unk_33E1A + (theater&7)*64, 64). */
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

/* var_315: scalar flag, only byte[0] is used. */
int16 var_315 = 0;

/* var_316: standalone byte flag. */
uint8 var_316 = 0;

/* var_654, var_657..672: standalone int16 flags. */
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

int16 var_255 = 0;
int16 var_256 = 0;
/* var_258: a flag, accessed only by byte (eg3dmap), in a 16-bit slot. */
int16 var_258 = 0;
int16 var_259 = 0;
int16 var_260 = 0;

/* var_588: radar range. var_589/590: standalone int16 scalars.
 * word_383F2/word_383F4: tacmap blink/dwell countdown timers. */
int16 var_588 = 1;
int16 var_589 = 0;
int16 var_590 = 0;
int16 word_383F2 = 0;
int16 word_383F4 = 0;

/* var_595/597: standalone int16 scalars.
 * var_596: detail-level counter (0..2), also a joystick-scaling factor. */
int16 var_595 = 0;
int16 var_596 = 2;
int16 var_597 = 0;

/* Per-axis joystick read accumulator, indexed by axis in readAxisInput.
 * The key handler reuses slots [0]/[1]/[2] as scratch state (egkeys.c). */
int16 word_38606[4] = { 0, 0, 0, 0 };
int16 var_669 = 0;
int16 var_670 = 0;
int16 var_673 = 0;
int16 var_674 = 0;
int16 var_675 = 0;
int16 var_676 = 0;
int16 var_677 = 0;
int16 var_680 = 0;
int16 var_681 = 0;
int16 var_682 = 0;
int16 var_683 = 0;
int16 var_684 = 0;
int16 var_685 = 0;
int16 var_686 = 0;

/* var_810/811: viewX/viewY scratch for the player tile-object world pos. */
uint16 var_810 = 0;
uint16 var_811 = 0;

/* Collapsed _var_N EQU aliases: plain scalars (no address-coupling), storage moved from egslots.asm. */
int16 var_194 = 0x800;
int16 var_195 = 0x1000;
int16 var_196 = 0x2000;
int16 var_197 = 0x4000;
int16 var_202 = 0;
int16 var_203 = 0;
/* var_204 is the head of a 4-word run {var_204, word_34246, word_34248,
 * word_3424A} that sub_202B6 indexes by a model opcode as
 * [BX+offset _var_204] (BX in {0,2,4,6}); the tail words are reached as
 * _var_204+2/+4/+6. Keep it one contiguous C array so the index stays valid
 * (was word_34244..word_3424A in egslots.asm). C uses element 0 as the scalar. */
int16 var_204[4] = {0, 0, 0, 0};
uint8 var_215 = 0;
int16 var_216 = 0;
/* word_34262: a flag slot accessed both as a byte (eg3dmap clears the low
 * byte) and as a word (eg3dproj writes 7 via *(int16 *)&word_34262). */
int16 word_34262 = 0;
int16 var_218 = 0;
int16 var_219 = 0;
/* var_224-227: sphere/horizon projection scalars. */
int16 var_224 = 0;
int16 var_225 = 0;
int16 var_226 = 0;
int16 var_227 = 0;
int16 var_257 = 0;
int16 var_261 = 0;
int16 var_549 = 0;
char var_550 = 0;
int16 var_556 = 0;

/* g_setThrust: player thrust setting (was also aliased _var_552). word_380E2: a frame timer. */
int16 g_setThrust = 0;
int16 word_380E2 = 0;

/* blitSprite() sprite descriptor (was word_383CC..var_586, an asm SpriteParams). */
struct SpriteParams blitSpriteParams = {
    0, 0, 0, 0, 0, 0, 0, 0,   /* bufPtr,srcX,srcY,page,dstX,dstY,width,height */
    {0, 0}, 0x61, {0, 0, 0}, 0x3F, 0x01,   /* +0x10..0x17 config bytes */
    0x01,                     /* flags (byte_383E4 init) */
    {0x01, 0x01, 0x00}        /* pad19[0]=var_586 init */
};

/* byte_383E5: tactical-map zoom level (declared dw, used as a small int). */
int16 byte_383E5 = 8;

/* blitGaugeSprite() sprite descriptor (was word_383AE.., an asm SpriteParams). */
struct SpriteParams gaugeSpriteParams = {
    0, 0, 0, 0, 0, 0, 7, 7,   /* bufPtr,srcX,srcY,page,dstX,dstY,width,height */
    {0x68, 0}, 0xAF, {0, 0x78, 0}, 0xC7, 0x00,   /* +0x10..0x17 config bytes */
    0x10,                     /* flags */
    {0x01, 0x01, 0x00}        /* pad19 */
};

/* unk_3806E: current 3x3 orientation matrix (Q15 identity init); was var_524-529
   element aliases + block-memcpy target in egslots.asm. */
int16 unk_3806E[9] = {0x7FFF, 0, 0, 0, 0x7FFF, 0, 0, 0, 0x7FFF};

/* bulletTracks: 3D projectile table (player rounds + threat shots), HUD-projected.
   Was word_3C5AC.. (stride-12) in egslots.asm. */
struct BulletTrack bulletTracks[20];

/* Flat scalars/pointers migrated out of egslots.asm (bare-EXTRN repoints). Kept in
   egslots.asm address order. The hand-written asm routines now reference these by their
   mangled (_-prefixed) names. */
int16 word_336F0 = 0;
int16 var_141 = 0;
int16 var_220 = 0;
uint8 byte_378EE = 0;
uint8 byte_37F98 = 0;   /* keyboard virtual-stick raw pitch axis (int9Handler) */
uint8 byte_37F99 = 0;   /* keyboard virtual-stick raw roll axis (int9Handler) */
/* player orientation/altitude view state, shared with egseg2 projection. */
int g_ourHead = 0;
int g_ourPitch = 0;
int g_ourRoll = 0;
int16 var_593 = 0;
uint8 byte_3850E = 0;
int word_39606;
/* word_39808: nearest-tile-object pointer; result of findNearestTileObject(),
   aliasing the word_3B7E0 scratch block. */
struct TileObject *word_39808;
int16 word_3B0AC;
int16 word_3B4D8;
int16 word_3B4E0;
int16 word_3B5D6;
int16 word_3B7DE;
/* byte_3B7EE..F1: nearest-object scan result (row/col/index/depth), written
   together by the display-list walk in eg3dmap.c. */
uint8 byte_3B7EE;
uint8 byte_3B7EF;
uint8 byte_3B7F0;
uint8 byte_3B7F1;
int16 word_3BEBC;
int16 word_3BEC8;
int16 word_3BECE;
int16 word_3C020;
int16 word_3C16C;
/* byte_3C16E: 0x2ee-byte buffer holding the region label strings; word_3C0A2[]
   entries point into it (parsed by the loader, read back via moveNearFar). */
char byte_3C16E[0x2EE];
struct Matrix3dEntry7 *word_3C5A8;
int16 *word_3C69C;
int16 word_3C69E;
int16 *word_3C6A2;
uint8 byte_3C6A0[1];
uint8 byte_3C8B0[2];

/* g_proj3d: projectObjects() world-space projection origin.
   Was word_3C8B8/BC/C0 (each a long; high halves 3C8BA/BE/C2) in egslots.asm. */
struct Proj3d g_proj3d;

/* byte_3B7FC: tactical-replay event log (events[0..0x600]) + 3D model vertex-X table
   (vertexX[] at +0x600). One 0x640-byte buffer; egseg1.asm reaches vertexX at the fixed
   offset _byte_3B7FC+0x600. Was _byte_3B7FC db 640h dup in egslots.asm. */
struct ReplayLog byte_3B7FC;

/* Combat-event message fragments assembled into strBuf by updateThreatTargeting. */
uint8 aMisses[] = " misses ";
uint8 aDestroyedBy[] = " destroyed by ";
uint8 aDestroyedBy_0[] = " destroyed by ";
uint8 aGroundImpact[] = " ground impact";
uint8 aHitBy[] = "Hit by ";
uint8 aIneffective[] = "Ineffective";
uint8 aHitBy_0[] = " hit by ";

/* aMap: tactical-map panel label. aNotAvailable: store-status text. */
char aMap[] = "Map";
uint8 aNotAvailable[] = " not available";
