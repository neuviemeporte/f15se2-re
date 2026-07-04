#ifndef F15_SE2_EGFILEIO
#define F15_SE2_EGFILEIO
#include "inttype.h"
#include "egtypes.h"
/* public interface of egfileio.c */

int16 openFileWrapper(const char *filename, int16 mode);
void closeFileWrapper(int16 handle);

#endif /* F15_SE2_EGFILEIO */
