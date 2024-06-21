#ifndef F15_SE2_LL
#define F15_SE2_LL

#include "inttype.h"
#include "pointers.h"

void setupOverlaySlots(uint16);
void installCBreakHandler(void);
void setTimerIrqHandler(void);
uint16 loadOverlay(const char*);
void intDispatch(int16 intnum, uint8 *inreg, uint8 *outreg);
void setupPIT();
uint8* dos_alloc(uint16 size);
void dos_printstring(const char* str);

int FAR copyJoystickData(uint8 FAR *ptr);

#endif // F15_SE2_LL
