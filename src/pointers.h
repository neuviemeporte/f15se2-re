#ifndef POINTERS_H
#define POINTERS_H

#include "inttype.h"

#if defined(MSDOS) || defined(__MSDOS__) || defined(MSC_VER)
#define NEAR near
#define FAR far
#define CDECL cdecl
#else
#define NEAR
#define FAR
#define CDECL
#endif

#if !defined(__TURBOC__)
#define MK_FP(a,off) ((void FAR *) (((unsigned long)(a) << 16) | (unsigned long)(off)))
#endif

#define offsetof(st, m) ((size_t)&(((st*)0)->m))

#ifdef HAVE_PRAGMA
#pragma pack(1)
#endif
union FarAddress {
    struct { uint16 off, seg; } data;
    uint8 FAR *ptr;
};

#define FARPTR_CAST(type, addr) ((type FAR*)addr.ptr)
#define FARPTR_CAST_OFFSET(type, addr, offset) (type FAR*)(addr.ptr + offset)
#define VFARPTR_CAST_OFFSET(type, addr, offset) (volatile type FAR*)(addr.ptr + offset)

#define MAKEFAR(type, seg, off) ((type FAR *)MK_FP(seg, off))

/*
#define FARADDR_PTR(type, addr) (*((type FAR **)&addr))
#define FARADDR_PTR_OFF(type, addr, offset) (type FAR*)(*((uint8 FAR **)&addr) + offset)
#define VFARADDR_PTR(type, addr) (*((volatile type FAR **)&addr))
#define VFARADDR_PTR_OFF(type, addr, offset) (volatile type FAR*)(*((uint8 FAR **)&addr) + offset)
*/

#endif /* POINTERS_H */
