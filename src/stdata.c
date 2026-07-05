#include "inttype.h"
#include "pointers.h"
#include "struct.h"
#include "comm.h"
#include <stdio.h>
#include <dos.h>

/* === Group 1 (0x0042-0x0530): Filename, mission selection, UI strings === */

/* Mission selection strings */
const char emptyMissTypeNames[3] = {0, 0, 0};
const char emptyMissTypeDescs[3] = {0, 0, 0};
const char emptyHistDesc1 = 0;
const char emptyHistDesc2 = 0;
char placeholder_3d3[] = "xx.3d3";

/* UI strings */
const char aTheater_0[] = "THEATER";

/* === Group 3 (0x0830-0x0a98): Rank, roster, overlay strings === */

/* Overlay loader variables */
int16 ovlSeg1 = 0;
int16 ovlParCnt = 0;
int16 ovlParBlock = 0;
int16 ovlSeg2 = 0;
char ovlInsaneFlag = 0;

/* Overlay error strings */
const char aAlloc1M[] = "Allocated 1Mb of space????$";
const char aDosLied[] = "MS-DOS lied to us about how much memory was available$";
const char aFileNFound[] = "Filename not found$";
const char aEnoughMem[] = "Not enough memory to load file$";
const char aOvlFail[] = "Overlay load failed for some reason$";
const char aOvlOvrrun[] = "Overlay has overrun allocated memory$";
const char aOvlShrink[] = "Unable to shrink overlay memory allocation$";
const char aOvlRel[] = "Error releasing overlay memory$";

/* === Group 4 (0x12b6-0x130c): File I/O error strings === */
const char aFileNotFound[] = ":File not found$";
const char aNoFileBuffersAvailable[] = ":No file buffers available$";
const char aOpenError[] = ":Open error $";
const char aFileClosingError[] = "File closing error$";
const char aReadError[] = "Read error$";
const char aWriteError[] = "Write error$";

/* === Group 5 (0x146e-0x14d6): Alloc error, highlight, lookup tables === */

/* Mission selection state */
int16 enableHighlight = 1;

/* Direction/level lookup tables */
extern const int16 dirDeltaX[] = {-1, 1, 1, -1, 0, 1, 0, -1, 0};
extern const int16 dirDeltaY[] = {1, 1, -1, -1, 1, 0, -1, 0, 0, -8192, -4096};
extern const int16 gridLevelSize[] = {0, 0x1000, 0x2000, 0x400, 0x100, 0x40, 0x10, 4};

/* === Group 6 (0x1632-0x1763): Terrain/grid file strings === */
int16 gridSignature = 0x3232;
int16 terrainSignature = 0x3131;
int16 terrainDirtyFlag = 0;
int16 gridValidFlag = 0;

/* regn.xxx buffer: regnPlhPtr's strcpy/fopen target, overwritten with the
   per-theater region filename (plhFiles[theater]). */
char aRegn_xxx[] = "regn.xxx";

/* === Unmapped variables (original relative order preserved) === */

/* Timer variables */
uint8 timerFlag = 0;
uint8 timerHandlerInstalled = 0;
int16 timerCountLo = 0;
int16 timerCountHi = 0;
int16 timerTarget = 0;
int16 timerDivisor = 0;
int16 timerTickCnt = 0;
int16 timerReload = 0;
uint8 timerDivider = 0;
int16 timerMode = 0;
int16 timerCalSumLo = 0;
int16 timerCalSumHi = 0;
uint8 timerSyncRetrace = 0;
int16 timerTick = 0;
int16 timerRetrace = 0;
uint8 timerCounter = 0;
uint8 timerCounter2 = 0;
uint8 timerCounter3 = 0;
uint8 timerCounter4 = 0;
uint8 FAR *moveDst = 0;

/* Sprite blit params struct */
struct SpriteParams spriteParams = {
    0, 0, 0, 0, 0, 0, 0, 0, /* bufPtr..height */
    {0, 0},                 /* pad10 */
    0x6D,                   /* byte12 */
    {0, 0, 0},              /* pad13 */
    0x3F,                   /* byte16 */
    0x01,                   /* byte17 */
    0x01,                   /* flags */
    {0x01, 0x01, 0x00}      /* pad19 */
};

