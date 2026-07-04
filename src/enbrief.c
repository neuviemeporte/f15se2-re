/* enbrief.c — debrief UI, compiled with /Gs /Zi */
#include "slot.h"
#include <dos.h>
#include "offsets.h"
#include "pointers.h"
#include "log.h"
#include "shared/common.h"
#include "endtypes.h"
#include "endata.h"
#include "endcode.h"
#include "enbrief.h"
#include "eninput.h"
#include "entext.h"

/* Private helpers for this translation unit. */
int16 mapToScreenY(uint8 mapCoord);
int16 mapToScreenX(uint8 mapCoord);
void drawClippedLineEx(int16 x1, int16 y1, int16 x2, int16 y2, int16 cx1, int16 cy1, int16 cx2, int16 cy2, int16 flag);
void drawClippedLine(int16 x1, int16 y1, int16 x2, int16 y2);
int16 drawEventSprite(int16 recordIdx);
void drawMapPixel(int16 x, int16 y, int16 color);
int16 isPointInRect(const struct MenuItem *p);
void blinkWidget(MenuItem *item, int16 *gfxPage);
uint16 drawFlightPath(int16 *gfxPage, uint16 maxRecord);
void showEventPopup(void);
void drawFlightLine(int16 p1, int16 p2, int16 p3, int16 p4);
char *formatFlightTime(int16 timeValue, char *buffer);
void plotMapPoint(int16 x, int16 y, int16 color, int16 unused);
void timerWait(uint16 ticks);
void processDebriefInput(const int16 *cursorBounds, const MenuItem *menuItem, int16 *gfxPage);
void drawMenuItem(const MenuItem *items, uint16 index, int16 *gfxPage);

void computeMissionResult(void) {
    uint16 gridX, gridY;

    gridX = commData->worldX >> 0x0b;
    gridY = commData->worldY >> 0x0b;
    missionResult = gridFlags[gridX + gridY * 16] & 3;
}

