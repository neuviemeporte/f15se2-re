#ifndef F15_SE2_EGTHREAT
#define F15_SE2_EGTHREAT
/* public interface of egthreat.c */

void updateThreatSites();
int computeThreatRangeBearing(int threatX, int threatY, int threatAlt, int threatType, int *outBearing, int *outRange);
void updateThreatAlert();
int computeThreatScore();
void updateObjects(void);
int rangeApprox(int dx, int dy);
int sinMul(int angle, int value);

#endif /* F15_SE2_EGTHREAT */