/* Page descriptors - 24-byte structs passed by pointer to graphics overlay */
struct PageDesc page1Desc = {
    1,                        /* pageNum */
    {0, 0},                   /* pad1 */
    0,                        /* color (drawColor) */
    0x0B,                     /* byte6 */
    {0, 0, 0, 0, 0},          /* pad2 */
    1,                        /* font (fontIndex) */
    {0, 0, 0, 0, 0, 0, 0, 0}, /* pad3 */
    (int16 *)&page1Desc       /* selfPtr (page1NumPtr) */
};
int16 *page1NumPtr = (int16 *)&page1Desc;
struct PageDesc page2Desc = {
    2,                        /* pageNum */
    {0, 0},                   /* pad1 */
    0,                        /* color */
    0x0B,                     /* byte6 */
    {0, 0, 0, 0, 0},          /* pad2 */
    1,                        /* font */
    {0, 0, 0, 0, 0, 0, 0, 0}, /* pad3 */
    (int16 *)&page2Desc       /* selfPtr (page2NumPtr) */
};
int16 *page2NumPtr = (int16 *)&page2Desc;
struct PageDesc page3Desc = {
    3,                        /* pageNum */
    {0, 0},                   /* pad1 */
    0,                        /* color */
    0x0B,                     /* byte6 */
    {0, 0, 0, 0, 0},          /* pad2 */
    1,                        /* font */
    {0, 0, 0, 0, 0, 0, 0, 0}, /* pad3 */
    (int16 *)&page3Desc       /* selfPtr */
};
struct PageDesc screenDesc = {
    0,                        /* pageNum */
    {0, 0},                   /* pad1 */
    7,                        /* color (textColor) */
    0x00,                     /* byte6 */
    {0, 0, 0, 0, 0},          /* pad2 */
    1,                        /* font */
    {0, 0, 0, 0, 0, 0, 0, 0}, /* pad3 */
    (int16 *)&screenDesc      /* selfPtr (screenBuf) */
};
int16 *screenBuf = (int16 *)&screenDesc;
struct PageDesc pageNumPageDesc = {
    0,                        /* pageNum */
    {0, 0},                   /* pad1 */
    0x0C,                     /* color */
    0x00,                     /* byte6 */
    {0, 0, 0, 0, 0},          /* pad2 */
    3,                        /* font */
    {0, 0, 0, 0, 0, 0, 0, 0}, /* pad3 */
    (int16 *)&pageNumPageDesc /* selfPtr (pageNumPtr) */
};
int16 *pageNumPtr = (int16 *)&pageNumPageDesc;

int16 nightMissionFlag = 0;
char bufCoordStr[5] = {0};

int16 escortMissionFlag;
uint32 baseXPrecise = 0;
struct NearestTerrain nearestTerrain = {0};
int16 missionDistAccum;
int16 playerStartLoc;
uint32 baseYPrecise;
struct TerrainTile *tileDataPtr;
uint16 menuSprites;

/* Joystick calibration arrays (4 words each, only first declared in header) */
int16 joyMinValues[4] = {0};
int16 joyMaxValues[4] = {0};
int16 joyCenterValues[4] = {0};
int16 joyRangeBelow[4] = {0};
int16 joyRangeAbove[4] = {0};
int16 joyRawAxis0 = 0;
int16 joyRawAxis1 = 0;
int16 joyRawAxis2 = 0; /* padding - 2 words after joyRawAxis1 */
int16 joyRawAxis3 = 0;
uint8 joyAxes[8] = {0};

/* Clear rect parameters */
int16 clearRectX = 0;
int16 clearRectY = 0;
int16 clearRectWidth = 0;
int16 clearRectHeight = 0;

/* Line drawing parameters */
int16 lineX1 = 0;
int16 lineX2 = 0;
int16 lineY1 = 0;
int16 lineY2 = 0;

/* Clipping state */
uint8 clipOutcode = 0;
int16 clipDx = 0;
int16 clipDy = 0;
int16 clipDxHalf = 0;
int16 clipDyHalf = 0;
int16 clipMaxX = 319;
int16 clipMaxY = 111;

/* Ctrl-Break handler state */
uint8 cbreakHit = 0;
int16 origCBreakSeg = 0;
int16 origCBreakOfs = 0;
int16 errorCodeStr = 0;

/* Page descriptor for buffer page 0 (color=0x0F, font=0x0100) */
int16 bufPageDesc[7] = {0, 0, 0x0F, 0, 0, 0, 0x0100};
int16 *bufPtr = bufPageDesc;

