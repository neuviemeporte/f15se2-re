#pragma once
// Minimal dos.h stub for 64-bit native builds

#ifndef _DOS_H_COMPAT64
#define _DOS_H_COMPAT64

#define _CDECL
#define cdecl
#define far
#define FAR
#define near
#define pascal
#define interrupt
#define _interrupt
#define __interrupt
#define register

// FP_SEG/FP_OFF: In 64-bit builds, far pointers don't exist.
// Use reinterpret_cast to provide lvalue access to the high/low 16-bit words of a 32-bit-sized pointer slot.
// This won't produce meaningful addresses but allows the code to compile.
#define FP_SEG(fp) (((unsigned short *)&(fp))[1])
#define FP_OFF(fp) (((unsigned short *)&(fp))[0])

struct WORDREGS {
    unsigned short ax;
    unsigned short bx;
    unsigned short cx;
    unsigned short dx;
    unsigned short si;
    unsigned short di;
    unsigned short cflag;
};

struct BYTEREGS {
    unsigned char al, ah;
    unsigned char bl, bh;
    unsigned char cl, ch;
    unsigned char dl, dh;
};

union REGS {
    struct WORDREGS x;
    struct BYTEREGS h;
};

struct SREGS {
    unsigned short es;
    unsigned short cs;
    unsigned short ss;
    unsigned short ds;
};

inline int16 intdos(union REGS *inregs, union REGS *outregs) {
    (void)inregs;
    (void)outregs;
    return 0;
}
inline int16 intdosx(union REGS *inregs, union REGS *outregs, struct SREGS *segregs) {
    (void)inregs;
    (void)outregs;
    (void)segregs;
    return 0;
}
inline int16 int86(int16 intno, union REGS *inregs, union REGS *outregs) {
    (void)intno;
    (void)inregs;
    (void)outregs;
    return 0;
}
inline int16 int86x(int16 intno, union REGS *inregs, union REGS *outregs, struct SREGS *segregs) {
    (void)intno;
    (void)inregs;
    (void)outregs;
    (void)segregs;
    return 0;
}
inline void segread(struct SREGS *segregs) { (void)segregs; }
inline void movedata(uint16 srcseg, uint16 srcoff, uint16 dstseg, uint16 dstoff, uint16 nbytes) {
    (void)srcseg;
    (void)srcoff;
    (void)dstseg;
    (void)dstoff;
    (void)nbytes;
}

inline void _chain_intr(void (*handler)()) { (void)handler; }
typedef void (*_dos_isr_t)();
inline _dos_isr_t _dos_getvect(uint16no) {
    (void)intno;
    return 0;
}
inline void _dos_setvect(uint16no, _dos_isr_t handler) {
    (void)intno;
    (void)handler;
}

inline int16 inp(uint16 port) {
    (void)port;
    return 0;
}
inline int16 outp(uint16 port, int16 value) {
    (void)port;
    (void)value;
    return 0;
}

inline unsigned short _psp = 0;

// Non-standard C functions used by the codebase
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <stdio.h>
#if !defined(MSDOS) && !defined(_WIN32)
#include <unistd.h>
#else
#include <io.h>
#endif

inline int16 getch(void) { return 0; }
inline int16 putch(int16 c) {
    (void)c;
    return 0;
}
inline int16 kbhit(void) { return 0; }

inline char *itoa(int16 value, char *str, int16 base) {
    if (base == 10) {
        sprintf(str, "%d", value);
    } else if (base == 16) {
        sprintf(str, "%x", value);
    } else {
        str[0] = '\0';
    }
    return str;
}

inline char *strupr(char *s) {
    for (char *p = s; *p; p++) *p = toupper((unsigned char)*p);
    return s;
}

#endif // _DOS_H_COMPAT64
