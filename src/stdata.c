#include "inttype.h"
#include "struct.h"
#include "comm.h"
#include <stdio.h>
#include <dos.h>

/* === Group 1 (0x0042-0x0530): Filename, mission selection, UI strings === */
char aTemp_wld[] = "temp.wld";

/* Mission selection strings */
char aLibya[] = "Libya";
char aPersianGulf[] = "Persian Gulf";
char aVietnam[] = "Vietnam";
char aMiddleEast[] = "Middle East";
char aOtherAreas[] = "Other Areas";
char aAcrossTheLineO[] = "Across the \"Line of Death\"";
char aKeepingTheSeaL[] = "Keeping the Sea Lanes Open";
char aAmericaSLonges[] = "America's Longest Air War";
char aEaglesVsMigs[] = "Eagles vs MiGs";
char aInsertYourScen[] = "Insert your scenario disk";
char aRookie[] = "Rookie";
char aPilot[] = "Pilot";
char aVeteran[] = "Veteran";
char aAce[] = "Ace";
char aDemo[] = "Demo";
char aGetOffToAGoodS[] = "Get off to a good start";
char aForTheCasualPl[] = "For the casual player";
char aForMoreSerious[] = "For more serious players";
char aTheUltimateCha[] = "The Ultimate Challenge";
char aLetSSeeWhatThi[] = "Let's see what this thing can do";
char aNc[] = "nc";
char aCe[] = "ce";
char aJp[] = "jp";
char aNa[] = "na";
char aNorthCape[] = "North Cape";
char aCentralEurope[] = "Central Europe";
char aDesertStorm[] = "Desert Storm";
char aNorthAtlantic[] = "North Atlantic";
char aOtherAreas_0[] = "Other Areas";
char aIntoTheSovietS[] = "Into the Soviet's Backyard";
char aRedStormRaging[] = "Red Storm Raging";
char aTheFightForKuw[] = "The Fight for Kuwait";
char aDefendingTheIc[] = "Defending the Iceland-UK Gap";
char aSelectABuiltIn[] = "Select a built-in area";
char aHistoricalMiss[] = "Historical Missions";
char aGeneralAirStri[] = "General Air Strikes";
char emptyMissTypeNames[3] = {0, 0, 0};
char aReenactHistory[] = "Reenact history";
char aTheCoreOfTheAi[] = "The core of the Air Campaign";
char emptyMissTypeDescs[3] = {0, 0, 0};
char aSaddamSEyes[] = "Saddam's Eyes";
char aCommandAndCont[] = "Command and Control";
char aScudBusting[] = "Scud Busting";
char aNoNukes[] = "No Nukes";
char aMoreHistorical[] = "more historical missions";
char aIraqSEarlyWarn[] = "Iraq's Early Warning Radar";
char aIraqiDefenseNe[] = "Iraqi Defense Nerve Center";
char aStopSaddamSTer[] = "Stop Saddam's Terror Weapon";
char aNuclearResearc[] = "Nuclear Research Facility";
char emptyHistDesc1 = 0;
char aBabyMilkFactory[] = "'Baby Milk Factory'";
char aStopTheSpill[] = "Stop the Spill";
char aBridgesToNowhe[] = "Bridges to Nowhere";
char aRepublicanGuar[] = "Republican Guards";
char aMoreHistoric_0[] = "more historical missions";
char aChemicalBiolog[] = "Chemical/Biological Weapons Plant";
char aSeverTheOilPum[] = "Sever the Oil Pumping Manifold";
char aSaddamSEliteAr[] = "Saddam's Elite Armored Units";
char aCutTheSupplyLi[] = "Cut the Supply Lines";
char emptyHistDesc2 = 0;
char aMission[] = "MISSION";
char placeholder_3d3[] = "xx.3d3";

/* UI strings */
char aDifficulty[] = "DIFFICULTY";
char aTheater[] = "THEATER";
char aNoScenarioFile[] = "No scenario files found";
char aSeeTechnicalSu[] = "See Technical Supplement";
char aTheater_0[] = "THEATER";
char aMissionType[] = "MISSION TYPE";

