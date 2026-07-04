#ifndef F15_SE2_EGTACMAP
#define F15_SE2_EGTACMAP
#include "inttype.h"
#include "egtypes.h"
/* public interface of egtacmap.c */

void clearStatusPanel();
void setActivePanel(int16);
void refreshActivePanel(int16 panelId);
void initTacMapView(void);
void redrawTacMap(int16, int16);
void zoomIn(void);
void zoomOut(void);
int16 plotMapObject(int16 mapX, int16 mapY, int16 color, int16 big);
int16 readMapPixelColor(int16 mapX, int16 mapY);
void drawMapRangeArc(int16, int16, int16, int16, int16, int16, int16);
void drawFullscreenLine(int16 x1, int16 y1, int16 x2, int16 y2);
void drawViewportLine(int16 x1, int16 y1, int16 x2, int16 y2);
void drawClippedLineRegion(int16 x1, int16 y1, int16 x2, int16 y2, int16 clipLeft, int16 clipRight, int16 clipTop, int16 clipBottom, int16 drawBothPages);
void drawScreenLineOnePage(int16 x1, int16 y1, int16 x2, int16 y2);
void drawHudViewLine(int16, int16, int16, int16);
void setDrawColor(int16);
void fillRectBoth(int16 x1, int16 y1, int16 x2, int16 y2);
void switchIndicatorColor(int16 indicatorIdx, int16 color);
void fillPanelBox(int16, int16);
void drawStringBothPages(const char *, int16, int16, int16);
void drawStringActivePage(const char *, int16, int16, int16);
void drawNumber(int16, int16, int16, int16);
void tempStrcpy(const char *src);
void setTimedMessage(char *message);

#endif /* F15_SE2_EGTACMAP */
