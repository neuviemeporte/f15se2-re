#ifndef F15_SE2_ENDATA
#define F15_SE2_ENDATA
/* Public data globals defined in endata.c (debrief state, strings, sprites). */
#include "inttype.h"
#include "struct.h"
#include "comm.h"
#include "endtypes.h"
#include <dos.h>
#include <stdio.h>

extern unsigned char timerCounter;
extern int16 lineX1;
extern int16 lineY1;
extern int16 lineX2;
extern int16 lineY2;
extern int16 clipMaxX;
extern int16 clipMaxY;
extern int lastDrawX;
extern int prevDrawX;
extern int lastDrawY;
extern int prevDrawY;
extern char popupVisible;
extern int32 missionScore;
extern int popupX;
extern int popupY;
extern char scoreString[];
extern int target1Type[];
extern int target1MiscBits[];
extern int target2Type[];
extern int target2MiscBits[];
extern int16 randSeed;
extern int16 randState;
extern const int mapViewX1;
extern const int mapViewY1;
extern const int mapViewX2;
extern const int mapViewY2;
extern uint16 cursorX;
extern uint16 cursorY;
extern struct GameComm far *commData;
extern uint8 quitFlag;
extern unsigned int *colorTablePtr;
extern char inputChanged;
extern int colorAnimIdx;
extern int colorAnimEnabled;
extern char joyRepeatFlag;
extern char spriteToggle;
extern char animDone;
extern uint8 timerCounter2;
extern uint8 timerCounter3;
extern char enterPressed;
extern int colorStyleTable[];
extern struct SpriteParams* spriteAirBlink;
extern struct SpriteParams* spriteSamBlink;
extern struct SpriteParams* spriteGroundBlink;
extern struct SpriteParams* spriteWaypointBlink;
extern FlightRecord flightRecords[];
extern int curRecordIdx;
extern char slotInfoTable[];  /* slot info table, 16 bytes per slot */
extern char ejectedFlag;
extern const int popupSpriteY[];
extern const int popupSpriteX[];
extern struct SpriteParams* spriteAir;
extern struct SpriteParams* spriteSam;
extern struct SpriteParams* spriteGround;
extern struct SpriteParams* spriteWaypoint;
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
extern int16 *debriefPage;
extern int16 *debriefPage2;
extern struct SpriteParams *spriteMapArea;
extern struct SpriteParams *spriteStatusBar;
extern int16 *cursorBoundsPtr;
extern const char *theaterSprFiles[];
extern const char *debriefMenuStrings[];
extern MenuItem debriefMenuItems[];
extern int worldDataReady;
extern char *worldStrings[];
extern char worldStringBuf[];
extern FILE *worldBufHandle;
extern struct WorldObject worldObjects[];
extern int16 worldWaypointCount;
extern int worldRouteTable;
extern int16 worldRouteCount;
extern int worldSamTable;
extern int worldUnitFlags;
extern int16 worldGridSize;
extern int worldMiscHeader;
extern struct WeaponDataBlock weaponDataBlock;
extern uint16 worldObjectCount;
extern int worldSamCount;
extern int waypointData;
extern int16 flightTimeTable[];
extern int totalFlightRecords;
extern struct PageDesc awardPageDesc;
extern int16 *awardPage;
extern char textBuf[];
extern const char *rankNames[];
extern const long promoThresholds[];
extern const char *medalNames[];
extern const long medalThresholds[];
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
extern struct Game far *gameData;
extern char hercFlag;
extern uint8 joyAxisY;
extern uint8 joyAxisX;
extern int hasVgaMode;
extern int16 gfxBufSeg;
extern int vgaBufSeg;
extern int vgaBufSeg2;
extern int vgaBufOffset;
extern int spriteBufSeg;
extern int missionResult;
extern int selectedMenuItem;
extern int16 worldBufOffset;
extern int16 worldBufSegment;

/* Named views into weaponDataBlock[] (offsets documented in endata.c):
 *   planeArray     +0x156  SamDataEntry[] — enemy aircraft specs
 *   samWeaponTable +0x3B6  Sam[]          — SAM/missile entries
 *   nightMission   +0x6DA  int16          — night-mission flag
 */
#define planeArray     ((struct SamDataEntry *)((unsigned char *)&weaponDataBlock + 0x156))
#define samWeaponTable ((struct Sam *)((unsigned char *)&weaponDataBlock + 0x3B6))
#define nightMission   (*(int16 *)((unsigned char *)&weaponDataBlock + 0x6DA))

/* Award screen page descriptor views (awardPageDesc defined in endata.c) */
#define awardFont  (awardPageDesc.font)
#define awardColor (awardPageDesc.color)

#endif /* F15_SE2_ENDATA */
