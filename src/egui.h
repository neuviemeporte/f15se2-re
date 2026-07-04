#ifndef F15_SE2_EGUI
#define F15_SE2_EGUI
#include "inttype.h"
/* public interface of egui.c */

void drawTacticalMap(char page);
void blitSprite(int16 destX, int16 destY, int16 srcX, int16 srcY, int16 spriteWidth, int16 spriteHeight, int16 transparent);
void cacheScopePanel();
void restoreScopePanel();
void captureScopePanel();

#endif /* F15_SE2_EGUI */
