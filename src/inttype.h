#ifndef INTTYPE_H
#define INTTYPE_H

#define HAVE_PRAGMA

#if defined(MSC_VER) && MSC_VER < 5
#define const
#define volatile
#endif

#if defined(MSC_VER) && MSC_VER < 4
#undef HAVE_PRAGMA
#define cdecl
#define signed
#define register
#endif

/* 
 * Results from example code run:
 * 
 * long x;
 * int a;
 * short b;
 * char c;
 * void near *pn;
 * void far *pf;
 * printf("long = %d, int = %d, short = %d, char = %d, near = %d, far = %d, size = %d\n", sizeof(x), sizeof(a), sizeof(b), sizeof(c), sizeof(pn), sizeof(pf), sizeof(size_t));
 * 
 * long = 4, int =2, short = 2, char = 1, near = 2, far = 4, size = 2
 */
#if defined(MSDOS) || defined(__MSDOS__) || defined(MSC_VER)
typedef unsigned long uint32;
typedef unsigned int uint16;
typedef unsigned char uint8;

typedef signed long int32;
typedef signed int int16;
typedef signed char int8;

typedef int bool;
#define true 1
#define false 0
#else
#include <cstdint>
typedef uint32_t uint32;
typedef uint16_t uint16;
typedef uint8_t uint8;

typedef int32_t int32;
typedef int16_t int16;
typedef int8_t int8;
#endif

#endif /* INTTYPE_H */