/* === Group 2 (0x0670-0x072c): Mission briefing strings === */
char aRepeatLastMiss[] = "Repeat last mission ? (y/n)";
char strCloseParen[] = ")";
char aPleaseReinsert[] = "Please reinsert F15 Disk A";
char aPressSelectorW[] = "<Press selector when ready>";
char aDecodingMissio[] = "decoding mission...";
char aTodaySMission[] = "TODAY'S MISSION";
char aTakeoffFrom[] = "Takeoff from:";
char aOnc_2[] = "ONC ";
char aPrimaryTarget[] = "Primary Target:";
char aOnc_0[] = "ONC ";
char aSecondaryTarge[] = "Secondary Target:";
char aOnc_1[] = "ONC ";

/* === Group 3 (0x0830-0x0a98): Rank, roster, overlay strings === */
char a2ndLt_[] = "2nd Lt. ";
char a1stLt_[] = "1st Lt. ";
char aCapt_[] = "Capt. ";
char aMajor[] = "Major ";
char aLtCol_[] = "Lt Col. ";
char aColonel[] = "Colonel ";
char aGen_[] = "Gen. ";

char aOriginalDiskIn[] = "Original Disk in drive.  Roster will not be saved.";
char aPressAKeyToCon[] = "Press a key to continue.";
char aUseSelectorToC[] = "Use SELECTOR to choose pilot,  ESC to enter new pilot.";
char strOpenParen[] = " (";
char aMenterYourName[] = "\376ENTER YOUR NAME !";

/* Overlay loader variables */
int ovlSeg1 = 0;
int ovlParCnt = 0;
int ovlParBlock = 0;
int ovlSeg2 = 0;
char ovlInsaneFlag = 0;

/* Overlay error strings */
char aAlloc1M[] = "Allocated 1Mb of space????$";
char aDosLied[] = "MS-DOS lied to us about how much memory was available$";
char aFileNFound[] = "Filename not found$";
char aEnoughMem[] = "Not enough memory to load file$";
char aOvlFail[] = "Overlay load failed for some reason$";
char aOvlOvrrun[] = "Overlay has overrun allocated memory$";
char aOvlShrink[] = "Unable to shrink overlay memory allocation$";
char aOvlRel[] = "Error releasing overlay memory$";

/* === Group 4 (0x12b6-0x130c): File I/O error strings === */
char aFileNotFound[] = ":File not found$";
char aNoFileBuffersAvailable[] = ":No file buffers available$";
char aOpenError[] = ":Open error $";
char aFileClosingError[] = "File closing error$";
char aReadError[] = "Read error$";
char aWriteError[] = "Write error$";

/* === Group 5 (0x146e-0x14d6): Alloc error, highlight, lookup tables === */
char str_allocError[] = "Insufficient system memory - AllocBuffer$";

/* Mission selection state */
int16 enableHighlight = 1;

/* Direction/level lookup tables */
int dirDeltaX[] = {-1, 1, 1, -1, 0, 1, 0, -1, 0};
int dirDeltaY[] = {1, 1, -1, -1, 1, 0, -1, 0, 0, -8192, -4096};
int gridLevelSize[] = {0, 0x1000, 0x2000, 0x400, 0x100, 0x40, 0x10, 4};

/* === Group 6 (0x1632-0x1763): Terrain/grid file strings === */
int16 gridSignature = 0x3232;
int16 terrainSignature = 0x3131;
int16 terrainDirtyFlag = 0;
int16 gridValidFlag = 0;

char a_3dt[] = ".3dT";
char aOpenErrorOn_3d[] = "Open Error on *.3DT, assuming new file !";
char aBadTileFileFor[] = "Bad Tile file format.";
char aTooManyTiles_[] = "Too many tiles.";
char aTooMuchTileDat[] = "Too much tile data";
char a_3dg[] = ".3dG";
char aOpenErrorOn__0[] = "Open Error on *.3DG, assuming new file !";
char aBadGridFileFor[] = "Bad Grid file format.";

