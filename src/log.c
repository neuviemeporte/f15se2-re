#include "log.h"

#ifdef DEBUG

#include <stdarg.h>
#include <stddef.h>
#include <stdlib.h>

/* Application name prepended to each line; empty until log_set_app() is called. */
static const char *app_tag = "";

void log_set_app(const char *name) {
    app_tag = name;
}

#ifdef LOG_DOS

/*
 * egame backend. egame's _TEXT segment is already at the 64K small-model limit
 * (the Makefile compiles its largest TUs with /Os just to fit), so linking in
 * stdio's vfprintf/fopen overflows it. We format by hand and write through the
 * raw DOS file helpers in dbgio.asm to keep the code footprint tiny.
 */
extern int dos_creat(const char *filename);
extern int dos_open(const char *filename);
extern void dos_write(int fd, const char *buf, unsigned len);
extern void dos_close(int fd);

#define LOG_FILE "ZZZTRACE.XX"

static int logfd = -1; /* sentinel: -1 = not opened, -2 = unavailable, -3 = created */

void log_open(int append) {
    (void)append; /* the trace file is always recreated */
    if (logfd == -1) {
        int fd = dos_creat(LOG_FILE);
        if (fd >= 0) {
            dos_close(fd);
            logfd = -3; /* created; reopen per line */
        } else {
            logfd = -2; /* unavailable; logging disabled */
        }
    }
}

void log_close(void) {
    logfd = -1;
}

static char *fmt_uint(char *p, unsigned long val, unsigned base,
                      const char *digits, int width, int zero) {
    char tmp[12];
    int n = 0;
    do {
        tmp[n++] = digits[val % base];
        val /= base;
    } while (val);
    while (n < width--) *p++ = zero ? '0' : ' ';
    while (n > 0) *p++ = tmp[--n];
    return p;
}

/* Tiny printf: %s %c %d %u %x %X with optional width, zero-pad and h/l length. */
static void emit(const char *prefix, const char *fmt, va_list ap) {
    char buf[160];
    char *p = buf;
    const char *f;

    if (logfd == -1) log_open(0);
    if (logfd == -2) return;

    if (*app_tag) {
        for (f = app_tag; *f; ++f) *p++ = *f;
        *p++ = ':';
        *p++ = ' ';
    }
    for (f = prefix; *f; ++f) *p++ = *f;

    for (f = fmt; *f && (p - buf) < 150; ++f) {
        int width = 0, zero = 0, lng = 0;
        if (*f != '%') {
            *p++ = *f;
            continue;
        }
        ++f;
        if (*f == '0') { zero = 1; ++f; }
        while (*f >= '0' && *f <= '9') width = width * 10 + (*f++ - '0');
        while (*f == 'h' || *f == 'l') { if (*f == 'l') lng = 1; ++f; }
        switch (*f) {
        case 's': {
            const char *s = va_arg(ap, char *);
            while (*s && (p - buf) < 150) *p++ = *s++;
            break;
        }
        case 'c':
            *p++ = (char)va_arg(ap, int);
            break;
        case 'd': {
            long v = lng ? va_arg(ap, long) : (long)va_arg(ap, int);
            unsigned long u;
            if (v < 0) { *p++ = '-'; u = (unsigned long)-v; } else u = (unsigned long)v;
            p = fmt_uint(p, u, 10, "0123456789", width, zero);
            break;
        }
        case 'u':
            p = fmt_uint(p, lng ? va_arg(ap, unsigned long) : va_arg(ap, unsigned),
                         10, "0123456789", width, zero);
            break;
        case 'x':
            p = fmt_uint(p, lng ? va_arg(ap, unsigned long) : va_arg(ap, unsigned),
                         16, "0123456789abcdef", width, zero);
            break;
        case 'X':
            p = fmt_uint(p, lng ? va_arg(ap, unsigned long) : va_arg(ap, unsigned),
                         16, "0123456789ABCDEF", width, zero);
            break;
        case '%':
            *p++ = '%';
            break;
        default:
            *p++ = '%';
            *p++ = *f;
            break;
        }
    }
    *p++ = '\r';
    *p++ = '\n';

    {
        int fd = dos_open(LOG_FILE);
        if (fd >= 0) {
            dos_write(fd, buf, (unsigned)(p - buf));
            dos_close(fd);
        }
    }
}

#else /* stdio backend: launcher, start, end, tests, future hosts */

#include <stdio.h>

#define LOG_FILE "f15.log"

static FILE *logfile = NULL;

void log_open(int append) {
    if (!logfile) logfile = fopen(LOG_FILE, append ? "a" : "w");
}

void log_close(void) {
    if (logfile) {
        fclose(logfile);
        logfile = NULL;
    }
}

static void emit(const char *prefix, const char *fmt, va_list ap) {
    if (!logfile) log_open(1);
    if (!logfile) return;
    if (*app_tag) {
        fputs(app_tag, logfile);
        fputs(": ", logfile);
    }
    fputs(prefix, logfile);
    vfprintf(logfile, fmt, ap);
    fputc('\n', logfile);
    fflush(logfile);
}

/* Unprefixed, no-newline write for hexdump below. */
static void raw(const char *fmt, ...) {
    va_list ap;
    if (!logfile) log_open(1);
    if (!logfile) return;
    va_start(ap, fmt);
    vfprintf(logfile, fmt, ap);
    va_end(ap);
}

void hexdump(const void FAR *buf, size_t size, size_t off, int header) {
    const size_t bpl = 16; /* display bytes per line */
    const size_t limit = 50 * bpl;
    size_t i = 0, j = 0;
    unsigned char c;
    if (header) raw("buf[0x%x] @ %p + 0x%x: \n", size, (uint8 FAR *)buf, off);
    if (!buf || !size || off >= size) {
        raw("invalid input");
        return;
    }
    if (size - off > 2 * limit) {
        hexdump(buf, limit, 0, 0);
        raw("[...]\n");
        hexdump(buf, size, size - limit, 0);
        return;
    }
    for (i = 0; i + off < size; ++i) {
        const size_t pos = i % bpl;
        if (pos == 0) raw("0x%04x: ", i + off);
        raw("%02x ", (int)(((uint8 FAR *)buf)[i + off]));
        if (pos + 1 == bpl || i + 1 == size) { /* ascii column at line/buffer end */
            for (j = 1; j <= bpl; ++j) {
                if (pos + j < bpl) { raw("   "); continue; }
                c = ((uint8 FAR *)buf)[i + off - bpl + j];
                if (c >= 0x20 && c <= 0x7e) raw("%c", c);
                else raw(".");
            }
            raw("\n");
        }
    }
}

#endif /* LOG_DOS */

/* ---- public level helpers, shared by both backends ------------------- */

#define LOG_FN(name, prefix)                            \
    void name(const char *fmt, ...) {                   \
        va_list ap;                                     \
        va_start(ap, fmt);                              \
        emit(prefix, fmt, ap);                          \
        va_end(ap);                                     \
    }

LOG_FN(log_message, "")
LOG_FN(log_verbose, "Verbose: ")
LOG_FN(log_debug, "Debug: ")
LOG_FN(log_info, "Info: ")
LOG_FN(log_warn, "Warn: ")
LOG_FN(log_error, "Error: ")

void log_critical(const char *fmt, ...) {
    va_list ap;
    va_start(ap, fmt);
    emit("Critical: ", fmt, ap);
    va_end(ap);
    log_close();
    exit(1);
}

#endif /* DEBUG */
