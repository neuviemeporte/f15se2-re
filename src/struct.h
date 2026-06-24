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
    uint8 reserved[6];  /* +0x1E loaded/saved with the record but unused by start/egame */
};
#pragma pack()
STATIC_ASSERT(sizeof(struct FlightUnit)==36);
#define FLIGHTUNIT_SIZE 36

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
#define WORLDOBJECT_SIZE 16

#define BUF7SIZE 100
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
    int16 missionNum;    /* index into mission lookup table (missionTable/g_particles) */
    char coord[6];      /* grid reference string (e.g. "A3B2") */
    int16 distance;      /* distance metric */
};
#pragma pack()
STATIC_ASSERT(sizeof(struct Target)==18);

#define TARGETSIZE 18

/* MissionTableEntry: 0x0C-byte mission lookup table entry.
 * Array of ~56 entries defining possible mission types per theater/tension.
 * Used by missionTable[] (start.exe) and g_particles[] (egame.exe). */
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

#define MISSIONTABLEENTRY_SIZE 12

#pragma pack(1)
struct UnitTypeRemap {
    int16 upgrade;
    int16 downgrade;
};
#pragma pack()
STATIC_ASSERT(sizeof(struct UnitTypeRemap)==4);

#define UNITTYPEREMAP_SIZE 4
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
#define PLANESIZE 32

/* SamDataEntry: 32-byte record in end.exe's planeArray/samDataTable.
 * Unlike struct Plane (start.exe), this has 8 prefix bytes before the name.
 * These records are the shared enemy-aircraft table read with an 8-byte phase
 * shift, so a record's prefix words actually hold the PRECEDING entry's
 * model/view/kill fields (compare struct AircraftType). end.exe only reads the
 * name and the validFlag sentinel; the other columns are unused here. */
struct SamDataEntry {
    int16 validFlag;        /* +0x00 preceding entry's modelId; -1 = no-3D-model sentinel */
    int16 prevViewModelId;  /* +0x02 preceding entry's viewModelId (unused in end.exe) */
    int16 prevViewModelFar; /* +0x04 preceding entry's viewModelIdFar (unused) */
    int16 prevKillCount;    /* +0x06 preceding entry's killCount (unused) */
    char name[8];           /* "MIG-23\0 " - null-terminated, space at [7] precedes nickname */
    char nickname[10];      /* "Flogger\0\0\0" */
    int16 maxSpeed;
    int16 range;
    int16 maneuverability;  /* +0x1e turn/agility rating (unused in end.exe) */
};
STATIC_ASSERT(sizeof(struct SamDataEntry)==32);

struct TerrainPtrTable {
    struct TerrainTile *entries[32];
};
STATIC_ASSERT(sizeof(struct TerrainPtrTable)==sizeof(void*)*32);
// 64 with 16bit ptr
// 128 with far/32bit ptr
// 256 with 64bit ptr

struct TerrainCountTable {
    uint16 entries[32];
};
STATIC_ASSERT(sizeof(struct TerrainCountTable)==64);

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

// In-flight guided-weapon tracking (g_projectiles[12]): slots 0-7 = SAM/ground
// threat shots, 8-11 = player-fired missiles. fireMissile() claims a slot whose
// ttl == 0 and seeds the launch position; ttl counts down the flight time. 0x18 bytes.
struct Projectile {
    uint16 mapX;        // +0x00  launch map X coord
    uint16 mapY;        // +0x02  launch map Y coord
    int16 alt;          // +0x04  altitude (render target)
    int16 speed;        // +0x06  speed/range term
    int16 worldX;       // +0x08  launch world X
    int16 worldY;       // +0x0A  launch world Y
    int16 worldZ;       // +0x0C  launch world Z
    int16 ttl;          // +0x0E  flight-time countdown (0 = free slot)
    int16 specIdx;      // +0x10  weapon/threat spec index into sams[]
    int16 weaponIdx;    // +0x12  index into missiles[] (player-fired)
    int16 targetLock;   // +0x14  tracked target id (-1 = none)
    int16 targetRef;    // +0x16  ground threat: target index (>0 plane / <0 -simObject); player missile: loft angle
};
STATIC_ASSERT(sizeof(struct Projectile)==24);

