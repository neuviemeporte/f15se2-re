#ifndef F15_SE2_STCODE
#define F15_SE2_STCODE
/* assembly routines in stcode.asm called from C */
#include "inttype.h"
#include "pointers.h"
#include <dos.h>

int16 checkQuitFlag();
void picBlit(int16 handle, int16 unk);
void mystrcat(char *dst, const char *src);
void nearmemset(void *dst, char value, int16 count);
void dos_printstring(const char *str);
int16 loadOverlay(const char *filename);
void clearRect(int16 *buf, int16 x, int16 y, int16 maxx, int16 maxy);
void drawLineWrapper();
int16 writeFileAtRaw();
void decodePic(int16 handle, int16 segment);
void doNothing2(const char *msg, int16 a, int16 b, int16 c);
void FAR pollJoystick();
void FAR copyJoystickData(uint8 FAR *ptr);

#endif /* F15_SE2_STCODE */
