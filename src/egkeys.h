#ifndef F15_SE2_EGKEYS
#define F15_SE2_EGKEYS
/* public interface of egkeys.c */
#include "inttype.h"

void keyDispatch(uint16 scanCode);
void makeSound(int soundId, int priority);
void playVoiceCue(int weaponIdx);
void updateEngineSound(void);
void recalcTimeScale(void);
void setupLodDistances(void);
void exitSlowMotion();

#endif /* F15_SE2_EGKEYS */
