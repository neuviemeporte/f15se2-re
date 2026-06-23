/* enbrief.c — debrief UI, compiled with /Gs /Zi */
#include "slot.h"
#include <dos.h>
#include "offsets.h"
#include "pointers.h"
#include "debug.h"
#include "shared/common.h"
#include "endtypes.h"
#include "endata.h"
#include "endcode.h"
#include "enbrief.h"
#include "eninput.h"
#include "entext.h"

/* Private helpers for this translation unit. */
int mapToScreenY(unsigned char mapCoord);
int mapToScreenX(unsigned char mapCoord);
void drawClippedLineEx(int x1, int y1, int x2, int y2, int cx1, int cy1, int cx2, int cy2, int flag);
void drawClippedLine(int x1, int y1, int x2, int y2);
int drawEventSprite(int recordIdx);
void drawMapPixel(int x, int y, int color);
int isPointInRect(struct MenuItem *p);
void blinkWidget(MenuItem *item, int16* gfxPage);
unsigned int drawFlightPath(int16 *gfxPage, unsigned int maxRecord);
void showEventPopup(void);
void drawFlightLine(int p1, int p2, int p3, int p4);
char *formatFlightTime(int timeValue, char *buffer);
void plotMapPoint(int x, int y, int color, int unused);
void timerWait(unsigned int ticks);
void processDebriefInput(int16 *cursorBounds, MenuItem *menuItem, int16* gfxPage);
void drawMenuItem(MenuItem *items, unsigned int index, int16* gfxPage);

void computeMissionResult(void)
{
    unsigned int gridX, gridY;

    gridX = commData->worldX >> 0x0b;
    gridY = commData->worldY >> 0x0b;
    missionResult = gridFlags[gridX + gridY * 16] & 3;
}

void processMenuItems(MenuItem *items, int unused, int itemCount, int cursorStartX, int cursorStartY, int16* gfxPage) {
    char p[2]; char a[2]; char c[2]; int idx; char f[2];
    (void)unused;
    p[0] = 0x0d; p[1] = 0;
    c[0] = 0x89; c[1] = 0;
    a[0] = 0x8d; a[1] = 0;
    f[0] = 0x80; f[1] = 0;
    idx = 0;
    for (; idx < itemCount; idx++) {
        if (items[idx].state == 2) {
            selectedMenuItem = idx;
            items[idx].state = 0;
            blinkWidget(&items[idx], gfxPage);
            drawMenuItem(items, idx, gfxPage);
        } else {
            if (items[idx].state != 3) {
                items[idx].state = 0;
            }
        }
    }
    cursorX = cursorStartX;
    cursorY = cursorStartY;
}

// 224a
int selectMenuItem(MenuItem *items, int unused, int itemCount, int16* inputState, int16* gfxPage) {
    char p[2]; int toColor; int fromColor; char c[2]; char e[2]; int groupIdx;
    char h[2]; int curIdx;
    (void)unused;
    p[0] = 0x0d; p[1] = 0;
    e[0] = 0x89; e[1] = 0;
    c[0] = 0x8d; c[1] = 0;
    h[0] = 0x80; h[1] = 0;
    gfx_commitPage();
    colorAnimEnabled = 0;
    curIdx = 0;
    while (isPointInRect(&items[curIdx]) == 0 && curIdx < itemCount)
        curIdx++;
    joyRepeatFlag = 0;
    for (;;) {
        // 22a8
        do {
            gfx_commitPage();
            if ((items[curIdx].flags & MENUITEM_ENABLED) == 0) {
                colorAnimEnabled = 1;
            }
            // 22d4
            processDebriefInput(inputState, &items[curIdx], gfxPage);
        } while (inputChanged == 0 && enterPressed == 0);
        // 22e8
        if (enterPressed != 0) { // 22f2
            if (curIdx != selectedMenuItem) { // 22fa
                curIdx = 0;
                while (isPointInRect(&items[curIdx]) == 0 && curIdx < itemCount)
                    curIdx++;
            } // 2320
            // 232c
            if (items[selectedMenuItem].colorTableIdx == 0) {
                fromColor = 0x0b;
                toColor = 9;
                gfx_switchColor(gfxPage, items[selectedMenuItem].colorX1, items[selectedMenuItem].colorY1, items[selectedMenuItem].colorX2, items[selectedMenuItem].colorY2, 0x0b, 9);
                fromColor = 3;
                gfx_switchColor(gfxPage, items[selectedMenuItem].colorX1, items[selectedMenuItem].colorY1, items[selectedMenuItem].colorX2, items[selectedMenuItem].colorY2, 3, toColor);
                fromColor = 0x0d;
                gfx_switchColor(gfxPage, items[selectedMenuItem].colorX1, items[selectedMenuItem].colorY1, items[selectedMenuItem].colorX2, items[selectedMenuItem].colorY2, 0x0d, toColor);
            }
            // 23bc
            goto done;
            continue;
        } // 23c2
        curIdx = 0;
        while (isPointInRect(&items[curIdx]) == 0 && curIdx < itemCount)
            curIdx++;
        if (curIdx != selectedMenuItem) {
            if ((items[curIdx].flags & MENUITEM_SELECTABLE) != 0) {
                for (groupIdx = 0; groupIdx < itemCount; groupIdx++) {
                    if (items[groupIdx].state != 0 &&
                        items[curIdx].groupId == items[groupIdx].groupId) {
                        blinkWidget(&items[groupIdx], gfxPage);
                    }
                }
                if (items[selectedMenuItem].colorTableIdx == 0) {
                    fromColor = 9;
                    toColor = 6;
                    gfx_switchColor(gfxPage, items[selectedMenuItem].colorX1, items[selectedMenuItem].colorY1, items[selectedMenuItem].colorX2, items[selectedMenuItem].colorY2, 9, 6);
                    fromColor = 3;
                    gfx_switchColor(gfxPage, items[selectedMenuItem].colorX1, items[selectedMenuItem].colorY1, items[selectedMenuItem].colorX2, items[selectedMenuItem].colorY2, 3, toColor);
                    fromColor = 0x0d;
                    gfx_switchColor(gfxPage, items[selectedMenuItem].colorX1, items[selectedMenuItem].colorY1, items[selectedMenuItem].colorX2, items[selectedMenuItem].colorY2, 0x0d, toColor);
                    fromColor = 0x0b;
                    gfx_switchColor(gfxPage, items[selectedMenuItem].colorX1, items[selectedMenuItem].colorY1, items[selectedMenuItem].colorX2, items[selectedMenuItem].colorY2, 0x0b, toColor);
                }
                if (items[selectedMenuItem].colorTableIdx == 1) {
                    fromColor = 8;
                    toColor = 7;
                    gfx_switchColor(gfxPage, items[selectedMenuItem].colorX1, items[selectedMenuItem].colorY1, items[selectedMenuItem].colorX2, items[selectedMenuItem].colorY2, 8, 7);
                }
                blinkWidget(&items[curIdx], gfxPage);
            }
            selectedMenuItem = curIdx;
            // 256f
            drawMenuItem(items, curIdx, gfxPage);
        } // 2575
    }
done:
    return curIdx;
}

