#ifndef F15_SE2_EGFILEIO
#define F15_SE2_EGFILEIO
/* public interface of egfileio.c */
#include "egtypes.h"

int __cdecl openFileWrapper(const char *path, int mode);
void closeFileWrapper(int handle);

#endif /* F15_SE2_EGFILEIO */
