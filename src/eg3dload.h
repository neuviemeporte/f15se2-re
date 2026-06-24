#ifndef F15_SE2_EG3DLOAD
#define F15_SE2_EG3DLOAD
/* public interface of eg3dload.c */
#include "egtypes.h"

void load3DAll();
void __cdecl printError(const char *);
void __cdecl strcpyFromDot(char *dst, const char *src);

#endif /* F15_SE2_EG3DLOAD */
