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
void routine_146(char *dst, char *src, int count);
void routine_140(int src_seg, int src_off, int dst_seg, int dst_off, int count);
int routine_69(void);
void routine_70(int param_1);
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
extern char timerHandlerInstalled;
extern char var_81;
extern char var_194;
extern char var_195;
extern char var_196;
extern char var_197;
extern int var_208;
extern int var_209;
extern int var_211;
extern int var_213;
extern char var_214;
extern int var_219;
extern int var_220;
extern int var_227;
extern int var_228;
extern char dat_4824[];
extern int var_185[];
extern int var_186[];
extern int var_187[];
extern int var_188[];
extern int var_24;
extern char str_inFlight[];
extern char str_timeLabel[];
extern char str_timeZeros[];
extern char str_timeFormat[];
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
extern int var_169;
extern char var_170;
extern int var_171;
extern int var_172;
extern char var_173;
extern char var_174;
extern char var_175;
extern char var_82;
extern char var_83;
extern char var_202;
extern int dat_1c8e[];
extern int *dat_20E2;
extern int *dat_2122;
extern int *dat_2162;
extern int *dat_21E2;
extern void far routine_134(void);
void routine_98(int *param_1, int *param_2, int param_3);

/* FlightRecord: 6 bytes per record */
typedef struct {
    char cx;
    char cy;
    char status;
    char pad;
    char unk4;
    char unk5;
} FlightRecord;

extern FlightRecord flightRecords[];
extern int var_190;
extern char var_183[];  /* slot info table, 16 bytes per slot */
extern char var_207;
extern int var_97[];
extern int var_98[];

/* Sprite struct pointers (first word of each sprite descriptor) */
extern int *dat_20C2;
extern int *dat_2102;
extern int *dat_2142;
extern int *dat_21C2;

extern int far gfx_jump_11_blitSprite(int spritePtr);

/* Reconstructed C functions */
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
int routine_135(int param_1);
void routine_157(int x, int y, int color);
void routine_113(int handle);
int routine_97(unsigned int *p);
void routine_95(int *param_1, int param_2);
unsigned int routine_132(int param_1, unsigned int param_2);
void routine_131(void);
void routine_105(int p1, int p2, int p3, int p4);
void routine_65(int param_1);
void routine_130(int *page, char *str, unsigned int maxWidth, int x, int y, int lineHeight);
void clearRect(int *page, int y1, int x1, int x2, int y2);
void mystrcat(char *dst, char *src);
char *routine_106(int timeValue, char *buffer);
extern void far gfx_jump_21(int param);
extern void far gfx_jump_29_switchColor(int page, int x1, int y1, int x2, int y2, int fromColor, int toColor);
extern void far gfx_jump_2a(int p1, int p2, int p3, int p4, int p5, int p6, int p7, int p8);
long routine_63(int param);
void routine_66(void);
void routine_26(void);
void routine_5(void);
void routine_6(void);
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
void routine_71(int param_1, int param_2);
void routine_108(int param_1, int param_2, int param_3, int param_4);
void routine_109(int param_1, int param_2, int param_3, int param_4);
extern int var_206;
extern char *var_217[];
extern char var_218[];
extern int var_177;
int FUN_1000_4c20(int handle, int off, int whence, int mode);
void FUN_1000_15d2(char *name, int segment);
void FUN_1000_1626(char *name, int segment, int off, int whence);

/* Variables used by routine_63 */
extern int var_221;
extern int var_215;
extern int var_225;
extern int var_224;
extern int var_200;
extern int var_182;
extern int var_199;
extern int var_181;
extern char var_204[];
extern char var_184[];
extern char var_23[];

/* Variables used by main */
extern int far *var_178;
extern char var_191;
extern char var_56;
extern char var_55;
extern int var_189;
extern int var_226;
extern int var_230;
extern int var_232;
extern int var_231;
extern int var_229;
extern int var_201;

/* ASM functions called by main */
void routine_14(int param);
void routine_16(void);
void routine_18(void);
void routine_20(void);
void routine_41(void);
void routine_42(void);
void routine_24(void);
void routine_25(void);
void routine_27(void);
void installCBreakHandler(void);
extern void far copyJoystickData(char far *data);
extern int far gfx_jump_31(void);
extern int far gfx_jump_17_bufSize(void);

#endif // F15_SE2_END