/* g_proj3d: the world-space origin (x,y,z) projectObjects() projects the 3D scene
 * relative to. Three int32 written from the routine's long parameters. */
struct Proj3d {
    int32 x;            // +0x00
    int32 y;            // +0x04
    int32 z;            // +0x08
};
STATIC_ASSERT(sizeof(struct Proj3d)==12);

/* BulletTrack: a 3D moving point (player gun rounds + threat shots) tracked for HUD
 * projection. 20-entry table, stride 12. Each frame the position is advanced by the
 * velocity (updateBulletsAndFire) and projected to the HUD (projectWorldToHud). */
#pragma pack(1)
struct BulletTrack {
    int16 posX;         // +0x00  world X
    int16 posY;         // +0x02  world Y
    int16 alt;          // +0x04  world Z / altitude
    int16 velX;         // +0x06  velocity X
    int16 velY;         // +0x08  velocity Y
    int16 velZ;         // +0x0A  velocity Z
};
#pragma pack()
STATIC_ASSERT(sizeof(struct BulletTrack)==12);

#pragma pack(1)
struct SimObject {
    int16 objType;      // +0x00  spec index into g_planes
    uint16 posX;         // +0x02  world X seed; worldX = posX << 5
    uint16 posY;         // +0x04  world Y seed; worldY = posY << 5
    int16 alt;          // +0x06  altitude
    int32 worldX;       // +0x08  world X position (integrated each frame)
    int32 worldY;       // +0x0C  world Y position
    // +0x10..0x24  per-object motion/AI state
    union { int16 w; uint8 b[2]; } heading; // +0x10  yaw; b[1] high byte = 180deg flip
    int16 pitch;        // +0x12
    union { int16 w; uint8 b[2]; } bank; // +0x14  roll/bank (3rd Euler arg); b[1] high-byte flip
    int16 spec;         // +0x16  index into aircraftTypes
    union { uint16 w; uint8 b[2]; } flags;  // +0x18  b[0] low byte, b[1] high byte
    int16 speed;        // +0x1A  velocity magnitude / fuel
    int16 timer;        // +0x1C  countdown
    int16 weaponType;   // +0x1E  AI weapon index (sams[] lookup)
    int16 terrainColor; // +0x20  readMapPixelColor under object
    int16 damage;       // +0x22  damage accumulator (clamp 0..0xff)
};
#pragma pack()
STATIC_ASSERT(sizeof(struct SimObject)==36);

struct MapTarget {
    uint16 mapX;        // +0x00  map X coord (worldX = mapX << 5)
    uint16 mapY;        // +0x02  map Y coord (worldY = mapY << 5)
    int16 active;       // +0x04  alive/valid gate (0 = empty slot)
    int16 flags;        // +0x06  0x100 air / 0x200 ground / 0x8 ...
    int16 alertLevel;   // +0x08  SAM radar-alert accumulator (clamp 255)
    int16 threatTimer;  // +0x0A  threat-site countdown timer
    int16 nameIndex;    // +0x0C  g_targetNameTable index (&0x7f); bit8 = identified
    int16 secondaryNameIndex; // +0x0E  "at <base>" name index, read through the
                              //        GroundTargetTable stride-8 alias (see below)
};
STATIC_ASSERT(sizeof(struct MapTarget)==16);

/* GroundTargetTable: the in-mission target table. The 16-bit name-index column
 * is read as `((int16*)&g_planeTable)[idx*8]` — a stride-16 view that, thanks to
 * the 2-byte lead word before planes[], yields planes[idx-1].secondaryNameIndex (and the
 * lead sentinel at idx 0). planes[] and the lead word are therefore one
 * contiguous object; the mission loader deserialises it as a unit. */
