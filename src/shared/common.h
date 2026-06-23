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
void drawStringAt(int16 *pageNum, const char *string, int x, int y);

/* text layout & number formatting - textfmt.c */
void drawStringCentered(int16 *page, const char *str, int startx, int y, int endx);
int stringWidth(int16 *page, const char *str);
void my_ltoa(int32 value, char *buf);
void my_itoa(int value, char *buf);

/* file/picture wrappers & strcpy - filepic.c */
int openFileWrapper(const char *filename, int mode);
void closeFileWrapper(int handle);
void mystrcpy(char *dest, const char *source);
void loadPic(const char *filename, uint16 segment);
#ifdef BUGFIX
void openShowPic(char *filename, int page);
void showPicFile(int handle, int pageNum);
#else
void openShowPic(char *filename, int page, int garbage);
void showPicFile(int handle, int pageNum, int garbage);
#endif

/* functions provided by file_io.c / file_*.inc */
int openFile(const char *filename, int mode);

/* functions provided by miscimpl.c / overlay_dispatch.inc */
void intDispatch(int intNum, uint8 *inRegs, uint8 *outRegs);
void restoreCbreakHandler(void);
void installCBreakHandler(void);
void setupOverlaySlots(uint16 param);
int getTimeOfDay(void);

/* functions provided by timer.c / timer_*.inc */
void setTimerIrqHandler(void);
void restoreTimerIrqHandler(void);

#endif /* COMMON_H */
