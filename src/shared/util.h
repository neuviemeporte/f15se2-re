/*
 * util.h - Declarations for functions shared between start.exe and end.exe
 */
#ifndef UTIL_H
#define UTIL_H

#include "inttype.h"
#include "const.h"

/* functions provided by util.c */
int cleanup(void);
void drawStringAt(int16 *pageNum, const char *string, int x, int y);
void drawStringCentered(int16 *page, const char *str, int startx, int y, int endx);
int stringWidth(int16 *page, const char *str);
int my_ltoa(int32 value, char *buf);
int my_itoa(int value, char *buf);

/* functions provided by util2.c */
int openFileWrapper(char *filename, int mode);
void mystrcpy(char *dest, const char *source);

#endif /* UTIL_H */
