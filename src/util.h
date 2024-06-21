#ifndef UTIL_H
#define UTIL_H

#include "inttype.h"
#include <STDDEF.H>

void strcpyFar(const char* src, const uint16 destSegment, const uint16 destOffset, size_t size);
void memcpyFar(const char* src, const uint16 destSegment, const uint16 destOffset, size_t size);
void writeWordFar(const uint16 segment, const uint16 offset, const uint16 value);
int blitFileFar(const char* filename, const uint16 segment, const uint16 offset);
const char* sizeString(const size_t size);

#endif // UTIL_H
