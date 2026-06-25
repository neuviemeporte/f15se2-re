#ifndef F15_SE2_ENDCODE
#define F15_SE2_ENDCODE
/* assembly routines in endcode.asm called from C */
#include "inttype.h"
#include <dos.h>

void decodePic(int handle, int segment);
uint16 dos_alloc(int size);
void dos_printstring(const char *str);
int createFile(const char *name, int mode);
int readFileAt(int handle, int a, int b, int c);
int writeFile(int handle, int a, int b, int c, int d);
extern void far pollJoystick(void);
void drawLineWrapper(void);
void clearRect(int16 *page, int y1, int x1, int x2, int y2);
void mystrcat(char *dst, const char *src);
void decodePicRaw(int handle, uint16 segment);
extern void far copyJoystickData(uint8 far *data);

#endif /* F15_SE2_ENDCODE */