/* Weapon table (struct Weapon, 14 bytes/entry, 23 entries) */
const struct Weapon aNone[] = {
    {"None", 0, 0, 0x0000},
    {"SA-2", 200, 3, 0x0000},
    {"SA-5", 350, 2, 0x0000},
    {"SA-8B", 125, 5, 0x0000},
    {"SA-10", 320, 7, 0x0001},
    {"SA-11", 200, 5, 0x0000},
    {"SA-12", 290, 6, 0x0001},
    {"SA-13", 125, 3, 0x0000},
    {"SA-N-4", 200, 4, 0x0001},
    {"SA-N-5", 150, 3, 0x0000},
    {"SA-N-6", 320, 6, 0x0001},
    {"SA-N-7", 200, 5, 0x0000},
    {"Hawk", 175, 6, 0x0001},
    {"Rapier", 75, 8, 0x0000},
    {"Tiger", 65, 4, 0x0000},
    {"Seacat", 200, 2, 0x0000},
    {"IL76", 200, 8, 0x0003},
    {"", 50, 5, 0x0000},
    {"", 70, 6, 0x0000},
    {"", 80, 7, 0x0001},
    {"", 100, 8, 0x0001},
    {"OTH", 500, 5, 0x0001},
    {"", 40, 3, 0x0000},
};

/* File I/O buffer (512 bytes total) */
uint8 fileReadBuf[0x200] = {0};
int16 fileReadPos = 0;
int16 tmpFileHandle = 0;

/* Pic decode row buffer */
uint8 picDecodedRowBuf[320] = {0};

/* Graphics state */
int16 picScreenBufSize = 0;
int16 picPageIndex = 0;
int16 picRowOffset = 0;
int16 picRow = 0;
int16 picReadFromFilePtr = 0;

/* Sprite blit state */
int16 armPosition = 0;
int16 spriteBlitX = 0;
int16 spriteBlitY = 0;
int16 spriteBlitW = 0;
int16 spriteBlitH = 0;

/* Pic decode scalar state */
int16 picReadBufEndPtr = 0;
int16 picWorkDataPtr = 0;
int16 picRowLength = 0;
uint8 picProcessFlag0_1 = 0;
uint8 picLookupResult = 0;
uint8 picTmp9BitCount = 0;
uint8 picByte = 0;
int16 picFileReadBufEnd = 0;
int16 picNumberDictSlots = 0;
int16 picFileWord = 0;
uint8 picRemainingBitCount = 0;
uint8 picByteUnsignedFlag = 0;
int16 picSlotCounter = 0;
int16 picCurrentRow = 0;

/* Mission state */
int16 flag4Saved = 0;
int16 theaterSaved = 0;

/* Pointer arrays for region/world files */
char *regnPlhPtr = aRegn_xxx;
const char *plhFiles[] = {"lb.xxx", "pg.xxx", "vn.xxx", "me.xxx", "nc.xxx", "ce.xxx", "jp.xxx", "na.xxx"};
const char *worldFiles[] = {"Libya.wld", "gulf.wld", "vn.wld", "me.wld", "nc.wld", "ce.wld", "jp.wld", "na.wld"};

/* Mission coordinate state */
int16 missionMidX = 0;
int16 missionMidY = 0;
uint16 missionTargetX = 0;
uint16 missionTargetY = 0;
int16 missionTarget2X = 0;
int16 missionTarget2Y = 0;
int16 missionBase2X = 0;
int16 missionBase2Y = 0;

