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

#endif // STRUCT_H