#pragma pack(1)
struct GroundTargetTable {
    int16 nameIndexLead;          /* leading name-index sentinel */
    struct MapTarget planes[74];  /* g_planes */
};
#pragma pack()
STATIC_ASSERT(sizeof(struct GroundTargetTable) == 2 + 74 * 16);

/* ReplayEvent: one entry in the tactical-replay event log (appendMapEvent). */
#pragma pack(1)
struct ReplayEvent {
    int16 coord;        // +0x00  world frame coord (g_missionTick)
    uint8 screenX;      // +0x02  map X (viewX >> 7)
    uint8 screenY;      // +0x03  map Y (viewY >> 7)
    uint8 type;         // +0x04  event type (0 = end-of-log terminator)
    uint8 arg;          // +0x05  type-specific argument
};
#pragma pack()
STATIC_ASSERT(sizeof(struct ReplayEvent)==6);

/* g_replayLog: a single 0x640-byte buffer with two unrelated roles packed together
 * (the original reuses one allocation). egseg1.asm reaches the vertexX table at the
 * fixed offset _g_replayLog+0x600, so the layout split is a hard contract. */
#pragma pack(1)
struct ReplayLog {
    struct ReplayEvent events[256]; // +0x000  event log (moveNearFar saves this 0x600 region)
    int16 vertexX[32];              // +0x600  3D model vertex X table (fread; parallel to the vertex Y table)
};
#pragma pack()
STATIC_ASSERT(sizeof(struct ReplayLog)==0x640);

struct TargetSlot {
    int16 state;        // +0x00  lock state (3/4/>=5)
    int16 planeIndex;   // +0x02  index into g_planes
    int16 viewIndex;    // +0x04  index into g_planes (g_playerTargetIndex for slot 0)
    int16 flags;        // +0x06  (high byte = active)
    int16 seedNoise;    // +0x08  never written; low 4 bits sampled as RNG noise in initFrameRandom()
    int16 unused[4];    // +0x0A..0x11
};
STATIC_ASSERT(sizeof(struct TargetSlot)==18);

/* Particle: one short-lived world effect marker (smoke-trail puff, weapon-hit
 * spark, or flight marker) in the g_particles[8] ring. posX/posY/alt are the
 * world position; alt rises (+0x0A/frame) while posY drifts by alt>>9, and spin
 * is an orientation angle whose high byte advances each frame (passed where
 * drawWorldObject() takes its pitch argument). 8-byte record, stride 8. */
struct Particle {
    int16 posX;
    int16 posY;
    int16 alt;
    int16 spin;
};

struct TileSceneObject; /* defined below; TileObject holds a pointer to one */

/* TileObject: nearest-tile-object record returned by findNearestTileObject().
 * The same record is the scratch block addTileEntry() walks: it reads the
 * entry pointer at +0x0C, copies the 8-byte tile-entry tail (+0x0E..+0x15)
 * into g_dynTileEntries, and writes shapeOff/flag at +0x12/+0x14. */
#pragma pack(1)
struct TileObject {
    int16 id;       /* +0x00 object/shape id */
    int16 dist;     /* +0x02 distance metric */
    int32 x;        /* +0x04 world X */
    int32 y;        /* +0x08 world Y */
    struct TileSceneObject *entry; /* +0x0C nearest matrix entry */
    uint8 lod;      /* +0x0E LOD level */
    uint8 subIndex; /* +0x0F sub-object index */
    uint8 tileX;    /* +0x10 tile column */
    uint8 tileY;    /* +0x11 tile row */
    int16 shapeOff; /* +0x12 shape-data offset (addTileEntry arg) */
    uint8 flag;     /* +0x14 entry flag (addTileEntry arg) */
    uint8 pad15;    /* +0x15 trailing scratch byte (part of the 8-byte tail) */
};
#pragma pack()
/* 20 fixed bytes + a near pointer (2 in DOS, wider in the 64-bit lint). */
STATIC_ASSERT(sizeof(struct TileObject) == 20 + sizeof(void*));

