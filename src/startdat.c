/* start_data.c — Data definitions migrated from start_rc.asm (.DATA segment)
 * See docs/start_rc_data_migration.md
 */
#include "inttype.h"
#include "struct.h"

/* Filename strings */
char aLabs_pic[] = "labs.pic";
char aAdv_pic[] = "adv.pic";
char aEgraphic_exe[] = "egraphic.exe";
char aTitle640_pic[] = "Title640.Pic";
char aTitle16_pic[] = "title16.pic";
char aF15_spr[] = "f15.spr";
char aF15_spr_0[] = "f15.spr";
char aTemp_wld[] = "temp.wld";

/* UI strings */
char aWall_pic[] = "Wall.Pic";
char aDifficulty[] = "DIFFICULTY";
char aTheater[] = "THEATER";
char aRb_1[] = "rb";
char aNoScenarioFile[] = "No scenario files found";
char aSeeTechnicalSu[] = "See Technical Supplement";
char aTheater_0[] = "THEATER";
char aMissionType[] = "MISSION TYPE";

/* Mission briefing strings */
char aRepeatLastMiss[] = "Repeat last mission ? (y/n)";
char aRb_2[] = "rb";
char aF15_spr_1[] = "F15.spr";
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

/* Roster / pilot strings */
char aArmpiece_pic[] = "ArmPiece.Pic";
char aHiscore_pic[] = "HiScore.Pic";
char aOriginalDiskIn[] = "Original Disk in drive.  Roster will not be saved.";
char aPressAKeyToCon[] = "Press a key to continue.";
char aUseSelectorToC[] = "Use SELECTOR to choose pilot,  ESC to enter new pilot.";
char asc_174AC[] = " (";
char asc_174AF[] = ")";
char aMenterYourName[] = "\376ENTER YOUR NAME !";
char aRb_3[] = "rb";
char aHallfame[] = "HallFame";
char aWb[] = "wb";
char aHallfame_0[] = "HallFame";

/* Overlay error strings */
char aAlloc1M[] = "Allocated 1Mb of space????$";
char aDosLied[] = "MS-DOS lied to us about how much memory was available$";
char aFileNFound[] = "Filename not found$";
char aEnoughMem[] = "Not enough memory to load file$";
char aOvlFail[] = "Overlay load failed for some reason$";
char aOvlOvrrun[] = "Overlay has overrun allocated memory$";
char aOvlShrink[] = "Unable to shrink overlay memory allocation$";
char aOvlRel[] = "Error releasing overlay memory$";

/* File I/O error strings */
char aFileNotFound[] = ":File not found$";
char aNoFileBuffersAvailable[] = ":No file buffers available$";
char aOpenError[] = ":Open error $";
char aFileClosingError[] = "File closing error$";
char aReadError[] = "Read error$";
char aWriteError[] = "Write error$";
char str_allocError[] = "Insufficient system memory - AllocBuffer$";

/* Terrain/grid file strings */
char a_3dt[] = ".3dT";
char aRb[] = "rb";
char aOpenErrorOn_3d[] = "Open Error on *.3DT, assuming new file !";
char aBadTileFileFor[] = "Bad Tile file format.";
char aTooManyTiles_[] = "Too many tiles.";
char aTooMuchTileDat[] = "Too much tile data";
char a_3dg[] = ".3dG";
char aRb_0[] = "rb";
char aOpenErrorOn__0[] = "Open Error on *.3DG, assuming new file !";
char aBadGridFileFor[] = "Bad Grid file format.";

/* Mission/scenario strings */
char aPowCamp[] = "POW Camp";
char aRb_4[] = "rb";
char aWb_0[] = "wb";
char aTd00[] = "TD00";
char aJz00[] = "JZ00";
char aXv00[] = "XV00";
char aEs00[] = "ES00";
char aWx00[] = "WX00";
char aCc00[] = "CC00";
char aHz00[] = "HZ00";
char aAt[] = " at ";

/* Overlay loader variables */
int ovlSeg1 = 0;
int ovlParCnt = 0;
int ovlParBlock = 0;
int ovlSeg2 = 0;
char ovlInsaneFlag = 0;

