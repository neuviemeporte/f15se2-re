/*
 * ststub.c - start.exe-specific data variable stubs for NO_ASM build.
 * These provide variables that are still defined in start_rc.asm's data segment
 * for the normal build (overlay jump slots, offset-dependent tables, etc).
 */

#include "inttype.h"
#include "pointers.h"
#include "struct.h"

/* bufPtr and its target data block - uses segment-relative near pointer */
int16 *bufPtr = 0;

/* Plane table - initialized data in ASM */
uint16 planes[1];