/* Region/theater filename strings */
char aRegn_xxx[] = "regn.xxx";
char aLb_xxx[] = "lb.xxx";
char aPg_xxx[] = "pg.xxx";
char aVn_xxx[] = "vn.xxx";
char aMe_xxx[] = "me.xxx";
char aNc_xxx[] = "nc.xxx";
char aCe_xxx[] = "ce.xxx";
char aJp_xxx[] = "jp.xxx";
char aNa_xxx[] = "na.xxx";
char aLibya_wld[] = "Libya.wld";
char aGulf_wld[] = "gulf.wld";
char aVn_wld[] = "vn.wld";
char aMe_wld[] = "me.wld";
char aNc_wld[] = "nc.wld";
char aCe_wld[] = "ce.wld";
char aJp_wld[] = "jp.wld";
char aNa_wld[] = "na.wld";

/* === Group 7 (0x27e6-0x2818): Mission/scenario strings === */
char aPowCamp[] = "POW Camp";
char aTd00[] = "TD00";
char aJz00[] = "JZ00";
char aXv00[] = "XV00";
char aEs00[] = "ES00";
char aWx00[] = "WX00";
char aCc00[] = "CC00";
char aHz00[] = "HZ00";
char aAt[] = " at ";

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
uint8 far *moveDst = 0;

/* Sprite blit params struct */
struct SpriteParams spriteParams = {
    0, 0, 0, 0, 0, 0, 0, 0,  /* bufPtr..height */
    {0, 0},                   /* pad10 */
    0x6D,                     /* byte12 */
    {0, 0, 0},                /* pad13 */
    0x3F,                     /* byte16 */
    0x01,                     /* byte17 */
    0x01,                     /* flags */
    {0x01, 0x01, 0x00}        /* pad19 */
};

/* Page descriptors - 24-byte structs passed by pointer to graphics overlay */
struct PageDesc page1Desc = {
    1,                        /* pageNum */
    {0, 0},                   /* pad1 */
    0,                        /* color (drawColor) */
    0x0B,                     /* byte6 */
    {0, 0, 0, 0, 0},         /* pad2 */
    1,                        /* font (fontIndex) */
    {0, 0, 0, 0, 0, 0, 0, 0}, /* pad3 */
    (int16*)&page1Desc        /* selfPtr (page1NumPtr) */
};
int16 *page1NumPtr = (int16*)&page1Desc;
struct PageDesc page2Desc = {
    2,                        /* pageNum */
    {0, 0},                   /* pad1 */
    0,                        /* color */
    0x0B,                     /* byte6 */
    {0, 0, 0, 0, 0},         /* pad2 */
    1,                        /* font */
    {0, 0, 0, 0, 0, 0, 0, 0}, /* pad3 */
    (int16*)&page2Desc        /* selfPtr (page2NumPtr) */
};
int16 *page2NumPtr = (int16*)&page2Desc;
struct PageDesc page3Desc = {
    3,                        /* pageNum */
    {0, 0},                   /* pad1 */
    0,                        /* color */
    0x0B,                     /* byte6 */
    {0, 0, 0, 0, 0},         /* pad2 */
    1,                        /* font */
    {0, 0, 0, 0, 0, 0, 0, 0}, /* pad3 */
    (int16*)&page3Desc        /* selfPtr */
};
struct PageDesc screenDesc = {
    0,                        /* pageNum */
    {0, 0},                   /* pad1 */
    7,                        /* color (textColor) */
    0x00,                     /* byte6 */
    {0, 0, 0, 0, 0},         /* pad2 */
    1,                        /* font */
    {0, 0, 0, 0, 0, 0, 0, 0}, /* pad3 */
    (int16*)&screenDesc       /* selfPtr (screenBuf) */
};
int16 *screenBuf = (int16*)&screenDesc;
struct PageDesc pageNumPageDesc = {
    0,                        /* pageNum */
    {0, 0},                   /* pad1 */
    0x0C,                     /* color */
    0x00,                     /* byte6 */
    {0, 0, 0, 0, 0},         /* pad2 */
    3,                        /* font */
    {0, 0, 0, 0, 0, 0, 0, 0}, /* pad3 */
    (int16*)&pageNumPageDesc  /* selfPtr (pageNumPtr) */
};
int16 *pageNumPtr = (int16*)&pageNumPageDesc;

