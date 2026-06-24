#ifndef F15_SE2_STCODE
#define F15_SE2_STCODE
/* assembly routines in stcode.asm called from C */
#include "inttype.h"
#include "pointers.h"
#include <dos.h>

int checkQuitFlag();
void picBlit(int handle, int unk);
void mystrcat(char *dst, const char *src);
void nearmemset(void *dst, char value, int count);
void dos_printstring(const char *str);
int loadOverlay(const char *filename);
void clearRect(int16 *buf, int x, int y, int maxx, int maxy);
void drawLineWrapper();
int writeFileAtRaw();
void decodePic(int handle, uint16 segment);
void doNothing2(const char *msg, int a, int b, int c);
void far pollJoystick();
void far copyJoystickData(uint8 FAR *ptr);

#endif /* F15_SE2_STCODE */
