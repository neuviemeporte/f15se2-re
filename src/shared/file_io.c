/*
 * file_io.c - C implementations of shared file I/O routines for NO_ASM build.
 */

#include "inttype.h"
#include "pointers.h"
#include <dos.h>

/* file_alloc.inc: Allocate DOS memory. Callers pass BYTE count. */
uint16 dos_alloc(uint16 size) {
    union REGS r;
    r.h.ah = 0x48;
    /* Convert bytes to paragraphs (divide by 16, round up) */
    r.x.bx = size >> 4;
    if (size & 0x0F) r.x.bx++;
    intdos(&r, &r);
    if (r.x.cflag) return 0;
    return r.x.ax;
}

/* file_close.inc: Close file handle */
void fileClose(int16 handle) {
    union REGS r;
    r.h.ah = 0x3E;
    r.x.bx = handle;
    intdos(&r, &r);
}

/* file_open.inc: Open file, returns handle or -1 on error */
int16 openFile(const char *filename, int16 mode) {
    union REGS r;
    struct SREGS s;
    r.h.ah = 0x3D;
    r.h.al = (uint8)mode;
    segread(&s);
    r.x.dx = PTR_OFF(filename);
    intdosx(&r, &r, &s);
    if (r.x.cflag) return -1;
    return r.x.ax;
}

/* file_printstring.inc: Print '$'-terminated string via DOS */
void dos_printstring(const char *str) {
    union REGS r;
    struct SREGS s;
    r.h.ah = 0x09;
    segread(&s);
    r.x.dx = PTR_OFF(str);
    intdosx(&r, &r, &s);
}

/* file_write.inc: Write to file */
int16 writeFileAtRaw(int16 handle, const void FAR *buf, uint16 count) {
    union REGS r;
    struct SREGS s;
    r.h.ah = 0x40;
    r.x.bx = handle;
    r.x.cx = count;
    s.ds = FP_SEG(buf);
    r.x.dx = FP_OFF(buf);
    intdosx(&r, &r, &s);
    if (r.x.cflag) return -1;
    return r.x.ax;
}

/* dos_free: Free DOS memory block (INT 21h/49h) */
int16 dos_free(int16 segment) {
    union REGS r;
    struct SREGS s;
    r.h.ah = 0x49;
    s.es = segment;
    intdosx(&r, &r, &s);
    if (r.x.cflag) return r.x.ax;
    return 0;
}

/* createFile: Create or truncate file (INT 21h/3Ch) */
int16 createFile(const char *filename, int16 attr) {
    union REGS r;
    struct SREGS s;
    r.h.ah = 0x3C;
    r.x.cx = attr;
    segread(&s);
    r.x.dx = PTR_OFF(filename);
    intdosx(&r, &r, &s);
    if (r.x.cflag) return -1;
    return r.x.ax;
}

/* readFile: Read from file into DS-relative buffer (INT 21h/3Fh) */
int16 readFile(int16 handle, int16 count, int16 bufOffset) {
    union REGS r;
    struct SREGS s;
    r.h.ah = 0x3F;
    r.x.bx = handle;
    r.x.cx = count;
    r.x.dx = bufOffset;
    segread(&s);
    intdosx(&r, &r, &s);
    if (r.x.cflag) return -1;
    return r.x.ax;
}

/* readFileAt: Read from file into specific segment:offset (INT 21h/3Fh) */
int16 readFileAt(int16 handle, int16 count, int16 offset, int16 segment) {
    union REGS r;
    struct SREGS s;
    r.h.ah = 0x3F;
    r.x.bx = handle;
    r.x.cx = count;
    r.x.dx = offset;
    s.ds = segment;
    intdosx(&r, &r, &s);
    if (r.x.cflag) return -1;
    return r.x.ax;
}

/* writeFile: Write to file from specific segment:offset (INT 21h/40h) */
int16 writeFile(int16 handle, int16 count, int16 offset, int16 segment, int16 unused) {
    union REGS r;
    struct SREGS s;
    r.h.ah = 0x40;
    r.x.bx = handle;
    r.x.cx = count;
    r.x.dx = offset;
    s.ds = segment;
    intdosx(&r, &r, &s);
    if (r.x.cflag) return -1;
    return r.x.ax;
}

/* file_read512.inc: Read 512 bytes from file - stub */
int16 read512FromFileIntoBuf(void) {
    return 0;
}

/* file_error.inc: Print error and exit */
void errorAndExit(const char *msg) {
    union REGS r;
    dos_printstring(msg);
    r.h.ah = 0x4C;
    r.h.al = 1;
    intdos(&r, &r);
}
