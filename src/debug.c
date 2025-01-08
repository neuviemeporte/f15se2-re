#include "pointers.h"

#include <stdio.h>
#include <STDARG.H>
#include <STRING.H>

void my_vtrace(const char* fmt, va_list ap) {
    static FILE *stream = NULL;
    static long lasttime = 0;
    const long thistime = time(NULL);
    long timedelta;
    if (stream == NULL) {
        lasttime = time(NULL);
        stream = fopen("start.log", "w");
        if (stream == NULL) {
            printf("Unable to open debug stream");
            exit(1);
        }
        setbuf(stream, NULL);
        fprintf(stream, "Successfully opened debug log\n");
    }
    timedelta = thistime - lasttime;
    lasttime = thistime;
    fprintf(stream, "[%04lds] ", timedelta);
    vfprintf(stream, fmt, ap);
    fprintf(stream, "\n");
    fflush(stream);
}
void my_trace(const char* fmt, ...) {
    va_list ap;
    va_start(ap, fmt);
    my_vtrace(fmt, ap);
    va_end(ap);
}

static char tracebuf[128];

void my_fartrace(const char far *msg, ...) {
    const char FAR *ptr = msg;
    size_t size = 0, idx;
    va_list ap;
    while (*ptr++ != '\0') size++;
    ptr = msg;
    for (idx = 0; idx < size && idx < 127; ++idx) {
      tracebuf[idx] = *ptr++;
    }
    tracebuf[idx] = '\0';
    va_start(ap, msg);
    my_vtrace(tracebuf, ap);
    va_end(ap);
}

void ftoncpy(void *near_ptr, void far *far_ptr, uint32 size) {
    uint8 far *src = (uint8 far *)far_ptr;
    uint8 *dest = (uint8 *)near_ptr;
    uint32 i;

    for (i = 0; i < size; i++) {
        dest[i] = src[i];
    }
}

#define CHUNK_SIZE 512

void dumpbuf(const char *filename, const uint8 far *buf, const uint32 size) {
    char buffer[CHUNK_SIZE];
    uint32 bytes_written = 0;
    FILE *file = fopen(filename, "wb");
    size_t result;

    if (!file) {
        my_trace("Unable to open file for buffer dump: %s", filename);
        return;
    }
    my_trace("Dumping %lu bytes from %p to %s", size, buf, filename);
    while (bytes_written < size) {
        uint32 bytes_to_copy = (size - bytes_written > CHUNK_SIZE) ? CHUNK_SIZE : (size - bytes_written);
#ifdef DEBUGDUMP
        my_trace("remaining = %lu", bytes_to_copy);
#endif
        // Copy data from far pointer to near buffer
        ftoncpy(buffer, buf, bytes_to_copy);
        // Write near buffer to file
        result = fwrite(buffer, 1, bytes_to_copy, file);
        if (result != bytes_to_copy) {
            my_trace("Write error occurred!");
            break;
        }
        bytes_written += bytes_to_copy;
#ifdef DEBUGDUMP
        my_trace("written = %lu", bytes_written);
#endif
        buf += bytes_to_copy;  // Increment far pointer
    }
#ifdef DEBUGDUMP    
    my_trace("Successfully written %lu bytes to %s", bytes_written, filename);
#endif
    fclose(file);
}

void changeext(char *filename, const char *ext) {
    char *dot = strchr(filename, '.');
    if (!dot) {
        dot = filename + strlen(filename);
        *dot = '.';
    }  
    strncpy(dot + 1, ext, 3);
}
