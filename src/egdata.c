/*
 * Variables are sorted by their original DGROUP offset (the address encoded in
 * a word_/byte_/dword_ name, or the offset from map/egame.map for renamed
 * symbols) as a convenience for a possible future binary-exact-match effort.
 * String literals and a few renamed BSS arrays have no recoverable original
 * address, so they are placed approximately, adjacent to a known neighbour.
 * The order is not load-bearing: the binary relocates, so data may move freely.
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
uint8 byte_32933 = 0;
uint8 exitCode = 0x81;

int16 gfxModeUnset = 0;
int16 f15DgtlResult = 0;
char *regnStr = (char *)aRegn_xxx;
char *scenarioPlh[8] = {
    (char *)aLb_xxx, (char *)aPg_xxx, (char *)aVn_xxx, (char *)aMe_xxx,
    (char *)aNc_xxx, (char *)aCe_xxx, (char *)aJp_xxx, (char *)aNa_xxx
};

/* aEmpty_5950: empty string passed to drawPanelText to clear a panel label. */
uint8 aEmpty_5950[] = "";
char aCockpit_pic[] = "cockpit.PIC";
int allocSize = 0;
int16 word_3298A = 0xC4;
int16 word_3298C = 0xA0;
int16 word_3298E = 0x64;
/* word_32990: 16-entry seed table copied into word_3BE9C and then offset to
   drive the 3D-sphere/horizon ring radii (egsphere.c). */
int16 word_32990[16] = {
    0, 2, 3, 4, 6, 8, 0x0B, 0x0F, 0x14, 0x1B, 0x24, 0x30, 0x40, 0x57, 0x77, 0xA4
};
char aReadyForTakeof[] = "Ready for takeoff";
char aWeaponsRepleni[] = "Weapons replenished";
char aAutomaticLandi[] = "Automatic Landing Engaged";
/* waypoints: 4 navigation/target waypoints (map X/Y). [0] steerpoint, [3] threat. */
struct Waypoint waypoints[4];

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
int16 waypointIndex = 0;
int16 word_32A34 = 0;

int16 word_33096 = 4;
int16 word_33098 = 0x1388;
/* Countermeasure ammo counters, indexed by kind in countermeasures():
 * [1] = flare, [2] = chaff. word_3309A[0] is unused. */
int16 word_3309A[3] = {0, 0x0C, 0x12};
int16 missileSpecIndex = 0;

int16 word_330B4 = 0x28A;
int16 g_autopilotAltitude = 0;
int16 g_missionStatus = 1;
int16 word_330BA = 1;
int16 word_330BC = 0;
int16 word_330BE = 0;
int16 word_330C2 = 1;
int16 g_frameRateScaling = 4;

/* var_83: weapon/target compatibility matrix, 20 weapons x 13 target
   categories, read as var_83[weaponIdx*13 + (byte_3BFA4[..] & 0xf)] by
   missileTargetCompat (egtacmap.c). Rows w0/w1 (Sidewinder/AMRAAM) and
   w16/w17/w19 are all zero; type-1 weapons do not use it. */
int8 var_83[260] = {
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 2, 6, 2, 0, 2, 5,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6,
    2, 1, 2, 2, 3, 4, 3, 3, 4, 4, 4, 1, 2,
    4, 1, 2, 4, 5, 5, 4, 4, 5, 4, 4, 1, 3,
    0, 0, 4, 4, 0, 0, 5, 5, 4, 4, 5, 0, 4,
    0, 8, 0, 0, 2, 1, 0, 0, 0, 0, 0, 0, 0,
    3, 1, 3, 4, 1, 1, 4, 2, 3, 3, 4, 0, 3,
    0, 1, 4, 4, 0, 0, 4, 0, 2, 0, 4, 0, 0,
    1, 1, 4, 4, 1, 1, 4, 4, 4, 4, 4, 1, 3,
    2, 0, 4, 4, 0, 2, 5, 3, 3, 2, 5, 1, 3,
    4, 0, 0, 6, 0, 5, 0, 0, 0, 4, 0, 5, 2,
    1, 0, 6, 4, 0, 0, 6, 6, 3, 6, 6, 0, 3,
    0, 6, 0, 3, 0, 0, 2, 3, 0, 0, 3, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    3, 0, 4, 4, 0, 2, 4, 4, 3, 4, 5, 0, 3,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
};

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
    { "MIG-23", " Flogger", 740, 560, 3, 17, 10, 2, 0 },
    { "MIG-25", " Foxbat", 570, 700, 2, 18, 0, 2, 0 },
    { "MIG-29", " Fulcrum", 700, 400, 5, 19, 20, 2, 0 },
    { "F-1", " Mirage", 790, 930, 3, 20, 0, 2, 0 },
    { "Su-27", " Flanker", 725, 715, 4, 19, 20, 2, 0 },
    { "IL-76", " Mainstay", 400, 4000, 1, 16, 12, 2, 0 },
    { "F-4E", " Phantom", 800, 520, 4, 18, 11, 2, 0 },
    { "F-14", " Tomcat", 800, 800, 4, 19, 8, 2, 0 },
    { "F-18", " Hornet", 660, 461, 5, -1, 0, 2, 0 },
    { "An-72", " Coaler", 350, 620, 2, 0, 9, 2, 0 },
    { "F-18", " Hornet", 660, 461, 5, -1, 4, 2, 0 },
    { "MIG-23", " Flogger", 740, 560, 3, 0, 4, 2, 0 },
    { "F-14", " Tomcat", 800, 800, 4, -1, 8, 2, 0 },
    { "F-4E", " Phantom", 800, 520, 4, -1, 11, 2, 0 },
    { "MIG-17", " Fresco", 550, 300, 3, 17, 16, 2, 0 },
    { "Tu-95", " Bear", 410, 5100, 1, 0, 18, 2, 0 },
    { "Mi-24", " Hind", 200, 300, 1, 17, 19, 2, 0 },
    { "F-5", " Tiger", 500, 250, 3, 22, 22, 2, 0 },
    { "767", " Boeing", 400, 1000, 1, -1, 18, 2, 0 },
};
int16 word_33442 = 0;

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
};
/* stru_335C4: in-flight projectile/missile table (player rounds + threat
 * shots), 12 entries. stru_3A95A: 16-entry camera/view replay snapshot ring. */
struct Projectile stru_335C4[12];
int16 word_336E4 = 4;
int16 word_336E6 = -1;
int16 frameTick = 0;
int16 word_336EA = 0;
int16 word_336EC = 1;
int16 word_336EE = 0;

