#ifndef F15_SE2_EGTARGET
#define F15_SE2_EGTARGET
/* public interface of egtarget.c */

void updateTargetLock();
void drawHudWorldOverlay(void);
int findWaypointEntry(int mapX, int mapY);
int computeLoftAngle();
int getTargetSymbol(int wpIdx);

#endif /* F15_SE2_EGTARGET */
