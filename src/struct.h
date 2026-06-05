#ifndef STRUCT_H
#define STRUCT_H

#include "inttype.h"
#include "sassert.h"

struct JoyAxes {
    uint8 x,y;
};
STATIC_ASSERT(sizeof(struct JoyAxes)==2);

#pragma pack(1)
struct FlightUnit {
    int16 waypointIdx;
    uint16 x;
    uint16 y;
    uint16 altitude;
    int32 xPrecise;
    int32 yPrecise;
    int16 heading;
    int16 pitch;
    int16 roll;
    int16 planeType;
    int16 flags;
    int16 maxSpeed;
    uint16 fuel;
    uint8 field_1E[6];
};
#pragma pack()
STATIC_ASSERT(sizeof(struct FlightUnit)==36);
#define FLIGHTUNIT_SIZE 0x24

/* WorldObject: 16-byte world target/object entry from .wld files.
 * Each entry describes a placeable object in the game world.
 * Used by worldObjects[] array loaded from theater .wld data.
 * Fields derived from F-117A reverse engineering (same engine). */
#pragma pack(1)
struct WorldObject {
    uint16 unitRef;      /* object/unit type reference (index into wldOffsets name table) */
    uint16 x_coord;      /* world X coordinate */
    uint16 y_coord;      /* world Y coordinate */
    int16 unitType;      /* unit type: 0=empty, 21=special */
    int16 targetFlags;   /* target flags bitfield (0x100=airbase, 0x200=large, 0x400=waypoint, 0x500=base, 0x800=disabled) */
    int16 occupantType;  /* plane type index of unit stationed here */
    int16 patrolCount;   /* patrol/spawn count */
    int16 objectIdx;     /* index into wld_obj_table, masked with 0x7f */
};
#pragma pack()
STATIC_ASSERT(sizeof(struct WorldObject)==16);
#define WORLDOBJECT_SIZE 0x10

#define BUF7SIZE 0x64
#define BUF10SIZE 0x100

/* Target: 0x12-byte mission target/parameters structure.
 * Two targets per mission: targets[0] = primary, targets[1] = secondary.
 * Populated by runGenerator() during mission generation. */
#pragma pack(1)
struct Target {
    int16 missionType;   /* 1=photograph, 2=destroy, 3=supply_drop, 4=landing */
    int16 targetIdx;     /* target index into worldObjects[] world data */
    int16 baseIdx;       /* takeoff base (primary) or landing base (secondary) index */
    int16 missionCode;   /* bit flags for mission completion detection */
    int16 missionNum;    /* index into mission lookup table (missionTable/stru_33402) */
    char coord[6];      /* grid reference string (e.g. "A3B2") */
    int16 distance;      /* distance metric */
};
#pragma pack()
STATIC_ASSERT(sizeof(struct Target)==18);

#define TARGETSIZE 0x12

/* MissionTableEntry: 0x0C-byte mission lookup table entry.
 * Array of ~56 entries defining possible mission types per theater/tension.
 * Used by missionTable[] (start.exe) and stru_33402[] (egame.exe). */
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

#define MISSIONTABLEENTRY_SIZE 0xc

#pragma pack(1)
struct UnitTypeRemap {
    int16 upgrade;
    int16 downgrade;
};
#pragma pack()
STATIC_ASSERT(sizeof(struct UnitTypeRemap)==4);

#define UNITTYPEREMAP_SIZE 0x4
#define PILOTNAMELEN 22

#pragma pack(1)
struct Pilot {
    char name[PILOTNAMELEN]; // 0
    int32 total_score; // 0x16
    uint16 last_score; // 0x1a
    int8 rank; // 0x1c
    uint8 medals;  /* bitmask of earned medals (bits 0-6), bits 5-6 also = dead/retired status */
    int8 theater; // 0x1e
    int8 difficulty; // 0x1f
};
#pragma pack()
STATIC_ASSERT(sizeof(struct Pilot)==32);

struct Plane {
    int8 name[8];
    int8 nickname[10];
    int16 maxSpeed;
    int16 range;
    int8 weaponConfig[10];
};
STATIC_ASSERT(sizeof(struct Plane)==32);
#define PLANESIZE 0x20

/* SamDataEntry: 32-byte record in end.exe's planeArray/samDataTable.
 * Unlike struct Plane (start.exe), this has 8 prefix bytes before the name. */
struct SamDataEntry {
    int16 field_0;      /* -1 = sentinel/invalid entry */
    int16 field_2;
    int16 field_4;
    int16 field_6;
    char name[8];       /* "MIG-23\0 " - null-terminated, space at [7] precedes nickname */
    char nickname[10];  /* "Flogger\0\0\0" */
    int16 maxSpeed;
    int16 range;
    int16 field_1E;
};
STATIC_ASSERT(sizeof(struct SamDataEntry)==32);

struct TerrainPtrTable {
    uint8 *entries[32];
};
STATIC_ASSERT(sizeof(struct TerrainPtrTable)==sizeof(uint8*)*32);
// 64 with 16bit ptr
// 128 with far/32bit ptr
// 256 with 64bit ptr

