#ifndef F15_SE2_STDATA
#define F15_SE2_STDATA
/* Public data globals defined in stdata.c. */
#include "inttype.h"
#include "struct.h"
#include "comm.h"
#include "pointers.h"
#include <dos.h>
#include <stdio.h>

extern int16 *bufPtr;
extern struct PageDesc page1Desc;
extern int16 *page1NumPtr;
extern int16 *page2NumPtr;
extern const char *missTheaNames[];
extern const char *missTheaDesc[];
extern const char *missDiffLevels[];
extern const char *missDiffDesc[];
extern const char *scenarioCodePtr[];
extern const char *missScenarioNames[];
extern const char *missScenarioDesc[];
extern const char *missTypeNames[];
extern const char *missTypeDesc[];
extern const char *missHistorical1Names[];
extern const char *missHistorical1Desc[];
extern const char *missHistorical2Names[];
extern const char *missHistorical2Desc[];
extern const char *missionStr;
extern const int16 armSrcX[];
extern const int16 armSrcY[];
extern const int16 armBlitX[];
extern const int16 armBlitY[];
extern const int16 armBlitW[];
extern const int16 armBlitH[];
extern int16 enableHighlight;
extern char *plh3d3Ptr;
extern int16 missionPick;
extern const int16 armSpriteIndex[];
extern int16 joyRepeatFlag;
extern struct SpriteParams spriteParams;
extern uint8 timerCounter;
extern uint8 timerCounter3;
extern uint8 pilotSelectFlag;
extern struct PageDesc screenDesc;
extern int16 *screenBuf;
extern int16 *pageNumPtr;
extern const char *ranks[];
extern const uint8 medalSpriteX[];
extern const uint8 medalSpriteY[];
extern const uint8 medalWidth[];
extern const int16 blinkColors[];
extern int16 blinkColorIdx;
extern const int16 pilotNameInputColors[];
extern uint8 joyAxes[];
extern int16 lineX1;
extern int16 lineX2;
extern int16 lineY1;
extern int16 lineY2;
extern uint8 cbreakHit;
extern const int16 dirDeltaX[];
extern const int16 dirDeltaY[];
extern const int16 gridLevelSize[];
extern int16 terrainSignature;
extern uint16 terrainBuf1[];
extern struct TerrainCountTable terrainTileCounts[];
extern int16 gridSignature;
extern int16 terrainDirtyFlag;
extern int16 gridValidFlag;
extern int16 missionMidX;
extern int16 missionMidY;
extern uint16 missionTargetX;
extern uint16 missionTargetY;
extern int16 missionTarget2X;
extern int16 missionTarget2Y;
extern int16 missionBase2X;
extern int16 missionBase2Y;
extern const struct Plane planes[];
extern const struct UnitTypeRemap unitTypeRemapTable[];
extern int16 difficultySaved;
extern int16 nightMissionFlag;
extern const struct WeaponLoadout weaponLoadouts[];
extern const struct MissionTableEntry missionTable[];
extern char *regnPlhPtr;
extern const char *plhFiles[];
extern const char *worldFiles[];
extern const int16 targetCoordsX6[];
extern const int16 targetCoordsY6[];
extern const int16 targetCoordsX2Alt[];
extern const int16 targetCoordsY2Alt[];
extern const uint8 missionPickType[];
extern const int16 *targetCoordsXPtrs[];
extern const int16 *targetCoordsYPtrs[];
extern const int16 targetCoordsCount[];
extern int16 armPosition;
extern int16 spriteBlitX;
extern int16 spriteBlitY;
extern int16 spriteBlitW;
extern int16 spriteBlitH;
extern int16 flag4Saved;
extern int16 theaterSaved;
extern uint8 FAR *moveDst;
/* Grid-reference string buffer: "<colLetter><rowLetter><colDigit><rowDigit>\0".
   The data named these 4 bytes separately but they form one contiguous
   buffer (mystrcpy writes the whole string into it). */
extern char bufCoordStr[];
extern char todayMissStrBuf[];
extern uint8 missionStrTrunc;
extern uint8 missionStrTruncEnd[];
extern int16 escortMissionFlag;
extern int16 FAR *gfxModeSetPtr;
extern FILE *fileHandle;
extern struct Game FAR *gameData;
extern int16 groundUnitCount;
extern uint8 gridBuf5[];
extern uint8 gridBuf4[];
extern int16 page1Ptr;
extern uint8 gridBuf3[];
extern struct NearestTerrain *nearestTerrainResult;
extern uint8 gridBuf2[];
extern struct TerrainTile terrainTileBlock[];
extern uint8 wldReadBuf1[];
extern uint8 gridBuf1[];
extern char scenarioFoundArr[];
extern struct WorldObject worldObjects[];
extern char terrainGrid[256];
extern int16 FAR *needSplash;
extern struct Target targets[];
extern int16 playerStartLoc;
extern struct FlightUnit flightUnits[];
extern uint8 hercFlag;
extern uint32 baseXPrecise;
extern struct NearestTerrain nearestTerrain;
extern uint8 exitCode[];
extern char objectTypeTable[];
extern uint32 baseYPrecise;
extern int16 readItemSize;
extern uint8 wldReadBuf8[];
extern uint8 intRegs[];
extern uint8 wldReadBuf7[];
extern int16 missionDistAccum;
extern int16 selectedPilotIdx;
extern int16 flightUnitCount;
extern uint8 joyReady[];
extern char *wldOffsets[];
extern char wldReadBuf11[];
extern struct TerrainPtrTable terrainTilePtrs[];
extern struct TerrainTile *tileDataPtr;
extern uint16 worldObjectCount;
extern struct GameComm FAR *commData;
extern struct Pilot hallfameBuf[];
extern uint16 menuSprites;

#endif /* F15_SE2_STDATA */