int16 word_336F0 = 0;
int16 word_336F2 = -1;
int16 word_336F4 = -1;
int16 word_336F6 = -1;
int16 word_336F8 = 1;
int16 word_336FA = 0;
int16 word_336FC = -1;
int16 word_336FE = 4;
int16 word_33700 = -1;
int16 word_33702 = 1;
int16 word_33704 = 1;
int16 word_33706 = 1;
uint16 word_33708 = 0;
int16 word_3370A = 1;
int16 word_3370C = -1;
int word_3370E = 0;
int16 word_33710 = 1;
int16 word_33712 = 0;
int16 word_33714 = 0;
uint8 aStoresExhauste[] = "Stores exhausted";
uint8 aFlare[] = "Flare";
uint8 aChaff[] = "Chaff";
uint8 aReleased[] = " released";
uint8 asc_3373D[] = ":";
char aGun[] = "GUN:";

/* asc_33744: 3 weapon-indicator box X-coordinates, read as asc_33744[weaponIdx]. */
int16 asc_33744[3] = { 76, 40, 115 };
int16 word_3374A = 0;
char aOnPatrol[] = " on patrol";
char aF15StrikeEagle[] = "F15 Strike Eagle";
char aAt[] = " at ";
char aSafeLanding[] = "Safe Landing";

/* Three more 11-word page/viewport descriptors (sub-window regions) reached
   through the var_134/567/568 near-pointers; same field layout as the off_38334
   descriptors ([1]=mode, [2]=fill color, [7..10]=clip rect / page base). */
int16 buf6data_4[11] = { 0, 2, 2, 0, 0, 0, 1, 0, 0x6F, 0, 0x13F };
int16 *var_134 = buf6data_4;

/* byte_339B2: a one-byte toggle flag (eg3dview flips it each call). */
uint8 byte_339B2 = 0;
/* word_339B4: four 16-entry colour-remap palettes; loadColorPalette(idx) copies
   the idx'th 16-byte record into colorLut[0..15]. */
uint8 word_339B4[64] = {
    0x0,0x1,0x2,0x3,0x4,0x0,0x6,0x7,0x8,0x9,0xA,0xB,0xC,0xD,0xE,0xF,
    0xF,0x1,0x8,0x0,0x0,0x3,0x0,0x8,0x8,0x9,0x7,0x7,0x7,0xD,0x7,0x3,
    0xC,0x0,0x6,0x0,0x4,0x0,0x4,0x6,0x6,0x0,0xC,0xC,0xC,0xD,0xC,0xC,
    0x4,0x3,0x4,0x4,0x4,0x4,0x4,0x4,0x4,0x4,0x3,0x4,0x4,0x4,0x4,0x4
};
struct NeighborSampling g_neighborSampling = {
    { -1, 1, 1, -1, 0, 1, 0, -1, 0 },
    { 1, 1, -1, -1, 1, 0, -1, 0, 0, -8192, -4096 },
    { 0, 0x1000, 0x2000 }
};

/* Projection vertex-offset table for process3dg LOD expansion (eg3dproj),
   indexed (char*)&word_339F4 + f*2 + 18*row. */
int16 word_339F4[192] = {
    -1, 1, 0, -1, 1, 0, -1, 1, 0, 2, 1, 2,
    0, 2, 1, 0, 1, 0, 2, 2, 2, 1, 1, 1,
    0, 0, 0, 2, 2, 1, 2, 0, 1, 1, 0, 0,
    1, -1, 0, 1, -1, 0, 1, -1, 0, -2, -1, -2,
    0, -2, -1, 0, -1, 0, -2, -2, -2, -1, -1, -1,
    0, 0, 0, -2, -2, -1, -2, 0, -1, -1, 0, 0,
    -2, 2, -1, 1, 0, -2, 2, -1, 1, 0, -2, 2,
    -1, 1, 0, 2, 1, 2, 0, 2, 1, -1, 2, 0,
    1, -2, 2, -1, 1, 0, 2, 2, 2, 2, 2, 1,
    1, 1, 1, 1, 0, 0, 0, 0, 0, 2, 2, 1,
    2, 0, 1, 2, -1, 1, 0, 2, -2, 1, -1, 0,
    2, -2, 1, -1, 0, 2, -2, 1, -1, 0, 2, -2,
    1, -1, 0, -2, -1, -2, 0, -2, -1, 1, -2, 0,
    -1, 2, -2, 1, -1, 0, -2, -2, -2, -2, -2, -1,
    -1, -1, -1, -1, 0, 0, 0, 0, 0, -2, -2, -1,
    -2, 0, -1, -2, 1, -1, -2, 2, -1, 1, 0, 0
};

/* word_33BA2: per-LOD enable flag for the secondary 3D grid, indexed by LOD
   level (0..4); every level is enabled. */
int16 word_33BA2[5] = { 1, 1, 1, 1, 1 };
int16 var_141 = 0;
/* word_33BAE: per-LOD grid dimension (cells per side) used as the process3dg
   bounds check, indexed by LOD level (0..4). */
int16 word_33BAE[5] = { 0x400, 0x100, 0x40, 0x10, 8 };

/* 3D loader size/sign scalars. */

size_t size3d3 = 1;

/* 3D-loader buffers/sizes. buf3d3: shape->offset table, fread up to size3d3
 * words. sizes3dt: per-LOD vertex counts (5 entries, each <=0x20). matrix3dt:
 * 5 LODs x 32 vertex words. */
unsigned int buf3d3[100] = { 0 };
unsigned int size3d3_2 = 0;
int16 sign3dt = 0x3131;
unsigned int sizes3dt[5] = { 0x20, 0x20, 0x20, 0x20, 0x20 };
unsigned int matrix3dt[5][32] = { 0 };

/* word_33DD0: 32-word scratch buffer for the secondary photo/3D model loader
   (eg3dload.c). fread fills word_33DD0[0..size3d3_7-1] with per-section offsets,
   then word_33DD0[size3d3_7] gets the terminating size; section sizes are the
   successive differences word_33DD0[i+1] - word_33DD0[i]. */
int16 word_33DD0[32];
size_t size3d3_4 = 0;
size_t size3d3_5 = 0;
size_t size3d3_6 = 0;
size_t size3d3_3 = 0;
int16 sign3dg = 0x3232;

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

int16 word_3401A = 0;
char aOpenErrorOn_3d3[] = "Open Error on *.3D3";
char aOpenErrorOn_3d3_0[] = "Open Error on *.3D3";
char a15flt_xxx[] = "15FLT.xxx";
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
char unk_34121[] = "  Press a key when ready";
char a256pit_pic[] = "256pit.PIC";
char aBadGridFileFormat_[] = "Bad Grid file format.";

/* Saved original INT 0 (divide-by-zero) interrupt vector: offset in
 * word_34150, segment in word_34152. installDivZeroHandler records it before
 * pointing the vector at the in-game stub; installDivZeroVector restores it. */
int16 word_34150 = 0;
int16 word_34152 = 0;

/* Working state for the egseg1 coordinate-transform / line-clipping routines.
 * word_3416A/word_3416C hold the low/high words of a 32-bit accumulator. */