void blinkWidget(MenuItem *item, int16* gfxPage) {
    int toColor;
    int fromColor;
    TRACE(("blinkWidget"));
    if (item->state == 0) {
        item->state = 1;
        fromColor = (unsigned)item->colorPair >> 4;
        toColor = item->colorPair & 0xF;
        if (item->colorPair != 0) {
            gfx_switchColor(gfxPage, item->colorX1, item->colorY1, item->colorX2, item->colorY2, fromColor, toColor);
        }
    } else {
        item->state = 0;
        fromColor = item->colorPair & 0xF;
        toColor = (unsigned)item->colorPair >> 4;
    }
    if (item->colorPair != 0) {
        gfx_switchColor(gfxPage, item->colorX1, item->colorY1, item->colorX2, item->colorY2, fromColor, toColor);
    }
}

int isPointInRect(MenuItem *p)
{
    TRACE(("isPointInRect"));
    if (p->hitX1 <= cursorX && p->hitX2 >= cursorX && p->hitY1 <= cursorY && p->hitY2 >= cursorY)
        return 1;
    else
        return 0;
}

/*static*/ void processDebriefInput(int16 *cursorBounds, MenuItem *menuItem, int16* gfxPage) {
    int fromColor;
    int toColor;
    int joyBtn0;
    int joyBtn1;
    char repeatActive;
    int keycode;
    TRACE(("processDebriefInput"));

    colorTablePtr = (unsigned int *)((char *)colorStyleTable + menuItem->colorTableIdx * 14);
    timerCounter2 = 0;
    joyBtn0 = joyBtn1 = 0;
    inputChanged = enterPressed = animDone = repeatActive = 0;
    if (joyRepeatFlag == 1) {
        timerCounter = 0;
        repeatActive = 1;
    }

    /* pre-loop joystick read */
    if (commData->setupUseJoy == 1) {
        joyBtn0 = misc_readJoystick(0);
        joyBtn1 = misc_readJoystick(1);
        pollJoystick();
    }

    /* main loop */
    for (;;) {
        if ((char)misc_checkKeyBuf() == 0
            || joyBtn0 != 0
            || joyBtn1 != 0
            || (unsigned char)joyAxisX < JOY_DEADZONE_LO
            || (unsigned char)joyAxisX > JOY_DEADZONE_HI
            || (unsigned char)joyAxisY < JOY_DEADZONE_LO
            || (unsigned char)joyAxisY > JOY_DEADZONE_HI) {
            if (repeatActive != 1)
                break;
        }
        /* joystick repeat handling */
        if (joyRepeatFlag == 1) {
            if (timerCounter > 0x0F) {
                repeatActive = 0;
                joyRepeatFlag = 0;
            }
        }

        /* re-read joystick */
        if (commData->setupUseJoy == 1) {
            joyBtn0 = misc_readJoystick(0);
            joyBtn1 = misc_readJoystick(1);
            pollJoystick();
        }

        /* quit check */
        if (quitFlag != 0) {
            cleanup();
            restoreCbreakHandler();
            exit(0);
        }

        /* animation */
        if (colorAnimEnabled == 1) {
            if (timerCounter2 > 6) {
                timerCounter2 = 0;
                toColor = colorTablePtr[colorAnimIdx + 1] >> 4;
                fromColor = colorTablePtr[colorAnimIdx + 1] & 0xF;
                gfx_switchColor(gfxPage, menuItem->colorX1, menuItem->colorY1, menuItem->colorX2, menuItem->colorY2, toColor, fromColor);
                colorAnimIdx++;
                colorAnimIdx = (unsigned)colorAnimIdx % *colorTablePtr;
            }
        }

        /* sprite section */
        if (!(menuItem->flags & MENUITEM_HAS_SPRITE)) goto skip_sprite;
        if (!(menuItem->flags & MENUITEM_SPRITE_BLINK)) goto skip_sprite;
        if (timerCounter3 <= 0x12) goto skip_sprite;
        timerCounter3 = 0;
        if (spriteToggle != 0) {
            switch (flightRecords[curRecordIdx].status & STATUS_TYPE_MASK) {
            case EVENT_AIR_KILL:
            case EVENT_AIR_KILL2:
                spriteAirBlink->dstX = mapToScreenX(flightRecords[curRecordIdx].mapX) + mapViewX1 - 2;
                spriteAirBlink->dstY = mapToScreenY(flightRecords[curRecordIdx].mapY) + mapViewY1 - 2;
                if (slotInfoTable[(flightRecords[curRecordIdx].unitId & UNIT_ID_MASK) << 4] & 8) {
                    spriteAirBlink->srcX = 0x11E;
                } else {
                    spriteAirBlink->srcX = 0x12D;
                }
                gfx_blitSprite(spriteAirBlink);
                break;
            case EVENT_SAM_KILL:
                spriteSamBlink->dstX = mapToScreenX(flightRecords[curRecordIdx].mapX) + mapViewX1 - 2;
                spriteSamBlink->dstY = mapToScreenY(flightRecords[curRecordIdx].mapY) + mapViewY1 - 2;
                gfx_blitSprite(spriteSamBlink);
                break;
            case EVENT_GROUND_KILL:
                spriteGroundBlink->dstX = mapToScreenX(flightRecords[curRecordIdx].mapX) + mapViewX1 - 2;
                spriteGroundBlink->dstY = mapToScreenY(flightRecords[curRecordIdx].mapY) + mapViewY1 - 2;
                gfx_blitSprite(spriteGroundBlink);
                break;
            case EVENT_BOMB_HIT:
                spriteWaypointBlink->dstX = mapToScreenX(flightRecords[curRecordIdx].mapX) + mapViewX1;
                spriteWaypointBlink->dstY = mapToScreenY(flightRecords[curRecordIdx].mapY) + mapViewY1;
                gfx_blitSprite(spriteWaypointBlink);
                break;
            case EVENT_EJECTED:
                spriteSamBlink->dstX = mapToScreenX(flightRecords[curRecordIdx].mapX) + mapViewX1 - 2;
                spriteSamBlink->dstY = mapToScreenY(flightRecords[curRecordIdx].mapY) + mapViewY1 - 2;
                gfx_blitSprite(spriteSamBlink);
                break;
            case EVENT_WAYPOINT:
                spriteWaypointBlink->dstX = mapToScreenX(flightRecords[curRecordIdx].mapX) + mapViewX1;
                spriteWaypointBlink->dstY = mapToScreenY(flightRecords[curRecordIdx].mapY) + mapViewY1;
                gfx_blitSprite(spriteWaypointBlink);
                break;
            }
        } else {
            drawEventSprite(curRecordIdx);
        }
        spriteToggle = (spriteToggle == 0);
skip_sprite:
        ;
    }

    /* post-loop input handling */
    if ((char)misc_checkKeyBuf() == 0) {
        keycode = misc_getKey();
    } else {
        if (joyBtn0 == 1) {
            keycode = KEYCODE_ENTER;
        } else if (joyBtn1 == 1) {
            keycode = KEYCODE_ESC;
        } else if ((unsigned char)joyAxisX < JOY_DEADZONE_LO) {
            keycode = KEYCODE_LEFTARROW;
            joyRepeatFlag = 1;
        } else if ((unsigned char)joyAxisX > JOY_DEADZONE_HI) {
            keycode = KEYCODE_RIGHTARROW;
            joyRepeatFlag = 1;
        } else if ((unsigned char)joyAxisY < JOY_DEADZONE_LO) {
            keycode = KEYCODE_UPARROW;
            joyRepeatFlag = 1;
        } else if ((unsigned char)joyAxisY > JOY_DEADZONE_HI) {
            keycode = KEYCODE_DNARROW;
            joyRepeatFlag = 1;
        }
    }

    /* process key */
    if ((char)keycode == KEYCODE_ENTER) {
        enterPressed = 1;
    }
    if (keycode == KEYCODE_ALTQ) {
        quitFlag = 1;
        enterPressed = 1;
    }
    if (keycode == KEYCODE_UPARROW) {
        cursorY -= cursorBounds[1];
        if (cursorBounds[4] > (int)cursorY) {
            cursorY = cursorBounds[4];
        }
        inputChanged = 1;
    }
    if (keycode == KEYCODE_DNARROW) {
        cursorY += cursorBounds[1];
        if (cursorY > (unsigned)cursorBounds[5]) {
            cursorY = cursorBounds[5];
        }
        inputChanged = 1;
    }
    if (keycode == KEYCODE_RIGHTARROW) {
        cursorX += cursorBounds[0];
        if (cursorX > (unsigned)cursorBounds[3]) {
            cursorX = cursorBounds[3];
        }
        inputChanged = 1;
    }
    if (keycode == KEYCODE_LEFTARROW) {
        cursorX -= cursorBounds[0];
        if (cursorBounds[2] > (int)cursorX) {
            cursorX = cursorBounds[2];
        }
        if (cursorBounds[4] > (int)cursorY) {
            cursorX += cursorBounds[0];
        }
        inputChanged = 1;
    }

    /* final cleanup */
    if (menuItem->flags & MENUITEM_HAS_SPRITE) {
        if (menuItem->flags & MENUITEM_SPRITE_BLINK) {
            drawEventSprite(curRecordIdx);
        }
    }
}

