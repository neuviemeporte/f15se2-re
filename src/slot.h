#ifndef SLOT_H
#define SLOT_H

#include "pointers.h"
#include "inttype.h"

/* ---- graphics (first slot 0, 84 used) ---- */
/* dseg:0xab8 */
int FAR CDECL gfx_jump_0_alloc(int);
int FAR CDECL gfx_jump_01();
int FAR CDECL gfx_jump_02();
int FAR CDECL gfx_jump_03();
int FAR CDECL gfx_jump_04();
int FAR CDECL gfx_jump_05_drawString();
int FAR CDECL gfx_jump_06();
int FAR CDECL gfx_jump_07();
int FAR CDECL gfx_jump_08();
int FAR CDECL gfx_jump_09();
int FAR CDECL gfx_jump_0a();
int FAR CDECL gfx_jump_0b();
int FAR CDECL gfx_jump_0c();
int FAR CDECL gfx_jump_0d_setCurBuf();
/* dseg:0xafe */
int FAR CDECL gfx_jump_0e_setCurBuf(uint16);
int FAR CDECL gfx_jump_0f_getBufPtr();
int FAR CDECL gfx_jump_10_getCurBuf();
int FAR CDECL gfx_jump_11();
int FAR CDECL gfx_jump_12();
int FAR CDECL gfx_jump_13();
int FAR CDECL gfx_jump_14();
int FAR CDECL gfx_jump_15();
int FAR CDECL gfx_jump_16();
int FAR CDECL gfx_jump_17_bufSize();
int FAR CDECL gfx_jump_18();
int FAR CDECL gfx_jump_19();
int FAR CDECL gfx_jump_1a();
int FAR CDECL gfx_jump_1b();
int FAR CDECL gfx_jump_1c();
int FAR CDECL gfx_jump_1d();
int FAR CDECL gfx_jump_1e();
int FAR CDECL gfx_jump_1f();
int FAR CDECL gfx_jump_20();
int FAR CDECL gfx_jump_21();
int FAR CDECL gfx_jump_22();
int FAR CDECL gfx_jump_23();
int FAR CDECL gfx_jump_24();
int FAR CDECL gfx_jump_25();
int FAR CDECL gfx_jump_26();
int FAR CDECL gfx_jump_27();
int FAR CDECL gfx_jump_28();
int FAR CDECL gfx_jump_29_switchColor();
int FAR CDECL gfx_jump_2a();
int FAR CDECL gfx_jump_2b();
int FAR CDECL gfx_jump_2c();
int FAR CDECL gfx_jump_2d();
int FAR CDECL gfx_jump_2e();
int FAR CDECL gfx_jump_2f_charWidth(uint16, uint16);
int FAR CDECL gfx_jump_30_blitToCurrent();
int FAR CDECL gfx_jump_31();
int FAR CDECL gfx_jump_32();
int FAR CDECL gfx_jump_33_fillRow();
int FAR CDECL gfx_jump_34_fillRow();
int FAR CDECL gfx_jump_35();
int FAR CDECL gfx_jump_36_null();
int FAR CDECL gfx_jump_37_null();
int FAR CDECL gfx_jump_38_getPageBuf();
int FAR CDECL gfx_jump_39();
int FAR CDECL gfx_jump_3a_getRowOffset();
int FAR CDECL gfx_jump_3b_clearBuf();
/* dseg:0xbe4 */
int FAR CDECL gfx_jump_3c_setMode13();
int FAR CDECL gfx_jump_3d_null(int);
int FAR CDECL gfx_jump_3e();
/* dseg:0xbf3 */
int FAR CDECL gfx_jump_3f_modecode();
int FAR CDECL gfx_jump_40();
int FAR CDECL gfx_jump_41();
int FAR CDECL gfx_jump_42();
int FAR CDECL gfx_jump_43();
int FAR CDECL gfx_jump_44_setDac(uint16);
int FAR CDECL gfx_jump_45_retrace();
int FAR CDECL gfx_jump_46_retrace2();
int FAR CDECL gfx_jump_47();
int FAR CDECL gfx_jump_48();
int FAR CDECL gfx_jump_49();
int FAR CDECL gfx_jump_4a();
/* dseg:0xc2f */
int FAR CDECL gfx_jump_4b_storeBufPtr(uint16, int);
int FAR CDECL gfx_jump_4c();
int FAR CDECL gfx_jump_4d();
int FAR CDECL gfx_jump_4e_getVal();
int FAR CDECL gfx_jump_4f();
int FAR CDECL gfx_jump_50_null();
int FAR CDECL gfx_jump_51_null();
int FAR CDECL gfx_jump_52(uint16);
int FAR CDECL gfx_jump_53();
int FAR CDECL gfx_jump_54();
int FAR CDECL gfx_jump_55();
int FAR CDECL gfx_jump_56();
int FAR CDECL gfx_jump_57();
int FAR CDECL gfx_jump_58();
int FAR CDECL gfx_jump_59();
/* misc (first slot 0x5a, 6 used) */
int FAR CDECL misc_jump_5a_keybuf(); /* returns 0xffff if no character, 0 if have character */
int FAR CDECL misc_jump_5b_getkey();
int FAR CDECL misc_jump_5c();
int FAR CDECL misc_jump_5d_readJoy();
int FAR CDECL misc_jump_5e_clearKeyFlags();
int FAR CDECL misc_jump_5f();
int FAR CDECL misc_jump_60();
int FAR CDECL misc_jump_61();
int FAR CDECL misc_jump_62();
int FAR CDECL misc_jump_63();
/* sound (first slot 0x64, 10 used) */
int FAR CDECL audio_jump_64(int16, int16);
int FAR CDECL audio_jump_65(void);
int FAR CDECL audio_jump_66();
int FAR CDECL audio_jump_67(); /* intro music? */
int FAR CDECL audio_jump_68();
int FAR CDECL audio_jump_69();
int FAR CDECL audio_jump_6a();
int FAR CDECL audio_jump_6b();
int FAR CDECL audio_jump_6c();
int FAR CDECL audio_jump_6d();

#endif /* SLOT_H */