int16 nightMissionFlag = 0;
char bufCoordStr = 0;
uint8 gridRefRow = 0;
uint8 gridRefCol = 0;
uint8 gridRefRowDigit[1] = {0};

int16 escortMissionFlag;
uint32 baseXPrecise = 0;
int16 nearestObjectType = 0;
int16 nearestDist = 0;
uint32 nearestWorldX = 0;
uint32 nearestWorldY = 0;
int16 nearestTilePtr = 0;
uint8 nearestLevel = 0;
uint8 nearestCellIdx = 0;
uint8 nearestGridX = 0;
uint8 nearestGridY[1] = {0};
int16 missionDistAccum;
int16 playerStartLoc;
uint32 baseYPrecise;
struct TerrainTile* tileDataPtr;
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
int16 clipMaxX = 0x13F;
int16 clipMaxY = 0x6F;

/* Ctrl-Break handler state */
uint8 cbreakHit = 0;
int16 origCBreakSeg = 0;
int16 origCBreakOfs = 0;
int16 errorCodeStr = 0;

/* Page descriptor for buffer page 0 (color=0x0F, font=0x0100) */
int16 bufPageDesc[7] = {0, 0, 0x0F, 0, 0, 0, 0x0100};
int16 *bufPtr = bufPageDesc;

/* Weapon table (struct Weapon, 14 bytes/entry, 23 entries) */
struct Weapon aNone[] = {
    { "None",   0x0000, 0x0000, 0x0000 },
    { "SA-2",   0x00c8, 0x0003, 0x0000 },
    { "SA-5",   0x015e, 0x0002, 0x0000 },
    { "SA-8B",  0x007d, 0x0005, 0x0000 },
    { "SA-10",  0x0140, 0x0007, 0x0001 },
    { "SA-11",  0x00c8, 0x0005, 0x0000 },
    { "SA-12",  0x0122, 0x0006, 0x0001 },
    { "SA-13",  0x007d, 0x0003, 0x0000 },
    { "SA-N-4", 0x00c8, 0x0004, 0x0001 },
    { "SA-N-5", 0x0096, 0x0003, 0x0000 },
    { "SA-N-6", 0x0140, 0x0006, 0x0001 },
    { "SA-N-7", 0x00c8, 0x0005, 0x0000 },
    { "Hawk",   0x00af, 0x0006, 0x0001 },
    { "Rapier", 0x004b, 0x0008, 0x0000 },
    { "Tiger",  0x0041, 0x0004, 0x0000 },
    { "Seacat", 0x00c8, 0x0002, 0x0000 },
    { "IL76",   0x00c8, 0x0008, 0x0003 },
    { "",       0x0032, 0x0005, 0x0000 },
    { "",       0x0046, 0x0006, 0x0000 },
    { "",       0x0050, 0x0007, 0x0001 },
    { "",       0x0064, 0x0008, 0x0001 },
    { "OTH",    0x01f4, 0x0005, 0x0001 },
    { "",       0x0028, 0x0003, 0x0000 },
};

/* File I/O buffer (512 bytes total) */
uint8 fileReadBuf[0x200] = {0};
int16 fileReadPos = 0;
int16 tmpFileHandle = 0;

/* Pic decode row buffer */
uint8 picDecodedRowBuf[0x140] = {0};

/* Graphics state */
int16 picScreenBufSize = 0;
int16 picPageIndex = 0;
int16 picRowOffset = 0;
int16 picRow = 0;
int16 picReadFromFilePtr = 0;

