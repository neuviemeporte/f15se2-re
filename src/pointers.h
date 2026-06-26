#ifndef POINTERS_H
#define POINTERS_H

#include "inttype.h"
#include "sassert.h"

#if defined(MSDOS)
#define NEAR near
#define FAR far
#define CDECL cdecl
#define HUGE huge
#define offsetof(st, m) ((size_t)&(((st *)0)->m))
#else
#define NEAR
#define FAR
#define CDECL
#define HUGE
#endif

#define MK_FP(a, off) ((void FAR *)(((unsigned long)(a) << 16) | (unsigned long)(off)))
#define MAKEFAR(type, seg, off) ((type FAR *)MK_FP(seg, off))

/* PTR_OFF(p): the 16-bit DOS offset of a (near) pointer, as needed to load a
 * register for an int86/intdos call, build a far pointer with MK_FP, or feed
 * movedata. On DOS this is just the pointer's offset word. On a 64-bit host it
 * is a deliberate truncation of the address: the value is meaningless there but
 * the host build (build64/clang) only needs these paths to compile, never to
 * run. Routing through uintptr_t off-DOS keeps the narrowing explicit and warning
 * free instead of a bare pointer->uint16 cast that loses precision. */
#if defined(MSDOS)
#define PTR_OFF(p) ((uint16)(p))
#else
#define PTR_OFF(p) ((uint16)(uintptr_t)(p))
#endif

#endif /* POINTERS_H */
