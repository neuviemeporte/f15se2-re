#ifndef F15_SE2_EGTHREAT
#define F15_SE2_EGTHREAT
#include "inttype.h"
/* public interface of egthreat.c */

void updateThreatSites();
int16 computeThreatRangeBearing(int16 threatX, int16 threatY, int16 threatAlt, int16 threatType, int16 *outBearing, int16 *outRange);
void updateThreatAlert();
int16 computeThreatScore();
void updateObjects(void);
int16 rangeApprox(int16 dx, int16 dy);
int16 sinMul(int16 angle, int16 value);

#endif /* F15_SE2_EGTHREAT */
