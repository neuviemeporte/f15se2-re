#ifndef F15_SE2_EGFRAME
#define F15_SE2_EGFRAME
/* public interface of egframe.c */
#include "inttype.h"

void countermeasures(int eventType);
void resetSimObjectLocks();
void initWeaponLoadout(void);
void drawWeaponAmmo();
void drawWeaponSelectMarker(int weaponIdx);
void finalizeMission(int outcome);
void scheduleEventCheck(int eventObjIdx, unsigned int priority);
void scheduleTimedEvent(int keyVal, int delay);
void appendMapEvent(int eventType, int eventArg);
void placeString(int waypointIdx);
void initMissionStrings();
void moveDataFar();
int objectToScreen(int mapX, int mapY, int16 *outScreenX, int16 *outScreenY);
int randomRange(int);

#endif /* F15_SE2_EGFRAME */
