#ifndef POINTERS_H
#define POINTERS_H

#include "inttype.h"
#include "platform.h"
#include "sassert.h"

#if defined(MSDOS)
#define NEAR near
#define FAR far
#define CDECL cdecl

#define offsetof(st, m) ((size_t)&(((st*)0)->m))
#else
#define NEAR
#define FAR
#define CDECL
#endif

#define MK_FP(a,off) ((void FAR *) (((unsigned long)(a) << 16) | (unsigned long)(off)))
#define MAKEFAR(type, seg, off) ((type FAR *)MK_FP(seg, off))

#endif /* POINTERS_H */