/* Mission menu pointer arrays */
const char *missTheaNames[] = {"Libya", "Persian Gulf", "Vietnam", "Middle East", "Other Areas"};
const char *missTheaDesc[] = {"Across the \"Line of Death\"", "Keeping the Sea Lanes Open", "America's Longest Air War", "Eagles vs MiGs", "Insert your scenario disk"};
const char *missDiffLevels[] = {"Rookie", "Pilot", "Veteran", "Ace", "Demo"};
const char *missDiffDesc[] = {"Get off to a good start", "For the casual player", "For more serious players", "The Ultimate Challenge", "Let's see what this thing can do"};
const char *scenarioCodePtr[] = {"nc", "ce", "jp", "na"};
const char *missScenarioNames[] = {"North Cape", "Central Europe", "Desert Storm", "North Atlantic", "Other Areas"};
const char *missScenarioDesc[] = {"Into the Soviet's Backyard", "Red Storm Raging", "The Fight for Kuwait", "Defending the Iceland-UK Gap", "Select a built-in area"};
const char *missTypeNames[] = {"Historical Missions", "General Air Strikes", &emptyMissTypeNames[0], &emptyMissTypeNames[1], &emptyMissTypeNames[2]};
const char *missTypeDesc[] = {"Reenact history", "The core of the Air Campaign", &emptyMissTypeDescs[0], &emptyMissTypeDescs[1], &emptyMissTypeDescs[2]};
const char *missHistorical1Names[] = {"Saddam's Eyes", "Command and Control", "Scud Busting", "No Nukes", "more historical missions"};
const char *missHistorical1Desc[] = {"Iraq's Early Warning Radar", "Iraqi Defense Nerve Center", "Stop Saddam's Terror Weapon", "Nuclear Research Facility", &emptyHistDesc1};
const char *missHistorical2Names[] = {"'Baby Milk Factory'", "Stop the Spill", "Bridges to Nowhere", "Republican Guards", "more historical missions"};
const char *missHistorical2Desc[] = {"Chemical/Biological Weapons Plant", "Sever the Oil Pumping Manifold", "Saddam's Elite Armored Units", "Cut the Supply Lines", &emptyHistDesc2};
const char *missionStr = "MISSION";
char *plh3d3Ptr = placeholder_3d3;

/* Pilot state */
uint8 pilotSelectFlag = 0;

/* Rank pointer array */
const char *ranks[] = {"2nd Lt. ", "1st Lt. ", "Capt. ", "Major ", "Lt Col. ", "Colonel ", "Gen. "};

/* Medal sprite tables (7 entries for 7 medals, null-terminated) */
extern const uint8 medalSpriteX[] = {130, 113, 129, 112, 111, 161, 159, 0};
extern const uint8 medalSpriteY[] = {128, 128, 179, 179, 145, 145, 162, 0};
extern const uint8 medalWidth[] = {9, 11, 11, 13, 47, 11, 15, 0};

/* Blink animation colors */
extern const int16 blinkColors[] = {7, 0x0F};
int16 blinkColorIdx = 0;

/* Pilot name input colors (2 words: word + byte pair) */
extern const int16 pilotNameInputColors[] = {0, 0x0008};

/* Arm animation sprite tables (8 entries each) */
extern const int16 armSrcX[] = {1, 83, 217, 164, 1, 1, 191, 266};
extern const int16 armSrcY[] = {0, 0, 0, 46, 62, 124, 106, 83};
extern const int16 armBlitX[] = {62, 62, 61, 62, 62, 62, 63, 62};
extern const int16 armBlitY[] = {28, 47, 53, 54, 55, 56, 57, 56};
extern const int16 armBlitW[] = {82, 93, 102, 102, 104, 92, 75, 53};
extern const int16 armBlitH[] = {62, 46, 37, 45, 62, 75, 93, 116};

/* Mission pick state */
int16 missionPick = -1;    /* 0xFFFF */
int16 missionPickPad = -1; /* the db 0FFh, 0FFh after missionPick */
extern const int16 armSpriteIndex[] = {1, 2, 3, 4, 5, 6, 7};

/* Joystick repeat flag */
int16 joyRepeatFlag = 0;

/* FCB search data */
const uint8 fcbMatchStr[] = {0x49, 0x03, 0x46, 0x31, 0x35, 0x41, 0x00};
uint8 searchFCB[] = {
    0xFF, 0, 0, 0, 0, 0, 0x08, 0x00,
    '?', '?', '?', '?', '?', '?', '?', '?', '?', '?', '?',
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};

/* Disk Transfer Area (DOS FCB search result buffer) */
uint8 diskTransferArea[0x85] = {0};