int16 word_34156 = 0;
int16 word_34158 = 0;
int16 word_3415A = 0;
int16 word_3415C = 0;
int16 word_3415E = 0;
int16 word_34160 = 0;
int16 word_34162 = 0;
int16 word_34164 = 0;
int16 word_34166 = 0;
int16 word_34168 = 0;
int16 word_3416A = 0;
int16 word_3416C = 0;
uint8 byte_3416E = 0;
uint8 byte_3416F = 0;
uint8 byte_34170 = 0;
int16 word_34171 = 0;
int16 word_34173 = 0;
int16 word_34175 = 0;
int16 word_34177 = 0;
int16 word_34179 = 0;
int16 word_3417B = 0;
int16 word_3417D = 0;
int16 word_3417F = 0;

/* word_34186: LOD level selected per object pass, indexed by var_666 (0..4) in
   the tile-object draw loop; feeds word_3C16C / process3dg. */
int16 word_34186[5] = { 3, 4, 2, 3, 4 };

/* More egseg1 scratch state. byte_34196 selects an active count/mode. */
int16 word_34190 = 0;
int16 word_34192 = 0;
int16 word_34194 = 0;
uint8 byte_34196 = 3;

uint8 byte_34197 = 6;
int16 word_34198 = 0;

/* var_190: object-shading flag, written by the 3D shape renderer. */
uint8 var_190 = 0;

/* colorLut: 256-entry colour-remap table for 3D shape rendering, indexed by a
 * shape/display-list colour byte (egflight.c drawVectorShape, eg3dview.c,
 * egmath.c, egseg1). The low entries double as the LOD/clip control words the
 * projection code reads, and several are overwritten at runtime:
 *   [0x00..0x0F] colour palette (loadColorPalette copies word_339B4[idx] here)
 *   [0x10..0x1F] LOD distance-threshold table (setupLodDistances writes [0..5])
 *   [0x20..0x21] var_198 object-cull distance (setupLodDistances writes it)
 *   [0x30..0x3F] near-clip distance table (read as word[BX] by the clipper)
 * Entries 0x40+ are unused colour slots (kept zero). */
uint8 colorLut[0x100] = {
    0x00,0x01,0x02,0x03,0x04,0x05,0x06,0x07,0x08,0x09,0x0A,0x0B,0x0C,0x0D,0x0E,0x0F,
    0x80,0x00,0x00,0x01,0x00,0x02,0x00,0x04,0x00,0x08,0x00,0x10,0x00,0x20,0x00,0x40,
    0x10,0x27,0x10,0x27,0x10,0x27,0x10,0x27,0x10,0x27,0x10,0x27,0x10,0x27,0x10,0x27,
    0xFF,0xFF,0xE9,0xFF,0xA5,0xFF,0x4A,0xFF,0x95,0xFE,0x2B,0xFD,0x56,0xFA,0xAC,0xF4
};

int16 var_194 = 0x800;
int16 var_195 = 0x1000;
int16 var_196 = 0x2000;
int16 var_197 = 0x4000;

int16 word_341DC[16] = { 2, 0x2C, 0xAC, 0x158, 0x2AD, 0x558, 0xAB0, 0x1560,
                         2, 0x1E, 0x75, 0xE9, 0x1D1, 0x3A1, 0x741, 0xE82 };
int16 word_341FC[32] = { 3, 0x32, 0xC5, 0x18A, 0x312, 0x622, 0xC43, 0x1886,
                         2, 0x1A, 0x65, 0xCA, 0x193, 0x325, 0x649, 0xC91,
                         4, 0x53, 0x145, 0x28A, 0x511, 0xA1E, 0x143B, 0x2876,
                         2, 0x1F, 0x78, 0xF0, 0x1DE, 0x3BB, 0x776, 0xEEC };

/* var_315: scalar flag, only byte[0] is used. */
int16 var_315 = 0;

/* var_200: model-data read cursor (far pointer into the loaded 3D model data).
 * egseg1/egcode advance it through the model byte stream as they decode shapes;
 * eg3dmap.c/eg3dproj.c walk it the same way. */
char far *var_200 = 0;
int16 var_202 = 0;
int16 var_203 = 0;
/* var_204: head of a 4-word run that sub_202B6 indexes by a model opcode
 * (BX in {0,2,4,6}). One contiguous C array so the index stays valid; element
 * 0 is also used as the scalar var_204. */
int16 var_204[4] = {0, 0, 0, 0};
/* Overlaid LZW-dict / vertex-projection scratch (was word_3424C..0x35AF7 in
 * egslots.asm). egcode.asm (pic dict) and egseg1.asm (render/numerator scratch +
 * vertex cluster) reach the sub-objects via _vtxScratch EQUs; the C flight code
 * uses vtxScratch.vproj. See struct VtxScratch. */
struct VtxScratch vtxScratch;

/* egseg1 fixed-point projection accumulators. word_34250/word_34252 and
 * word_34254/word_34256 are each the low/high words of a 32-bit value;
 * word_3426A/word_3426C are 16-bit multiplicands. */
int16 word_34250 = 0;
int16 word_34252 = 0;
int16 word_34254 = 0;
int16 word_34256 = 0;
uint8 var_215 = 0;
int16 var_216 = 0;
/* word_34262: a flag slot accessed both as a byte (eg3dmap clears the low
 * byte) and as a word (eg3dproj writes 7 via *(int16 *)&word_34262). */
int16 word_34262 = 0;
int16 var_218 = 0;
int16 var_219 = 0;
int16 var_220 = 0;
int16 word_3426A = 0;
int16 word_3426C = 0;
/* var_224-227: sphere/horizon projection scalars. */
int16 var_224 = 0;
int16 var_225 = 0;
int16 var_226 = 0;
int16 var_227 = 0;

/* word_34276: 3x3 (9-word) camera/world rotation matrix, filled by
 * buildRotationMatrixFar and consumed element-by-element by the egseg1
 * projection routines. */
int16 word_34276[9];

int16 var_255 = 0;
int16 var_256 = 0;
int16 var_257 = 0;
/* var_258: a flag, accessed only by byte (eg3dmap), in a 16-bit slot. */
int16 var_258 = 0;
int16 var_259 = 0;
int16 var_260 = 0;
int16 var_261 = 0;

/* word_36B7E/word_36B80/word_36B82: rotated 3D point coordinate components
   (X/Y/Z) produced by rotatePoint3d (egseg1) and consumed by the subsequent
   per-vertex projection scan. word_36B84: the point component temp held across
   the rotation-matrix multiplies. */
int16 word_36B7E = 0;
int16 word_36B80 = 0;
int16 word_36B82 = 0;
int16 word_36B84 = 0;

/* var_316: standalone byte flag. */
uint8 var_316 = 0;

/* word_36B89: loop bound (vertex/element count << 2) for the per-vertex scan
   in egseg1. */
int16 word_36B89 = 0;

