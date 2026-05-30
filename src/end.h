#ifndef F15_SE2_END
#define F15_SE2_END
#include "inttype.h"
#include "struct.h"
#include "comm.h"
#include "slot.h"

#include <stdio.h>
#include <dos.h>

#if !defined(MSDOS) && !defined(__MSDOS__)
#define far
#endif

#define __int32 long
#define __int8 char
#define __cdecl
#define __far far

/* Flight record status field bitmasks */
#define STATUS_TYPE_MASK    0x3F  /* lower 6 bits: event type */
#define STATUS_PRIMARY_HIT  0x80  /* primary target was hit */
#define STATUS_SECONDARY_HIT 0x40 /* secondary target was hit */

/* Flight record event types (status & STATUS_TYPE_MASK) */
#define EVENT_AIR_KILL      1
#define EVENT_GROUND_KILL   2
#define EVENT_SAM_KILL      3
#define EVENT_BOMB_HIT      5
#define EVENT_EJECTED       8
#define EVENT_TIMESTAMP     9
#define EVENT_WAYPOINT      10
#define EVENT_AIR_KILL2     12

/* Map coordinate conversion divisors */
#define MAP_SCALE_X         0x92  /* horizontal: (coord << 7) / 0x92 */
#define MAP_SCALE_Y         0xC3  /* vertical:   (coord << 7) / 0xC3 */

/* Kill record offset in flight record array */
#define KILL_RECORD_OFFSET  207

/* Unit ID / slot index mask */
#define UNIT_ID_MASK        0x7F

/* Popup overlay dimensions (pixels) */
#define POPUP_WIDTH         0x30
#define POPUP_HEIGHT        0x28
#define POPUP_SAVE_Y        0x96  /* Y offset for popup save area */

/* VGA double-buffer size in paragraphs */
#define VGA_BUF_SIZE        0x3c8c

/* Normal debrief exit code */
#define EXIT_DEBRIEF        0x23

/* Font/color index for title text */
#define FONT_TITLE          0x0d

/* Landing type values (commData->landingType) */
#define LANDING_CRASHED     1
#define LANDING_EJECTED     2
#define LANDING_SAFE        3

/* Max record count sentinel for drawFlightPath */
#define ALL_RECORDS         0x270f

/* calcMissionScore: compute score for all events */
#define SCORE_ALL_EVENTS    0x100

void closeFileWrapper(int handle);

/* ASM functions called from C */
void restoreTimerIrqHandler(void);
void setTimerIrqHandler(void);
void intDispatch(int intNum, uint8 *inRegs, uint8 *outRegs);
void restoreCbreakHandler(void);
int getTimeOfDay(void);
void srandInit(int seed);
void decodePic(int handle, int segment);
void showPicFile(int handle, int page, int garbage);
int dos_alloc(int size);
void dos_printstring(const char *str);
int dos_free(int segment);
int openFile(char *name, int mode);
int createFile(char *name, int mode);
int readFile(int handle, int buf, int size);
int readFileAt(int handle, int a, int b, int c);
int writeFile(int handle, int a, int b, int c, int d);

/* Extern variables from ASM */
extern char var_timerFlag;
extern char timerHandlerInstalled;
extern int timerCountLo;
extern int timerCountHi;
extern int timerTarget;
extern int timerDivisor;
extern int timerTickCnt;
extern int timerReload;
extern char timerDivider;
extern int timerMode;
extern int timerCalSumLo;
extern int timerCalSumHi;
extern char timerSyncRetrace;
extern int timerTick;
extern int timerRetrace;
extern unsigned char timerCounter;
extern char timerCounter4;
extern int origCBreakSeg;
extern int origCBreakOfs;
extern int lineX1;
extern int lineY1;
extern int lineX2;
extern int lineY2;
extern int clipMaxX;
extern int clipMaxY;
extern unsigned char clipOutcode;
extern int clipDx;
extern int clipDy;
extern int clipDxHalf;
extern int clipDyHalf;
extern int clearRectX;
extern int clearRectY;
extern int clearRectWidth;
extern int clearRectHeight;
extern int joyMinValues[];
extern int joyMaxValues[];
extern int joyCenterValues[];
extern int joyRangeBelow[];
extern int joyRangeAbove[];
extern int joyRawAxis0;
extern int joyRawAxis1;
extern int joyRawAxis2;
extern int joyRawAxis3;
extern int lastDrawX;
extern int prevDrawX;
extern int lastDrawY;
extern int prevDrawY;
extern char popupVisible;
extern int missionScore;
extern int missionScoreHi;
extern int popupX;
extern int popupY;
extern char scoreString[];
extern int target1Type[];
extern int target1MiscBits[];
extern int target2Type[];
extern int target2MiscBits[];
extern char str_inFlight[];
extern char str_timeLabel[];
extern char str_timeZeros[];
extern char str_timeFormat[];
extern char str_allocError[];
extern char str_deallocError[];
extern int randSeed;
extern int randState;
extern int mapViewX1;
extern int mapViewY1;
extern int mapViewX2;
extern int mapViewY2;
extern unsigned int cursorX;
extern unsigned int cursorY;
extern struct GameComm far *commData;
extern char quitFlag;
extern int colorTablePtr;
extern char inputChanged;
extern int colorAnimIdx;
extern int colorAnimEnabled;
extern char joyRepeatFlag;
extern char spriteToggle;
extern char animDone;
extern char timerCounter2;
extern char timerCounter3;
extern char enterPressed;
extern int colorStyleTable[];
extern struct SpriteParams* spriteAirBlink;
extern struct SpriteParams* spriteSamBlink;
extern struct SpriteParams* spriteGroundBlink;
extern struct SpriteParams* spriteWaypointBlink;
extern void far pollJoystick(void);