// 2bd1
void drawMenuItem(MenuItem *items, unsigned int index, int16* gfxPage) {
    char p[2]; char a[2]; char prefix[2]; char d[2];
    int m;
    char numBuf[4]; unsigned int unitIdx;
    p[0] = 0x0a; p[1] = 0;
    prefix[0] = 0x89; prefix[1] = 0;
    a[0] = 0x8d; a[1] = 0;
    d[0] = 0x80; d[1] = 0;
    // 2c07
    if ((items[index].flags & MENUITEM_HAS_SPRITE) != 0) {
        // 2c1d
        if ((items[index].flags & MENUITEM_TYPE_MASK) == 7) {
        /* Section 1: mission complete display */
        clearRect(gfxPage, 0xeb, 0x0a, 0x13f, 0x95);
        gfxPage[2] = 0;
        mystrcpy(scoreString, prefix);
        mystrcat(scoreString, str_pressExit);
        drawWrappedText(gfxPage, scoreString, 0x50, 0xf0, 0x82, 8);
        clearRect(gfxPage, 0xf0, 0x64, 0x12c, 0x7e);
        if (popupVisible == 1) {
            gfx_copyRect(1, 0, POPUP_SAVE_Y, 0, popupX, popupY, POPUP_WIDTH, POPUP_HEIGHT);
            popupVisible = 0;
        }
        curRecordIdx = 0;
        totalFlightRecords = drawFlightPath(gfxPage, ALL_RECORDS);
        missionScore = calcMissionScore(totalFlightRecords);
        mystrcpy(scoreString, str_dot1);
        mystrcat(scoreString, str_overall1);
        drawStringCentered(gfxPage, scoreString, 0xe8, 0x46, 0x57);
        mystrcpy(scoreString, str_missionRating1);
        drawStringCentered(gfxPage, scoreString, 0xe8, 0x4e, 0x57);
        mystrcpy(scoreString, str_dot2);
        my_ltoa(missionScore, numBuf);
        mystrcat(scoreString, numBuf);
        drawStringCentered(gfxPage, scoreString, 0xe8, 0x56, 0x57);
        if (commData->trainingFlag != 0) {
            drawStringCentered(gfxPage, str_trainingScore, 0xe8, 0x60, 0x57);
            drawStringCentered(gfxPage, str_notRecorded, 0xe8, 0x68, 0x57);
        } else {
            mystrcpy(scoreString, str_dot3);
            mystrcat(scoreString, str_careerTotal);
            drawStringCentered(gfxPage, scoreString, 0xe8, 0x6c, 0x57);
            mystrcpy(scoreString, str_dot4);
            my_ltoa(gameData->totalScore + missionScore, numBuf);
            mystrcat(scoreString, numBuf);
            drawStringCentered(gfxPage, scoreString, 0xe8, 0x74, 0x57);
        }
        gfxPage[2] = FONT_TITLE;
        mystrcpy(scoreString, str_missionSummary);
        drawStringCentered(gfxPage, scoreString, 0xe8, 0x14, 0x57);
        gfxPage[2] = 0;
        mystrcpy(scoreString, str_priSecTargets);
        drawStringAt(gfxPage, scoreString, 0xf0, 0x1e);
        my_itoa(primaryHit + secondaryHit, scoreString);
        drawStringAt(gfxPage, scoreString, 0x131, 0x1e);
        mystrcpy(scoreString, str_otherTargets);
        drawStringAt(gfxPage, scoreString, 0xf0, 0x26);
        my_itoa(groundKilled + airKilled - primaryHit - secondaryHit, scoreString);
        drawStringAt(gfxPage, scoreString, 0x131, 0x26);
        mystrcpy(scoreString, str_enemyPlanes);
        drawStringAt(gfxPage, scoreString, 0xf0, 0x2e);
        my_itoa(samKilled, scoreString);
        drawStringAt(gfxPage, scoreString, 0x131, 0x2e);
        mystrcpy(scoreString, str_friendlyTargets);
        drawStringAt(gfxPage, scoreString, 0xf0, 0x36);
        my_itoa(groundMissed + airMissed + samMissed, scoreString);
        drawStringAt(gfxPage, scoreString, 0x131, 0x36);
        ejectedFlag = 1;
        } // 2fbf
        // 2fca
        if ((items[index].flags & MENUITEM_SPRITE_BLINK) == 0)
            return;
        if (ejectedFlag == 1) {
            ejectedFlag = 0;
            popupVisible = 0;
            gfx_blitSprite(spriteMapArea);
            curRecordIdx = prevDrawX = prevDrawY = 0;
            clearRect(gfxPage, 0xeb, 0x0a, 0x13f, 0x95);
            missionScore = calcMissionScore(SCORE_ALL_EVENTS);
            mystrcpy(scoreString, str_dot5);
            mystrcat(scoreString, str_overall2);
            drawStringCentered(gfxPage, scoreString, 0xe8, 0x64, 0x57);
            mystrcpy(scoreString, str_missionRating2);
            drawStringCentered(gfxPage, scoreString, 0xe8, 0x6c, 0x57);
            mystrcpy(scoreString, str_dot6);
            my_ltoa(missionScore, numBuf);
            mystrcat(scoreString, numBuf);
            drawStringCentered(gfxPage, scoreString, 0xe8, 0x74, 0x57);
        }
        clearRect(gfxPage, 0xeb, 0x0a, 0x13f, 0x63);
        gfxPage[2] = FONT_TITLE;
        mystrcpy(scoreString, str_missionEvent);
        drawStringCentered(gfxPage, scoreString, 0xe8, 0x14, 0x57);
        mystrcpy(scoreString, str_time);
        mystrcat(scoreString, formatFlightTime(flightTimeTable[curRecordIdx * 3], numBuf));
        drawStringAt(gfxPage, scoreString, 0xf0, 0x1e);
        unitIdx = flightRecords[curRecordIdx].unitId & UNIT_ID_MASK;
        switch (flightRecords[curRecordIdx].status & STATUS_TYPE_MASK) {
        case EVENT_AIR_KILL:
        case EVENT_AIR_KILL2:
            if (worldObjects[unitIdx].unitRef != 0) {
                mystrcpy(scoreString, worldStrings[worldObjects[unitIdx].unitRef]);
                mystrcat(scoreString, str_destroyed4);
                mystrcat(scoreString, worldStrings[worldObjects[unitIdx].objectIdx & UNIT_ID_MASK]);
                mystrcat(scoreString, str_destroyed1);
            } else {
                mystrcpy(scoreString, worldStrings[worldObjects[unitIdx].objectIdx & UNIT_ID_MASK]);
                mystrcat(scoreString, str_destroyed2);
            }
            break;
        case EVENT_SAM_KILL:
            mystrcpy(scoreString, planeArray[unitIdx].name);
            mystrcat(scoreString, str_shotDown2);
            mystrcat(scoreString, &planeArray[unitIdx].name[7]);
            mystrcat(scoreString, str_shotDown);
            break;
        case EVENT_GROUND_KILL:
            mystrcpy(scoreString, worldStrings[unitIdx]);
            mystrcat(scoreString, str_destroyed3);
            break;
        case EVENT_WAYPOINT:
            if (worldObjects[unitIdx].unitRef != 0) {
                mystrcpy(scoreString, worldStrings[worldObjects[unitIdx].unitRef]);
                mystrcat(scoreString, str_rearmed3);
                mystrcat(scoreString, worldStrings[worldObjects[unitIdx].objectIdx & UNIT_ID_MASK]);
                mystrcat(scoreString, str_rearmed1);
            } else {
                mystrcpy(scoreString, worldStrings[worldObjects[unitIdx].objectIdx & UNIT_ID_MASK]);
                mystrcat(scoreString, str_rearmed2);
            }
            break;
        case EVENT_BOMB_HIT:
            mystrcpy(scoreString, str_hitBy);
            mystrcat(scoreString, samWeaponTable[unitIdx].name);
            mystrcat(scoreString, str_missile);
            break;
        case EVENT_EJECTED:
            if (curRecordIdx == 0) {
                mystrcpy(scoreString, str_takeoffPoint);
                if (worldObjects[waypointData].unitRef != 0) {
                    mystrcat(scoreString, worldStrings[worldObjects[waypointData].unitRef]);
                } else {
                    mystrcat(scoreString, worldStrings[(unsigned char)worldObjects[waypointData].objectIdx]);
                }
            } else {
                mystrcpy(scoreString, str_missionEnd);
                switch (commData->landingType) {
                case LANDING_CRASHED:
                    mystrcat(scoreString, str_crashed);
                    break;
                case LANDING_EJECTED:
                    if (commData->bailoutSurvived == 0 && missionResult != 0) {
                        mystrcat(scoreString, str_goodBailout);
                    } else if (commData->bailoutSurvived == 0 && missionResult == 0) {
                        mystrcat(scoreString, str_captured);
                    } else {
                        mystrcat(scoreString, str_bailedDied);
                    }
                    break;
                case LANDING_SAFE:
                    mystrcat(scoreString, str_goodLanding);
                    break;
                }
            }
            break;
        }
        drawWrappedText(gfxPage, scoreString, 0x50, 0xf0, 0x26, 8);
        if ((unsigned char)flightRecords[curRecordIdx].status & STATUS_PRIMARY_HIT) {
            mystrcpy(scoreString, str_primaryObj);
            drawStringCentered(gfxPage, scoreString, 0xe8, gfxPage[5], 0x57);
        }
        if ((unsigned char)flightRecords[curRecordIdx].status & STATUS_SECONDARY_HIT) {
            mystrcpy(scoreString, str_secndryObj);
            drawStringCentered(gfxPage, scoreString, 0xe8, gfxPage[5], 0x57);
        }
        missionScore = calcMissionScore(curRecordIdx);
        mystrcpy(scoreString, str_cumulative2);
        mystrcat(scoreString, str_cumulative);
        drawStringCentered(gfxPage, scoreString, 0xe8, 0x46, 0x57);
        mystrcpy(scoreString, str_missionRating3);
        drawStringCentered(gfxPage, scoreString, 0xe8, 0x4e, 0x57);
        mystrcpy(scoreString, str_pressSelect);
        my_ltoa(missionScore, numBuf);
        mystrcat(scoreString, numBuf);
        drawStringCentered(gfxPage, scoreString, 0xe8, 0x56, 0x57);
        showEventPopup();
        mystrcpy(scoreString, prefix);
        mystrcat(scoreString, str_pressNext);
        drawWrappedText(gfxPage, scoreString, 0x50, 0xf0, 0x82, 8);
    } // 35db
}