/* word_36C10/word_36C12/word_36C14: byte-offset cursors into the current model
   primitive buffer (index, attribute, and base spans) set up by the egseg1
   primitive renderer. byte_36C16/byte_36C17: per-run element countdown counters
   driving the inner draw loops. byte_36C18: 0..2 phase counter selecting which
   of the two saved coordinate sets the next primitive writes. */
int16 word_36C10 = 0;
int16 word_36C12 = 0;
int16 word_36C14 = 0;
uint8 byte_36C16 = 0;
uint8 byte_36C17 = 0;
uint8 byte_36C18 = 0;

/* byte_36C31: flag cleared before the final clipped-primitive emit pass in the
   egseg1 renderer. byte_36C32: element countdown counter for the secondary draw
   loop. word_36C33: saved primitive coordinate/accumulator carried across that
   loop. */
uint8 byte_36C31 = 0;
uint8 byte_36C32 = 0;
int16 word_36C33 = 0;
/* word_37348: 256-entry signed sine table (sin(i*2*pi/256) scaled to +-0x7FFF),
 * with 3-4 trailing zero slots so the +1 look-ahead read stays in bounds.
 * valueToAngle() does an arcsin by searching this table and interpolating
 * between word_37348[b] and word_37348[b+1] (the latter named word_3734A in
 * the asm consumers, which read it as offset _word_37348+2). */
int16 word_37348[260] = {
    0x0000, 0x0324, 0x0648, 0x096B, 0x0C8C, 0x0FAB, 0x12C8, 0x15E2, 0x18F9, 0x1C0C, 0x1F1A, 0x2224,
    0x2528, 0x2827, 0x2B1F, 0x2E11, 0x30FC, 0x33DF, 0x36BA, 0x398D, 0x3C57, 0x3F17, 0x41CE, 0x447B,
    0x471D, 0x49B4, 0x4C40, 0x4EC0, 0x5134, 0x539B, 0x55F6, 0x5843, 0x5A82, 0x5CB4, 0x5ED7, 0x60EC,
    0x62F2, 0x64E9, 0x66D0, 0x68A7, 0x6A6E, 0x6C24, 0x6DCA, 0x6F5F, 0x70E3, 0x7255, 0x73B6, 0x7505,
    0x7642, 0x776C, 0x7885, 0x798A, 0x7A7D, 0x7B5D, 0x7C2A, 0x7CE4, 0x7D8A, 0x7E1E, 0x7E9D, 0x7F0A,
    0x7F62, 0x7FA7, 0x7FD9, 0x7FF6, 0x7FFF, 0x7FF6, 0x7FD9, 0x7FA7, 0x7F62, 0x7F0A, 0x7E9D, 0x7E1E,
    0x7D8A, 0x7CE4, 0x7C2A, 0x7B5D, 0x7A7D, 0x798A, 0x7885, 0x776C, 0x7642, 0x7505, 0x73B6, 0x7255,
    0x70E3, 0x6F5F, 0x6DCA, 0x6C24, 0x6A6E, 0x68A7, 0x66D0, 0x64E9, 0x62F2, 0x60EC, 0x5ED7, 0x5CB4,
    0x5A82, 0x5843, 0x55F6, 0x539B, 0x5134, 0x4EC0, 0x4C40, 0x49B4, 0x471D, 0x447B, 0x41CE, 0x3F17,
    0x3C57, 0x398D, 0x36BA, 0x33DF, 0x30FC, 0x2E11, 0x2B1F, 0x2827, 0x2528, 0x2224, 0x1F1A, 0x1C0C,
    0x18F9, 0x15E2, 0x12C8, 0x0FAB, 0x0C8C, 0x096B, 0x0648, 0x0324, 0x0000, 0xFCDC, 0xF9B8, 0xF695,
    0xF374, 0xF055, 0xED38, 0xEA1E, 0xE707, 0xE3F4, 0xE0E6, 0xDDDC, 0xDAD8, 0xD7D9, 0xD4E1, 0xD1EF,
    0xCF04, 0xCC21, 0xC946, 0xC673, 0xC3A9, 0xC0E9, 0xBE32, 0xBB85, 0xB8E3, 0xB64C, 0xB3C0, 0xB140,
    0xAECC, 0xAC65, 0xAA0A, 0xA7BD, 0xA57E, 0xA34C, 0xA129, 0x9F14, 0x9D0E, 0x9B17, 0x9930, 0x9759,
    0x9592, 0x93DC, 0x9236, 0x90A1, 0x8F1D, 0x8DAB, 0x8C4A, 0x8AFB, 0x89BE, 0x8894, 0x877B, 0x8676,
    0x8583, 0x84A3, 0x83D6, 0x831C, 0x8276, 0x81E2, 0x8163, 0x80F6, 0x809E, 0x8059, 0x8027, 0x800A,
    0x8001, 0x800A, 0x8027, 0x8059, 0x809E, 0x80F6, 0x8163, 0x81E2, 0x8276, 0x831C, 0x83D6, 0x84A3,
    0x8583, 0x8676, 0x877B, 0x8894, 0x89BE, 0x8AFB, 0x8C4A, 0x8DAB, 0x8F1D, 0x90A1, 0x9236, 0x93DC,
    0x9592, 0x9759, 0x9930, 0x9B17, 0x9D0E, 0x9F14, 0xA129, 0xA34C, 0xA57E, 0xA7BD, 0xAA0A, 0xAC65,
    0xAECC, 0xB140, 0xB3C0, 0xB64C, 0xB8E3, 0xBB85, 0xBE32, 0xC0E9, 0xC3A9, 0xC673, 0xC946, 0xCC21,
    0xCF04, 0xD1EF, 0xD4E1, 0xD7D9, 0xDAD8, 0xDDDC, 0xE0E6, 0xE3F4, 0xE707, 0xEA1E, 0xED38, 0xF055,
    0xF374, 0xF695, 0xF9B8, 0xFCDC, 0x0000, 0x0000, 0x0000, 0x0000,
};

/* byte_3754E: swap/sign flag in the egseg1 edge interpolator (toggled per edge,
   tested to decide step direction). word_3754F/word_37551/word_37553/word_37555:
   the edge-stepping working registers (midpoint accumulators, IMUL/IDIV divisor,
   and subtrahend) used while rasterizing a clipped line/edge. */
uint8 byte_3754E = 0;
int16 word_3754F = 0;
int16 word_37551 = 0;
int16 word_37553 = 0;
int16 word_37555 = 0;

/* Default full-screen clip bounds for the 3D rasterizer (right/bottom). */
int16 word_37557 = 0x13F;
int16 word_37559 = 0x6F;
/* Clip rectangle for the 3D line/polygon rasterizer
   (word_3755D/3755F/37561/37563 = left/right/top/bottom). */
int16 word_3755D = 0;
int16 word_3755F = 0;
int16 word_37561 = 0;
int16 word_37563 = 0;

