#ifndef STDLIB16_STUBS_H
#define STDLIB16_STUBS_H

#include "platform.h"

// copied signatures from msc510/INCLUDE files
// TODO: dummy inline implementations for all

typedef unsigned char uint8_t;
typedef unsigned short uint16_t;
typedef unsigned int uint32_t;
typedef uint32_t uint32;

typedef signed char int8_t;
typedef signed short int16_t;
typedef signed int int32_t;

#if !defined(NULL)
#define NULL (0)
#endif

#define _CDECL
#define far
#define FAR
#define pascal

#define FP_SEG(fp) (*((unsigned *)&(fp) + 1))
#define FP_OFF(fp) (*((unsigned *)&(fp)))

long time(int) { return 0; }

inline uint16_t _psp;

struct FILE {
    char* _ptr;
    int _cnt;
    char* _base;
    char _flag;
    char _file;
};

inline int fprintf(FILE*, const char*, ...) { return 0; }
inline int printf(const char*, ...) { return 0; }

inline size_t fread(void*, size_t, size_t, FILE*) { return 0; }
inline int _CDECL fclose(FILE*) { return 0; }
inline FILE* _CDECL fopen(const char*, const char*) { return 0; }
inline FILE* stderr;

inline int _CDECL abs(int) { return 0; }
inline int _CDECL getch(void) { return 0; }
inline void _CDECL exit(int) {};

#define _IOMYBUF 0x08
#define _IOEOF 0x10
#define _IOERR 0x20
#define _IOSTRG 0x40
#define _IORW 0x80

#define feof(f) ((f)->_flag & _IOEOF)
#define ferror(f) ((f)->_flag & _IOERR)

inline int _CDECL fflush(FILE*) { return 0; }
inline size_t _CDECL fwrite(const void*, size_t, size_t, FILE*) { return 0; }
inline int _CDECL inp(unsigned int) { return 0; }
inline int _CDECL outp(unsigned int, int) { return 0; }
inline int _CDECL putch(int) { return 0; }
inline int _CDECL rand(void) { return 0; }
inline void _CDECL setbuf(FILE*, char*) { return; }
inline int _CDECL sprintf(char*, const char*, ...) { return 0; };
typedef char* va_list;
inline void va_start(va_list ap, ...) { return; };
inline void va_end(va_list ap) { return; }
inline int _CDECL vprintf(const char*, va_list) { return 0; }
inline int _CDECL vfprintf(FILE*, const char*, va_list) { return 0; }
inline int _CDECL vsprintf(char*, const char*, va_list) { return 0; }
inline void _CDECL srand(unsigned int) { return; }
inline char* _CDECL strcat(char*, const char*) { return 0; }
inline char* _CDECL strchr(const char*, int) { return 0; }
inline int _CDECL strcmp(const char*, const char*) { return 0; }
inline char* _CDECL strcpy(char*, const char*) { return 0; }
inline size_t _CDECL strlen(const char*) { return 0; }
inline char* _CDECL strncpy(char*, const char*, size_t) { return 0; }
inline char* _CDECL strupr(char*) { return 0; }
inline void* _CDECL memcpy(void*, const void*, size_t) { return 0; }
inline void* _CDECL memset(void*, int, size_t) { return 0; }
inline void _CDECL movedata(unsigned int, unsigned int, unsigned int, unsigned int, unsigned int) { return; }
inline void abort(void) { return; }
inline char* itoa(int value, char* str, int base) { return 0; }
inline int _bios_keybrd(int cmd) { return 0; }
inline int _CDECL kbhit(void) { return 0; }

struct WORDREGS {
    unsigned short ax;
    unsigned short bx;
    unsigned short cx;
    unsigned short dx;
    unsigned short si;
    unsigned short di;
    unsigned short cflag;
};

/* byte registers */

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

inline int _CDECL intdos(union REGS*, union REGS*) { return 0; }
inline int _CDECL intdosx(union REGS*, union REGS*, struct SREGS*) { return 0; }
inline int _CDECL int86(int, union REGS*, union REGS*) { return 0; }
inline int _CDECL int86x(int, union REGS*, union REGS*, struct SREGS*) { return 0; }
inline void _CDECL segread(struct SREGS*) { return; }

inline int fputs(const char* str, FILE* stream) { return 0; }

inline void _CDECL _chain_intr(void (_CDECL interrupt far*)()) { return; };
inline void (_CDECL interrupt far* _CDECL _dos_getvect(unsigned))() { return 0; };
inline void _CDECL _dos_setvect(unsigned, void (_CDECL interrupt far*)()) { return; };

#endif // STDLIB16_STUBS