int drawEventSprite(int recordIdx)
{
    TRACE(("drawEventSprite"));
    switch (flightRecords[recordIdx].status & STATUS_TYPE_MASK) {
        case EVENT_AIR_KILL:
        case EVENT_AIR_KILL2:
        spriteAir->dstX  = mapToScreenX(flightRecords[recordIdx].mapX) + mapViewX1 - 2;
        spriteAir->dstY = mapToScreenY(flightRecords[recordIdx].mapY) + mapViewY1 - 2;
        if (slotInfoTable[(flightRecords[curRecordIdx].unitId & UNIT_ID_MASK) * 16] & 8) {
                    spriteAir->srcX = 0x11e;
        } else {
            spriteAir->srcX = 0x12d;
        }
        return gfx_blitSprite(spriteAir);
    case EVENT_GROUND_KILL:
        spriteGround->dstX  = mapToScreenX(flightRecords[recordIdx].mapX) + mapViewX1 - 2;
        spriteGround->dstY = mapToScreenY(flightRecords[recordIdx].mapY) + mapViewY1 - 2;
        return gfx_blitSprite(spriteGround);
    case EVENT_SAM_KILL:
        spriteSam->dstX  = mapToScreenX(flightRecords[recordIdx].mapX) + mapViewX1 - 2;
        spriteSam->dstY = mapToScreenY(flightRecords[recordIdx].mapY) + mapViewY1 - 2;
        return gfx_blitSprite(spriteSam);
    case EVENT_BOMB_HIT:
        spriteWaypoint->dstX  = mapToScreenX(flightRecords[recordIdx].mapX) + mapViewX1;
        spriteWaypoint->dstY = mapToScreenY(flightRecords[recordIdx].mapY) + mapViewY1;
        return gfx_blitSprite(spriteWaypoint);
    case EVENT_EJECTED:
        spriteSam->dstX  = mapToScreenX(flightRecords[recordIdx].mapX) + mapViewX1 - 2;
        spriteSam->dstY = mapToScreenY(flightRecords[recordIdx].mapY) + mapViewY1 - 2;
        return gfx_blitSprite(spriteSam);
    case EVENT_WAYPOINT:
        spriteWaypoint->dstX  = mapToScreenX(flightRecords[recordIdx].mapX) + mapViewX1;
        spriteWaypoint->dstY = mapToScreenY(flightRecords[recordIdx].mapY) + mapViewY1;
        return gfx_blitSprite(spriteWaypoint);
    }
}


