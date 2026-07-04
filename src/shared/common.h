/*
 * common.h - Declarations for functions shared between start.exe and end.exe
 */
#ifndef COMMON_H
#define COMMON_H

#include "../inttype.h"
#include "../const.h"

/* program teardown - cleanup.c */
void cleanup(void);

/* string drawing - drawstr.c */
void drawStringAt(int16 *pageNum, const char *string, int16 x, int16 y);

/* text layout & number formatting - textfmt.c */
void drawStringCentered(int16 *page, const char *str, int16 startx, int16 y, int16 endx);
int16 stringWidth(int16 *page, const char *str);
void my_ltoa(int32 value, char *buf);
void my_itoa(int16 value, char *buf);

/* file/picture wrappers & strcpy - filepic.c */
int16 openFileWrapper(const char *filename, int16 mode);
void closeFileWrapper(int16 handle);
void mystrcpy(char *dest, const char *source);
void loadPic(const char *filename, uint16 segment);
#ifdef BUGFIX
void openShowPic(const char *filename, int16 page);
void showPicFile(int16 handle, int16 pageNum);
#else
void openShowPic(const char *filename, int16 page, int16 garbage);
void showPicFile(int16 handle, int16 pageNum, int16 garbage);
#endif

/* functions provided by file_io.c / file_*.inc */
int16 openFile(const char *filename, int16 mode);

/* functions provided by miscimpl.c / overlay_dispatch.inc */
void intDispatch(int16 intNum, uint8 *inRegs, uint8 *outRegs);
void restoreCbreakHandler(void);
void installCBreakHandler(void);
void setupOverlaySlots(uint16 param);
int16 getTimeOfDay(void);

/* functions provided by timer.c / timer_*.inc */
void setTimerIrqHandler(void);
void restoreTimerIrqHandler(void);

#endif /* COMMON_H */
