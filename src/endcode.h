#ifndef F15_SE2_ENDCODE
#define F15_SE2_ENDCODE
#include "inttype.h"
#include <dos.h>
/* assembly routines in endcode.asm called from C */

void decodePic(int16 handle, int16 segment);
uint16 dos_alloc(int16 size);
void dos_printstring(const char *str);
int16 createFile(const char *name, int16 mode);
int16 readFileAt(int16 handle, int16 a, int16 b, int16 c);
int16 writeFile(int16 handle, int16 a, int16 b, int16 c, int16 d);
extern void FAR pollJoystick(void);
void drawLineWrapper(void);
void clearRect(int16 *page, int16 y1, int16 x1, int16 x2, int16 y2);
void mystrcat(char *dst, const char *src);
void decodePicRaw(int16 handle, uint16 segment);
extern void FAR copyJoystickData(uint8 FAR *data);

#endif /* F15_SE2_ENDCODE */