void waitForKeyOrJoy(void);

void animateFlightPath(int16* gfxPage)
{
    char numBuf[22];
    int pad;

    if (popupVisible == 1) {
        gfx_copyRect(1, 0, POPUP_SAVE_Y, 0, popupX, popupY, POPUP_WIDTH, POPUP_HEIGHT);
        popupVisible = 0;
    }
    clearRect(gfxPage, 0xe9, 0x1e, 0x13f, 0x45);
    drawStringAt(gfxPage, str_inFlight, 0xf0, 0x26);
loop_top:
        curRecordIdx++;
        if (flightRecords[curRecordIdx].status & STATUS_TYPE_MASK) {
            if ((flightRecords[curRecordIdx].status & STATUS_TYPE_MASK) == EVENT_TIMESTAMP) {
        clearRect(gfxPage, 0xf0, 0x1e, 0x13f, 0x25);
        mystrcpy(scoreString, str_timeLabel);
        mystrcat(scoreString, formatFlightTime(*((int *)&flightRecords[curRecordIdx] - 1), numBuf));
        drawStringAt(gfxPage, scoreString, 0xf0, 0x1e);
        gfx_setColor(0);
        if (prevDrawX == 0 && prevDrawY == 0) {
            drawFlightLine(flightRecords[0].mapX, flightRecords[0].mapY, flightRecords[curRecordIdx].mapX, flightRecords[curRecordIdx].mapY);
            prevDrawX = flightRecords[curRecordIdx].mapX;
            prevDrawY = flightRecords[curRecordIdx].mapY;
        } else {
            lastDrawX = flightRecords[curRecordIdx].mapX;
            lastDrawY = flightRecords[curRecordIdx].mapY;
            drawFlightLine(lastDrawX, lastDrawY, prevDrawX, prevDrawY);
            prevDrawX = lastDrawX;
            prevDrawY = lastDrawY;
        }
        missionScore = calcMissionScore(curRecordIdx);
        mystrcpy(scoreString, str_timeZeros);
        my_ltoa(missionScore, numBuf);
        mystrcat(scoreString, numBuf);
        clearRect(gfxPage, 0xe8, 0x56, 0x13f, 0x5e);
        drawStringCentered(gfxPage, scoreString, 0xe8, 0x56, 0x57);
        timerCounter = 0;
wait_loop:
        if (timerCounter <= 5) goto wait_loop;
                goto loop_top;
            }
        }
done:
    if (!(flightRecords[curRecordIdx].status & STATUS_TYPE_MASK)) {
        curRecordIdx--;
    }
    gfx_setColor(0);
    if (prevDrawX == 0 && prevDrawY == 0) {
        drawFlightLine(flightRecords[0].mapX, flightRecords[0].mapY, flightRecords[curRecordIdx].mapX, flightRecords[curRecordIdx].mapY);
        prevDrawX = flightRecords[curRecordIdx].mapX;
        prevDrawY = flightRecords[curRecordIdx].mapY;
    } else {
        lastDrawX = flightRecords[curRecordIdx].mapX;
        lastDrawY = flightRecords[curRecordIdx].mapY;
        drawFlightLine(lastDrawX, lastDrawY, prevDrawX, prevDrawY);
        prevDrawX = lastDrawX;
        prevDrawY = lastDrawY;
    }
}

