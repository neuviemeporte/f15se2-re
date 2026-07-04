#ifndef F15_SE2_ENBRIEF
#define F15_SE2_ENBRIEF
#include "inttype.h"
#include "endtypes.h"
/* debrief briefing/scoring/menu (enbrief.c) */

void animateFlightPath(int16 *gfxPage);
int32 calcMissionScore(int16 param);
void processMenuItems(MenuItem *items, int16 unused, int16 itemCount, int16 cursorStartX, int16 cursorStartY, int16 *gfxPage);
int16 selectMenuItem(MenuItem *items, int16 unused, int16 itemCount, int16 *inputState, int16 *gfxPage);
void computeMissionResult(void);

#endif /* F15_SE2_ENBRIEF */
