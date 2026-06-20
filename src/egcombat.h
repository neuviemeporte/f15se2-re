#ifndef F15_SE2_EGCOMBAT
#define F15_SE2_EGCOMBAT
/* public interface of egcombat.c */

void fireAirThreat(int objIdx);
void spawnEnemyAircraft(int slot, int objType);
void updateThreatTargeting();
void destroyAircraft(int objIdx);
void destroyGroundTarget(int planeIdx);
void bombTarget(void);
void fireMissile();
void testWorldPosVisible(int worldX, int worldY, int worldZ);
int missileTargetCompat(int weaponType, int objIdx);
int isTargetOverWater(int wpIdx);

#endif /* F15_SE2_EGCOMBAT */