typedef uint16 MenuItemFlags;

#define MENUITEM_TYPE_MASK    0x0007 // 0b0000000000000111
#define MENUITEM_SELECTABLE   0x0008 // 0b0000000000001000
#define MENUITEM_ENABLED      0x0100 // 0b0000000100000000
#define MENUITEM_HAS_SPRITE   0x0800 // 0b0000100000000000
#define MENUITEM_SPRITE_BLINK 0x1000 // 0b0001000000000000

typedef struct MenuItem {
    int16  hitX1;          /* 0x00 */
    int16  hitY1;          /* 0x02 */
    int16  hitX2;          /* 0x04 */
    int16  hitY2;          /* 0x06 */

    int16  colorX1;        /* 0x08 */
    int16  colorY1;        /* 0x0a */
    int16  colorX2;        /* 0x0c */
    int16  colorY2;        /* 0x0e */
    int16  colorTableIdx;  /* 0x10 */
    int16  colorPair;      /* 0x12 */

    int16  labelData1[5];  /* 0x14-0x1D */
    int16 *pagePtr;        /* 0x1E */
    int16  labelData2[4];  /* 0x20-0x27 */
    struct SpriteParams *spriteNormal; /* 0x28 */
    struct SpriteParams *spriteBlink;  /* 0x2A */

    int16  unk_2c;         /* 0x2c */
    int16  state;          /* 0x2e */
    MenuItemFlags flags; /* 0x30 */
} MenuItem;
#if F15_PTR_BITS==64
STATIC_ASSERT(sizeof(struct MenuItem)==72);
#elif F15_PTR_BITS==32
STATIC_ASSERT(sizeof(struct MenuItem)==60);
#else
STATIC_ASSERT(sizeof(struct MenuItem)==50);
#endif

void processDebriefInput(int *cursorBounds, MenuItem *menuItem, int16* gfxPage);

/* FlightRecord: 6 bytes per record */
typedef struct {
    char mapX;
    char mapY;
    char status;
    char unitId;
    char unk4;
    char unk5;
} FlightRecord;

extern FlightRecord flightRecords[];
extern int curRecordIdx;
extern char slotInfoTable[];  /* slot info table, 16 bytes per slot */
extern char ejectedFlag;
extern int popupSpriteY[];
extern int popupSpriteX[];

/* Sprite struct pointers (first word of each sprite descriptor) */
extern struct SpriteParams* spriteAir;
extern struct SpriteParams* spriteSam;
extern struct SpriteParams* spriteGround;
extern struct SpriteParams* spriteWaypoint;

/* Sprite descriptor structs */
extern struct SpriteParams spriteMapAreaDef;
extern struct SpriteParams spriteStatusBarDef;
extern struct SpriteParams spriteAirDef;
extern struct SpriteParams spriteAirBlinkDef;
extern struct SpriteParams spriteSamDef;
extern struct SpriteParams spriteSamBlinkDef;
extern struct SpriteParams spriteGroundDef;
extern struct SpriteParams spriteGroundBlinkDef;
extern struct SpriteParams spriteBombDef;
extern struct SpriteParams spriteBombBlinkDef;
extern struct SpriteParams spriteWaypointDef;
extern struct SpriteParams spriteWaypointBlinkDef;

