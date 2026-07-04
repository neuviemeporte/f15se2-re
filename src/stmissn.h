#ifndef F15_SE2_STMISSN
#define F15_SE2_STMISSN
/* mission select/decode (stmissn.c) */
#include "inttype.h"

void clearKeybuf(void);
void waitMdaCgaStatus(int16 iter);
void showPic640(const char *filename);
void missionSelect(void);
int16 askRepeatMission(void);
void checkDiskA(void);
void missionDecode(void);
void printMission(void);
int16 pollMenuInput();

#endif /* F15_SE2_STMISSN */
