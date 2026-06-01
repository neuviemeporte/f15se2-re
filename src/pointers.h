#ifndef POINTERS_H
#define POINTERS_H

#include "inttype.h"
#include "sassert.h"

#if defined(MSDOS) || defined(__MSDOS__) || defined(MSC_VER)
#define NEAR near
#define FAR far
#define CDECL cdecl
#else
#define NEAR
#define FAR
#define CDECL
#endif

#define MK_FP(a,off) ((void FAR *) (((unsigned long)(a) << 16) | (unsigned long)(off)))
#define MAKEFAR(type, seg, off) ((type FAR *)MK_FP(seg, off))

#endif /* POINTERS_H */