void processMenuItems(MenuItem *items, int16 unused, int16 itemCount, int16 cursorStartX, int16 cursorStartY, int16 *gfxPage) {
    char p[2];
    char a[2];
    char c[2];
    int16 idx;
    char f[2];
    (void)unused;
    p[0] = 0x0d;
    p[1] = 0;
    c[0] = 0x89;
    c[1] = 0;
    a[0] = 0x8d;
    a[1] = 0;
    f[0] = 0x80;
    f[1] = 0;
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
int16 selectMenuItem(MenuItem *items, int16 unused, int16 itemCount, int16 *inputState, int16 *gfxPage) {
    char p[2];
    int16 toColor;
    int16 fromColor;
    char c[2];
    char e[2];
    int16 groupIdx;
    char h[2];
    int16 curIdx;
    (void)unused;
    p[0] = 0x0d;
    p[1] = 0;
    e[0] = 0x89;
    e[1] = 0;
    c[0] = 0x8d;
    c[1] = 0;
    h[0] = 0x80;
    h[1] = 0;
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
        if (enterPressed != 0) {              // 22f2
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

void blinkWidget(MenuItem *item, int16 *gfxPage) {
    int16 toColor;
    int16 fromColor;
    if (item->state == 0) {
        item->state = 1;
        fromColor = (uint16)item->colorPair >> 4;
        toColor = item->colorPair & 0xF;
        if (item->colorPair != 0) {
            gfx_switchColor(gfxPage, item->colorX1, item->colorY1, item->colorX2, item->colorY2, fromColor, toColor);
        }
    } else {
        item->state = 0;
        fromColor = item->colorPair & 0xF;
        toColor = (uint16)item->colorPair >> 4;
    }
    if (item->colorPair != 0) {
        gfx_switchColor(gfxPage, item->colorX1, item->colorY1, item->colorX2, item->colorY2, fromColor, toColor);
    }
}

int16 isPointInRect(const MenuItem *p) {
    if (p->hitX1 <= cursorX && p->hitX2 >= cursorX && p->hitY1 <= cursorY && p->hitY2 >= cursorY)
        return 1;
    else
        return 0;
}

/*static*/ void processDebriefInput(const int16 *cursorBounds, const MenuItem *menuItem, int16 *gfxPage) {
    int16 fromColor, toColor, joyBtn0, joyBtn1;
    char repeatActive;
    int16 keycode;

    colorTablePtr = (uint16 *)((char *)colorStyleTable + menuItem->colorTableIdx * 14);
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
        if ((char)misc_checkKeyBuf() == 0 || joyBtn0 != 0 || joyBtn1 != 0 || joyAxisX < JOY_DEADZONE_LO || joyAxisX > JOY_DEADZONE_HI || joyAxisY < JOY_DEADZONE_LO || joyAxisY > JOY_DEADZONE_HI) {
            if (repeatActive != 1)
                break;
        }
        /* joystick repeat handling */
        if (joyRepeatFlag == 1) {
            if (timerCounter > 15) {
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
                colorAnimIdx = (uint16)colorAnimIdx % *colorTablePtr;
            }
        }

        /* sprite section */
        if (!(menuItem->flags & MENUITEM_HAS_SPRITE)) goto skip_sprite;
        if (!(menuItem->flags & MENUITEM_SPRITE_BLINK)) goto skip_sprite;
        if (timerCounter3 <= 18) goto skip_sprite;
        timerCounter3 = 0;
        if (spriteToggle != 0) {
            switch (flightRecords[curRecordIdx].status & STATUS_TYPE_MASK) {
            case EVENT_AIR_KILL:
            case EVENT_AIR_KILL2:
                spriteAirBlink->dstX = mapToScreenX(flightRecords[curRecordIdx].mapX) + mapViewX1 - 2;
                spriteAirBlink->dstY = mapToScreenY(flightRecords[curRecordIdx].mapY) + mapViewY1 - 2;
                if (slotInfoTable[(flightRecords[curRecordIdx].unitId & UNIT_ID_MASK) << 4] & 8) {
                    spriteAirBlink->srcX = 286;
                } else {
                    spriteAirBlink->srcX = 301;
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
    skip_sprite:;
    }

    /* post-loop input handling */
    if ((char)misc_checkKeyBuf() == 0) {
        keycode = misc_getKey();
    } else {
        if (joyBtn0 == 1) {
            keycode = KEYCODE_ENTER;
        } else if (joyBtn1 == 1) {
            keycode = KEYCODE_ESC;
        } else if (joyAxisX < JOY_DEADZONE_LO) {
            keycode = KEYCODE_LEFTARROW;
            joyRepeatFlag = 1;
        } else if (joyAxisX > JOY_DEADZONE_HI) {
            keycode = KEYCODE_RIGHTARROW;
            joyRepeatFlag = 1;
        } else if (joyAxisY < JOY_DEADZONE_LO) {
            keycode = KEYCODE_UPARROW;
            joyRepeatFlag = 1;
        } else if (joyAxisY > JOY_DEADZONE_HI) {
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
        if (cursorBounds[4] > (int16)cursorY) {
            cursorY = cursorBounds[4];
        }
        inputChanged = 1;
    }
    if (keycode == KEYCODE_DNARROW) {
        cursorY += cursorBounds[1];
        if (cursorY > cursorBounds[5]) {
            cursorY = cursorBounds[5];
        }
        inputChanged = 1;
    }
    if (keycode == KEYCODE_RIGHTARROW) {
        cursorX += cursorBounds[0];
        if (cursorX > cursorBounds[3]) {
            cursorX = cursorBounds[3];
        }
        inputChanged = 1;
    }
    if (keycode == KEYCODE_LEFTARROW) {
        cursorX -= cursorBounds[0];
        if (cursorBounds[2] > (int16)cursorX) {
            cursorX = cursorBounds[2];
        }
        if (cursorBounds[4] > (int16)cursorY) {
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
void drawMenuItem(const MenuItem *items, uint16 index, int16 *gfxPage) {
    char p[2];
    char a[2];
    char prefix[2];
    char d[2];
    int16 m;
    char numBuf[4];
    uint16 unitIdx;
    p[0] = 0x0a;
    p[1] = 0;
    prefix[0] = 0x89;
    prefix[1] = 0;
    a[0] = 0x8d;
    a[1] = 0;
    d[0] = 0x80;
    d[1] = 0;
    // 2c07
    if ((items[index].flags & MENUITEM_HAS_SPRITE) != 0) {
        // 2c1d
        if ((items[index].flags & MENUITEM_TYPE_MASK) == 7) {
            /* Section 1: mission complete display */
            clearRect(gfxPage, 235, 10, 319, 149);
            gfxPage[2] = 0;
            mystrcpy(scoreString, prefix);
            mystrcat(scoreString, "Press Selector to exit Debriefing");
            drawWrappedText(gfxPage, scoreString, 80, 240, 130, 8);
            clearRect(gfxPage, 240, 100, 300, 126);
            if (popupVisible == 1) {
                gfx_copyRect(1, 0, POPUP_SAVE_Y, 0, popupX, popupY, POPUP_WIDTH, POPUP_HEIGHT);
                popupVisible = 0;
            }
            curRecordIdx = 0;
            totalFlightRecords = drawFlightPath(gfxPage, ALL_RECORDS);
            missionScore = calcMissionScore(totalFlightRecords);
            mystrcpy(scoreString, "\x8d");
            mystrcat(scoreString, "OVERALL");
            drawStringCentered(gfxPage, scoreString, 232, 70, 87);
            mystrcpy(scoreString, "MISSION RATING");
            drawStringCentered(gfxPage, scoreString, 232, 78, 87);
            mystrcpy(scoreString, "\x80");
            my_ltoa(missionScore, numBuf);
            mystrcat(scoreString, numBuf);
            drawStringCentered(gfxPage, scoreString, 232, 86, 87);
            if (commData->trainingFlag != 0) {
                drawStringCentered(gfxPage, "\x84Training Score", 232, 96, 87);
                drawStringCentered(gfxPage, "NOT Recorded !", 232, 104, 87);
            } else {
                mystrcpy(scoreString, "\x8d");
                mystrcat(scoreString, "CAREER TOTAL");
                drawStringCentered(gfxPage, scoreString, 232, 108, 87);
                mystrcpy(scoreString, "\x80");
                my_ltoa(gameData->totalScore + missionScore, numBuf);
                mystrcat(scoreString, numBuf);
                drawStringCentered(gfxPage, scoreString, 232, 116, 87);
            }
            gfxPage[2] = FONT_TITLE;
            mystrcpy(scoreString, "MISSION SUMMARY");
            drawStringCentered(gfxPage, scoreString, 232, 20, 87);
            gfxPage[2] = 0;
            mystrcpy(scoreString, "Pri/Sec Targets");
            drawStringAt(gfxPage, scoreString, 240, 30);
            my_itoa(primaryHit + secondaryHit, scoreString);
            drawStringAt(gfxPage, scoreString, 305, 30);
            mystrcpy(scoreString, "Other Targets");
            drawStringAt(gfxPage, scoreString, 240, 38);
            my_itoa(groundKilled + airKilled - primaryHit - secondaryHit, scoreString);
            drawStringAt(gfxPage, scoreString, 305, 38);
            mystrcpy(scoreString, "Enemy Planes");
            drawStringAt(gfxPage, scoreString, 240, 46);
            my_itoa(samKilled, scoreString);
            drawStringAt(gfxPage, scoreString, 305, 46);
            mystrcpy(scoreString, "Friendly Targets");
            drawStringAt(gfxPage, scoreString, 240, 54);
            my_itoa(groundMissed + airMissed + samMissed, scoreString);
            drawStringAt(gfxPage, scoreString, 305, 54);
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
            clearRect(gfxPage, 235, 10, 319, 149);
            missionScore = calcMissionScore(SCORE_ALL_EVENTS);
            mystrcpy(scoreString, "\x8d");
            mystrcat(scoreString, "OVERALL");
            drawStringCentered(gfxPage, scoreString, 232, 100, 87);
            mystrcpy(scoreString, "MISSION RATING");
            drawStringCentered(gfxPage, scoreString, 232, 108, 87);
            mystrcpy(scoreString, "\x80");
            my_ltoa(missionScore, numBuf);
            mystrcat(scoreString, numBuf);
            drawStringCentered(gfxPage, scoreString, 232, 116, 87);
        }
        clearRect(gfxPage, 235, 10, 319, 99);
        gfxPage[2] = FONT_TITLE;
        mystrcpy(scoreString, "MISSION EVENT");
        drawStringCentered(gfxPage, scoreString, 232, 20, 87);
        mystrcpy(scoreString, "TIME: \x80");
        mystrcat(scoreString, formatFlightTime(flightTimeTable[curRecordIdx * 3], numBuf));
        drawStringAt(gfxPage, scoreString, 240, 30);
        unitIdx = flightRecords[curRecordIdx].unitId & UNIT_ID_MASK;
        switch (flightRecords[curRecordIdx].status & STATUS_TYPE_MASK) {
        case EVENT_AIR_KILL:
        case EVENT_AIR_KILL2:
            if (worldObjects[unitIdx].unitRef != 0) {
                mystrcpy(scoreString, worldStrings[worldObjects[unitIdx].unitRef]);
                mystrcat(scoreString, " ");
                mystrcat(scoreString, worldStrings[worldObjects[unitIdx].objectIdx & UNIT_ID_MASK]);
                mystrcat(scoreString, " destroyed");
            } else {
                mystrcpy(scoreString, worldStrings[worldObjects[unitIdx].objectIdx & UNIT_ID_MASK]);
                mystrcat(scoreString, " destroyed");
            }
            break;
        case EVENT_SAM_KILL:
            mystrcpy(scoreString, planeArray[unitIdx].name);
            mystrcat(scoreString, " ");
            mystrcat(scoreString, &planeArray[unitIdx].name[7]);
            mystrcat(scoreString, " shot down");
            break;
        case EVENT_GROUND_KILL:
            mystrcpy(scoreString, worldStrings[unitIdx]);
            mystrcat(scoreString, " destroyed");
            break;
        case EVENT_WAYPOINT:
            if (worldObjects[unitIdx].unitRef != 0) {
                mystrcpy(scoreString, worldStrings[worldObjects[unitIdx].unitRef]);
                mystrcat(scoreString, " ");
                mystrcat(scoreString, worldStrings[worldObjects[unitIdx].objectIdx & UNIT_ID_MASK]);
                mystrcat(scoreString, " - Rearmed/Refueled");
            } else {
                mystrcpy(scoreString, worldStrings[worldObjects[unitIdx].objectIdx & UNIT_ID_MASK]);
                mystrcat(scoreString, " - Rearmed/Refueled");
            }
            break;
        case EVENT_BOMB_HIT:
            mystrcpy(scoreString, "Hit by ");
            mystrcat(scoreString, samWeaponTable[unitIdx].name);
            mystrcat(scoreString, " missile");
            break;
        case EVENT_EJECTED:
            if (curRecordIdx == 0) {
                mystrcpy(scoreString, "Takeoff point:");
                if (worldObjects[targetBlock.waypointData].unitRef != 0) {
                    mystrcat(scoreString, worldStrings[worldObjects[targetBlock.waypointData].unitRef]);
                } else {
                    mystrcat(scoreString, worldStrings[(uint8)worldObjects[targetBlock.waypointData].objectIdx]);
                }
            } else {
                mystrcpy(scoreString, "Mission end:\n");
                switch (commData->landingType) {
                case LANDING_CRASHED:
                    mystrcat(scoreString, "Crashed");
                    break;
                case LANDING_EJECTED:
                    if (commData->bailoutSurvived == 0 && missionResult != 0) {
                        mystrcat(scoreString, "Good Bailout");
                    } else if (commData->bailoutSurvived == 0 && missionResult == 0) {
                        mystrcat(scoreString, "Captured");
                    } else {
                        mystrcat(scoreString, "Bailed & Died");
                    }
                    break;
                case LANDING_SAFE:
                    mystrcat(scoreString, "Good Landing");
                    break;
                }
            }
            break;
        }
        drawWrappedText(gfxPage, scoreString, 80, 240, 38, 8);
        if ((uint8)flightRecords[curRecordIdx].status & STATUS_PRIMARY_HIT) {
            mystrcpy(scoreString, "\x8c"
                                  "PRIMARY OBJECTIVE");
            drawStringCentered(gfxPage, scoreString, 232, gfxPage[5], 87);
        }
        if ((uint8)flightRecords[curRecordIdx].status & STATUS_SECONDARY_HIT) {
            mystrcpy(scoreString, "\x8c"
                                  "SECNDRY OBJECTIVE");
            drawStringCentered(gfxPage, scoreString, 232, gfxPage[5], 87);
        }
        missionScore = calcMissionScore(curRecordIdx);
        mystrcpy(scoreString, "\x8d");
        mystrcat(scoreString, "CUMULATIVE");
        drawStringCentered(gfxPage, scoreString, 232, 70, 87);
        mystrcpy(scoreString, "MISSION RATING");
        drawStringCentered(gfxPage, scoreString, 232, 78, 87);
        mystrcpy(scoreString, "\x80");
        my_ltoa(missionScore, numBuf);
        mystrcat(scoreString, numBuf);
        drawStringCentered(gfxPage, scoreString, 232, 86, 87);
        showEventPopup();
        mystrcpy(scoreString, prefix);
        mystrcat(scoreString, "Press Selector for next mission event");
        drawWrappedText(gfxPage, scoreString, 80, 240, 130, 8);
    } // 35db
}

int16 drawEventSprite(int16 recordIdx) {
    switch (flightRecords[recordIdx].status & STATUS_TYPE_MASK) {
    case EVENT_AIR_KILL:
    case EVENT_AIR_KILL2:
        spriteAir->dstX = mapToScreenX(flightRecords[recordIdx].mapX) + mapViewX1 - 2;
        spriteAir->dstY = mapToScreenY(flightRecords[recordIdx].mapY) + mapViewY1 - 2;
        if (slotInfoTable[(flightRecords[curRecordIdx].unitId & UNIT_ID_MASK) * 16] & 8) {
            spriteAir->srcX = 286;
        } else {
            spriteAir->srcX = 301;
        }
        return gfx_blitSprite(spriteAir);
    case EVENT_GROUND_KILL:
        spriteGround->dstX = mapToScreenX(flightRecords[recordIdx].mapX) + mapViewX1 - 2;
        spriteGround->dstY = mapToScreenY(flightRecords[recordIdx].mapY) + mapViewY1 - 2;
        return gfx_blitSprite(spriteGround);
    case EVENT_SAM_KILL:
        spriteSam->dstX = mapToScreenX(flightRecords[recordIdx].mapX) + mapViewX1 - 2;
        spriteSam->dstY = mapToScreenY(flightRecords[recordIdx].mapY) + mapViewY1 - 2;
        return gfx_blitSprite(spriteSam);
    case EVENT_BOMB_HIT:
        spriteWaypoint->dstX = mapToScreenX(flightRecords[recordIdx].mapX) + mapViewX1;
        spriteWaypoint->dstY = mapToScreenY(flightRecords[recordIdx].mapY) + mapViewY1;
        return gfx_blitSprite(spriteWaypoint);
    case EVENT_EJECTED:
        spriteSam->dstX = mapToScreenX(flightRecords[recordIdx].mapX) + mapViewX1 - 2;
        spriteSam->dstY = mapToScreenY(flightRecords[recordIdx].mapY) + mapViewY1 - 2;
        return gfx_blitSprite(spriteSam);
    case EVENT_WAYPOINT:
        spriteWaypoint->dstX = mapToScreenX(flightRecords[recordIdx].mapX) + mapViewX1;
        spriteWaypoint->dstY = mapToScreenY(flightRecords[recordIdx].mapY) + mapViewY1;
        return gfx_blitSprite(spriteWaypoint);
    }
}

void waitForKeyOrJoy(void);

void animateFlightPath(int16 *gfxPage) {
    char numBuf[22];
    int16 pad;

    if (popupVisible == 1) {
        gfx_copyRect(1, 0, POPUP_SAVE_Y, 0, popupX, popupY, POPUP_WIDTH, POPUP_HEIGHT);
        popupVisible = 0;
    }
    clearRect(gfxPage, 233, 30, 319, 69);
    drawStringAt(gfxPage, "\x80"
                          "In-Flight",
                 240, 38);
loop_top:
    curRecordIdx++;
    if (flightRecords[curRecordIdx].status & STATUS_TYPE_MASK) {
        if ((flightRecords[curRecordIdx].status & STATUS_TYPE_MASK) == EVENT_TIMESTAMP) {
            clearRect(gfxPage, 240, 30, 319, 37);
            mystrcpy(scoreString, "\x8d"
                                  "TIME: \x80");
            mystrcat(scoreString, formatFlightTime(flightTimeTable[curRecordIdx * 3], numBuf));
            drawStringAt(gfxPage, scoreString, 240, 30);
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
            mystrcpy(scoreString, "\x80");
            my_ltoa(missionScore, numBuf);
            mystrcat(scoreString, numBuf);
            clearRect(gfxPage, 232, 86, 319, 94);
            drawStringCentered(gfxPage, scoreString, 232, 86, 87);
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

uint16 drawFlightPath(int16 *gfxPage, uint16 maxRecord) {
    int16 curX, recIdx, prevX, curY, prevY;
    recIdx = -1;
    while (++recIdx, (flightRecords[recIdx].status & STATUS_TYPE_MASK) != 0 && (uint16)recIdx <= maxRecord) {
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
    while (++recIdx, (flightRecords[recIdx].status & STATUS_TYPE_MASK) != 0 && (uint16)recIdx <= maxRecord) {
        if ((flightRecords[recIdx].status & STATUS_TYPE_MASK) != EVENT_TIMESTAMP) {
            drawEventSprite(recIdx);
        }
    }
    recIdx--;
    return recIdx;
}

char *formatFlightTime(int16 timeValue, char *buffer) {
    int16 hours, miscBits, minutes, seconds;

    miscBits = targetBlock.target1MiscBits[0] + targetBlock.target2MiscBits[0];
    nightMission = ((char)miscBits & 3) == 0;
    if (targetBlock.target1Type[0] == 1 || targetBlock.target2Type[0] == 1) {
        nightMission = 0;
    }
    if (targetBlock.target1Type[0] == 4 || targetBlock.target2Type[0] == 4) {
        nightMission = 1;
    }
    timeValue += (miscBits & 0xF) << 8;
    mystrcpy(buffer, "00:00:00");
    hours = (uint16)timeValue / 1800;
    buffer[0] += nightMission + 1;
    buffer[1] += hours % 10;
    minutes = ((uint16)timeValue / 30) % 60;
    buffer[3] += minutes / 10;
    buffer[4] += minutes % 10;
    seconds = ((uint16)timeValue * 2) % 60;
    buffer[6] += seconds / 10;
    buffer[7] += seconds % 10;
    return buffer;
}

int16 mapToScreenX(uint8 mapCoord) {
    return ((uint16)mapCoord << 7) / MAP_SCALE_X;
}

int16 mapToScreenY(uint8 mapCoord) {
    return ((uint16)mapCoord << 7) / MAP_SCALE_Y;
}

void plotMapPoint(int16 x, int16 y, int16 color, int16 unused) {
    int16 sx, sy;
    (void)unused;
    sx = mapToScreenX(x);
    sy = mapToScreenY(y);
    if (color != -1 &&
        (uint16)sx >= (uint16)mapViewX1 &&
        (uint16)sx < (uint16)mapViewX2 &&
        (uint16)sy >= (uint16)mapViewY1 &&
        (uint16)sy < (uint16)mapViewY2) {
        drawMapPixel(sx, sy, color);
    }
}

void timerWait(uint16 ticks) {
    timerCounter = 0;
    setTimerIrqHandler();
    while (ticks >= timerCounter);
    restoreTimerIrqHandler();
}

void drawFlightLine(int16 p1, int16 p2, int16 p3, int16 p4) {
    drawClippedLineEx(mapToScreenX(p1), mapToScreenY(p2), mapToScreenX(p3), mapToScreenY(p4), mapViewX1, mapViewX2, mapViewY1, mapViewY2, 1);
}

void drawClippedLine(int16 x1, int16 y1, int16 x2, int16 y2) {
    drawClippedLineEx(x1, y1, x2, y2, mapViewX1, mapViewX2, mapViewY1, mapViewY2, 1);
}

void drawClippedLineEx(int16 x1, int16 y1, int16 x2, int16 y2, int16 cx1, int16 cy1, int16 cx2, int16 cy2, int16 flag) {
    int16 w, h;
    (void)flag;
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
    clipMaxX = 319;
    clipMaxY = 199;
    gfx_setOvlVal1(199);
    gfx_setOvlVal2(clipMaxX);
    gfx_setBlitOffset(0);
}

void drawMapPixel(int16 x, int16 y, int16 color) {
    drawClippedLine(x, y, x, y);
}

int32 calcMissionScore(int16 param) {
    int16 weaponCount, a, recIdx, ejected;
    int32 score;
    int16 unitId, waypointCount;

    samKilled = groundKilled = samMissed = groundMissed = airKilled = airMissed = primaryHit = secondaryHit = ejected = 0;
    waypointCount = 1;
    score = 0;

    weaponCount = commData->weaponCount[0];
    if (weaponCount > 15) {
        weaponCount = 15;
    }

    for (recIdx = 0; (uint16)recIdx <= (uint16)param && flightRecords[recIdx].status; recIdx++) {
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
            } else if (!(*(int16 *)&slotInfoTable[unitId * 16] & 0x500)) {
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
                if (!((gridFlags[(((flightRecords[recIdx].mapY & 0xff) >> 4) << 4) + ((uint8)flightRecords[recIdx].mapX >> 4)]) & 3)) {
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

    score = (int32)((airKilled - airMissed * 2) * weaponCount * 25) + (int32)((samKilled - samMissed * 2) * (gameData->difficulty + 1) * 50) + (int32)((groundKilled - groundMissed * 2) * weaponCount * 20) + (int32)(weaponCount * primaryHit * 200) + (int32)(weaponCount * secondaryHit * 100);

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
    int16 spriteIdx;

    if (popupVisible == 1) {
        gfx_copyRect(1, 0, POPUP_SAVE_Y, 0, popupX, popupY, POPUP_WIDTH, POPUP_HEIGHT);
        popupVisible = 0;
    }
    spriteIdx = flightRecords[curRecordIdx].status & STATUS_TYPE_MASK;
    switch (spriteIdx) {
    case EVENT_AIR_KILL:
        if (slotInfoTable[(flightRecords[curRecordIdx].unitId & UNIT_ID_MASK) * 16] & 8) {
            spriteIdx = 15;
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
                spriteIdx = 14;
            } else if (missionResult == 0) {
                ejectedFlag = 1;
                spriteIdx = 11;
            } else {
                ejectedFlag = 1;
                spriteIdx = 13;
            }
        }
        break;
    case EVENT_WAYPOINT:
        spriteIdx = 10;
        break;
    }
    if ((uint16)(mapToScreenX(flightRecords[curRecordIdx].mapX) + mapViewX1) < 115 &&
        (uint16)(mapToScreenY(flightRecords[curRecordIdx].mapY) + mapViewY1) < 89) {
        popupX = mapToScreenX(flightRecords[curRecordIdx].mapX) + mapViewX1 + 10;
        popupY = mapToScreenY(flightRecords[curRecordIdx].mapY) + mapViewY1 + 10;
    } else if ((uint16)(mapToScreenX(flightRecords[curRecordIdx].mapX) + mapViewX1) >= 115 &&
               (uint16)(mapToScreenY(flightRecords[curRecordIdx].mapY) + mapViewY1) < 89) {
        popupX = mapToScreenX(flightRecords[curRecordIdx].mapX) + mapViewX1 - 58;
        popupY = mapToScreenY(flightRecords[curRecordIdx].mapY) + mapViewY1 + 10;
    } else if ((uint16)(mapToScreenX(flightRecords[curRecordIdx].mapX) + mapViewX1) >= 115 &&
               (uint16)(mapToScreenY(flightRecords[curRecordIdx].mapY) + mapViewY1) >= 89) {
        popupX = mapToScreenX(flightRecords[curRecordIdx].mapX) + mapViewX1 - 58;
        popupY = mapToScreenY(flightRecords[curRecordIdx].mapY) + mapViewY1 - 40;
    } else {
        popupX = mapToScreenX(flightRecords[curRecordIdx].mapX) + mapViewX1 + 10;
        popupY = mapToScreenY(flightRecords[curRecordIdx].mapY) + mapViewY1 - 40;
    }
    gfx_copyRect(0, popupX, popupY, 1, 0, POPUP_SAVE_Y, POPUP_WIDTH, POPUP_HEIGHT);
    gfx_copyRect(1, popupSpriteX[spriteIdx], popupSpriteY[spriteIdx], 0, popupX, popupY, POPUP_WIDTH, POPUP_HEIGHT);
    popupVisible = 1;
}
