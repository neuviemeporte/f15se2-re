#include "f15util.h"
#include "pointers.h"
#include "log.h"

#include <stdio.h>

void strcpyFar(const char *src, const uint16 destSegment, const uint16 destOffset, size_t size) {
    char FAR *dest = (char FAR *)MK_FP(destSegment, destOffset);
    while (size > 0 && *src != '\0') {
        *dest = *src;
        dest++;
        src++;
        size--;
    }
}

void memcpyFar(const char *src, const uint16 destSegment, const uint16 destOffset, size_t size) {
    uint8 FAR *dest = (uint8 FAR *)MK_FP(destSegment, destOffset);
    while (size > 0) {
        *dest = *src;
        dest++;
        src++;
        size--;
    }
}

void writeWordFar(const uint16 segment, const uint16 offset, const uint16 value) {
    uint16 FAR *wordPtr = (uint16 FAR *)MK_FP(segment, offset);
    *wordPtr = value;
}

enum { BUFSIZE = 256 };
int16 blitFileFar(const char *filename, const uint16 segment, const uint16 offset) {
    uint8 FAR *dest = (uint8 FAR *)MK_FP(segment, offset);
    uint8 buffer[BUFSIZE];
    FILE *infile = NULL;
    size_t readsize = 0, i;
    int16 err;
    infile = fopen(filename, "rb");
    if (infile == NULL) {
        LogError(("Unable to open %s for reading", filename));
        return 1;
    }
    while (!feof(infile)) {
        readsize = fread(buffer, 1, BUFSIZE, infile);
        if ((err = ferror(infile)) != 0) {
            LogError(("Error reading from %s: %d", filename, err));
            return 2;
        }
        LogDebug(("read %u bytes, writing at %p", readsize, dest));
        i = 0;
        while (i < readsize) {
            *dest = buffer[i++];
            dest++;
        }
    }
    return 0;
}

const char *sizeString(const size_t paragraphs) {
    static char buffer[128];
    const uint32 bytes = ((uint32)paragraphs) * 16;
    sprintf(buffer, "%lu (0x%x/%up)", bytes, paragraphs, paragraphs);
    return buffer;
}