/* word_378D5/word_378D7: working screen coordinates for the second egseg1 edge
   rasterizer. word_378D9/word_378DB: the accumulated dirty-rectangle X/Y bounds
   handed to gfx_dirtyRect after a primitive is drawn. byte_378DE: this
   rasterizer's swap/sign flag. word_378DF/word_378E1/word_378E3/word_378E5: its
   edge-stepping working registers (midpoint accumulators, IMUL/IDIV divisor and
   subtrahend). */
int16 word_378D5 = 0;
int16 word_378D7 = 0;
int16 word_378D9 = -1;
int16 word_378DB = 0;
uint8 byte_378DE = 0;
int16 word_378DF = 0;
int16 word_378E1 = 0;
int16 word_378E3 = 0;
int16 word_378E5 = 0;
uint8 byte_378EE = 0;

/* Timer-ISR state block (egcode.asm). word_378F0/word_378F2: 32-bit elapsed
   tick count (lo/hi). word_378F4: countdown target. word_378F6: PIT reload
   divisor. word_378F8: accumulated tick count. word_378FA: timer-running flag.
   byte_378FC: PIT clock divider. word_378FD: timer mode. word_378FF/word_37901:
   32-bit calibration sum (lo/hi). byte_37903: vsync flag. word_37904: per-frame
   tick counter. word_37906: retrace-wait counter. */
int16 word_378F0 = 0;
int16 word_378F2 = 0;
int16 word_378F4 = 0;
int16 word_378F6 = 0;
int16 word_378F8 = 0;
int16 word_378FA = 0;
uint8 byte_378FC = 0;
int16 word_378FD = 0;
int16 word_378FF = 0;
int16 word_37901 = 0;
uint8 byte_37903 = 0;
int16 word_37904 = 0;
int16 word_37906 = 0;

/* var_383: frame-rate timing accumulator (incremented per frame tick by
 * advanceFrameTick, recalibrated against the BIOS timer by the frame pacer). */
uint16 var_383 = 0;

/* byte_3790C: [0] is the per-frame tick counter (incremented by
 * advanceFrameTick, spun on by the frame sync). The rest is a read-only
 * lookup table of four 64-entry signed-word animation curves at offsets
 * 0x1A/0x9A/0x11A/0x19A, sampled by the egseg2 cockpit-tape renderer. */
uint8 byte_3790C[0x21A] = {
    0, 0, 0, 160, 1, 0, 0, 0, 15, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 94, 80, 2, 0, 2, 0, 2, 0,
    2, 0, 2, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 255, 255, 255, 255, 254, 255, 254, 255, 253, 255, 252, 255, 252, 255,
    251, 255, 251, 255, 250, 255, 250, 255, 249, 255, 249, 255, 248, 255, 248, 255,
    248, 255, 247, 255, 247, 255, 247, 255, 247, 255, 247, 255, 247, 255, 247, 255,
    247, 255, 247, 255, 248, 255, 248, 255, 248, 255, 249, 255, 249, 255, 250, 255,
    250, 255, 251, 255, 251, 255, 252, 255, 252, 255, 253, 255, 254, 255, 254, 255,
    255, 255, 255, 255, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0,
    1, 0, 2, 0, 2, 0, 2, 0, 2, 0, 255, 255, 254, 255, 254, 255,
    253, 255, 253, 255, 252, 255, 252, 255, 251, 255, 251, 255, 250, 255, 250, 255,
    250, 255, 249, 255, 249, 255, 249, 255, 249, 255, 249, 255, 249, 255, 249, 255,
    249, 255, 249, 255, 250, 255, 250, 255, 250, 255, 251, 255, 251, 255, 252, 255,
    252, 255, 253, 255, 253, 255, 254, 255, 254, 255, 255, 255, 0, 0, 0, 0,
    0, 0, 0, 0, 1, 0, 1, 0, 2, 0, 2, 0, 3, 0, 3, 0,
    3, 0, 4, 0, 4, 0, 4, 0, 4, 0, 4, 0, 4, 0, 4, 0,
    4, 0, 4, 0, 3, 0, 3, 0, 3, 0, 2, 0, 2, 0, 1, 0,
    1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 255, 255, 255, 255, 254, 255,
    254, 255, 253, 255, 253, 255, 252, 255, 252, 255, 251, 255, 250, 255, 250, 255,
    249, 255, 249, 255, 248, 255, 248, 255, 247, 255, 247, 255, 246, 255, 246, 255,
    246, 255, 245, 255, 245, 255, 245, 255, 245, 255, 245, 255, 245, 255, 245, 255,
    245, 255, 245, 255, 246, 255, 246, 255, 246, 255, 247, 255, 247, 255, 248, 255,
    248, 255, 249, 255, 249, 255, 250, 255, 250, 255, 251, 255, 252, 255, 252, 255,
    253, 255, 253, 255, 254, 255, 254, 255, 255, 255, 255, 255, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 255, 255, 254, 255, 254, 255,
    253, 255, 253, 255, 252, 255, 252, 255, 251, 255, 251, 255, 250, 255, 250, 255,
    250, 255, 249, 255, 249, 255, 249, 255, 249, 255, 249, 255, 249, 255, 249, 255,
    249, 255, 249, 255, 250, 255, 250, 255, 250, 255, 251, 255, 251, 255, 252, 255,
    252, 255, 253, 255, 253, 255, 254, 255, 254, 255, 255, 255, 0, 0, 0, 0,
    0, 0, 0, 0, 1, 0, 1, 0, 2, 0, 2, 0, 3, 0, 3, 0,
    3, 0, 4, 0, 4, 0, 4, 0, 4, 0, 4, 0, 4, 0, 4, 0,
    4, 0, 4, 0, 3, 0, 3, 0, 3, 0, 2, 0, 2, 0, 1, 0,
    1, 0, 0, 0, 0, 0, 0, 0, 0, 0,
};
/* byte_37C24: reduced-scale render toggle. When set, world/target rendering
   uses a halved scale (smaller sizes, extra scale shift, shifted overlay). */
uint8 byte_37C24 = 0;
uint8 byte_37C2F = 0;

/* byte_37EEE: column counter for the egseg2 heading/compass tape renderer.
   byte_37EEF: the current tape character/digit being drawn. word_37EF0: the
   running screen X offset (DI cursor) advanced as each tape cell is emitted. */
uint8 byte_37EEE = 0;
uint8 byte_37EEF = 0;
int16 word_37EF0 = 0;

/* mapEvents: 4 tactical-map marker slots (flare/chaff/lock markers). A slot is
   free when ttl == 0; entries are aged down by tickMessageTimers. */