/* Weapon loadout table (26 bytes per entry, accessed via weaponLoadouts[idx].qty) */
extern const struct WeaponLoadout weaponLoadouts[] = {
    {4, "AIM-9M\0\0\0", "Sidewinder\0", 23},       /* 0 */
    {4, "AIM-120\0\0", "AMRAAM \0\0\0\0", 22},     /* 1 */
    {4, "AGM-88A\0\0", "HARM\0\0\0\0\0\0\0", 24},  /* 2 */
    {4, "AIM-7M\0\0\0", "Sparrow\0\0\0\0", 22},    /* 3 */
    {1, "AGM-86A\0\0", "Harpoon\0\0\0\0", 26},     /* 4 */
    {6, "AGM-65D\0\0", "Maverick\0\0\0", 27},      /* 5 */
    {8, "GBU-12\0\0\0", "Paveway\0\0\0\0", 28},    /* 6 */
    {2, "Mk 20\0\0\0\0", "Rockeye\0\0\0\0", 29},   /* 7 */
    {2, "Dndl\0\0\0\0\0", "Durandal\0\0\0", 29},   /* 8 */
    {3, "Mk 82-0\0\0", "Slick\0\0\0\0\0\0", 30},   /* 9 */
    {3, "Mk 82-1\0\0", "Snakeye\0\0\0\0", 29},     /* 10 */
    {4, "Mk 20\0\0\0\0", "Rockeye II\0", 28},      /* 11 */
    {2, "Mk 122\0\0\0", "Fireeye\0\0\0\0", 30},    /* 12 */
    {2, "CBU-72\0\0\0", "Fuel-Air\0\0\0", 28},     /* 13 */
    {2, "Mk 35\0\0\0\0", "IN Cluster\0", 29},      /* 14 */
    {1, "ISC B-1\0\0", "Minelets\0\0\0", 29},      /* 15 */
    {1, "135 mm\0\0\0", "Camera\0\0\0\0\0", -1},   /* 16 */
    {1, "1900lbs\0\0", "Extra Fuel\0", -2},        /* 17 */
    {1, "20 mm\0\0\0\0", "Guns\0\0\0\0\0\0\0", 0}, /* 18 */
    {1, "Special\0\0", "Equip\0\0\0\0\0\0", 38},   /* 19 */
};

/* Plane/aircraft table - 19 entries used by mission generator */
extern const struct Plane planes[19] = {
    {{"MIG-23"}, {"Flogger"}, 740, 560, {3, 0, 17, 0, 10, 0, 2, 0, 0, 0}},
    {{"MIG-25"}, {"Foxbat"}, 570, 700, {2, 0, 18, 0, 0, 0, 2, 0, 0, 0}},
    {{"MIG-29"}, {"Fulcrum"}, 700, 400, {5, 0, 19, 0, 20, 0, 2, 0, 0, 0}},
    {{"F-1"}, {"Mirage"}, 790, 930, {3, 0, 20, 0, 0, 0, 2, 0, 0, 0}},
    {{"Su-27"}, {"Flanker"}, 725, 715, {4, 0, 19, 0, 20, 0, 2, 0, 0, 0}},
    {{"IL-76"}, {"Mainstay"}, 400, 4000, {1, 0, 16, 0, 12, 0, 2, 0, 0, 0}},
    {{"F-4E"}, {"Phantom"}, 800, 520, {4, 0, 18, 0, 11, 0, 2, 0, 0, 0}},
    {{"F-14"}, {"Tomcat"}, 800, 800, {4, 0, 19, 0, 8, 0, 2, 0, 0, 0}},
    {{"F-18"}, {"Hornet"}, 660, 461, {5, 0, -1, -1, 0, 0, 2, 0, 0, 0}},
    {{"An-72"}, {"Coaler"}, 350, 620, {2, 0, 0, 0, 9, 0, 2, 0, 0, 0}},
    {{"F-18"}, {"Hornet"}, 660, 461, {5, 0, -1, -1, 4, 0, 2, 0, 0, 0}},
    {{"MIG-23"}, {"Flogger"}, 740, 560, {3, 0, 0, 0, 4, 0, 2, 0, 0, 0}},
    {{"F-14"}, {"Tomcat"}, 800, 800, {4, 0, -1, -1, 8, 0, 2, 0, 0, 0}},
    {{"F-4E"}, {"Phantom"}, 800, 520, {4, 0, -1, -1, 11, 0, 2, 0, 0, 0}},
    {{"MIG-17"}, {"Fresco"}, 550, 300, {3, 0, 17, 0, 16, 0, 2, 0, 0, 0}},
    {{"Tu-95"}, {"Bear"}, 410, 5100, {1, 0, 0, 0, 18, 0, 2, 0, 0, 0}},
    {{"Mi-24"}, {"Hind"}, 200, 300, {1, 0, 17, 0, 19, 0, 2, 0, 0, 0}},
    {{"F-5"}, {"Tiger"}, 500, 250, {3, 0, 22, 0, 22, 0, 2, 0, 0, 0}},
    {{"767"}, {"Boeing"}, 400, 1000, {1, 0, -1, -1, 18, 0, 2, 0, 0, 0}},
};

