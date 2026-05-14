#ifndef F15_SE2_END
#define F15_SE2_END
#include "inttype.h"
#include "struct.h"
#include "comm.h"

#include <stdio.h>
#include <dos.h>

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

/* ASM functions called from C */
void restoreTimerIrqHandler(void);
void setTimerIrqHandler(void);
void intDispatch(int intNum, char *inRegs, char *outRegs);
extern void far misc_jump_5e_clearKeyFlags(void);
extern int far misc_jump_5a_keybuf(void);
extern int far misc_jump_5b_getkey(void);
extern int far misc_jump_5d_readJoy(int param);
void routine_28(void);
void routine_140(int src_seg, int src_off, int dst_seg, int dst_off, int count);
int routine_69(void);
void routine_70(int param_1);
int openFileWrapper(char *name, int mode);
void decodePic(int handle, int segment);
void showPicFile(int handle, int page, int garbage);
int dos_alloc(int size);
void dos_printstring(char *str);
void routine_8(int code);
int routine_102(int segment);
int openFile(char *name, int mode);
int FUN_1000_1405(char *name, int mode);
int FUN_1000_147e(int handle, int buf, int size);
int FUN_1000_14a9(int handle, int a, int b, int c);
int FUN_1000_1539(int handle, int a, int b, int c, int d);

/* Extern variables from ASM */
extern char var_69;       /* timerHandlerInstalled */
extern char var_81;
extern char str_allocError[];
extern char str_deallocError[];
extern int var_138;
extern int var_139;
extern int var_93;
extern int var_94;
extern int var_95;
extern int var_96;
extern unsigned int var_210;
extern unsigned int var_212;
extern int far *var_222;
extern char var_57;

/* Reconstructed C functions */
void cleanup(void);
void routine_34(void);
void loadPic(char *filename, int segment);
void openShowPic(char *name, int page, int garbage);
int allocBuffer(int size);
void routine_64(int segment);
void routine_70(int param_1);
int routine_136(unsigned char param_1);
int routine_137(unsigned char param_1);
void routine_138(int x1, int y1, int x2, int y2, int cx1, int cy1, int cx2, int cy2, int flag);
void routine_160(int x1, int y1, int x2, int y2);
void routine_157(int x, int y, int color);
void routine_113(int handle);
int routine_97(unsigned int *p);
void routine_105(int p1, int p2, int p3, int p4);
void routine_66(void);
void routine_85(int *p);
void routine_147(int x, int y, int color);
void FUN_1000_0990(unsigned int ticks);
void FUN_1000_041a(int *s, char far *str, int x, int y);
void FUN_1000_0469(int *s, char far *str);
void FUN_1000_0a74(char *dst, char far *src);
int FUN_1000_1348(char *name, int mode);
int FUN_1000_1368(int handle, int buf, int size);
int FUN_1000_137c(int handle, int a, int b, int c);
int FUN_1000_1394(int handle, int a, int b, int c, int d);
int FUN_1000_12c6(char *name, int b, int c);
int FUN_1000_12fe(char *name, int b, int c, int d, int e);
void FUN_1000_09e4(int port, int value);
void FUN_1000_16d6(int handle, int segment);
int FUN_1000_4c20(int handle, int off, int whence, int mode);
void FUN_1000_15d2(char *name, int segment);
void FUN_1000_1626(char *name, int segment, int off, int whence);

#endif // F15_SE2_END
