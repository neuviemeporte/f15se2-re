#ifndef F15_SE2_END
#define F15_SE2_END
#include "inttype.h"
#include "struct.h"
#include "comm.h"

#include <stdio.h>

#if !defined(MSDOS) && !defined(__MSDOS__)
#define far
#endif

#define __int32 long
#define __int8 char
#define __cdecl
#define __far far

void routine_91(int param_1);
void mystrcpy(char *dst, char *src);
void actualDrawString(int *pageNum, const char *string, int x, int y);
int stringWidth(int *page, const char *str);
void drawString(int *page, const char *str, int startx, int y, int endx);
extern void far gfx_jump_05_drawString(int *pageNum, const char *string);
extern int far gfx_jump_2f_charWidth(int ch, int font);

#endif // F15_SE2_END