/* Sprite blit state */
int armPosition = 0;
int spriteBlitX = 0;
int spriteBlitY = 0;
int spriteBlitW = 0;
int spriteBlitH = 0;

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
char *plhFiles[] = { aLb_xxx, aPg_xxx, aVn_xxx, aMe_xxx, aNc_xxx, aCe_xxx, aJp_xxx, aNa_xxx };
char *worldFiles[] = { aLibya_wld, aGulf_wld, aVn_wld, aMe_wld, aNc_wld, aCe_wld, aJp_wld, aNa_wld };

/* Mission coordinate state */
int16 missionMidX = 0;
int16 missionMidY = 0;
unsigned int missionTargetX = 0;
unsigned int missionTargetY = 0;
int16 missionTarget2X = 0;
int16 missionTarget2Y = 0;
int16 missionBase2X = 0;
int16 missionBase2Y = 0;

/* Mission menu pointer arrays */
char *missTheaNames[] = { aLibya, aPersianGulf, aVietnam, aMiddleEast, aOtherAreas };
char *missTheaDesc[] = { aAcrossTheLineO, aKeepingTheSeaL, aAmericaSLonges, aEaglesVsMigs, aInsertYourScen };
char *missDiffLevels[] = { aRookie, aPilot, aVeteran, aAce, aDemo };
char *missDiffDesc[] = { aGetOffToAGoodS, aForTheCasualPl, aForMoreSerious, aTheUltimateCha, aLetSSeeWhatThi };
char *scenarioCodePtr[] = { aNc, aCe, aJp, aNa };
char *missScenarioNames[] = { aNorthCape, aCentralEurope, aDesertStorm, aNorthAtlantic, aOtherAreas_0 };
char *missScenarioDesc[] = { aIntoTheSovietS, aRedStormRaging, aTheFightForKuw, aDefendingTheIc, aSelectABuiltIn };
char *missTypeNames[] = { aHistoricalMiss, aGeneralAirStri, &emptyMissTypeNames[0], &emptyMissTypeNames[1], &emptyMissTypeNames[2] };
char *missTypeDesc[] = { aReenactHistory, aTheCoreOfTheAi, &emptyMissTypeDescs[0], &emptyMissTypeDescs[1], &emptyMissTypeDescs[2] };
char *missHistorical1Names[] = { aSaddamSEyes, aCommandAndCont, aScudBusting, aNoNukes, aMoreHistorical };
char *missHistorical1Desc[] = { aIraqSEarlyWarn, aIraqiDefenseNe, aStopSaddamSTer, aNuclearResearc, &emptyHistDesc1 };
char *missHistorical2Names[] = { aBabyMilkFactory, aStopTheSpill, aBridgesToNowhe, aRepublicanGuar, aMoreHistoric_0 };
char *missHistorical2Desc[] = { aChemicalBiolog, aSeverTheOilPum, aSaddamSEliteAr, aCutTheSupplyLi, &emptyHistDesc2 };
char *missionStr = aMission;
char *plh3d3Ptr = placeholder_3d3;

/* Pilot state */
uint8 pilotSelectFlag = 0;

/* Rank pointer array */
char *ranks[] = { a2ndLt_, a1stLt_, aCapt_, aMajor, aLtCol_, aColonel, aGen_ };

/* Medal sprite tables (7 entries for 7 medals, null-terminated) */
uint8 medalSpriteX[] = { 0x82, 0x71, 0x81, 0x70, 0x6F, 0xA1, 0x9F, 0 };
uint8 medalSpriteY[] = { 0x80, 0x80, 0xB3, 0xB3, 0x91, 0x91, 0xA2, 0 };
uint8 medalWidth[] = { 0x09, 0x0B, 0x0B, 0x0D, 0x2F, 0x0B, 0x0F, 0 };

/* Blink animation colors */
int16 blinkColors[] = { 7, 0x0F };
int16 blinkColorIdx = 0;

/* Pilot name input colors (2 words: word + byte pair) */
int16 pilotNameInputColors[] = { 0, 0x0008 };