unsigned int drawFlightPath(int16 *gfxPage, unsigned int maxRecord) {
    int curX;
    int recIdx;
    int prevX;
    int curY;
    int prevY;
    recIdx = -1;
    while (++recIdx, (flightRecords[recIdx].status & STATUS_TYPE_MASK) != 0 && (unsigned)recIdx <= maxRecord) {
        gfx_setColor(0);
        if (recIdx == 0) {
            plotMapPoint(flightRecords[0].mapX, flightRecords[0].mapY, 0, 0);
            prevX = flightRecords[0].mapX;
            prevY = flightRecords[0].mapY;
        } else {
            curX = flightRecords[recIdx].mapX;
            curY = flightRecords[recIdx].mapY;
            drawFlightLine(curX, curY, prevX, prevY);
            prevX = curX;
            prevY = curY;
        }
    }
    recIdx = -1;
    while (++recIdx, (flightRecords[recIdx].status & STATUS_TYPE_MASK) != 0 && (unsigned)recIdx <= maxRecord) {
        if ((flightRecords[recIdx].status & STATUS_TYPE_MASK) != EVENT_TIMESTAMP) {
            drawEventSprite(recIdx);
        }
    }
    recIdx--;
    return recIdx;
}

char *formatFlightTime(int timeValue, char *buffer) {
    int hours;
    int miscBits;
    int minutes;
    int seconds;

    miscBits = target1MiscBits[0] + target2MiscBits[0];
    nightMission = ((char)miscBits & 3) == 0;
    if (target1Type[0] == 1 || target2Type[0] == 1) {
        nightMission = 0;
    }
    if (target1Type[0] == 4 || target2Type[0] == 4) {
        nightMission = 1;
    }
    timeValue += (miscBits & 0xF) << 8;
    mystrcpy(buffer, str_timeFormat);
    hours = (unsigned)timeValue / 0x708;
    buffer[0] += nightMission + 1;
    buffer[1] += hours % 10;
    minutes = ((unsigned)timeValue / 30) % 60;
    buffer[3] += minutes / 10;
    buffer[4] += minutes % 10;
    seconds = ((unsigned)timeValue * 2) % 60;
    buffer[6] += seconds / 10;
    buffer[7] += seconds % 10;
    return buffer;
}