/* === Mission generation coordinate tables (from stslots.asm) === */

/* Unit type remapping table - maps unit type to alternative types */
extern const struct UnitTypeRemap unitTypeRemapTable[] = {
    {0, 0},
    {2, 0},
    {6, 1},
    {7, 3},
    {6, 2},
    {5, 7},
    {4, 2},
    {5, 3},
    {8, 0},
    {8, 0},
    {10, 11},
    {11, 9},
    {12, 13},
    {12, 14},
    {13, 14},
    {15, 0},
    {4, 5000},
    {0, 12},
    {18, 3},
    {0, 4},
    {1, 4},
    {5, 6},
    {0, 0},
    {0, 650},
    {0, 0},
};

/* Difficulty level saved from game state */
int16 difficultySaved = 1;

/* Mission table - 56 entries defining mission types per theater/tension */
extern const struct MissionTableEntry missionTable[56] = {
    {4, 1, 0x2F, 0, 0x0F, 7},
    {4, 1, 0x2F, 0, 0x0F, 1},
    {3, 1, 0x3A, 0, 0x0F, 6},
    {3, 1, 0x3A, 0, 0x0F, 3},
    {1, 2, 0, 0, 0x0F, 6},
    {2, 2, 0, 0, 0x0F, 6},
    {2, 3, 0, 1, 0x0F, 7},
    {1, 4, 0, 0, 0x0F, 6},
    {2, 4, 0, 0, 0x0F, 1},
    {1, 5, 0, 0, 0x0F, 7},
    {2, 5, 0, 0, 0x0F, 7},
    {1, 6, 0, 9, 0x0F, 4},
    {2, 6, 0, 9, 0x0F, 3},
    {1, 7, 0, 4, 0x0F, 7},
    {2, 7, 0, 4, 0x0F, 7},
    {1, 0x16, 0, 5, 0x0F, 7},
    {2, 0x16, 0, 5, 0x0F, 7},
    {1, 0x16, 0, 6, 0x0F, 7},
    {2, 0x16, 0, 6, 0x0F, 3},
    {1, 0x16, 0x22, 6, 0x0F, 7},
    {2, 0x16, 0x22, 6, 3, 3},
    {1, 0x17, 0, 0x0B, 3, 7},
    {2, 0x17, 2, 0x0B, 0x0F, 1},
    {1, 0x0A, 0, 3, 0x0F, 6},
    {2, 0x0A, 0, 3, 0x0F, 7},
    {1, 0x0C, 0, 7, 3, 7},
    {2, 0x0C, 2, 7, 3, 7},
    {2, 0x0C, 0, 7, 3, 7},
    {1, 0x0D, 0, 1, 3, 7},
    {2, 0x0D, 0, 1, 2, 3},
    {1, 0x0E, 0, 8, 2, 7},
    {2, 0x0E, 0, 8, 3, 3},
    {1, 0x0F, 0, 2, 3, 7},
    {2, 0x0F, 0, 2, 0x0F, 3},
    {1, 0x10, 0, 0, 0x0F, 6},
    {2, 0x10, 0, 0, 0x0F, 3},
    {1, 0x11, 0x22, 0, 3, 7},
    {2, 0x11, 0x22, 0, 0x0F, 3},
    {1, 0x12, 0, 0, 0x0F, 6},
    {2, 0x12, 0, 0, 0x0F, 1},
    {1, 0x13, 0, 0, 0x0F, 7},
    {2, 0x13, 0, 0, 0x0B, 7},
    {1, 9, 0, 0, 0x0B, 7},
    {2, 9, 0, 0, 0x0C, 6},
    {2, 9, 2, 0, 0x0F, 6},
    {1, 0x14, 0, 0, 0x0F, 6},
    {2, 0x14, 0, 0, 0x0C, 6},
    {5, 0x15, 0, 0, 3, 7},
    {5, 0x15, 0, 0, 0x0C, 6},
    {7, 0x15, 0, 0, 3, 3},
    {7, 0x15, 0, 0, 0x0B, 1},
    {7, 0x15, 0, 0, 0x0F, 3},
    {6, 0x15, 0, -15, 0x0C, 6},
    {8, 0x15, 0, -15, 0x0D, 6},
    {8, 0x15, 0, -5, 0x0F, 7},
    {8, 0x15, 0, -2, 0, 0},
};