#define TERRAINUNKSIZE 64

// used in egame.exe renderFrame, 16 bytes
struct ViewSnapshot {
    int32 worldX;       // +0x00  camera world X
    int32 worldY;       // +0x04  camera world Y
    int16 alt;          // +0x08  camera altitude
    int16 heading;      // +0x0A  yaw
    int16 pitch;        // +0x0C
    int16 roll;         // +0x0E
};
STATIC_ASSERT(sizeof(struct ViewSnapshot)==16);

// In-flight guided-weapon tracking (stru_335C4[12]): slots 0-7 = SAM/ground
// threat shots, 8-11 = player-fired missiles. fireMissile() claims a slot whose
// ttl == 0 and seeds the launch position; ttl counts down the flight time. 0x18 bytes.
struct Projectile {
    uint16 mapX;        // +0x00  launch map X coord
    uint16 mapY;        // +0x02  launch map Y coord
    int16 alt;          // +0x04  altitude (render target)
    int16 field_6;      // +0x06  speed/range term
    int16 worldX;       // +0x08  launch world X
    int16 worldY;       // +0x0A  launch world Y
    int16 worldZ;       // +0x0C  launch world Z
    int16 ttl;          // +0x0E  flight-time countdown (0 = free slot)
    uint8 state[8];     // +0x10  per-projectile state
};
STATIC_ASSERT(sizeof(struct Projectile)==0x18);

// used in egame.exe renderFrame, 0x24 bytes.
// Array based at 0x3B202 (symbol stru_3B202), stride 0x24, cleared in moveStuff().
// The element really begins 6 bytes before the old stru_3B208 label; objType/posX/posY
// are the leading members that earlier code reached via (char*)&stru_3B208[i] - 6/-4/-2.
#pragma pack(1)
struct SimObject {
    int16 objType;      // +0x00  spec index into stru_3AA5E (was -6)
    uint16 posX;         // +0x02  world X seed; worldX = posX << 5 (was -4)
    uint16 posY;         // +0x04  world Y seed; worldY = posY << 5 (was -2)
    int16 alt;          // +0x06  altitude
    int32 worldX;       // +0x08  world X position (integrated each frame)
    int32 worldY;       // +0x0C  world Y position
    uint8 state[20];    // +0x10..0x24  per-object motion/AI state
};
#pragma pack()
STATIC_ASSERT(sizeof(struct SimObject)==0x24);

// used in egame.exe, 0x10 bytes
struct MapTarget {
    uint16 mapX;        // +0x00  map X coord (worldX = mapX << 5)
    uint16 mapY;        // +0x02  map Y coord (worldY = mapY << 5)
    int16 field_4;
    int16 flags;        // +0x06  0x100 air / 0x200 ground / 0x8 ...
    int32 field_8;
    int16 field_C;
    int16 field_E;
};
STATIC_ASSERT(sizeof(struct MapTarget)==0x10);

// 8-byte struct used for stru_33402
struct struc_9 {
    int16 field_0;
    int16 field_2;
    int16 field_4;
    int16 field_6;
};

#pragma pack(1)
struct TerrainTile {
    int16 buf3;
    int16 buf4;
    int16 buf5;
    uint8 idx;
};
#pragma pack()
STATIC_ASSERT(sizeof(struct TerrainTile)==7);

// used in egame.exe, 4 bytes
struct Waypoint {
    uint16 mapX;        // +0x00  map X coord (worldX = mapX << 5)
    uint16 mapY;        // +0x02  map Y coord
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

// 0x1A (26) bytes - weapon loadout entry (accessed with stride 0xD words)
#pragma pack(1)
struct WeaponLoadout {
    int16 qty;            /* number carried */
    char shortName[10];   /* short display name, null-padded */
    char longName[12];    /* long display name, null-padded */
    int16 typeId;         /* weapon type index (0xFFFF=camera, 0xFFFE=fuel) */
};
#pragma pack()
STATIC_ASSERT(sizeof(struct WeaponLoadout)==26);

// 0x4 bytes
struct MissileSpec {
    int16 weaponIdx;  /* index into weaponLoadouts[] / missiles[] */
    int16 ammo;       /* remaining count */
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
STATIC_ASSERT(sizeof(struct PageDesc) == 22 + sizeof(void*));

#pragma pack(1)
struct Matrix3dEntry7 {
    int16 _0x00;
    int16 _0x02;
    int16 _0x04;
    uint8 _0x06;
};
#pragma pack()

#pragma pack(1)
struct Unknown3B4E6Record8 {
    uint8 _0x00;  /* compared with p1 */
    uint8 _0x01;  /* compared with p2 */
    uint8 _0x02;  /* compared with p3 */
    uint8 _0x03;  /* compared with p4 */
    int16 _0x04;  /* returned if first 4 bytes match */
    uint8 _0x06;
    uint8 _0x07;
};
#pragma pack()
STATIC_ASSERT(sizeof(struct Unknown3B4E6Record8)==8);

#endif // STRUCT_H
