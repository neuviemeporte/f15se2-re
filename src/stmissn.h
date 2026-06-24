#ifndef F15_SE2_STMISSN
#define F15_SE2_STMISSN
/* mission select/decode (stmissn.c) */
#include "inttype.h"

void clearKeybuf(void);
void waitMdaCgaStatus(int16);
void showPic640(const char *filename);
void missionSelect(void);
int askRepeatMission(void);
void checkDiskA(void);
void missionDecode(void);
void printMission(void);
int pollMenuInput();

#endif /* F15_SE2_STMISSN */