struct MapEvent mapEvents[4];
uint8 byte_37F98 = 0;   /* keyboard virtual-stick raw pitch axis (int9Handler) */
uint8 byte_37F99 = 0;   /* keyboard virtual-stick raw roll axis (int9Handler) */
/* Normalized/calibrated stick deflection: [0] = pitch, [1] = roll.
   Produced by readCalibratedJoystick (egseg2) or scaled from the keyboard
   raw axes; read by the stick dot and tac map. */
uint8 joyAxes[2] = {0};
uint8 aLandingGearRaised[] = "Landing gear raised";
uint8 aBrakesOn[] = "Brakes on";
uint8 a_[] = ".";
uint8 aG[] = "G";
uint8 aFiring[] = " firing ";
/* byte_37FEC: g-load lookup indexed by (abs(roll) >> 8) & 0x7f. Lowest near
   wings-level, peaking past 90 degrees of bank where lift bleeds off. */
uint8 byte_37FEC[128] = {
    0x10, 0x10, 0x10, 0x10, 0x10, 0x11, 0x11, 0x11, 0x11, 0x11, 0x11, 0x11, 0x11, 0x12, 0x12, 0x12,
    0x12, 0x12, 0x12, 0x12, 0x13, 0x13, 0x14, 0x14, 0x15, 0x16, 0x16, 0x17, 0x18, 0x19, 0x19, 0x1a,
    0x1b, 0x1b, 0x1c, 0x1d, 0x1d, 0x1e, 0x1f, 0x1f, 0x20, 0x22, 0x24, 0x25, 0x27, 0x29, 0x2b, 0x2c,
    0x2e, 0x30, 0x34, 0x38, 0x3c, 0x40, 0x48, 0x50, 0x60, 0x70, 0x80, 0x90, 0xa0, 0xb0, 0xc0, 0xd0,
    0xc0, 0xb0, 0xa0, 0x90, 0x80, 0x70, 0x60, 0x50, 0x48, 0x40, 0x3c, 0x38, 0x34, 0x30, 0x2e, 0x2c,
    0x2b, 0x29, 0x27, 0x25, 0x24, 0x22, 0x20, 0x1f, 0x1f, 0x1e, 0x1d, 0x1d, 0x1c, 0x1b, 0x1b, 0x1a,
    0x19, 0x19, 0x18, 0x17, 0x16, 0x16, 0x15, 0x14, 0x14, 0x13, 0x13, 0x12, 0x12, 0x12, 0x12, 0x12,
    0x12, 0x12, 0x11, 0x11, 0x11, 0x11, 0x11, 0x11, 0x11, 0x11, 0x10, 0x10, 0x10, 0x10, 0x10, 0x08,
};

/* unk_3806E: current 3x3 orientation matrix (Q15 identity init). */
int16 unk_3806E[9] = {0x7FFF, 0, 0, 0, 0x7FFF, 0, 0, 0, 0x7FFF};

/* Per-axis delta rotation matrices rebuilt each frame from sin/cos of the
   heading/pitch/roll change and composited into unk_3806E by applyRotationDelta.
   word_38080 = yaw (Y axis), unk_38092 = pitch (X axis), word_380A4 = roll
   (Z axis); the fixed 0x7FFF entry is the unchanged on-axis component. */
int16 word_38080[9] = {0, 0, 0, 0, 0x7FFF, 0, 0, 0, 0};
int16 unk_38092[9]  = {0x7FFF, 0, 0, 0, 0, 0, 0, 0, 0};
int16 word_380A4[9] = {0, 0, 0, 0, 0, 0, 0, 0, 0x7FFF};

/* bulletTracks: 3D projectile table (player rounds + threat shots), HUD-projected. */
struct BulletTrack bulletTracks[20];

/* 3x3 rotation matrix scratch buffers (9 words): written by
 * multiplyMatrix3x3Far/buildRotationMatrixFar, read as [axis]/[3+axis]/[6+axis]. */
int16 unk_380B6[9];
int g_ourPitch = 0;
int g_ourRoll = 0;
/* player orientation/altitude view state, shared with egseg2 projection. */
int g_ourHead = 0;

#ifdef NO_ASM
int16 g_viewZ;
#endif

/* word_380D0: airspeed/velocity magnitude. */
unsigned int word_380D0 = 0;
int16 var_549 = 0;
char var_550 = 0;
/* byte_380DD: orientation-dirty flag. Set when heading/pitch/roll change so the
   next frame rebuilds the rotation matrix; cleared by rebuildOrientation(). */
char byte_380DD = 0;
int16 word_380E2 = 0;

/* blitSprite() sprite descriptor. */
struct SpriteParams blitSpriteParams = {
    0, 0, 0, 0, 0, 0, 0, 0,   /* bufPtr,srcX,srcY,page,dstX,dstY,width,height */
    {0, 0}, 0x61, {0, 0, 0}, 0x3F, 0x01,   /* +0x10..0x17 config bytes */
    0x01,                     /* flags (byte_383E4 init) */
    {0x01, 0x01, 0x00}        /* pad19[0]=var_586 init */
};
char a256left_pic[] = "256Left.Pic";
char a256right_pic[] = "256Right.Pic";
char a256rear_pic[] = "256Rear.Pic";
char aLeft_pic[] = "Left.Pic";
char aRight_pic[] = "Right.Pic";
char aRear_pic[] = "Rear.Pic";
uint8 aArmed[] = " armed";

/* voiceCueThresholds[0..2]: per-weapon digital-voice-cue thresholds (vs f15DgtlResult).
   playVoiceCue also indexes [4] (weaponIdx can be 4), an over-read. */
int16 voiceCueThresholds[3] = { 0x31F3, 0x4796, 0x5C92 };
int16 word_38126 = 0x6C;
/* unk_38128: vector-shape display list for drawVectorShape (two outlined boxes,
   colors 7 and 8). Each sub-shape is a color word, then x,y point pairs, ended
   by -1; a trailing -1 terminates the list. */
int16 unk_38128[21] = {
    7, 0x53, 0x15, 0x49, 0x5E, 0x53, 0x5E, 0x53, 0x15, -1,
    8, 0xF1, 0x15, 0xFB, 0x5E, 0xF1, 0x5E, 0xF1, 0x15, -1, -1
};
int16 word_38152 = 0;
int16 var_556 = 0;

/* g_setThrust: player thrust setting. word_380E2: a frame timer. */
int16 g_setThrust = 0;
uint8 aFiredBy[] = " fired by ";
char aDash[] = " - ";
char aTakingOff[] = " taking off";
char a0[] = ":0";
char aColon[] = ":";
char aFired[] = " fired";

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

/* ammoNumX[3]: screen x-coordinate of the ammo-count readout for each
 * missileSpecIndex (0..2). */
int16 aA[3] = { 65, 26, 101 };

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
/* word_38202: HUD/tac-map indicator descriptor block (156 words). [0..2] are
   the weapon-ammo X positions; [3..22] are four 5-word indicator rectangles
   (x1,y1,x2,y2,color). The remaining tail is additional descriptor tables. */
