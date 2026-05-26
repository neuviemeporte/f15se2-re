#ifndef STRUCT_H
#define STRUCT_H

#include "inttype.h"
#include "sassert.h"

struct JoyAxes {
    uint8 x,y;
};
STATIC_ASSERT(sizeof(struct JoyAxes)==2);

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
#pragma pack()
STATIC_ASSERT(sizeof(struct Buf6Item)==36);
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
#pragma pack()
STATIC_ASSERT(sizeof(struct Buf4Item)==16);
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
    char coord[6];      /* grid reference string (e.g. "A3B2") */
    int16 distance;      /* distance metric */
};
#pragma pack()
STATIC_ASSERT(sizeof(struct Target)==18);

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
#pragma pack()
STATIC_ASSERT(sizeof(struct MissionTableEntry)==12);

#define STRUC9SIZE 0xc

#pragma pack(1)
struct struc_10 {
    int16 field_0;
    int16 field_2;
};
#pragma pack()
STATIC_ASSERT(sizeof(struct struc_10)==4);

#define STRUC10SIZE 0x4
#define PILOTNAMELEN 22

#pragma pack(1)
struct Pilot {
    char name[PILOTNAMELEN]; // 0
    int32 total_score; // 0x16
    uint16 last_score; // 0x1a
    int8 rank; // 0x1c
    uint8 field_1D;
    int8 theater; // 0x1e
    int8 difficulty; // 0x1f
};
#pragma pack()
STATIC_ASSERT(sizeof(struct Pilot)==32);

struct Plane {
    int8 field_0[8]; // name
    int8 field_8[10]; // nickname
    int16 field_12;
    int16 field_14;
    int8 field_16[10];
};
STATIC_ASSERT(sizeof(struct Plane)==32);
#define PLANESIZE 0x20

struct TerrainUnk {
    uint8 *field_0[32];
};
STATIC_ASSERT(sizeof(struct TerrainUnk)==sizeof(uint8*)*32);
// 64 with 16bit ptr
// 128 with far/32bit ptr
// 256 with 64bit ptr

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
STATIC_ASSERT(sizeof(struct struc_1)==16);

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
STATIC_ASSERT(sizeof(struct struc_2)==0x18);

// used in egame.exe sub_155AB, 0x24 bytes
struct struc_3 {
    int16 field_0;
    int32 field_2;
    int32 field_6;
    uint8 field_10[26];
};
#if defined(__clang__) || defined(_MSC_VER) && (_MSC_VER > 510) 
STATIC_ASSERT(sizeof(struct struc_3)==40);
#else
STATIC_ASSERT(sizeof(struct struc_3)==36);
#endif

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
STATIC_ASSERT(sizeof(struct struc_4)==0x10);

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
STATIC_ASSERT(sizeof(struct Waypoint)==4);

// 0x1a bytes
struct Missile {
    char field_0[10];
    char field_A[12];
    int16 field_16;
    int16 field_18;
};
STATIC_ASSERT(sizeof(struct Missile)==26);

// 0x12 bytes
struct Sam {
    char field_0[8];
    int16 field_8;
    int16 field_A;
    int16 field_C;
    int16 field_E;
    int16 field_10;
};
STATIC_ASSERT(sizeof(struct Sam)==18);

// 0x0E bytes - weapon/SAM entry (first table, accessed with stride 14)
#pragma pack(1)
struct Weapon {
    char name[8];     /* null-terminated, zero-padded to 8 */
    int16 field_8;    /* range or speed */
    int16 field_A;    /* damage or type */
    int16 field_C;    /* flags */
};
#pragma pack()
STATIC_ASSERT(sizeof(struct Weapon)==14);

// 0x4 bytes
struct MissileSpec {
    int16 field_0;
    int16 field_2;
};
STATIC_ASSERT(sizeof(struct MissileSpec)==4);

/* SpriteParams: 28-byte sprite blit descriptor passed by pointer to gfx overlay.
 * Fields at +0x10..0x17 are constant config bytes set at init time.
 * The graphics overlay reads all fields by offset from the struct base address. */
#pragma pack(1)
struct SpriteParams {
    int16 bufPtr;       /* +0x00: sprite buffer pointer */
    int16 srcX;         /* +0x02: source X in sprite sheet */
    int16 srcY;         /* +0x04: source Y in sprite sheet */
    int16 page;         /* +0x06: target page */
    int16 dstX;         /* +0x08: destination X */
    int16 dstY;         /* +0x0A: destination Y */
    int16 width;        /* +0x0C: blit width */
    int16 height;       /* +0x0E: blit height */
    uint8 pad10[2];     /* +0x10 */
    uint8 byte12;       /* +0x12: 0x6D */
    uint8 pad13[3];     /* +0x13 */
    uint8 byte16;       /* +0x16: 0x3F */
    uint8 byte17;       /* +0x17: 0x01 */
    uint8 flags;        /* +0x18: blit flags (byte_1729C) */
    uint8 pad19[3];     /* +0x19 */
};
#pragma pack()
STATIC_ASSERT(sizeof(struct SpriteParams)==28);

/* PageDesc: 24-byte page descriptor used by graphics overlay.
 * The overlay receives a pointer to this struct and reads fields by offset.
 * The selfPtr field at +0x16 points back to the start of the struct.
 * C code accesses color/font directly; overlay accesses by word index from pointer. */
#pragma pack(1)
struct PageDesc {
    int16 pageNum;      /* +0x00: page number (1, 2, 3, or 0 for screen) */
    uint8 pad1[2];      /* +0x02 */
    int16 color;        /* +0x04: draw color / text color */
    uint8 byte6;        /* +0x06: constant (0x0B, 0x0C, or 0x00) */
    uint8 pad2[5];      /* +0x07 */
    int16 font;         /* +0x0C: font index */
    uint8 pad3[8];      /* +0x0E */
    int16 *selfPtr;     /* +0x16: pointer to start of this struct (pageNum field) */
};
#pragma pack()
STATIC_ASSERT(sizeof(struct PageDesc)==24);

#endif // STRUCT_H
