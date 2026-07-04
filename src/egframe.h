#ifndef F15_SE2_EGFRAME
#define F15_SE2_EGFRAME
/* public interface of egframe.c */
#include "inttype.h"

void countermeasures(int16 eventType);
void resetSimObjectLocks();
void initWeaponLoadout(void);
void drawWeaponAmmo();
void drawWeaponSelectMarker(int16 weaponIdx);
void finalizeMission(int16 outcome);
void scheduleEventCheck(int16 eventObjIdx, uint16 priority);
void scheduleTimedEvent(int16 keyVal, int16 delay);
void appendMapEvent(int16 eventType, int16 eventArg);
void placeString(int16 waypointIdx);
void initMissionStrings();
void moveDataFar();
int16 objectToScreen(int16 mapX, int16 mapY, int16 *outScreenX, int16 *outScreenY);
int16 randomRange(int16);

#endif /* F15_SE2_EGFRAME */
