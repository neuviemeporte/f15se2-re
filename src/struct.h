#ifndef STRUCT_H
#define STRUCT_H

#include "inttype.h"

struct JoyAxes {
    uint8 x,y;
};

#pragma pack(1)
struct Buf6Item {
    int16 field_0;
    uint16 field_2;
    uint16 field_4; // near pointer?
    uint16 field_6;
    int32 field_8;
    int32 field_C;
    int16 field_10;
    int16 field_12;
    int16 field_14;
    int16 field_16;
    int16 field_18;
    int16 field_1A;
    uint16 field_1C;
    uint8 field_1E[6];
};
#define BUF6ITEMSIZE 0x24

/* Buf4Item: 16-byte world target/object entry from .wld files.
 * Each entry describes a placeable object in the game world.
 * Used by wldReadBuf4[] array loaded from theater .wld data.
 * Fields derived from F-117A reverse engineering (same engine). */
#pragma pack(1)
struct Buf4Item {
    uint16 unitRef;      /* object/unit type reference (index into wldOffsets name table) */
    uint16 x_coord;      /* world X coordinate */
    uint16 y_coord;      /* world Y coordinate */
    int16 unitType;      /* unit type: 0=empty, 21=special */
    int16 targetFlags;   /* target flags bitfield (0x100=airbase, 0x200=large, 0x400=waypoint, 0x500=base, 0x800=disabled) */
    int16 field_A;       /* unknown */
    int16 field_C;       /* unknown */
    int16 objectIdx;     /* index into wld_obj_table, masked with 0x7f */
};
#define BUF4ITEMSIZE 0x10

#define BUF7SIZE 0x64
#define BUF10SIZE 0x100

/* Target: 0x12-byte mission target/parameters structure.
 * Two targets per mission: targets[0] = primary, targets[1] = secondary.
 * Populated by runGenerator() during mission generation. */
#pragma pack(1)
struct Target {
    int16 missionType;   /* 1=photograph, 2=destroy, 3=supply_drop, 4=landing */
    int16 targetIdx;     /* target index into wldReadBuf4[] world data */
    int16 baseIdx;       /* takeoff base (primary) or landing base (secondary) index */
    int16 missionCode;   /* bit flags for mission completion detection */
    int16 missionNum;    /* index into mission lookup table (stru_18FC0/stru_33402) */
    uint8 coord[6];      /* grid reference string (e.g. "A3B2") */
    int16 distance;      /* distance metric */
};

#define TARGETSIZE 0x12

/* MissionTableEntry: 0x0C-byte mission lookup table entry.
 * Array of ~56 entries defining possible mission types per theater/tension.
 * Used by stru_18FC0[] (start.exe) and stru_33402[] (egame.exe). */
#pragma pack(1)
struct MissionTableEntry {
    int16 theaterMask;   /* bitmask of which theaters support this mission */
    int16 tensionMask;   /* bitmask of which tension/campaign levels support it */
    int16 missionType;   /* 1=photograph, 2=destroy, 3=supply_drop, 4=landing */
    int16 objectFlag;    /* must match wld_obj_table[target.objectIdx] */
    int16 missionCode;   /* completion detection flags */
    int16 special;       /* special parameter, can be negative */
};

#define STRUC9SIZE 0xc

#pragma pack(1)
struct struc_10 {
    int16 field_0;
    int16 field_2;
};

#define STRUC10SIZE 0x4
#define PILOTNAMELEN 22

#pragma pack(1)
struct Pilot {
    int8 name[PILOTNAMELEN]; // 0
    int32 total_score; // 0x16
    uint16 last_score; // 0x1a
    int8 rank; // 0x1c
    uint8 field_1D;
    int8 theater; // 0x1e
    int8 difficulty; // 0x1f
};

struct Plane {
    int8 field_0[8]; // name
    int8 field_8[10]; // nickname
    int16 field_12;
    int16 field_14;
    int8 field_16[10];
};
#define PLANESIZE 0x20

struct TerrainUnk {
    uint8 *field_0[32];
};
#define TERRAINUNKSIZE 64

// used in egame.exe sub_155AB, 16 bytes
struct struc_1 {
    int32 field_0;
    int32 field_4;
    int16 field_8;
    int16 field_A;
    int16 field_C;
    int16 field_E;
};

// used in egame.exe sub_155AB, 0x18 bytes
struct struc_2 {
    uint16 field_0;
    uint16 field_2;
    int16 field_4;
    int16 field_6;
    int16 field_8;
    int16 field_A;
    int16 field_C;
    int16 field_E;
    uint8 field_10[8];
};

// used in egame.exe sub_155AB, 0x24 bytes
struct struc_3 {
    int16 field_0;
    int32 field_2;
    int32 field_6;
    uint8 field_10[26];
};

// used in egame.exe, 0x10 bytes
struct struc_4 {
    uint16 field_0;
    uint16 field_2;
    int16 field_4;
    int16 field_6;
    int32 field_8;
    int16 field_C;
    int16 field_E;
};

// 8-byte struct used for stru_33402
struct struc_9 {
    int16 field_0;
    int16 field_2;
    int16 field_4;
    int16 field_6;
};

// used in egame.exe, 4 bytes
struct Waypoint {
    uint16 field_0;
    uint16 field_2;
};

// 0x1a bytes
struct Missile {
    char field_0[10];
    char field_A[12];
    int field_16;
    int field_18;
};

// 0x12 bytes
struct Sam {
    char field_0[8];
    int field_8;
    int field_A;
    int field_C;
    int field_E;
    int field_10;
};

// 0x4 bytes
struct MissileSpec {
    int field_0;
    int field_2;
};

#endif // STRUCT_H