int mapToScreenX(unsigned char mapCoord) {
    TRACE(("mapToScreenX"));
    return ((unsigned int)mapCoord << 7) / MAP_SCALE_X;
}

int mapToScreenY(unsigned char mapCoord) {
    TRACE(("mapToScreenY"));
    return ((unsigned int)mapCoord << 7) / MAP_SCALE_Y;
}

void plotMapPoint(int x, int y, int color, int unused) {
    int sx;
    int sy;
    (void)unused;
    TRACE(("plotMapPoint"));
    sx = mapToScreenX(x);
    sy = mapToScreenY(y);
    if (color != -1 &&
        (unsigned)sx >= (unsigned)mapViewX1 &&
        (unsigned)sx < (unsigned)mapViewX2 &&
        (unsigned)sy >= (unsigned)mapViewY1 &&
        (unsigned)sy < (unsigned)mapViewY2) {
        drawMapPixel(sx, sy, color);
    }
}

void timerWait(unsigned int ticks) {
    TRACE(("timerWait"));
    timerCounter = 0;
    setTimerIrqHandler();
    while (ticks >= timerCounter)
        ;
    restoreTimerIrqHandler();
}

void drawFlightLine(int p1, int p2, int p3, int p4)
{
    TRACE(("drawFlightLine"));
    drawClippedLineEx(mapToScreenX(p1), mapToScreenY(p2), mapToScreenX(p3), mapToScreenY(p4), mapViewX1, mapViewX2, mapViewY1, mapViewY2, 1);
}

void drawClippedLine(int x1, int y1, int x2, int y2) {
    TRACE(("drawClippedLine"));
    drawClippedLineEx(x1, y1, x2, y2, mapViewX1, mapViewX2, mapViewY1, mapViewY2, 1);
}

void drawClippedLineEx(int x1, int y1, int x2, int y2, int cx1, int cy1, int cx2, int cy2, int flag) {
    int w, h;
    (void)flag;
    TRACE(("drawClippedLineEx"));
    w = cy1 - cx1;
    h = cy2 - cx2;
    gfx_setBlitOffset(gfx_calcRowAddr(cx1, cx2));
    clipMaxX = w - 1;
    clipMaxY = h - 1;
    gfx_setOvlVal1(clipMaxY);
    gfx_setOvlVal2(clipMaxX);
    lineX1 = x1;
    lineY1 = y1;
    lineX2 = x2;
    lineY2 = y2;
    drawLineWrapper();
    gfx_nop23();
    clipMaxX = 0x13f;
    clipMaxY = 0xc7;
    gfx_setOvlVal1(0xc7);
    gfx_setOvlVal2(clipMaxX);
    gfx_setBlitOffset(0);
}

void drawMapPixel(int x, int y, int color) {
    TRACE(("drawMapPixel"));
    drawClippedLine(x, y, x, y);
}

