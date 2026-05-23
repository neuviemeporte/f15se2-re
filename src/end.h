#ifndef F15_SE2_END
#define F15_SE2_END
#include "inttype.h"
#include "struct.h"
#include "comm.h"

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
extern void far gfx_jump_05_drawString(int *pageNum, const char *string);
extern int far gfx_jump_2f_charWidth(int ch, int font);

/* ASM functions called from C */
void restoreTimerIrqHandler(void);
void setTimerIrqHandler(void);
void intDispatch(int intNum, uint8 *inRegs, uint8 *outRegs);
extern void far misc_jump_5e_clearKeyFlags(void);
extern int far misc_jump_5a_keybuf(void);
extern int far misc_jump_5b_getkey(void);
extern int far misc_jump_5d_readJoy(int param);
void restoreCbreakHandler(void);
void memcopy(char *dst, char *src, int count);
void farMemcopy(int src_seg, int src_off, int dst_seg, int dst_off, int count);
int getTimeOfDay(void);
void srandInit(int seed);
void decodePic(int handle, int segment);
void showPicFile(int handle, int page, int garbage);
int dos_alloc(int size);
void dos_printstring(const char *str);
void dosExit(int code);
int dos_free(int segment);
int openFile(char *name, int mode);
int openFileRaw(char *name, int mode);
int readFileRaw(int handle, int buf, int size);
int readFileAtRaw(int handle, int a, int b, int c);
int readFileAtExRaw(int handle, int a, int b, int c, int d);

/* Extern variables from ASM */
extern char timerHandlerInstalled;
extern char timerCounter;
extern char var_194;
extern char var_195;
extern char var_196;
extern char var_197;
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
extern int nightMission;
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
extern int dat_1c8e[];
extern int *spriteAirBlink;
extern int *spriteSamBlink;
extern int *spriteGroundBlink;
extern int *spriteWaypointBlink;
extern void far pollJoystick(void);
void processDebriefInput(int *cursorBounds, void *menuItem, int gfxPage);

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

    char label[0x18];    /* 0x14 .. 0x2b */

    int16  unk_2c;         /* 0x2c */
    int16  state;          /* 0x2e */
    MenuItemFlags flags; /* 0x30 */
} MenuItem;
STATIC_ASSERT(sizeof(struct MenuItem)==50);

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
extern int *spriteAir;
extern int *spriteSam;
extern int *spriteGround;
extern int *spriteWaypoint;

extern int far gfx_jump_11_blitSprite(int spritePtr);

/* Reconstructed C functions */
void seedRandom(void);
void loadPic(char *filename, int segment);
void openShowPic(char *name, int page, int garbage);
int allocBuffer(int size);
void freeBuffer(int segment);
void srandInit(int seed);
int mapToScreenY(unsigned char mapCoord);
int mapToScreenX(unsigned char mapCoord);
void drawClippedLineEx(int x1, int y1, int x2, int y2, int cx1, int cy1, int cx2, int cy2, int flag);
void drawClippedLine(int x1, int y1, int x2, int y2);
int drawEventSprite(int recordIdx);
void drawMapPixel(int x, int y, int color);
void markHandleClosed(int handle);
int isPointInRect(void *p);
void blinkWidget(void *item, int gfxPage);
unsigned int drawFlightPath(int gfxPage, unsigned int maxRecord);
void showEventPopup(void);
void drawFlightLine(int p1, int p2, int p3, int p4);
void animateFlightPath(int gfxPage);
void drawWrappedText(int *page, char *str, unsigned int maxWidth, int x, int y, int lineHeight);
void clearRect(int *page, int y1, int x1, int x2, int y2);
void mystrcat(char *dst, char *src);
char *formatFlightTime(int timeValue, char *buffer);
extern void far gfx_jump_21(int param);
extern void far gfx_jump_50(void);
extern void far gfx_jump_29_switchColor(int page, int x1, int y1, int x2, int y2, int fromColor, int toColor);
extern void far gfx_jump_2a(int p1, int p2, int p3, int p4, int p5, int p6, int p7, int p8);
long calcMissionScore(int param);
void waitForKeyOrJoy(void);
void checkQuitFlag(void);
void routine_5(void);
void routine_6(void);
void closeAndResetFile(int *p);
void plotMapPoint(int x, int y, int color);
void timerWait(unsigned int ticks);
void drawStringAtPos(int *s, char far *str, int x, int y);
void drawFarString(int *s, char far *str);
void farStrcpy(char *dst, char far *src);
int openFileRead(char *name, int mode);
int readFileBlock(int handle, int buf, int size);
int readFileAt(int handle, int a, int b, int c);
int readFileAtEx(int handle, int a, int b, int c, int d);
int loadFileSection(char *name, int b, int c);
int loadFileSectionEx(char *name, int b, int c, int d, int e);
void outportByte(int port, int value);
void decodePicRaw(int handle, int segment);
void processMenuItems(void *items, int unused, int itemCount, int cursorStartX, int cursorStartY, int gfxPage);
int selectMenuItem(MenuItem *items, int unused, int itemCount, int inputState, int gfxPage);
void loadWorldData(int destOffset, int size);
void readFromWorldBuf(int destOffset, int size, int flag, int bufHandle);
void readFromWorldFile(int destOffset, int size, int flag, int bufHandle);
extern int worldDataReady;
extern char *worldStrings[];
extern char worldStringBuf[];
extern int worldBufHandle;
int fileSeek(int handle, int off, int whence, int mode);
void loadPicFromFile(char *name, int segment);
void loadPicFromFileAt(char *name, int segment, int off, int whence);
void drawMenuItem(MenuItem *items, unsigned int index, int gfxPage);

/* String constants from ASM */
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
extern char dat_4824[];
extern int dat_424e[];
extern int var_425c[];
extern int dat_4804;
extern int var_193[];
extern int var_192;
extern int var_102;

/* Data symbols used by showPostMissionAwards */
extern int *awardPage;
extern int awardFont;
extern int awardColor;
extern unsigned char textBuf[];
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
extern void far gfx_jump_3d_null(int param);
extern void far gfx_jump_50(void);
extern void far gfx_jump_45_retrace(void);
extern void far gfx_jump_46_retrace2(void);

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
extern char samDataTable[];

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
void initGraphics(void);
void loadWorldStrings(void);
void setupWorldBufPtr(void);
void readWorldData(void);
void loadTheaterIndex(void);
void debriefMainLoop(void);
void showPostMissionAwards(void);
void installCBreakHandler(void);
extern void far copyJoystickData(char far *data);
extern int far gfx_jump_31(void);
extern int far gfx_jump_17_bufSize(void);

#endif // F15_SE2_END
