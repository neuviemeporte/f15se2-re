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

#if !defined(__TURBOC__) && !defined(MK_FP)
#define MK_FP(a,off) ((void FAR *) (((unsigned long)(a) << 16) | (unsigned long)(off)))
#endif

#if !defined(offsetof)
#define offsetof(st, m) ((size_t)&(((st*)0)->m))
#endif

#ifdef HAVE_PRAGMA
#pragma pack(1)
#endif
union FarAddress {
    struct { uint16 off, seg; } data;
    uint8 FAR *ptr;
};
#ifdef HAVE_PRAGMA
#pragma pack()
#endif
#if defined(__clang__) || defined(_MSC_VER) && (_MSC_VER > 510) 
STATIC_ASSERT(sizeof(union FarAddress)==8);
#else
STATIC_ASSERT(sizeof(union FarAddress)==4);
#endif

#define MAKEFAR(type, seg, off) ((type FAR *)MK_FP(seg, off))

#endif /* POINTERS_H */
