#ifndef OFFSETS_H
#define OFFSETS_H

#define SIZE_PARAGRAPH 16
#define PARA_TO_BYTES(para) ((uint32)(para) * SIZE_PARAGRAPH)
#define FARPTR_WORDSZ 2

#define SEG_LOWMEM 0
#define OFF_BDA_KEYFLAGS 0x417
#define OFF_IACA_START 0x4f0
#define OFF_IACA_NEEDSPLASH 0x4f2 
/* set to 0 in f15.com, DS.EXE checks it at some point, if COMM monochrome flag
   is 1, sets also to 1, not interesting b/c it's in the part that's executed
   only if a game exe file does not exist
*/
#define OFF_IACA_FLAG2 0x4f4 
// egame uses it as arg to audio func 64
#define OFF_IACA_UNK 0x4fe

#define SEG_BDA 0x40
#define OFF_BDA_FLOPPYMOTOR 0x440
#define OFF_BDA_EGASWITCH 0x88


#define OFF_STACK_JOYDATA 0xcde

#define ROSTER_SCORE_LO 0x16
#define ROSTER_SCORE_HI 0x18

#endif /* OFFSETS_H */
