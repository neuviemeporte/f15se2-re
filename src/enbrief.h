#ifndef F15_SE2_ENBRIEF
#define F15_SE2_ENBRIEF
/* debrief briefing/scoring/menu (enbrief.c) */
#include "inttype.h"
#include "endtypes.h"

void animateFlightPath(int16 *gfxPage);
long calcMissionScore(int param);
void processMenuItems(MenuItem *items, int unused, int itemCount, int cursorStartX, int cursorStartY, int16 *gfxPage);
int selectMenuItem(MenuItem *items, int unused, int itemCount, int16 *inputState, int16 *gfxPage);
void computeMissionResult(void);

#endif /* F15_SE2_ENBRIEF */
