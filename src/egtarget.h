#ifndef F15_SE2_EGTARGET
#define F15_SE2_EGTARGET
/* public interface of egtarget.c */

void updateTargetLock();
void drawHudWorldOverlay(void);
int16 findWaypointEntry(int16 mapX, int16 mapY);
int16 computeLoftAngle();
int16 getTargetSymbol(int16 wpIdx);

#endif /* F15_SE2_EGTARGET */