/* Mission selection state */
int enableHighlight = 1;

/* Direction/level lookup tables */
int word_17FFE[] = {-1, 1, 1, -1, 0, 1, 0, -1, 0};
int word_18010[] = {1, 1, -1, -1, 1, 0, -1, 0, 0, (int)0xE000, (int)0xF000};
int word_18026[] = {0, 0x1000, 0x2000, 0x400, 0x100, 0x40, 0x10, 4};

/* Terrain/grid state */
int terrainSignature = 0x3131;
int terrainDirtyFlag = 0;
int gridSignature = 0x3232;
int gridValidFlag = 0;

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
/* page1Ptr must stay in start_rc.asm - sandwiched between grid buffers */

/* Sprite blit params struct - was word_17284..byte_1729C in start_rc.asm */
struct SpriteParams spriteParams = {
    0, 0, 0, 0, 0, 0, 0, 0,  /* bufPtr..height */
    {0, 0},                   /* pad10 */
    0x6D,                     /* byte12 */
    {0, 0, 0},                /* pad13 */
    0x3F,                     /* byte16 */
    0x01,                     /* byte17 */
    0x01,                     /* flags (byte_1729C) */
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
int *page2NumPtr = (int*)&page2Desc;
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
    0,                        /* pageNum (unk_173D2) */
    {0, 0},                   /* pad1 */
    7,                        /* color (textColor) */
    0x00,                     /* byte6 */
    {0, 0, 0, 0, 0},         /* pad2 */
    1,                        /* font (word_173DE) */
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

/* Migrated from .DATA */
int16 word_18994 = 0;
char bufCoordStr = 0;
uint8 byte_1B0D1 = 0;
uint8 byte_1B0D2 = 0;
uint8 byte_1B0D3 = 0;

/* Migrated from .DATA? */
int16 word_1B148;
uint32 dword_1D5D0 = 0;
int16 word_1D5D4 = 0;
int16 word_1D5D6 = 0;
uint32 dword_1D5D8 = 0;
uint32 dword_1D5DC = 0;
int16 word_1D5E0 = 0;
uint8 byte_1D5E2 = 0;
uint8 byte_1D5E3 = 0;
uint8 byte_1D5E4 = 0;
uint8 byte_1D5E5 = 0;
int16 word_1DD38;
int16 word_1D00A;
uint32 dword_1D650;
int16 word_1E24A;
int16 menuSprites;

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

/* Dirty rect buffers stay in start_rc.asm - overlay hardcodes +0x1B8 offset
 * between dirtyMinBuf and dirtyMaxBuf, only ASM can guarantee contiguity. */

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

/* File I/O buffer (512 bytes total) */
uint8 fileReadBuf[0x200] = {0};
int16 fileReadPos = 0;
int16 tmpFileHandle = 0;

/* Pic decode row buffer */
uint8 picDecodedRowBuf[0x140] = {0};

/* Graphics state */
int16 screenBufSize = 0;
int16 tmpPageIndex = 0;
int16 rowOffset = 0;
int16 row = 0;
int16 readFromFilePtr = 0;

/* Sprite blit state */
int armPosition = 0;
int spriteBlitX = 0;
int spriteBlitY = 0;
int spriteBlitW = 0;
int spriteBlitH = 0;

/* Pic decode scalar state */
int16 readBufEndPtr = 0;
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

/* Pointer arrays for region/world files */
char *regnPlhPtr = aRegn_xxx;
char *plhFiles[] = { aLb_xxx, aPg_xxx, aVn_xxx, aMe_xxx, aNc_xxx, aCe_xxx, aJp_xxx, aNa_xxx };
char *worldFiles[] = { aLibya_wld, aGulf_wld, aVn_wld, aMe_wld, aNc_wld, aCe_wld, aJp_wld, aNa_wld };

/* Mission coordinate state */
int16 word_182BA = 0;
int16 word_182BC = 0;
int16 word_182BE = 0;
int16 word_182C0 = 0;
int16 word_182C2 = 0;
int16 word_182C4 = 0;
int16 word_182C6 = 0;
int16 word_182C8 = 0;