/* Page descriptors and pointers */
extern struct PageDesc pageStruct;
extern struct PageDesc pageStruct2;
extern int16 pageStruct3[];
extern int16 *debriefPage;
extern int16 *debriefPage2;
extern struct SpriteParams *spriteMapArea;
extern struct SpriteParams *spriteStatusBar;
extern int16 *cursorBoundsPtr;
extern char *menuItemsBase;
extern char *theaterSprFiles[];
extern char *debriefMenuStrings[];
extern MenuItem debriefMenuItems[];

/* Reconstructed C functions */
void seedRandom(void);
void loadPic(char *filename, int segment);
void openShowPic(char *name, int page);
uint16 allocBuffer(int size);
void freeBuffer(int segment);
void srandInit(int seed);
int mapToScreenY(unsigned char mapCoord);
int mapToScreenX(unsigned char mapCoord);
void drawClippedLineEx(int x1, int y1, int x2, int y2, int cx1, int cy1, int cx2, int cy2, int flag);
void drawClippedLine(int x1, int y1, int x2, int y2);
int drawEventSprite(int recordIdx);
void drawMapPixel(int x, int y, int color);
int isPointInRect(void *p);
void blinkWidget(MenuItem *item, int16* gfxPage);
unsigned int drawFlightPath(int16 *gfxPage, unsigned int maxRecord);
void showEventPopup(void);
void drawFlightLine(int p1, int p2, int p3, int p4);
void animateFlightPath(int16* gfxPage);
void drawWrappedText(int16 *page, char *str, unsigned int maxWidth, int x, int y, int lineHeight);
void drawLineWrapper(void);
void clearRect(int16 *page, int y1, int x1, int x2, int y2);
void mystrcat(char *dst, char *src);
char *formatFlightTime(int timeValue, char *buffer);
long calcMissionScore(int param);
void waitForKeyOrJoy(void);
void checkQuitFlag(void);
void restoreVideoMode(void);
void restoreInterrupts(void);
void plotMapPoint(int x, int y, int color, int unused);
void timerWait(unsigned int ticks);
void drawStringAtPos(int16 *s, char far *str, int x, int y);
void drawFarString(int16 *s, char far *str);
void farStrcpy(char *dst, char far *src);
int loadFileSection(char *name, int b, int c);
int loadFileSectionEx(char *name, int b, int c, int d, int e);
void outportByte(int port, int value);
void decodePicRaw(int handle, int segment);
void processMenuItems(MenuItem *items, int unused, int itemCount, int cursorStartX, int cursorStartY, int16* gfxPage);
int selectMenuItem(MenuItem *items, int unused, int itemCount, int inputState, int16* gfxPage);
void loadWorldData(int destOffset, int size);
void readFromWorldBuf(char *dest, int size, int count, int bufHandle);
void readFromWorldFile(char *dest, int size, int count, int bufHandle);
extern int worldDataReady;
extern char *worldStrings[];
extern char worldStringBuf[];
extern int worldBufHandle;
void loadPicFromFile(char *name, int segment);
void loadPicFromFileAt(char *name, int segment, int off, int whence);
void drawMenuItem(MenuItem *items, unsigned int index, int16* gfxPage);

/* String constants from ASM */
extern char str_insertScenario[];
extern char str_pressKey1[];
extern char str_insertDiskA[];
extern char str_pressKey2[];
extern char str_dbicons1[];
extern char str_dbicons2[];
extern char str_modeRb1[];
extern char str_modeRb2[];
extern char str_missionDebrief[];
extern char str_pressExit[];
extern char str_dot1[];
extern char str_overall1[];
extern char str_missionRating1[];
extern char str_dot2[];
extern char str_trainingScore[];
extern char str_notRecorded[];
extern char str_dot3[];
extern char str_careerTotal[];
extern char str_dot4[];
extern char str_missionSummary[];
extern char str_priSecTargets[];
extern char str_otherTargets[];
extern char str_enemyPlanes[];
extern char str_friendlyTargets[];
extern char str_dot5[];
extern char str_overall2[];
extern char str_missionRating2[];
extern char str_dot6[];
extern char str_missionEvent[];
extern char str_time[];
extern char str_destroyed4[];
extern char str_destroyed1[];
extern char str_destroyed2[];
extern char str_shotDown2[];
extern char str_shotDown[];
extern char str_destroyed3[];
extern char str_rearmed3[];
extern char str_rearmed1[];
extern char str_rearmed2[];
extern char str_hitBy[];
extern char str_missile[];
extern char str_takeoffPoint[];
extern char str_missionEnd[];
extern char str_crashed[];
extern char str_goodBailout[];
extern char str_captured[];
extern char str_bailedDied[];
extern char str_goodLanding[];
extern char str_primaryObj[];
extern char str_secndryObj[];
extern char str_cumulative2[];
extern char str_cumulative[];
extern char str_missionRating3[];
extern char str_pressSelect[];
extern char str_pressNext[];

