#ifndef F15_SE2_STGEN
#define F15_SE2_STGEN
/* mission generator (stgen.c) */
#include "inttype.h"

int16 mystrlen(const char *str);
void missionGenerate(void);
void exportWorldToComm(const char *filename);
char *getItemCoordStr(int16);
void buildTargetLabel(int16 idx);

#endif /* F15_SE2_STGEN */
