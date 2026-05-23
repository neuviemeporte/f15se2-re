/* Minimal debug trace for egame - uses dbgio.asm DOS helpers */
#include "inttype.h"
#include "pointers.h"

static int logfd = -1;  /* must be in DATA, not BSS */

/* Implemented in dbgio.asm */
extern int dos_creat(const char *filename);
extern int dos_open(const char *filename);
extern void dos_write(int fd, const char *buf, unsigned len);
extern void dos_close(int fd);

static void log_open(void) {
    if (logfd == -1) {
        logfd = dos_creat("ZZZTRACE.XX");
        if (logfd >= 0) {
            dos_write(logfd, "=== egame debug ===\r\n", 21);
            dos_close(logfd);
            logfd = -3; /* signals: created, use reopen */
        } else {
            logfd = -2;
        }
    }
}

/* Simple integer to decimal string */
static char *itoa_simple(int val, char *buf) {
    char tmp[8];
    int i = 0, neg = 0;
    unsigned int uval;
    if (val < 0) { neg = 1; uval = -val; } else { uval = val; }
    do { tmp[i++] = '0' + (uval % 10); uval /= 10; } while (uval);
    if (neg) *buf++ = '-';
    while (i > 0) *buf++ = tmp[--i];
    *buf = 0;
    return buf;
}

/* Simple uint16 to hex string */
static char *u16hex(uint16 val, char *buf) {
    static char hex[] = "0123456789abcdef";
    buf[0] = hex[(val >> 12) & 0xf];
    buf[1] = hex[(val >> 8) & 0xf];
    buf[2] = hex[(val >> 4) & 0xf];
    buf[3] = hex[val & 0xf];
    buf[4] = 0;
    return buf + 4;
}

void log_close(void) {
    if (logfd >= 0) { dos_close(logfd); logfd = -1; }
}

/* Minimal printf-like: supports %s, %d, %04x only */
void my_trace(const char *fmt, ...) {
    char buf[128];
    char *p = buf;
    const char *f = fmt;
    int *args = (int *)(&fmt) + 1;
    int argidx = 0;

    log_open();
    if (logfd == -2) return;

    while (*f && (p - buf) < 120) {
        if (*f == '%') {
            f++;
            if (*f == 's') {
                const char *s = (const char *)args[argidx++];
                while (*s && (p - buf) < 120) *p++ = *s++;
            } else if (*f == 'd') {
                p = itoa_simple(args[argidx++], p);
            } else if (f[0] == '0' && f[1] == '4' && f[2] == 'x') {
                p = u16hex((uint16)args[argidx++], p);
                f += 2;
            } else if (f[0] == 'h' && f[1] == 'd') {
                p = itoa_simple(args[argidx++], p);
                f++;
            } else {
                *p++ = '%';
                *p++ = *f;
            }
            f++;
        } else {
            *p++ = *f++;
        }
    }
    *p++ = '\r';
    *p++ = '\n';
    {
        int fd;
        fd = dos_open("ZZZTRACE.XX");
        if (fd >= 0) {
            dos_write(fd, buf, (unsigned int)(p - buf));
            dos_close(fd);
        }
    }
}

void my_fartrace(const char FAR *msg) {
    char buf[128];
    int i = 0;
    while (msg[i] && i < 126) { buf[i] = msg[i]; i++; }
    buf[i] = 0;
    my_trace(buf);
}