int16 word_38202[156] = {
    0x0041, 0x001A, 0x0065, 0x00A3, 0x00BF, 0x00A9, 0x00C5, 0x0003,
    0x00B4, 0x00BF, 0x00BA, 0x00C5, 0x0003, 0x00D6, 0x00BF, 0x00DC,
    0x00C5, 0x0003, 0x00C5, 0x00BF, 0x00CB, 0x00C5, 0x0003, 0x0002,
    0x0085, 0x0010, 0x008A, 0x0000, 0x011F, 0x0085, 0x0129, 0x008A,
    0x0000, 0x011F, 0x0090, 0x0129, 0x0095, 0x0000, 0x011F, 0x009B,
    0x0129, 0x00A0, 0x0000, 0x0098, 0x0072, 0x00A8, 0x0075, 0x0003,
    0x0098, 0x00B4, 0x00A8, 0x00B7, 0x0003, 0x000A, 0x0074, 0x0010,
    0x0078, 0x000A, 0x0013, 0x0074, 0x0019, 0x0078, 0x000A, 0x001C,
    0x0074, 0x0023, 0x0078, 0x000A, 0x000A, 0x0079, 0x0010, 0x007C,
    0x000A, 0x0013, 0x0079, 0x0019, 0x007C, 0x000A, 0x001C, 0x0079,
    0x0023, 0x007C, 0x000A, 0x000A, 0x007D, 0x0010, 0x0080, 0x000A,
    0x0013, 0x007D, 0x0019, 0x0080, 0x000A, 0x001C, 0x007D, 0x0023,
    0x0080, 0x000A, 0x0004, 0x0002, 0x001E, 0x0015, 0x000D, 0x0007,
    0x0037, 0x0023, 0x003B, 0x0007, 0x0059, 0x0023, 0x0050, 0x0025,
    0x0065, 0x0039, 0x002F, 0x0026, 0x004A, 0x0036, 0x0011, 0x002E,
    0x0036, 0x0042, 0x0005, 0x0036, 0x001F, 0x0047, 0x0016, 0x001D,
    0x004A, 0x0021, 0x0003, 0x0019, 0x0006, 0x001A, 0x0034, 0x001A,
    0x0041, 0x001B, 0x0004, 0x0010, 0x0008, 0x0014, 0x0000, 0x0002,
    0x0002, 0x0000, 0x0000, 0x0000, 0x0001, 0x007C, 0x00C4, 0x00B0,
    0x0118, 0x5ACE, 0x0001, 0x0001
};
/* The three gfx page/viewport descriptors (11-word records): [0]=page id,
   [1]=color/mode, [2]=fill color, [7..10]=clip rect, [8]=page base/height
   select. off_38334/3834C/38364 are the near-pointers the rendering code reads
   them through. */
int16 unk_3831E[11] = { 0, 2, 2, 0, 0, 0, 1, 0, 0x60, 0, 0x13F };
int16 *off_38334 = unk_3831E;
int16 unk_38336[11] = { 1, 2, 2, 0, 0, 0, 1, 0, 0x60, 0, 0x13F };
int16 *off_3834C = unk_38336;
int16 word_3834E[11] = { 2, 2, 2, 0, 0, 0, 0, 0, 0xC7, 0, 0x13F };
int16 *off_38364 = word_3834E;
int16 buf6data_0[11] = { 0, 2, 2, 0, 0, 0, 1, 0x70, 0xA8, 0x18, 0x60 };
int16 buf6data_1[11] = { 0, 2, 2, 0, 0, 0, 1, 0x80, 0xB8, 0xE8, 0x130 };
char  *var_567 = (char *)buf6data_0;
int16 *var_568 = buf6data_1;

/* byte_383E5: tactical-map zoom level (declared dw, used as a small int). */
int16 byte_383E5 = 8;

/* blitGaugeSprite() sprite descriptor. */
struct SpriteParams gaugeSpriteParams = {
    0, 0, 0, 0, 0, 0, 7, 7,   /* bufPtr,srcX,srcY,page,dstX,dstY,width,height */
    {0x68, 0}, 0xAF, {0, 0x78, 0}, 0xC7, 0x00,   /* +0x10..0x17 config bytes */
    0x10,                     /* flags */
    {0x01, 0x01, 0x00}        /* pad19 */
};

/* var_588: radar range. var_589/590: standalone int16 scalars.
 * word_383F2/word_383F4: tacmap blink/dwell countdown timers. */
int16 var_588 = 1;
int16 var_589 = 0;
int16 var_590 = 0;
int16 word_383F2 = 0;
int16 word_383F4 = 0;
int16 var_593 = 0;
uint8 byte_3850E = 0;

/* var_595/597: standalone int16 scalars.
 * var_596: detail-level counter (0..2), also a joystick-scaling factor. */
int16 var_595 = 0;
int16 var_596 = 2;
int16 var_597 = 0;

/* Per-axis joystick read accumulator, indexed by axis in readAxisInput.
 * The key handler reuses slots [0]/[1]/[2] as scratch state (egkeys.c). */
int16 word_38606[4] = { 0, 0, 0, 0 };
uint8 byte_3862A = 0;
uint8 byte_3862B = 0;
uint8 picBuf[0x200] = { 0 };

/* var_654, var_657..672: standalone int16 flags. */
int16 var_654 = 0;
uint8 far *farPointer = 0;
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
int16 var_669 = 0;
int16 var_670 = 0;
int16 var_671 = 0;
int16 var_672 = 0;
int16 var_673 = 0;
int16 var_674 = 0;
int16 var_675 = 0;
int16 var_676 = 0;
int16 var_677 = 0;

/* Scratch buffers (fread / moveNearFar / indexed scratch). */
uint8 flt15_buf1[0x40];
uint8 flt15_buf2[0x1040];
size_t flt15_size = 0;
int16 flt15_word1 = 0;
int16 var_680 = 0;
int16 var_681 = 0;
int16 var_682 = 0;
int16 var_683 = 0;
int16 var_684 = 0;
int16 var_685 = 0;
int16 var_686 = 0;
/* word_38F70: frame-init scalar seeded in initFrameRandom from the target-slot
   counts ((p & 0xF) << 8). */
int16 word_38F70;
int word_38F72;
/* strBuf: scratch buffer for building status/event message strings (assembled
   with strcpy/strcat/itoa, then drawn or queued). 24 labelled bytes plus the
   slack run up to word_38FC6 give it 78 bytes of capacity. */
char strBuf[78];
uint8 byte_38F8C;
uint8 byte_38F8D[1];

int16 word_38FC4;
int16 word_38FC6;
int16 word_38FC8;
int16 word_38FCC;
int16 word_38FCE;
/* unk_38FD0: g-meter readout string ("<g>.<tenths>G") built by drawGMeter and
   drawn by the HUD string-blit (egseg2). */