/* Target coordinate arrays per mission pick type */
const int16 targetCoordsX0[3] = {17856, 15680, 3520};
const int16 targetCoordsY0[3] = {15552, 17216, 9408};
const int16 targetCoordsX1[2] = {9920, 10048};
const int16 targetCoordsY1[2] = {8512, 8640};
const int16 targetCoordsX2[2] = {15808, 9664};
const int16 targetCoordsY2[2] = {17344, 15296};
const int16 targetCoordsX3[3] = {8448, 2304, 4352};
const int16 targetCoordsY3[3] = {8960, 2304, 1280};
const int16 targetCoordsX4[4] = {12032, 6912, 15616, 5376};
const int16 targetCoordsY4[4] = {11008, 4864, 11520, 13568};
const int16 targetCoordsX5 = 23232;
const int16 targetCoordsY5 = 15040;
extern const int16 targetCoordsX6[8] = {18624, 4288, 16576, 17600, 9408, 3776, 4800, 20672};
extern const int16 targetCoordsY6[8] = {10560, 8512, 9536, 9536, 8512, 2880, 1856, 13632};
const int16 targetCoordsX7[3] = {19776, 19520, 19776};
const int16 targetCoordsY7[3] = {14656, 14784, 14784};
extern const int16 targetCoordsX2Alt[4] = {15552, 15424, 9408, 9280};
extern const int16 targetCoordsY2Alt[4] = {16960, 17088, 14912, 15040};
extern const uint8 missionPickType[8] = {2, 6, 5, 6, 6, 6, 6, 11};

/* Pointer arrays: target coordinates per mission pick index */
const int16 *targetCoordsXPtrs[8] = {
    targetCoordsX0, targetCoordsX1, targetCoordsX2, targetCoordsX3,
    targetCoordsX4, &targetCoordsX5, targetCoordsX6, targetCoordsX7};
const int16 *targetCoordsYPtrs[8] = {
    targetCoordsY0, targetCoordsY1, targetCoordsY2, targetCoordsY3,
    targetCoordsY4, &targetCoordsY5, targetCoordsY6, targetCoordsY7};
extern const int16 targetCoordsCount[9] = {3, 2, 2, 3, 4, 1, 8, 3, 0};

/* === BSS variables === */

struct Pilot hallfameBuf[8];
struct GameComm FAR *commData;
struct Game FAR *gameData;
FILE *fileHandle;
int16 FAR *needSplash;
int16 FAR *gfxModeSetPtr;
uint8 hercFlag;
int16 selectedPilotIdx;
int16 readItemSize;
int16 flightUnitCount;
uint8 joyReady[4];
uint8 intRegs[12];
char todayMissStrBuf[0x1D];
uint8 missionStrTrunc;
uint8 missionStrTruncEnd[1];
uint8 exitCode[2];
struct NearestTerrain *nearestTerrainResult;
char objectTypeTable[0x64];
uint8 wldReadBuf8[0x64];
uint8 wldReadBuf7[0x64];
char *wldOffsets[0x64];
char wldReadBuf11[0x2EE];
struct TerrainPtrTable terrainTilePtrs[5];
uint16 worldObjectCount;
char scenarioFoundArr[6];
struct WorldObject worldObjects[0x4B];
char terrainGrid[256];
struct FlightUnit flightUnits[0x13];
int16 groundUnitCount;
uint8 wldReadBuf1[2];
int16 page1Ptr;
uint8 gridBuf1[17];
uint8 gridBuf2[0x100];
uint8 gridBuf3[0x200];
uint8 gridBuf4[0x200];
uint8 gridBuf5[0x200];
struct Target targets[2];
uint16 terrainBuf1[5] = {0x20, 0x20, 0x20, 0x20, 0x20};
struct TerrainCountTable terrainTileCounts[5] = {{0}};

/* terrainBuf3, terrainBuf4, terrainBuf5, terrainIdxBuf must be contiguous.
 * Code indexes them with stride 7: terrainBuf3+off(2), terrainBuf4+off(2),
 * terrainBuf5+off(2), terrainIdxBuf+off(1) per tile entry.
 * Max entries: 0xDAC/7 = 0x1F8 (504) tiles.
 */
struct TerrainTile terrainTileBlock[0x1F8];
