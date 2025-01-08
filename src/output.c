#include "output.h"

#include <STDIO.H>
#include <STDARG.H>

void output_stdout(const char* format, va_list ap) {
    vprintf(format, ap);
}

static const char* logname = "f15.log";
static FILE* logfile = NULL;
void output_log(const char* format, va_list ap) {
    if (logfile == NULL) {
        printf("Opening log file %s\n", logname);
        logfile = fopen(logname, "w");
    }
    vfprintf(logfile, format, ap);
}

void output_tee(const char *format, va_list ap) {
    output_log(format, ap);
    output_stdout(format, ap);
}

static void (*voutput)(const char* format, va_list ap) = output_log;

void output(const char* format, ...) {
    va_list ap;
    va_start(ap, format);
    voutput(format, ap);
    va_end(ap);
}

void INFO(const char *format, ...) {
    va_list ap;
    va_start(ap, format);
    voutput(format, ap);
    output("\n");
    va_end(ap);
}

void ERROR(const char *format, ...) {
    va_list ap;
    va_start(ap, format);
    output("ERROR: ");
    voutput(format, ap);
    output("\n");
    va_end(ap);
}

void FATAL(const char *format, ...) {
    va_list ap;
    va_start(ap, format);
    output("FATAL: ");
    voutput(format, ap);
    output("\n");
    va_end(ap);
    exit(1);
}

void DEBUG(const char *format, ...) {
    va_list ap;
    va_start(ap, format);
    output("DEBUG: ");
    voutput(format, ap);
    output("\n");
    va_end(ap);
}

void dumpregs(const union REGS *regs) {
    output("AX = 0x%x, BX = 0x%x, CX = 0x%x, DX = 0x%x\n", regs->x.ax, regs->x.bx, regs->x.cx, regs->x.dx);
    output("SI = 0x%x, DI = 0x%x, CF = 0x%x\n", regs->x.si, regs->x.di, regs->x.cflag);
}

void hexdump(const uint8 FAR *buf, const size_t size, const size_t off, const int header) {
    const size_t bpl = 16; // display bytes per line
    const size_t limit = 50 * bpl;
    size_t i = 0, j = 0;
    unsigned char c;
    if (header) output("buf[0x%x] @ %p + 0x%x: \n", size, buf, off);
    if (!buf || !size || off >= size) {
        output("invalid input");
        return;
    }
    if (size - off > 2 * limit) {
        hexdump(buf, limit, 0, 0);
        output("[...]\n");
        hexdump(buf, size, size - limit, 0);
        return;
    }
    for (i = 0; i + off < size; ++i) {
        const size_t pos = i % bpl;
        if (pos == 0) { // header at line start
            output("0x%04x: ", i + off);
        }
        // hex byte
        output("%02x ", (int)(buf[i + off]));
        if (pos + 1 == bpl || i + 1 == size) { // ascii dump at line or buffer end
            for (j = 1; j <= bpl; ++j) {
                if (pos + j < bpl) { output("   "); continue; }
                c = buf[i + off - bpl + j];
                if (c >= 0x20 && c <= 0x7e) output("%c", c);
                else output(".");
            }
            output("\n");
        }
    }
}
