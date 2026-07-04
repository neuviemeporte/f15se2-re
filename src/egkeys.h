#ifndef F15_SE2_EGKEYS
#define F15_SE2_EGKEYS
/* public interface of egkeys.c */
#include "inttype.h"

void keyDispatch(uint16 scanCode);
void makeSound(int16 soundId, int16 priority);
void playVoiceCue(int16 weaponIdx);
void updateEngineSound(void);
void recalcTimeScale(void);
void setupLodDistances(void);
void exitTimeAccel();

#endif /* F15_SE2_EGKEYS */
