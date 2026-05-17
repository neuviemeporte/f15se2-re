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

void closeFileWrapper(int param_1);
extern void far gfx_jump_05_drawString(int *pageNum, const char *string);
extern int far gfx_jump_2f_charWidth(int ch, int font);

/* ASM functions called from C */
void restoreTimerIrqHandler(void);
void setTimerIrqHandler(void);
void intDispatch(int intNum, char *inRegs, char *outRegs);
extern void far misc_jump_5e_clearKeyFlags(void);
extern int far misc_jump_5a_keybuf(void);
extern int far misc_jump_5b_getkey(void);
extern int far misc_jump_5d_readJoy(int param);
void restoreCbreakHandler(void);
void memcopy(char *dst, char *src, int count);
void farMemcopy(int src_seg, int src_off, int dst_seg, int dst_off, int count);
int getTimeOfDay(void);
void srandInit(int param_1);
void decodePic(int handle, int segment);
void showPicFile(int handle, int page, int garbage);
int dos_alloc(int size);
void dos_printstring(char *str);
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
extern char dat_4824[];
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
extern int far *commData;
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
extern void far routine_134(void);
void processDebriefInput(int *param_1, int *param_2, int param_3);

/* FlightRecord: 6 bytes per record */
typedef struct {
    char mapX;
    char mapY;
    char status;
    char pad;
    char unitId;
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
void srandInit(int param_1);
int mapToScreenY(unsigned char param_1);
int mapToScreenX(unsigned char param_1);
void drawClippedLineEx(int x1, int y1, int x2, int y2, int cx1, int cy1, int cx2, int cy2, int flag);
void drawClippedLine(int x1, int y1, int x2, int y2);
int drawEventSprite(int param_1);
void drawMapPixel(int x, int y, int color);
void markHandleClosed(int handle);
int isPointInRect(unsigned int *p);
void blinkWidget(int *param_1, int param_2);
unsigned int drawFlightPath(int param_1, unsigned int param_2);
void showEventPopup(void);
void drawFlightLine(int p1, int p2, int p3, int p4);
void animateFlightPath(int param_1);
void drawWrappedText(int *page, char *str, unsigned int maxWidth, int x, int y, int lineHeight);
void clearRect(int *page, int y1, int x1, int x2, int y2);
void mystrcat(char *dst, char *src);
char *formatFlightTime(int timeValue, char *buffer);
extern void far gfx_jump_21(int param);
extern void far gfx_jump_29_switchColor(int page, int x1, int y1, int x2, int y2, int fromColor, int toColor);
extern void far gfx_jump_2a(int p1, int p2, int p3, int p4, int p5, int p6, int p7, int p8);
long calcMissionScore(int param);
void waitForKeyOrJoy(void);
void routine_26(void);
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
void routine_71(int param_1, int param_2);
void routine_108(int param_1, int param_2, int param_3, int param_4);
void routine_109(int param_1, int param_2, int param_3, int param_4);
extern int worldDataReady;
extern char *worldStrings[];
extern char worldStringBuf[];
extern int worldBufHandle;
int fileSeek(int handle, int off, int whence, int mode);
void loadPicFromFile(char *name, int segment);
void loadPicFromFileAt(char *name, int segment, int off, int whence);

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
extern int far *gameData;
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

/* ASM functions called by main */
void setupOverlaySlots(int param);
void clearKeybuf(void);
void initGraphics(void);
void loadWorldStrings(void);
void setupWorldBufPtr(void);
void readWorldData(void);
void routine_24(void);
void routine_25(void);
void routine_27(void);
void installCBreakHandler(void);
extern void far copyJoystickData(char far *data);
extern int far gfx_jump_31(void);
extern int far gfx_jump_17_bufSize(void);

#endif // F15_SE2_END