/* Arm animation sprite tables (8 entries each) */
int16 armSrcX[] = { 1, 0x53, 0xD9, 0xA4, 1, 1, 0xBF, 0x10A };
int16 armSrcY[] = { 0, 0, 0, 0x2E, 0x3E, 0x7C, 0x6A, 0x53 };
int16 armBlitX[] = { 0x3E, 0x3E, 0x3D, 0x3E, 0x3E, 0x3E, 0x3F, 0x3E };
int16 armBlitY[] = { 0x1C, 0x2F, 0x35, 0x36, 0x37, 0x38, 0x39, 0x38 };
int16 armBlitW[] = { 0x52, 0x5D, 0x66, 0x66, 0x68, 0x5C, 0x4B, 0x35 };
int16 armBlitH[] = { 0x3E, 0x2E, 0x25, 0x2D, 0x3E, 0x4B, 0x5D, 0x74 };

/* Mission pick state */
int16 missionPick = -1;  /* 0xFFFF */
int16 missionPickPad = -1; /* the db 0FFh, 0FFh after missionPick */
int16 armSpriteIndex[] = { 1, 2, 3, 4, 5, 6, 7 };

/* Joystick repeat flag */
int16 joyRepeatFlag = 0;

/* FCB search data */
uint8 fcbMatchStr[] = { 0x49, 0x03, 0x46, 0x31, 0x35, 0x41, 0x00 };
uint8 searchFCB[] = {
    0xFF, 0, 0, 0, 0, 0, 0x08, 0x00,
    '?', '?', '?', '?', '?', '?', '?', '?', '?', '?', '?',
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
};

/* Disk Transfer Area (DOS FCB search result buffer) */
uint8 diskTransferArea[0x85] = {0};

/* Weapon loadout table (26 bytes per entry, accessed via weaponLoadouts[idx].qty) */
struct WeaponLoadout weaponLoadouts[] = {
    { 4, "AIM-9M\0\0\0",  "Sidewinder\0",  0x17 },  /* 0 */
    { 4, "AIM-120\0\0",  "AMRAAM \0\0\0\0",  0x16 },  /* 1 */
    { 4, "AGM-88A\0\0",  "HARM\0\0\0\0\0\0\0",  0x18 },  /* 2 */
    { 4, "AIM-7M\0\0\0",  "Sparrow\0\0\0\0",  0x16 },  /* 3 */
    { 1, "AGM-86A\0\0",  "Harpoon\0\0\0\0",  0x1A },  /* 4 */
    { 6, "AGM-65D\0\0",  "Maverick\0\0\0",  0x1B },  /* 5 */
    { 8, "GBU-12\0\0\0",  "Paveway\0\0\0\0",  0x1C },  /* 6 */
    { 2, "Mk 20\0\0\0\0",  "Rockeye\0\0\0\0",  0x1D },  /* 7 */
    { 2, "Dndl\0\0\0\0\0",  "Durandal\0\0\0",  0x1D },  /* 8 */
    { 3, "Mk 82-0\0\0",  "Slick\0\0\0\0\0\0",  0x1E },  /* 9 */
    { 3, "Mk 82-1\0\0",  "Snakeye\0\0\0\0",  0x1D },  /* 10 */
    { 4, "Mk 20\0\0\0\0",  "Rockeye II\0",  0x1C },  /* 11 */
    { 2, "Mk 122\0\0\0",  "Fireeye\0\0\0\0",  0x1E },  /* 12 */
    { 2, "CBU-72\0\0\0",  "Fuel-Air\0\0\0",  0x1C },  /* 13 */
    { 2, "Mk 35\0\0\0\0",  "IN Cluster\0",  0x1D },  /* 14 */
    { 1, "ISC B-1\0\0",  "Minelets\0\0\0",  0x1D },  /* 15 */
    { 1, "135 mm\0\0\0",  "Camera\0\0\0\0\0",  -1 },  /* 16 */
    { 1, "1900lbs\0\0",  "Extra Fuel\0",  -2 },  /* 17 */
    { 1, "20 mm\0\0\0\0",  "Guns\0\0\0\0\0\0\0",  0x00 },  /* 18 */
    { 1, "Special\0\0",  "Equip\0\0\0\0\0\0",  0x26 },  /* 19 */
};