#pragma pack(1)
struct NearestTerrain {
    int16 objectType;            /* +0x00 best tile object/shape id */
    int16 dist;                  /* +0x02 best distance metric */
    int32 worldX;                /* +0x04 world X of the match */
    int32 worldY;                /* +0x08 world Y of the match */
    struct TerrainTile *tilePtr; /* +0x0C tile entry of the match */
    uint8 level;                 /* +0x0E grid level */
    uint8 cellIdx;               /* +0x0F tile-entry index within the cell */
    uint8 gridX;                 /* +0x10 grid column */
    uint8 gridY;                 /* +0x11 grid row */
};
#pragma pack()
STATIC_ASSERT(sizeof(struct NearestTerrain) == 16 + sizeof(void*));

/* Neighbour-sampling tables used by findNearestTileObject()/projectModelEdges()
 * to scan the 3x3 grid of tiles around a position. The three arrays are laid
 * out contiguously so the sub-tile offset LUT can be indexed about its centre:
 * lut[-1]/lut[-2] read gridY[10]/gridY[9] (= -4096/-8192), the negative half of
 * the symmetric offset table {-0x2000,-0x1000,0,+0x1000,+0x2000}. */
#pragma pack(1)
struct NeighborSampling {
    int16 gridX[9];   /* per-cell tile-X delta (-1/0/+1) */
    int16 gridY[11];  /* [0..8] per-cell tile-Y delta; [9]/[10] also serve as
                         lut[-2]/lut[-1] */
    int16 lut[3];     /* sub-tile pixel offset per grid delta about the centre:
                         {0,+0x1000,+0x2000}; lut[-1]=gridY[10], lut[-2]=gridY[9] */
};
#pragma pack()
STATIC_ASSERT(sizeof(struct NeighborSampling) == 46);

#pragma pack(1)
struct TerrainTile {
    uint16 buf3;
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
    char shortName[10]; /* +0x00 designation, e.g. "AIM-9M" (not displayed by egame) */
    char longName[12];  /* +0x0A display name, e.g. "Sidewinder" (shown in all weapon messages) */
    int16 specIndex;    /* +0x16 sams[] index; -1 = camera, -2 = fuel */
    int16 weaponCategory; /* +0x18 weapon category (1=support,2=cluster,3=bomb,4=A2A,6=AGM,8=PGM) */
};
STATIC_ASSERT(sizeof(struct Missile)==26);

// 0x12 bytes
struct Sam {
    char name[8];       /* +0x00 weapon/SAM name string */
    int16 lockRange;    /* +0x08 engagement range */
    int16 maxSpeed;     /* +0x0A projectile speed = maxSpeed >> 6 */
    int16 weaponClass;  /* +0x0C firing-mode class (7 = A2A) */
    int16 turnRate;     /* +0x0E maneuver clamp = +/- turnRate*0x80 */
    int16 modelId;      /* +0x10 3D model id */
};
STATIC_ASSERT(sizeof(struct Sam)==18);

