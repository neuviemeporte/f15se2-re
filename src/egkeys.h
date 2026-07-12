#ifndef F15_SE2_EGKEYS
#define F15_SE2_EGKEYS
/* public interface of egkeys.c */
#include "inttype.h"

typedef enum {
    SCAN_ESCAPE = 0x11b,
    SCAN_MINUS = 0x0c2d,
    SCAN_SHIFT_MINUS = 0x0c5f,
    SCAN_SHIFT_EQUAL = 0x0d2b,
    SCAN_EQUAL = 0x0d3d,
    SCAN_BACKSPACE = 0xe08,
    SCAN_ALT_Q = 0x1000,
    SCAN_W = 0x1177,
    SCAN_R = 0x1372,
    SCAN_ALT_T = 0x1400,
    SCAN_T = 0x1474,
    SCAN_ALT_Y = 0x1500,
    SCAN_P = 0x1970,
    SCAN_ENTER = 0x1c0d,
    SCAN_ALT_A = 0x1e00,
    SCAN_A = 0x1e61,
    SCAN_S = 0x1f73,
    SCAN_ALT_D = 0x2000,
    SCAN_D = 0x2064,
    SCAN_ALT_F = 0x2100,
    SCAN_F = 0x2166,
    SCAN_G = 0x2267,
    SCAN_ALT_J = 0x2400,
    SCAN_ALT_K = 0x2500,
    SCAN_L = 0x266c,
    SCAN_Z = 0x2c7a,
    SCAN_X = 0x2d78,
    SCAN_C = 0x2e63,
    SCAN_ALT_V = 0x2f00,
    SCAN_ALT_B = 0x3000,
    SCAN_B = 0x3062,
    SCAN_ALT_N = 0x3100,
    SCAN_ALT_M = 0x3200,
    SCAN_M = 0x326d,
    SCAN_SPACEBAR = 0x3920,
    SCAN_F1 = 0x3b00,
    SCAN_F2 = 0x3c00,
    SCAN_F3 = 0x3d00,
    SCAN_F4 = 0x3e00,
    SCAN_F5 = 0x3f00,
    SCAN_F6 = 0x4000,
    SCAN_F7 = 0x4100,
    SCAN_F8 = 0x4200,
    SCAN_F9 = 0x4300,
    SCAN_F10 = 0x4400
} ScanCode;

void keyDispatch(uint16 scanCode);
void makeSound(int16 soundId, int16 priority);
void playVoiceCue(int16 weaponIdx);
void updateEngineSound(void);
void recalcTimeScale(void);
void setupLodDistances(void);
void exitTimeAccel();

#endif /* F15_SE2_EGKEYS */
