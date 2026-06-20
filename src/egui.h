#ifndef F15_SE2_EGUI
#define F15_SE2_EGUI
/* public interface of egui.c */

void drawTacticalMap(char page);
void blitSprite(int destX, int destY, int srcX, int srcY, int spriteWidth, int spriteHeight, int transparent);
void cacheScopePanel();
void restoreScopePanel();
void captureScopePanel();

#endif /* F15_SE2_EGUI */