/* Plane/aircraft table - 19 entries used by mission generator */
struct Plane planes[19] = {
    {{"MIG-23"}, {"Flogger"}, 0x02E4, 0x0230, {3, 0, 0x11, 0, 0x0A, 0, 2, 0, 0, 0}},
    {{"MIG-25"}, {"Foxbat"}, 0x023A, 0x02BC, {2, 0, 0x12, 0, 0, 0, 2, 0, 0, 0}},
    {{"MIG-29"}, {"Fulcrum"}, 0x02BC, 0x0190, {5, 0, 0x13, 0, 0x14, 0, 2, 0, 0, 0}},
    {{"F-1"}, {"Mirage"}, 0x0316, 0x03A2, {3, 0, 0x14, 0, 0, 0, 2, 0, 0, 0}},
    {{"Su-27"}, {"Flanker"}, 0x02D5, 0x02CB, {4, 0, 0x13, 0, 0x14, 0, 2, 0, 0, 0}},
    {{"IL-76"}, {"Mainstay"}, 0x0190, 0x0FA0, {1, 0, 0x10, 0, 0x0C, 0, 2, 0, 0, 0}},
    {{"F-4E"}, {"Phantom"}, 0x0320, 0x0208, {4, 0, 0x12, 0, 0x0B, 0, 2, 0, 0, 0}},
    {{"F-14"}, {"Tomcat"}, 0x0320, 0x0320, {4, 0, 0x13, 0, 8, 0, 2, 0, 0, 0}},
    {{"F-18"}, {"Hornet"}, 0x0294, 0x01CD, {5, 0, -1, -1, 0, 0, 2, 0, 0, 0}},
    {{"An-72"}, {"Coaler"}, 0x015E, 0x026C, {2, 0, 0, 0, 9, 0, 2, 0, 0, 0}},
    {{"F-18"}, {"Hornet"}, 0x0294, 0x01CD, {5, 0, -1, -1, 4, 0, 2, 0, 0, 0}},
    {{"MIG-23"}, {"Flogger"}, 0x02E4, 0x0230, {3, 0, 0, 0, 4, 0, 2, 0, 0, 0}},
    {{"F-14"}, {"Tomcat"}, 0x0320, 0x0320, {4, 0, -1, -1, 8, 0, 2, 0, 0, 0}},
    {{"F-4E"}, {"Phantom"}, 0x0320, 0x0208, {4, 0, -1, -1, 0x0B, 0, 2, 0, 0, 0}},
    {{"MIG-17"}, {"Fresco"}, 0x0226, 0x012C, {3, 0, 0x11, 0, 0x10, 0, 2, 0, 0, 0}},
    {{"Tu-95"}, {"Bear"}, 0x019A, 0x13EC, {1, 0, 0, 0, 0x12, 0, 2, 0, 0, 0}},
    {{"Mi-24"}, {"Hind"}, 0x00C8, 0x012C, {1, 0, 0x11, 0, 0x13, 0, 2, 0, 0, 0}},
    {{"F-5"}, {"Tiger"}, 0x01F4, 0x00FA, {3, 0, 0x16, 0, 0x16, 0, 2, 0, 0, 0}},
    {{"767"}, {"Boeing"}, 0x0190, 0x03E8, {1, 0, -1, -1, 0x12, 0, 2, 0, 0, 0}},
};

/* === Mission generation coordinate tables (from stslots.asm) === */

/* Unit type remapping table - maps unit type to alternative types */
struct UnitTypeRemap unitTypeRemapTable[] = {
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
    {0x0A, 0x0B},
    {0x0B, 0x09},
    {0x0C, 0x0D},
    {0x0C, 0x0E},
    {0x0D, 0x0E},
    {0x0F, 0},
    {4, 0x1388},
    {0, 0x0C},
    {0x12, 3},
    {0, 4},
    {1, 4},
    {5, 6},
    {0, 0},
    {0, 0x028A},
    {0, 0},
};

/* Difficulty level saved from game state */
int difficultySaved = 1;