// 0x0E bytes - weapon/SAM entry (first table, accessed with stride 14)
#pragma pack(1)
struct Weapon {
    char name[8];      /* null-terminated, zero-padded to 8 */
    int16 lethality;   /* +0x08 dominant threat-score term (0..500) */
    int16 dangerTier;  /* +0x0A small 0..8 threat-score multiplier */
    int16 flags;       /* +0x0C bit0 = radar-guided */
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
    uint8 flags;        /* +0x18: blit flags */
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
struct TileSceneObject {
    int16 x;        /* +0x00 object position X */
    int16 y;        /* +0x02 object position Y */
    int16 z;        /* +0x04 object position Z */
    uint8 shape;    /* +0x06 shape id (bit7 = needs tile lookup, low 7 bits = buf3d3 index) */
};
#pragma pack()

#pragma pack(1)
struct DynTileOverride {
    uint8 lod;       /* +0x00 LOD level (matched against lookup arg 1) */
    uint8 subIndex;  /* +0x01 sub-object index (matched against lookup arg 2) */
    uint8 tileX;     /* +0x02 tile column (matched against lookup arg 3) */
    uint8 tileY;     /* +0x03 tile row (matched against lookup arg 4) */
    int16 value;     /* +0x04 returned when the four key bytes match */
    uint8 shape;     /* +0x06 shape id override */
    uint8 pad7;
};
#pragma pack()
STATIC_ASSERT(sizeof(struct DynTileOverride)==8);

/* Enemy aircraft type table (head = aMig23). 32-byte records, one per type. */
#pragma pack(1)
struct AircraftType {
    char name[7];      /* +0x00 primary name, e.g. "MIG-23" */
    char altName[11];   /* +0x07 " "+NATO name appended after the primary, e.g. " Flogger" */
    int16 maxSpeed;        /* +0x12 speed cap / turn-timer divisor */
    int16 range;           /* +0x14 spawn/engage range */
    int16 maneuverability; /* +0x16 turn-command clamp = +/- field*0x1000 */
    int16 modelId;         /* +0x18  -1 = no 3D model */
    int16 viewModelId;     /* +0x1A near/far view model pair [0] */
    int16 viewModelIdFar;  /* +0x1C view model pair [1] */
    int16 killCount;       /* +0x1E kills tally (+=1 on a kill) */
};
#pragma pack()
STATIC_ASSERT(sizeof(struct AircraftType)==32);

/* Countermeasure/map-event markers. 12-byte records. */
#pragma pack(1)
struct MapEvent {
    int16 mapX;     /* +0x00 */
    int16 mapY;     /* +0x02 */
    int16 unused4;  /* +0x04 never written/read */
    int16 type;     /* +0x06 marker type */
    int16 ttl;      /* +0x08 countdown; 0 = slot free */
    int16 unusedA;  /* +0x0A never written/read */
};
#pragma pack()
STATIC_ASSERT(sizeof(struct MapEvent)==12);

/* Vertex-projection cluster (block 0x34684..0x35AF7). One contiguous block
 * consumed by the egseg1.asm 3D pipeline plus the C HUD/targeting code. The
 * genuine member overlaps (the HUD X is the low word of x.v[0]; the depth-sort
 * scratch starts at y.v[120]) are intrinsic to the original data, hence the
 * unions. */
#pragma pack(1)
struct VertexProj {
    struct { int16 num; int16 div; } in[121]; /* input pairs (stride 4) */
    union { int32 v[121]; int16 lo; } x;      /* projected screen X; .lo = HUD X */
    union { int32 v[121]; int16 lo; } y;      /* projected screen Y; .lo = HUD Y */
    uint8 scratch[3784];                      /* near-clip / depth-sort transform scratch */
};
#pragma pack()
STATIC_ASSERT(sizeof(struct VertexProj)==0x1474);

/* VtxScratch: the full overlaid scratch region. The original deliberately
 * time-shares this memory: the LZW
 * pic-decoder dictionary (egcode.asm picMakeDict writes 6144 bytes from the
 * base) during cockpit-PIC load, and the render-header / per-vertex numerator
 * arrays + the vertex-projection cluster during flight. They never overlap in
 * time, so one allocation serves both. The egseg1.asm / egcode.asm consumers
 * reach the individual sub-objects via offset EQUs off the _vtxScratch base;
 * the C flight code uses the typed vproj member. dictHead covers the pre-cluster
 * portion (dict base + scattered asm scratch; unused gaps are harmlessly
 * overlaid by the dict). */
#pragma pack(1)
struct VtxScratch {
    uint8 dictHead[0x404];    /* LZW dict base + asm scratch (asm reaches sub-objects via EQU) */
    struct VertexProj vproj;  /* +0x404 vertex cluster */
};
#pragma pack()
STATIC_ASSERT(sizeof(struct VtxScratch)==0x1878);

#endif // STRUCT_H