uint8 unk_38FD0[12];
int word_38FDC;
int16 word_38FDE;
int16 word_38FE0;
uint8 far *dword_38FE2;
FILE *fileHandle;
int16 word_38FE8;
int16 word_38FEA;
int16 word_38FEC;
int16 word_38FEE;

/* gameData: far pointer to the shared Game struct, set at startup.
 * unk_3BF96/unk_3BF98: tacmap screenX/screenY scratch. */
struct Game far *gameData = 0;
int16 word_38FF6;
int16 word_38FF8;
int16 word_38FFA;
int16 word_38FFC;
uint8 buf4_3dg[0x200];
uint8 buf_3dt[4000];
int16 g_playerPlaneFlags;
int16 word_39200;
uint8 buf3_3dg[0x200];
int16 word_39402;
int16 word_39604;
int word_39606;
uint8 buf2_3dg[0x200];
/* word_39808: nearest-tile-object pointer; result of findNearestTileObject(),
   pointing at the nearestTile scratch record below. */
struct TileObject *word_39808;

/* buf1_3dg: 16x16 grid, indexed col+(row<<4) (0..255). */
uint8 buf1_3dg[0x100];
char byte_3995A;
int16 word_3995C;
int16 word_3A8FE;

/* byte_3A900: 8x8 theater terrain grid, read as [col+(row<<3)] (0..63);
 * [66] = 64 grid bytes + 2 pad. */
uint8 byte_3A900[66];
int16 word_3A940;
int g_velocity;
int16 word_3A946;
int16 unk_3A948[9];
struct ViewSnapshot stru_3A95A[16];
int16 g_knots;
struct TargetSlot g_targetSlots[2];
/* g_planeTable: lead name-index word (word_3AA5C) + the 74-entry target array
   (g_planes), one contiguous block loaded from the mission file. */
struct GroundTargetTable g_planeTable;
int16 word_3AF0C;
uint8 buf3d3_1[0x96];
int16 word_3AFA4;
int16 word_3AFA8;
int16 word_3AFAA;
uint8 byte_3AFAC[0x100];
int16 word_3B0AC;
uint8 buf3d3_2[0x96];
uint8 buf3d3_3[0x96];
int32 dword_3B1FE;
struct SimObject stru_3B202[20];

/* var_810/811: viewX/viewY scratch for the player tile-object world pos. */
uint16 var_810 = 0;
uint16 var_811 = 0;
int16 word_3B4D2;
int32 dword_3B4D4;
int16 word_3B4D8;
int16 word_3B4DA;
int16 word_3B4DC;
int16 word_3B4DE;
int16 word_3B4E0;
uint8 hercFlag;
int16 word_3B4E4;
/* Model/shape LOD cache (754 reserved bytes = 94 8-byte records). eg3dmap
 * appends entries with memcpy (word_38FF8 is the live count) and scans
 * backwards for a key match. */
struct Unknown3B4E6Record8 byte_3B4E6[94];
int16 word_3B5D6;
int32 g_ViewX;
int16 word_3B7DE;
/* nearestTile: scratch record filled by findNearestTileObject()/
   drawNearestTileObject() and walked by addTileEntry(). */
struct TileObject nearestTile;
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

/* byte_3B7FC: tactical-replay event log (events[0..0x600]) + 3D model vertex-X
   table (vertexX[] at +0x600). One 0x640-byte buffer; egseg1.asm reaches
   vertexX at the fixed offset _byte_3B7FC+0x600, so it must stay contiguous. */
struct ReplayLog byte_3B7FC;
int16 word_3BE3C;
uint8 byte_3BE3E[0x40];
int16 word_3BE7E;
uint8 byte_3BE80[0x10];
int16 keyValue;
int16 word_3BE92;
int word_3BE94;
int16 word_3BE96;

int16 word_3BE98;

int16 word_3BE9C[16];
int16 word_3BEBC;
int16 word_3BEBE;
int16 g_viewX_;
int16 word_3BEC2;

/* Single-byte values (only [0] is used); the extra bytes are trailing pad
 * up to the next symbol. */
uint8 byte_3BEC4[4];
int16 word_3BEC8;
int16 sign3d3;
int16 word_3BECC;
int16 word_3BECE;
int16 g_viewY_;
int16 word_3BED2;
int16 word_3BED4;
int16 word_3BED6;
uint8 byte_3BED8[0x64];
char tempString[80];
int16 word_3BF3C;
int16 word_3BF3E;
int16 g_gunHits;
int16 g_thrust;
/* regs: shared int86/int86x register union for INT 10h/16h calls. */
union REGS regs;
uint8 unk_3BF95;
int16 unk_3BF96;
int16 unk_3BF98;
int16 word_3BFA0;
int16 word_3BFA2;
uint8 byte_3BFA4[UNIT_STATE_COUNT];
int16 word_3C008;
int16 word_3C00A;
int16 word_3C00C;
int word_3C00E;
int16 flagFarToNear;
int16 keyScancode;
int16 word_3C014;
int16 word_3C016;
int16 word_3C018;
int16 word_3C01A;
int32 dword_3C01C;
int16 word_3C020;
int32 dword_3C024;
int16 word_3C028;
uint8 byte_3C02A[2];
int16 word_3C02C;
int16 word_3C02E;
/* unk_3C030: itoa scratch buffer for assembling HUD/MFD numeric strings. */
char unk_3C030[12];
char string_3C04A[80];
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
char *word_3C0A2[100];
int16 g_closestThreatIndex;
int16 word_3C16C;
/* byte_3C16E: 0x2ee-byte buffer holding the region label strings; word_3C0A2[]
   entries point into it (parsed by the loader, read back via moveNearFar). */
char byte_3C16E[0x2EE];
int16 g_currentWeaponType;
int16 word_3C45E;
/* matrix3dt_2: per-LOD x per-vertex model-data pointers (parallels matrix3dt). */
struct Matrix3dEntry7 *matrix3dt_2[5][32];
char byte_3C5A0;
int16 word_3C5A2;
int16 word_3C5A4;
int16 word_3C5A6;
struct Matrix3dEntry7 *word_3C5A8;
int16 word_3C5AA;
int16 *word_3C69C;
int16 word_3C69E;
uint8 byte_3C6A0[1];
int16 *word_3C6A2;
int16 word_3C6A4;

/* commData: far pointer to the shared inter-process game-state record. */
struct GameComm far *commData = 0;
int16 word_3C6AA;
int16 word_3C6AC;
int word_3C6AE;
uint8 byte_3C8B0[2];

/* g_proj3d: projectObjects() world-space projection origin (three longs). */
struct Proj3d g_proj3d;
int16 word_3C8B2;
int16 gfxBufPtr;
int g_gees;
int16 word_3C8B6;
/* size3d3_7: vertex count for the secondary (word_33DD0) loader buffer. */
size_t size3d3_7;

char a_3d3[] = ".3D3";
char aRb[] = "rb";