/* Mission table - 56 entries defining mission types per theater/tension */
struct MissionTableEntry missionTable[56] = {
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
int16 targetCoordsX0[3] = {(int16)0x45C0, (int16)0x3D40, (int16)0x0DC0};
int16 targetCoordsY0[3] = {(int16)0x3CC0, (int16)0x4340, (int16)0x24C0};
int16 targetCoordsX1[2] = {(int16)0x26C0, 0x2740};
int16 targetCoordsY1[2] = {0x2140, (int16)0x21C0};
int16 targetCoordsX2[2] = {(int16)0x3DC0, (int16)0x25C0};
int16 targetCoordsY2[2] = {(int16)0x43C0, (int16)0x3BC0};
int16 targetCoordsX3[3] = {0x2100, 0x0900, 0x1100};
int16 targetCoordsY3[3] = {0x2300, 0x0900, 0x0500};
int16 targetCoordsX4[4] = {0x2F00, 0x1B00, 0x3D00, 0x1500};
int16 targetCoordsY4[4] = {0x2B00, 0x1300, 0x2D00, 0x3500};
int16 targetCoordsX5 = (int16)0x5AC0;
int16 targetCoordsY5 = (int16)0x3AC0;
int16 targetCoordsX6[8] = {(int16)0x48C0, (int16)0x10C0, (int16)0x40C0, (int16)0x44C0, (int16)0x24C0, (int16)0x0EC0, (int16)0x12C0, (int16)0x50C0};
int16 targetCoordsY6[8] = {0x2940, 0x2140, 0x2540, 0x2540, 0x2140, 0x0B40, 0x0740, 0x3540};
int16 targetCoordsX7[3] = {0x4D40, 0x4C40, 0x4D40};
int16 targetCoordsY7[3] = {0x3940, (int16)0x39C0, (int16)0x39C0};
int16 targetCoordsX2Alt[4] = {(int16)0x3CC0, 0x3C40, (int16)0x24C0, 0x2440};
int16 targetCoordsY2Alt[4] = {0x4240, (int16)0x42C0, 0x3A40, (int16)0x3AC0};
uint8 missionPickType[8] = {2, 6, 5, 6, 6, 6, 6, 0x0B};

/* Pointer arrays: target coordinates per mission pick index */
int16 *targetCoordsXPtrs[8] = {
    targetCoordsX0, targetCoordsX1, targetCoordsX2, targetCoordsX3,
    targetCoordsX4, &targetCoordsX5, targetCoordsX6, targetCoordsX7
};
int16 *targetCoordsYPtrs[8] = {
    targetCoordsY0, targetCoordsY1, targetCoordsY2, targetCoordsY3,
    targetCoordsY4, &targetCoordsY5, targetCoordsY6, targetCoordsY7
};
int16 targetCoordsCount[9] = {3, 2, 2, 3, 4, 1, 8, 3, 0};

/* === BSS variables === */

struct Pilot hallfameBuf[8];
struct GameComm far *commData;
struct Game far *gameData;
FILE *fileHandle;
int far *needSplash;
int far *gfxModeSetPtr;
uint8 hercFlag;
int selectedPilotIdx;
int readItemSize;
int flightUnitCount;
uint8 joyReady[4];
uint8 intRegs[12];
char todayMissStrBuf[0x1D];
uint8 missionStrTrunc;
uint8 missionStrTruncEnd[1];
uint8 exitCode[2];
int16 *nearestTerrainResult;
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
uint16 terrainBuf1[5] = { 0x20, 0x20, 0x20, 0x20, 0x20 };
struct TerrainCountTable terrainTileCounts[5] = {0};

/* terrainBuf3, terrainBuf4, terrainBuf5, terrainIdxBuf must be contiguous.
 * Code indexes them with stride 7: terrainBuf3+off(2), terrainBuf4+off(2),
 * terrainBuf5+off(2), terrainIdxBuf+off(1) per tile entry.
 * Max entries: 0xDAC/7 = 0x1F8 (504) tiles.
 */
struct TerrainTile terrainTileBlock[0x1F8];
