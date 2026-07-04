#pragma once
// Minimal bios.h stub for 64-bit native builds

#ifndef _BIOS_H_COMPAT64
#define _BIOS_H_COMPAT64

#define _KEYBRD_READY 1
#define _KEYBRD_READ 0

inline int16 _bios_keybrd(int16 cmd) {
    (void)cmd;
    return 0;
}

#endif // _BIOS_H_COMPAT64