long calcMissionScore(int param) {
    int weaponCount;
    int a;
    int recIdx;
    int ejected;
    long score;
    int unitId;
    int waypointCount;

    samKilled = groundKilled = samMissed = groundMissed = airKilled = airMissed = primaryHit = secondaryHit = ejected = 0;
    waypointCount = 1;
    score = 0;

    weaponCount = commData->weaponCount[0];
    if (weaponCount > 15) {
        weaponCount = 15;
    }

    for (recIdx = 0; (unsigned)recIdx <= (unsigned)param && flightRecords[recIdx].status; recIdx++) {
        unitId = flightRecords[recIdx].unitId;
        switch (flightRecords[recIdx].status & STATUS_TYPE_MASK) {
        case EVENT_EJECTED:
            if (recIdx != 0) {
                ejected = 1;
            }
            break;
        case EVENT_AIR_KILL:
        case EVENT_AIR_KILL2:
            if (flightRecords[recIdx].status & STATUS_PRIMARY_HIT) {
                primaryHit = 1;
                airKilled++;
            } else if (flightRecords[recIdx].status & STATUS_SECONDARY_HIT) {
                secondaryHit = 1;
                airKilled++;
            } else if (unitTypeTable[unitId & UNIT_ID_MASK] & 0x40) {
                airMissed++;
            } else if (!(*(int *)&slotInfoTable[unitId * 16] & 0x500)) {
                airKilled++;
            } else {
                airMissed++;
            }
            break;
        case EVENT_SAM_KILL:
            if (flightRecords[recIdx].status & STATUS_PRIMARY_HIT) {
                primaryHit = 1;
                samKilled++;
            } else if (flightRecords[recIdx].status & STATUS_SECONDARY_HIT) {
                secondaryHit = 1;
                samKilled++;
            } else if (planeArray[(unitId & UNIT_ID_MASK) + 1].validFlag == -1) {
                samMissed++;
            } else {
                samKilled++;
            }
            break;
        case EVENT_GROUND_KILL:
            if (flightRecords[recIdx].status & STATUS_PRIMARY_HIT) {
                primaryHit = 1;
                groundKilled++;
            } else if (flightRecords[recIdx].status & STATUS_SECONDARY_HIT) {
                secondaryHit = 1;
                groundKilled++;
            } else if (unitTypeTable[unitId & UNIT_ID_MASK] & 0x40) {
                groundMissed++;
            } else {
                if (!((gridFlags[(((flightRecords[recIdx].mapY & 0xff) >> 4) << 4) + ((unsigned char)flightRecords[recIdx].mapX >> 4)]) & 3)) {
                    groundKilled++;
                } else {
                    groundMissed++;
                }
            }
            break;
        case EVENT_WAYPOINT:
            waypointCount++;
            break;
        }
    }

    score = (long)((airKilled - airMissed * 2) * weaponCount * 25)
      + (long)((samKilled - samMissed * 2) * (gameData->difficulty + 1) * 50)
      + (long)((groundKilled - groundMissed * 2) * weaponCount * 20)
      + (long)(weaponCount * primaryHit * 200)
      + (long)(weaponCount * secondaryHit * 100);

    score = score * 2 / (waypointCount + 1);

    if (ejected != 0) {
        if (score < 0) {
            score = 0;
        }
        switch (commData->landingType) {
        case LANDING_CRASHED:
            score /= 2;
            break;
        case LANDING_EJECTED:
            score = score * 3 / 4;
            break;
        }
    }

    return score;
}

void showEventPopup(void) {
    int spriteIdx;

    if (popupVisible == 1) {
        gfx_copyRect(1, 0, POPUP_SAVE_Y, 0, popupX, popupY, POPUP_WIDTH, POPUP_HEIGHT);
        popupVisible = 0;
    }
    spriteIdx = flightRecords[curRecordIdx].status & STATUS_TYPE_MASK;
    switch (spriteIdx) {
    case EVENT_AIR_KILL:
        if (slotInfoTable[(flightRecords[curRecordIdx].unitId & UNIT_ID_MASK) * 16] & 8) {
                    spriteIdx = 0xf;
        } else {
            spriteIdx = 0;
        }
        break;
    case EVENT_AIR_KILL2:
        spriteIdx = 2;
        break;
    case EVENT_SAM_KILL:
        spriteIdx = 1;
        break;
    case EVENT_GROUND_KILL:
        spriteIdx = 2;
        break;
    case EVENT_BOMB_HIT:
        spriteIdx = 3;
        break;
    case EVENT_EJECTED:
        if (curRecordIdx == 0) {
            spriteIdx = 8;
        } else {
            if (commData->landingType == LANDING_SAFE) {
                ejectedFlag = 1;
                spriteIdx = 7;
            } else if (commData->landingType == LANDING_CRASHED) {
                ejectedFlag = 1;
                spriteIdx = 0xe;
            } else if (missionResult == 0) {
                ejectedFlag = 1;
                spriteIdx = 0xb;
            } else {
                ejectedFlag = 1;
                spriteIdx = 0xd;
            }
        }
        break;
    case EVENT_WAYPOINT:
        spriteIdx = 0xa;
        break;
    }
    if ((unsigned)(mapToScreenX(flightRecords[curRecordIdx].mapX) + mapViewX1) < 0x73 &&
        (unsigned)(mapToScreenY(flightRecords[curRecordIdx].mapY) + mapViewY1) < 0x59) {
        popupX = mapToScreenX(flightRecords[curRecordIdx].mapX) + mapViewX1 + 10;
        popupY = mapToScreenY(flightRecords[curRecordIdx].mapY) + mapViewY1 + 10;
    } else if ((unsigned)(mapToScreenX(flightRecords[curRecordIdx].mapX) + mapViewX1) >= 0x73 &&
               (unsigned)(mapToScreenY(flightRecords[curRecordIdx].mapY) + mapViewY1) < 0x59) {
        popupX = mapToScreenX(flightRecords[curRecordIdx].mapX) + mapViewX1 - 0x3a;
        popupY = mapToScreenY(flightRecords[curRecordIdx].mapY) + mapViewY1 + 10;
    } else if ((unsigned)(mapToScreenX(flightRecords[curRecordIdx].mapX) + mapViewX1) >= 0x73 &&
               (unsigned)(mapToScreenY(flightRecords[curRecordIdx].mapY) + mapViewY1) >= 0x59) {
        popupX = mapToScreenX(flightRecords[curRecordIdx].mapX) + mapViewX1 - 0x3a;
        popupY = mapToScreenY(flightRecords[curRecordIdx].mapY) + mapViewY1 - 0x28;
    } else {
        popupX = mapToScreenX(flightRecords[curRecordIdx].mapX) + mapViewX1 + 10;
        popupY = mapToScreenY(flightRecords[curRecordIdx].mapY) + mapViewY1 - 0x28;
    }
    gfx_copyRect(0, popupX, popupY, 1, 0, POPUP_SAVE_Y, POPUP_WIDTH, POPUP_HEIGHT);
    gfx_copyRect(1, popupSpriteX[spriteIdx], popupSpriteY[spriteIdx], 0, popupX, popupY, POPUP_WIDTH, POPUP_HEIGHT);
    popupVisible = 1;
}
