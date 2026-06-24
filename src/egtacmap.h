#ifndef F15_SE2_EGTACMAP
#define F15_SE2_EGTACMAP
/* public interface of egtacmap.c */
#include "egtypes.h"

void clearStatusPanel();
void __cdecl setActivePanel(int);
void refreshActivePanel(int panelId);
void initTacMapView(void);
void redrawTacMap(int, int);
void zoomIn(void);
void zoomOut(void);
int plotMapObject(int mapX, int mapY, int color, int big);
int readMapPixelColor(int mapX, int mapY);
void __cdecl drawMapRangeArc(int, int, int, int, int, int, int);
void drawFullscreenLine(int x1, int y1, int x2, int y2);
void drawViewportLine(int x1, int y1, int x2, int y2);
void drawClippedLineRegion(int x1, int y1, int x2, int y2, int clipLeft, int clipRight, int clipTop, int clipBottom, int drawBothPages);
void drawScreenLineOnePage(int x1, int y1, int x2, int y2);
void __cdecl drawHudViewLine(int, int, int, int);
void __cdecl setDrawColor(int);
void fillRectBoth(int x1, int y1, int x2, int y2);
void switchIndicatorColor(int indicatorIdx, int color);
void __cdecl fillPanelBox(int, int);
void __cdecl drawStringBothPages(const char *, int, int, int);
void drawStringActivePage(const char*, int, int, int);
void drawNumber(int, int, int, int);
void tempStrcpy(const char *src);
void setTimedMessage(char *message);

#endif /* F15_SE2_EGTACMAP */
