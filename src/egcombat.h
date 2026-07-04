#ifndef F15_SE2_EGCOMBAT
#define F15_SE2_EGCOMBAT
#include "inttype.h"
/* public interface of egcombat.c */

void fireAirThreat(int16 objIdx);
void spawnEnemyAircraft(int16 slot, int16 objType);
void updateThreatTargeting();
void destroyAircraft(int16 objIdx);
void destroyGroundTarget(int16 planeIdx);
void bombTarget(void);
void fireMissile();
void testWorldPosVisible(int16 worldX, int16 worldY, int16 worldZ);
int16 missileTargetCompat(int16 weaponType, int16 objIdx);
int16 isTargetOverWater(int16 wpIdx);

#endif /* F15_SE2_EGCOMBAT */