/* Data symbols used by drawMenuItem */
#define dat_4824 scoreString
extern struct WorldObject worldObjects[];
extern int worldWaypointCount;
extern int worldRouteTable;
extern int worldRouteCount;
extern int worldSamTable;
extern int worldUnitFlags;
extern int worldGridSize;
extern int worldMiscHeader;
extern unsigned char weaponDataBlock;
extern int worldObjectCount;
extern int worldSamCount;
extern int waypointData;
extern int flightTimeTable[];
extern int totalFlightRecords;

/* Data symbols used by showPostMissionAwards */
extern struct PageDesc awardPageDesc;
extern struct PageDesc awardPageDesc2;
extern int16 *awardPage;
#define awardFont  (awardPageDesc.font)
#define awardColor (awardPageDesc.color)
extern char textBuf[];
extern char *rankNames[];
extern long promoScores[];
extern long promoThresholds[];
extern char *medalNames[];
extern long medalScores[];
extern long medalThresholds[];
extern char str_deskPic[];
extern char str_deskMsg1[];
extern char str_deskMsg2[];
extern char str_deathPic[];
extern char str_deathMsg1[];
extern char str_deathMsg2[];
extern char str_promoPic[];
extern char str_promoMsg1[];
extern char str_promoMsg2[];
extern char str_medalPic[];
extern char str_medalMsg1[];
extern char str_medalMsg2[];

/* Variables used by calcMissionScore */
extern int secondaryHit;
extern int primaryHit;
extern int airMissed;
extern int airKilled;
extern int groundMissed;
extern int samMissed;
extern int groundKilled;
extern int samKilled;
extern char unitTypeTable[];
extern char gridFlags[];

/* Variables used by main */
extern struct Game far *gameData;
extern char hercFlag;
extern char joyAxisY;
extern char joyAxisX;
extern int hasVgaMode;
extern int gfxBufSeg;
extern int vgaBufSeg;
extern int vgaBufSeg2;
extern int vgaBufOffset;
extern int spriteBufSeg;
extern int missionResult;
extern int selectedMenuItem;

/* ASM functions called by main */
void setupOverlaySlots(int param);
void clearKeybuf(void);
void loadWorldStrings(void);
void setupWorldBufPtr(void);
void readWorldData(void);
void loadTheaterIndex(void);
void debriefMainLoop(void);
void showPostMissionAwards(void);
void installCBreakHandler(void);
extern void far copyJoystickData(uint8 far *data);

/* File I/O variables */
extern uint8 errorCodeStr;
extern uint8 errorCodeTerminator;
extern uint8 fileReadBuf[];
extern char str_fileNotFound[];
extern char str_noFileBufs[];
extern char str_openError[];
extern char str_fileCloseError[];
extern char str_readError[];
extern char str_writeError[];
extern int16 fileIoVar1;
extern int16 fileIoVar2;
extern int16 fileIoVar3;
extern int16 fileReadPos;
extern int16 tmpFileHandle;

/* Pic decoder state */
extern uint8 picDecodedRowBuf[];
extern int16 picScreenBufSize;
extern int16 picPageIndex;
extern int16 picRowOffset;
extern int16 picRowPad;
extern int16 picRow;
extern int16 picReadFromFilePtr;

/* Pic decoder state (BSS, moved to end_data.c) */
extern int16 worldBufOffset;
extern int16 worldBufSegment;
extern int16 picReadBufEndPtr;
extern int16 picWorkDataPtr;
extern int16 picRowLength;
extern uint8 picProcessFlag;
extern uint8 picLookupResult;
extern uint8 picTmp9BitCount;
extern uint8 picByte;
extern int16 picFileReadBufEnd;
extern int16 picNumberDictSlots;
extern int16 picFileWord;
extern uint8 picRemainingBitCount;
extern uint8 picByteUnsignedFlag;
extern int16 picSlotCounter;

/* Second LZW decoder state */
extern uint8 lzw2CodeBitWidth;
extern uint8 lzw2MaxBitWidth;
extern int16 lzw2CodeMask;
extern int16 lzw2NextSlot;
extern uint8 lzw2ReadByte;
extern uint8 lzw2BitPos;
extern uint8 lzw2DictBuf[];
extern int16 lzw2StackPtr;
extern int16 lzw2PrevCode;
extern int16 lzw2CurCode;
extern int16 lzw2FirstChar;
extern uint8 lzw2WorkBuf[];

extern uint8 ovlInsaneFlag;

#endif // F15_SE2_END
