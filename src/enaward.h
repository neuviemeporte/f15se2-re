#ifndef F15_SE2_ENAWARD
#define F15_SE2_ENAWARD
/* awards screen + buffer alloc (enaward.c) */
#include "inttype.h"

uint16 allocBuffer(int size);
void freeBuffer(uint16 segment);
void showPostMissionAwards(void);

#endif /* F15_SE2_ENAWARD */
