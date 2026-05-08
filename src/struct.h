#ifndef STRUCT_H
#define STRUCT_H

#include "inttype.h"

struct NoJoy80 {
    uint8 a,b;
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

#pragma pack(1)
struct Buf4Item {
    uint16 field_0;
    uint16 field_2;
    uint16 field_4;
    int16 field_6;
    int16 field_8;
    int16 field_A;
    int16 field_C;
    int16 field_E;
};
#define BUF4ITEMSIZE 0x10

#define BUF7SIZE 0x64
#define BUF10SIZE 0x100

#pragma pack(1)
struct Target {
    int16 field_0;
    int16 field_2;
    int16 field_4;
    int16 field_6;
    int16 field_8;
    uint8 coord[6];
    int16 field_10;
};

#define TARGETSIZE 0x12

#pragma pack(1)
struct struc_9 {
    int16 field_0;
    int16 field_2;
    int16 field_4;
    int16 field_6;
    int16 field_8;
    int16 field_A;
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
    int8 difficuly; // 0x1f
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
    uint16 posX;         // field_0 - missile world X
    uint16 posY;         // field_2 - missile world Y
    int16 altitude;      // field_4 - missile altitude (0 = ground)
    int16 activeFlag;    // field_6 - 1 = active
    int16 bearing;       // field_8 - bearing to target
    int16 speed;         // field_A - missile speed (0x4000 typical)
    int16 field_C;
    int16 timeToLive;    // field_E - computed TTL, 0 = slot free
    int16 samTypeIdx;    // field_10 - index into SamTypeInfo
    int16 field_12;
    int16 field_14;
    int16 sourceTarget;  // field_16 - index of firing SAM site
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
    uint16 worldX;       // field_0 - world X position
    uint16 worldY;       // field_2 - world Y position
    int16 samTypeIdx;    // field_4 - index into Sam/SamTypeInfo tables
    int16 statusFlags;   // field_6 - bit flags (bit2=tracking, bit4=firing, bit8=jamImmune)
    int32 trackingStr;   // field_8 - tracking strength (low word used as int16, 0-255)
    int16 field_C;
    int16 field_E;
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
    char name[8];        // field_0 - SAM system name (e.g. "SA-2")
    int maxRange;        // field_8 - maximum engagement range
    int missileSpeed;    // field_A - missile speed parameter
    int field_C;
    int field_E;
    int field_10;
};

// SAM type info table, 14 bytes per entry, at Data1:0x018E (samTable)
// Accessed as samTypeInfo[samTypeIdx]
#pragma pack(1)
struct SamTypeInfo {
    int16 field_0;
    int16 field_2;
    int16 guidanceFlags;  // bit 0: 1 = radar-guided, 0 = IR-guided
    int16 field_6;
    int16 field_8;
    int16 field_A;
    int16 field_C;
};
#define SAMTYPEINFOSIZE 0x0E

// 0x4 bytes
struct MissileSpec {
    int field_0;
    int field_2;
};

#endif // STRUCT_H
