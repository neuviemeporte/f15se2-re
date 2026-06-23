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
extern char str_inFlight[];
extern char str_timeLabel[];
extern char str_timeZeros[];
extern char str_timeFormat[];
extern char str_allocError[];
extern char str_deallocError[];
extern int16 randSeed;
extern int16 randState;
extern int mapViewX1;
extern int mapViewY1;
extern int mapViewX2;
extern int mapViewY2;
extern unsigned int cursorX;
extern unsigned int cursorY;
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
extern int popupSpriteY[];
extern int popupSpriteX[];
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
extern char *theaterSprFiles[];
extern char *debriefMenuStrings[];
extern MenuItem debriefMenuItems[];
extern int worldDataReady;
extern char *worldStrings[];
extern char worldStringBuf[];
extern FILE *worldBufHandle;
extern char str_insertScenario[];
extern char str_pressKey1[];
extern char str_insertDiskA[];
extern char str_pressKey2[];
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
extern char *rankNames[];
extern long promoThresholds[];
extern char *medalNames[];
extern long medalThresholds[];
extern char str_deskMsg1[];
extern char str_deskMsg2[];
extern char str_deathMsg1[];
extern char str_deathMsg2[];
extern char str_promoMsg1[];
extern char str_promoMsg2[];
extern char str_medalMsg1[];
extern char str_medalMsg2[];
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
extern char joyAxisY;
extern char joyAxisX;
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
