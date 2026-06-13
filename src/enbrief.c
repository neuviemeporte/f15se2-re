/* enbrief.c — debrief UI, compiled with /Gs /Zi */
#include "offsets.h"
#include "pointers.h"
#include "debug.h"
#include "shared/common.h"
#include "end.h"

void computeMissionResult(void)
{
    unsigned int x, y;

    x = commData->worldX >> 0x0b;
    y = commData->worldY >> 0x0b;
    missionResult = gridFlags[x + y * 16] & 3;
}

void processMenuItems(MenuItem *items, int unused, int itemCount, int cursorStartX, int cursorStartY, int16* gfxPage) {
    char p[2]; char a[2]; int b; char c[2]; int d; int e; char f[2];
    int g; int h; int i; int j; int k; int l; int m; int n; int o;
    (void)unused;
    (void)b; (void)e; (void)g; (void)h; (void)i; (void)j;
    (void)k; (void)l; (void)m; (void)n; (void)o;
    p[0] = 0x0d; p[1] = 0;
    c[0] = 0x89; c[1] = 0;
    a[0] = 0x8d; a[1] = 0;
    f[0] = 0x80; f[1] = 0;
    d = 0;
    for (; d < itemCount; d++) {
        if (items[d].state == 2) {
            selectedMenuItem = d;
            items[d].state = 0;
            blinkWidget(&items[d], gfxPage);
            drawMenuItem(items, d, gfxPage);
        } else {
            if (items[d].state != 3) {
                items[d].state = 0;
            }
        }
    }
    cursorX = cursorStartX;
    cursorY = cursorStartY;
}

// 224a
int selectMenuItem(MenuItem *items, int unused, int itemCount, int16* inputState, int16* gfxPage) {
    char p[2]; int a; int b; char c[2]; int d; char e[2]; int f;
    int g; char h[2]; int i; char j[12]; int k; int l; int m; int n; int o;
    (void)unused;
    (void)d; (void)g; (void)j; (void)k; (void)l; (void)m; (void)n; (void)o;
    p[0] = 0x0d; p[1] = 0;
    e[0] = 0x89; e[1] = 0;
    c[0] = 0x8d; c[1] = 0;
    h[0] = 0x80; h[1] = 0;
    gfx_commitPage();
    colorAnimEnabled = 0;
    i = 0;
    while (isPointInRect(&items[i]) == 0 && i < itemCount)
        i++;
    joyRepeatFlag = 0;
    for (;;) {
        // 22a8
        do {
            gfx_commitPage();
            if ((items[i].flags & MENUITEM_ENABLED) == 0) {
                colorAnimEnabled = 1;
            }
            // 22d4
            processDebriefInput((int *)inputState, &items[i], gfxPage);
        } while (inputChanged == 0 && enterPressed == 0);
        // 22e8
        if (enterPressed != 0) { // 22f2
            if (i != selectedMenuItem) { // 22fa
                i = 0;
                while (isPointInRect(&items[i]) == 0 && i < itemCount)
                    i++;
            } // 2320
            // 232c
            if (items[selectedMenuItem].colorTableIdx == 0) {
                b = 0x0b;
                a = 9;
                gfx_switchColor(gfxPage, items[selectedMenuItem].colorX1, items[selectedMenuItem].colorY1, items[selectedMenuItem].colorX2, items[selectedMenuItem].colorY2, 0x0b, 9);
                b = 3;
                gfx_switchColor(gfxPage, items[selectedMenuItem].colorX1, items[selectedMenuItem].colorY1, items[selectedMenuItem].colorX2, items[selectedMenuItem].colorY2, 3, a);
                b = 0x0d;
                gfx_switchColor(gfxPage, items[selectedMenuItem].colorX1, items[selectedMenuItem].colorY1, items[selectedMenuItem].colorX2, items[selectedMenuItem].colorY2, 0x0d, a);
            }
            // 23bc
            goto done;
            continue;
        } // 23c2
        i = 0;
        while (isPointInRect(&items[i]) == 0 && i < itemCount)
            i++;
        if (i != selectedMenuItem) {
            if ((items[i].flags & MENUITEM_SELECTABLE) != 0) {
                for (f = 0; f < itemCount; f++) {
                    if (items[f].state != 0 &&
                        items[i].unk_2c == items[f].unk_2c) {
                        blinkWidget(&items[f], gfxPage);
                    }
                }
                if (items[selectedMenuItem].colorTableIdx == 0) {
                    b = 9;
                    a = 6;
                    gfx_switchColor(gfxPage, items[selectedMenuItem].colorX1, items[selectedMenuItem].colorY1, items[selectedMenuItem].colorX2, items[selectedMenuItem].colorY2, 9, 6);
                    b = 3;
                    gfx_switchColor(gfxPage, items[selectedMenuItem].colorX1, items[selectedMenuItem].colorY1, items[selectedMenuItem].colorX2, items[selectedMenuItem].colorY2, 3, a);
                    b = 0x0d;
                    gfx_switchColor(gfxPage, items[selectedMenuItem].colorX1, items[selectedMenuItem].colorY1, items[selectedMenuItem].colorX2, items[selectedMenuItem].colorY2, 0x0d, a);
                    b = 0x0b;
                    gfx_switchColor(gfxPage, items[selectedMenuItem].colorX1, items[selectedMenuItem].colorY1, items[selectedMenuItem].colorX2, items[selectedMenuItem].colorY2, 0x0b, a);
                }
                if (items[selectedMenuItem].colorTableIdx == 1) {
                    b = 8;
                    a = 7;
                    gfx_switchColor(gfxPage, items[selectedMenuItem].colorX1, items[selectedMenuItem].colorY1, items[selectedMenuItem].colorX2, items[selectedMenuItem].colorY2, 8, 7);
                }
                blinkWidget(&items[i], gfxPage);
            }
            selectedMenuItem = i;
            // 256f
            drawMenuItem(items, i, gfxPage);
        } // 2575
    }
done:
    return i;
}

void blinkWidget(MenuItem *item, int16* gfxPage) {
    int p;
    int a;
    int b;
    int c;
    TRACE(("blinkWidget"));
    (void)a;
    (void)c;
    if (item->state == 0) {
        item->state = 1;
        b = (unsigned)item->colorPair >> 4;
        p = item->colorPair & 0xF;
        if (item->colorPair != 0) {
            gfx_switchColor(gfxPage, item->colorX1, item->colorY1, item->colorX2, item->colorY2, b, p);
        }
    } else {
        item->state = 0;
        b = item->colorPair & 0xF;
        p = (unsigned)item->colorPair >> 4;
    }
    if (item->colorPair != 0) {
        gfx_switchColor(gfxPage, item->colorX1, item->colorY1, item->colorX2, item->colorY2, b, p);
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

/*static*/ void processDebriefInput(int *cursorBounds, MenuItem *menuItem, int16* gfxPage) {
    int a;
    int b;
    int c;
    int d;
    int e;
    char f;
    int g;
    int h;
    int i;
    TRACE(("processDebriefInput"));
    (void)a;
    (void)g;
    (void)i;

    colorTablePtr = menuItem->colorTableIdx * 14 + (int)colorStyleTable;
    timerCounter2 = 0;
    d = e = 0;
    inputChanged = enterPressed = animDone = f = 0;
    if (joyRepeatFlag == 1) {
        timerCounter = 0;
        f = 1;
    }

    /* pre-loop joystick read */
    if (commData->setupUseJoy == 1) {
        d = misc_jump_5d_readJoy(0);
        e = misc_jump_5d_readJoy(1);
        pollJoystick();
    }

    /* main loop */
    for (;;) {
        if ((char)misc_jump_5a_keybuf() == 0
            || d != 0
            || e != 0
            || (unsigned char)joyAxisX < JOY_DEADZONE_LO
            || (unsigned char)joyAxisX > JOY_DEADZONE_HI
            || (unsigned char)joyAxisY < JOY_DEADZONE_LO
            || (unsigned char)joyAxisY > JOY_DEADZONE_HI) {
            if (f != 1)
                break;
        }
        /* joystick repeat handling */
        if (joyRepeatFlag == 1) {
            if ((unsigned char)timerCounter > 0x0F) {
                f = 0;
                joyRepeatFlag = 0;
            }
        }

        /* re-read joystick */
        if (commData->setupUseJoy == 1) {
            d = misc_jump_5d_readJoy(0);
            e = misc_jump_5d_readJoy(1);
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
            if ((unsigned char)timerCounter2 > 6) {
                timerCounter2 = 0;
                c = ((unsigned int *)colorTablePtr)[colorAnimIdx + 1] >> 4;
                b = ((unsigned int *)colorTablePtr)[colorAnimIdx + 1] & 0xF;
                gfx_switchColor(gfxPage, menuItem->colorX1, menuItem->colorY1, menuItem->colorX2, menuItem->colorY2, c, b);
                colorAnimIdx++;
                colorAnimIdx = (unsigned)colorAnimIdx % *(unsigned int *)colorTablePtr;
            }
        }

        /* sprite section */
        if (!(menuItem->flags & MENUITEM_HAS_SPRITE)) goto skip_sprite;
        if (!(menuItem->flags & MENUITEM_SPRITE_BLINK)) goto skip_sprite;
        if ((unsigned char)timerCounter3 <= 0x12) goto skip_sprite;
        timerCounter3 = 0;
        if (spriteToggle != 0) {
            switch (flightRecords[curRecordIdx].status & STATUS_TYPE_MASK) {
            case EVENT_AIR_KILL:
            case EVENT_AIR_KILL2:
                spriteAirBlink->dstX = mapToScreenX((char)flightRecords[curRecordIdx].mapX) + mapViewX1 - 2;
                spriteAirBlink->dstY = mapToScreenY((char)flightRecords[curRecordIdx].mapY) + mapViewY1 - 2;
                if (slotInfoTable[(flightRecords[curRecordIdx].unitId & UNIT_ID_MASK) << 4] & 8) {
                    spriteAirBlink->srcX = 0x11E;
                } else {
                    spriteAirBlink->srcX = 0x12D;
                }
                gfx_blitSprite(spriteAirBlink);
                break;
            case EVENT_SAM_KILL:
                spriteSamBlink->dstX = mapToScreenX((char)flightRecords[curRecordIdx].mapX) + mapViewX1 - 2;
                spriteSamBlink->dstY = mapToScreenY((char)flightRecords[curRecordIdx].mapY) + mapViewY1 - 2;
                gfx_blitSprite(spriteSamBlink);
                break;
            case EVENT_GROUND_KILL:
                spriteGroundBlink->dstX = mapToScreenX((char)flightRecords[curRecordIdx].mapX) + mapViewX1 - 2;
                spriteGroundBlink->dstY = mapToScreenY((char)flightRecords[curRecordIdx].mapY) + mapViewY1 - 2;
                gfx_blitSprite(spriteGroundBlink);
                break;
            case EVENT_BOMB_HIT:
                spriteWaypointBlink->dstX = mapToScreenX((char)flightRecords[curRecordIdx].mapX) + mapViewX1;
                spriteWaypointBlink->dstY = mapToScreenY((char)flightRecords[curRecordIdx].mapY) + mapViewY1;
                gfx_blitSprite(spriteWaypointBlink);
                break;
            case EVENT_EJECTED:
                spriteSamBlink->dstX = mapToScreenX((char)flightRecords[curRecordIdx].mapX) + mapViewX1 - 2;
                spriteSamBlink->dstY = mapToScreenY((char)flightRecords[curRecordIdx].mapY) + mapViewY1 - 2;
                gfx_blitSprite(spriteSamBlink);
                break;
            case EVENT_WAYPOINT:
                spriteWaypointBlink->dstX = mapToScreenX((char)flightRecords[curRecordIdx].mapX) + mapViewX1;
                spriteWaypointBlink->dstY = mapToScreenY((char)flightRecords[curRecordIdx].mapY) + mapViewY1;
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
    if ((char)misc_jump_5a_keybuf() == 0) {
        h = misc_jump_5b_getkey();
    } else {
        if (d == 1) {
            h = KEYCODE_ENTER;
        } else if (e == 1) {
            h = KEYCODE_ESC;
        } else if ((unsigned char)joyAxisX < JOY_DEADZONE_LO) {
            h = KEYCODE_LEFTARROW;
            joyRepeatFlag = 1;
        } else if ((unsigned char)joyAxisX > JOY_DEADZONE_HI) {
            h = KEYCODE_RIGHTARROW;
            joyRepeatFlag = 1;
        } else if ((unsigned char)joyAxisY < JOY_DEADZONE_LO) {
            h = KEYCODE_UPARROW;
            joyRepeatFlag = 1;
        } else if ((unsigned char)joyAxisY > JOY_DEADZONE_HI) {
            h = KEYCODE_DNARROW;
            joyRepeatFlag = 1;
        }
    }

    /* process key */
    if ((char)h == KEYCODE_ENTER) {
        enterPressed = 1;
    }
    if (h == KEYCODE_ALTQ) {
        quitFlag = 1;
        enterPressed = 1;
    }
    if (h == KEYCODE_UPARROW) {
        cursorY -= cursorBounds[1];
        if ((int)cursorBounds[4] > (int)cursorY) {
            cursorY = cursorBounds[4];
        }
        inputChanged = 1;
    }
    if (h == KEYCODE_DNARROW) {
        cursorY += cursorBounds[1];
        if (cursorY > (unsigned)cursorBounds[5]) {
            cursorY = cursorBounds[5];
        }
        inputChanged = 1;
    }
    if (h == KEYCODE_RIGHTARROW) {
        cursorX += cursorBounds[0];
        if (cursorX > (unsigned)cursorBounds[3]) {
            cursorX = cursorBounds[3];
        }
        inputChanged = 1;
    }
    if (h == KEYCODE_LEFTARROW) {
        cursorX -= cursorBounds[0];
        if ((int)cursorBounds[2] > (int)cursorX) {
            cursorX = cursorBounds[2];
        }
        if ((int)cursorBounds[4] > (int)cursorY) {
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
    char p[2]; char a[2]; char b[2]; int c; char d[2]; int e; int f;
    int g; int h; int i; int j; int k; int l; int m;
    char n[4]; unsigned int o;
    (void)c; (void)e; (void)f; (void)g; (void)h; (void)i;
    (void)j; (void)k; (void)l;
    p[0] = 0x0a; p[1] = 0;
    b[0] = 0x89; b[1] = 0;
    a[0] = 0x8d; a[1] = 0;
    d[0] = 0x80; d[1] = 0;
    // 2c07
    if ((items[index].flags & MENUITEM_HAS_SPRITE) != 0) {
        // 2c1d
        if ((items[index].flags & MENUITEM_TYPE_MASK) == 7) {
        /* Section 1: mission complete display */
        clearRect(gfxPage, 0xeb, 0x0a, 0x13f, 0x95);
        ((int *)gfxPage)[2] = 0;
        mystrcpy(dat_4824, b);
        mystrcat(dat_4824, str_pressExit);
        drawWrappedText(gfxPage, dat_4824, 0x50, 0xf0, 0x82, 8);
        clearRect(gfxPage, 0xf0, 0x64, 0x12c, 0x7e);
        if (popupVisible == 1) {
            gfx_copyRect(1, 0, POPUP_SAVE_Y, 0, popupX, popupY, POPUP_WIDTH, POPUP_HEIGHT);
            popupVisible = 0;
        }
        curRecordIdx = 0;
        totalFlightRecords = drawFlightPath(gfxPage, ALL_RECORDS);
        *(long *)&missionScore = calcMissionScore(totalFlightRecords);
        mystrcpy(dat_4824, str_dot1);
        mystrcat(dat_4824, str_overall1);
        drawStringCentered(gfxPage, dat_4824, 0xe8, 0x46, 0x57);
        mystrcpy(dat_4824, str_missionRating1);
        drawStringCentered(gfxPage, dat_4824, 0xe8, 0x4e, 0x57);
        mystrcpy(dat_4824, str_dot2);
        my_ltoa(*(long *)&missionScore, n);
        mystrcat(dat_4824, n);
        drawStringCentered(gfxPage, dat_4824, 0xe8, 0x56, 0x57);
        if (commData->trainingFlag != 0) {
            drawStringCentered(gfxPage, str_trainingScore, 0xe8, 0x60, 0x57);
            drawStringCentered(gfxPage, str_notRecorded, 0xe8, 0x68, 0x57);
        } else {
            mystrcpy(dat_4824, str_dot3);
            mystrcat(dat_4824, str_careerTotal);
            drawStringCentered(gfxPage, dat_4824, 0xe8, 0x6c, 0x57);
            mystrcpy(dat_4824, str_dot4);
            my_ltoa(gameData->totalScore + *(long *)&missionScore, n);
            mystrcat(dat_4824, n);
            drawStringCentered(gfxPage, dat_4824, 0xe8, 0x74, 0x57);
        }
        gfxPage[2] = FONT_TITLE;
        mystrcpy(dat_4824, str_missionSummary);
        drawStringCentered(gfxPage, dat_4824, 0xe8, 0x14, 0x57);
        gfxPage[2] = 0;
        mystrcpy(dat_4824, str_priSecTargets);
        drawStringAt(gfxPage, dat_4824, 0xf0, 0x1e);
        my_itoa(primaryHit + secondaryHit, dat_4824);
        drawStringAt(gfxPage, dat_4824, 0x131, 0x1e);
        mystrcpy(dat_4824, str_otherTargets);
        drawStringAt(gfxPage, dat_4824, 0xf0, 0x26);
        my_itoa(groundKilled + airKilled - primaryHit - secondaryHit, dat_4824);
        drawStringAt(gfxPage, dat_4824, 0x131, 0x26);
        mystrcpy(dat_4824, str_enemyPlanes);
        drawStringAt(gfxPage, dat_4824, 0xf0, 0x2e);
        my_itoa(samKilled, dat_4824);
        drawStringAt(gfxPage, dat_4824, 0x131, 0x2e);
        mystrcpy(dat_4824, str_friendlyTargets);
        drawStringAt(gfxPage, dat_4824, 0xf0, 0x36);
        my_itoa(groundMissed + airMissed + samMissed, dat_4824);
        drawStringAt(gfxPage, dat_4824, 0x131, 0x36);
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
            *(long *)&missionScore = calcMissionScore(SCORE_ALL_EVENTS);
            mystrcpy(dat_4824, str_dot5);
            mystrcat(dat_4824, str_overall2);
            drawStringCentered(gfxPage, dat_4824, 0xe8, 0x64, 0x57);
            mystrcpy(dat_4824, str_missionRating2);
            drawStringCentered(gfxPage, dat_4824, 0xe8, 0x6c, 0x57);
            mystrcpy(dat_4824, str_dot6);
            my_ltoa(*(long *)&missionScore, n);
            mystrcat(dat_4824, n);
            drawStringCentered(gfxPage, dat_4824, 0xe8, 0x74, 0x57);
        }
        clearRect(gfxPage, 0xeb, 0x0a, 0x13f, 0x63);
        gfxPage[2] = FONT_TITLE;
        mystrcpy(dat_4824, str_missionEvent);
        drawStringCentered(gfxPage, dat_4824, 0xe8, 0x14, 0x57);
        mystrcpy(dat_4824, str_time);
        mystrcat(dat_4824, formatFlightTime(flightTimeTable[curRecordIdx * 3], n));
        drawStringAt(gfxPage, dat_4824, 0xf0, 0x1e);
        o = flightRecords[curRecordIdx].unitId & UNIT_ID_MASK;
        switch (flightRecords[curRecordIdx].status & STATUS_TYPE_MASK) {
        case EVENT_AIR_KILL:
        case EVENT_AIR_KILL2:
            if (worldObjects[o].unitRef != 0) {
                mystrcpy(dat_4824, worldStrings[worldObjects[o].unitRef]);
                mystrcat(dat_4824, str_destroyed4);
                mystrcat(dat_4824, worldStrings[worldObjects[o].objectIdx & UNIT_ID_MASK]);
                mystrcat(dat_4824, str_destroyed1);
            } else {
                mystrcpy(dat_4824, worldStrings[worldObjects[o].objectIdx & UNIT_ID_MASK]);
                mystrcat(dat_4824, str_destroyed2);
            }
            break;
        case EVENT_SAM_KILL:
            /* 0x198: aircraft name field in samDataTable (32-byte records) */
            mystrcpy(dat_4824, ((struct SamDataEntry*)((unsigned char*)&weaponDataBlock + 0x156))[o].name);
            mystrcat(dat_4824, str_shotDown2);
            mystrcat(dat_4824, &((struct SamDataEntry*)((unsigned char*)&weaponDataBlock + 0x156))[o].name[7]);
            mystrcat(dat_4824, str_shotDown);
            break;
        case EVENT_GROUND_KILL:
            mystrcpy(dat_4824, worldStrings[o]);
            mystrcat(dat_4824, str_destroyed3);
            break;
        case EVENT_WAYPOINT:
            if (worldObjects[o].unitRef != 0) {
                mystrcpy(dat_4824, worldStrings[worldObjects[o].unitRef]);
                mystrcat(dat_4824, str_rearmed3);
                mystrcat(dat_4824, worldStrings[worldObjects[o].objectIdx & UNIT_ID_MASK]);
                mystrcat(dat_4824, str_rearmed1);
            } else {
                mystrcpy(dat_4824, worldStrings[worldObjects[o].objectIdx & UNIT_ID_MASK]);
                mystrcat(dat_4824, str_rearmed2);
            }
            break;
        case EVENT_BOMB_HIT:
            mystrcpy(dat_4824, str_hitBy);
            /* 0x3f8: missile name field in weapon table (18-byte records) */
            mystrcat(dat_4824, ((struct Sam*)((unsigned char*)&weaponDataBlock + 0x3B6))[o].field_0);
            mystrcat(dat_4824, str_missile);
            break;
        case EVENT_EJECTED:
            if (curRecordIdx == 0) {
                mystrcpy(dat_4824, str_takeoffPoint);
                if (worldObjects[waypointData].unitRef != 0) {
                    mystrcat(dat_4824, worldStrings[worldObjects[waypointData].unitRef]);
                } else {
                    mystrcat(dat_4824, worldStrings[(unsigned char)worldObjects[waypointData].objectIdx]);
                }
            } else {
                mystrcpy(dat_4824, str_missionEnd);
                switch (commData->landingType) {
                case LANDING_CRASHED:
                    mystrcat(dat_4824, str_crashed);
                    break;
                case LANDING_EJECTED:
                    if (commData->bailoutSurvived == 0 && missionResult != 0) {
                        mystrcat(dat_4824, str_goodBailout);
                    } else if (commData->bailoutSurvived == 0 && missionResult == 0) {
                        mystrcat(dat_4824, str_captured);
                    } else {
                        mystrcat(dat_4824, str_bailedDied);
                    }
                    break;
                case LANDING_SAFE:
                    mystrcat(dat_4824, str_goodLanding);
                    break;
                }
            }
            break;
        }
        drawWrappedText(gfxPage, dat_4824, 0x50, 0xf0, 0x26, 8);
        if ((unsigned char)flightRecords[curRecordIdx].status & STATUS_PRIMARY_HIT) {
            mystrcpy(dat_4824, str_primaryObj);
            drawStringCentered(gfxPage, dat_4824, 0xe8, gfxPage[5], 0x57);
        }
        if ((unsigned char)flightRecords[curRecordIdx].status & STATUS_SECONDARY_HIT) {
            mystrcpy(dat_4824, str_secndryObj);
            drawStringCentered(gfxPage, dat_4824, 0xe8, gfxPage[5], 0x57);
        }
        *(long *)&missionScore = calcMissionScore(curRecordIdx);
        mystrcpy(dat_4824, str_cumulative2);
        mystrcat(dat_4824, str_cumulative);
        drawStringCentered(gfxPage, dat_4824, 0xe8, 0x46, 0x57);
        mystrcpy(dat_4824, str_missionRating3);
        drawStringCentered(gfxPage, dat_4824, 0xe8, 0x4e, 0x57);
        mystrcpy(dat_4824, str_pressSelect);
        my_ltoa(*(long *)&missionScore, n);
        mystrcat(dat_4824, n);
        drawStringCentered(gfxPage, dat_4824, 0xe8, 0x56, 0x57);
        showEventPopup();
        mystrcpy(dat_4824, b);
        mystrcat(dat_4824, str_pressNext);
        drawWrappedText(gfxPage, dat_4824, 0x50, 0xf0, 0x82, 8);
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
    char local_18[22];
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
        mystrcat(scoreString, formatFlightTime(*((int *)&flightRecords[curRecordIdx] - 1), local_18));
        drawStringAt(gfxPage, scoreString, 0xf0, 0x1e);
        gfx_setColor(0);
        if (prevDrawX == 0 && prevDrawY == 0) {
            drawFlightLine((int)flightRecords[0].mapX, (int)flightRecords[0].mapY, (int)flightRecords[curRecordIdx].mapX, (int)flightRecords[curRecordIdx].mapY);
            prevDrawX = (int)flightRecords[curRecordIdx].mapX;
            prevDrawY = (int)flightRecords[curRecordIdx].mapY;
        } else {
            lastDrawX = (int)flightRecords[curRecordIdx].mapX;
            lastDrawY = (int)flightRecords[curRecordIdx].mapY;
            drawFlightLine(lastDrawX, lastDrawY, prevDrawX, prevDrawY);
            prevDrawX = lastDrawX;
            prevDrawY = lastDrawY;
        }
        *(long *)&missionScore = calcMissionScore(curRecordIdx);
        mystrcpy(scoreString, str_timeZeros);
        my_ltoa(*(long *)&missionScore, local_18);
        mystrcat(scoreString, local_18);
        clearRect(gfxPage, 0xe8, 0x56, 0x13f, 0x5e);
        drawStringCentered(gfxPage, scoreString, 0xe8, 0x56, 0x57);
        timerCounter = 0;
wait_loop:
        if ((unsigned char)timerCounter <= 5) goto wait_loop;
                goto loop_top;
            }
        }
done:
    if (!(flightRecords[curRecordIdx].status & STATUS_TYPE_MASK)) {
        curRecordIdx--;
    }
    gfx_setColor(0);
    if (prevDrawX == 0 && prevDrawY == 0) {
        drawFlightLine((int)flightRecords[0].mapX, (int)flightRecords[0].mapY, (int)flightRecords[curRecordIdx].mapX, (int)flightRecords[curRecordIdx].mapY);
        prevDrawX = (int)flightRecords[curRecordIdx].mapX;
        prevDrawY = (int)flightRecords[curRecordIdx].mapY;
    } else {
        lastDrawX = (int)flightRecords[curRecordIdx].mapX;
        lastDrawY = (int)flightRecords[curRecordIdx].mapY;
        drawFlightLine(lastDrawX, lastDrawY, prevDrawX, prevDrawY);
        prevDrawX = lastDrawX;
        prevDrawY = lastDrawY;
    }
}

unsigned int drawFlightPath(int16 *gfxPage, unsigned int maxRecord) {
    int p;
    int a;
    int b;
    int c;
    int d;
    int e;
    int f;
    int g;
    int h;
    int i;
    int j;
    int k;
    int l;
    int m;
    int n;
    (void)e; (void)f; (void)g; (void)h; (void)i;
    (void)j; (void)k; (void)l; (void)m; (void)n; (void)p;
    a = -1;
    while (++a, (flightRecords[a].status & STATUS_TYPE_MASK) != 0 && (unsigned)a <= maxRecord) {
        gfx_setColor(0);
        if (a == 0) {
            plotMapPoint((int)flightRecords[0].mapX, (int)flightRecords[0].mapY, 0, 0);
            b = (int)flightRecords[0].mapX;
            d = (int)flightRecords[0].mapY;
        } else {
            p = (int)flightRecords[a].mapX;
            c = (int)flightRecords[a].mapY;
            drawFlightLine(p, c, b, d);
            b = p;
            d = c;
        }
    }
    a = -1;
    while (++a, (flightRecords[a].status & STATUS_TYPE_MASK) != 0 && (unsigned)a <= maxRecord) {
        if ((flightRecords[a].status & STATUS_TYPE_MASK) != EVENT_TIMESTAMP) {
            drawEventSprite(a);
        }
    }
    a--;
    return a;
}

char *formatFlightTime(int timeValue, char *buffer) {
    int p;
    int a;
    int b;
    int c;

    a = target1MiscBits[0] + target2MiscBits[0];
    (*(int16*)((unsigned char*)&weaponDataBlock + 0x6DA)) = ((char)a & 3) == 0;
    if (target1Type[0] == 1 || target2Type[0] == 1) {
        (*(int16*)((unsigned char*)&weaponDataBlock + 0x6DA)) = 0;
    }
    if (target1Type[0] == 4 || target2Type[0] == 4) {
        (*(int16*)((unsigned char*)&weaponDataBlock + 0x6DA)) = 1;
    }
    timeValue += (a & 0xF) << 8;
    mystrcpy(buffer, str_timeFormat);
    p = (unsigned)timeValue / 0x708;
    buffer[0] += (*(int16*)((unsigned char*)&weaponDataBlock + 0x6DA)) + 1;
    buffer[1] += p % 10;
    b = ((unsigned)timeValue / 30) % 60;
    buffer[3] += b / 10;
    buffer[4] += b % 10;
    c = ((unsigned)timeValue * 2) % 60;
    buffer[6] += c / 10;
    buffer[7] += c % 10;
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
    (void*)unused;
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
    while (ticks >= (unsigned char)timerCounter)
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
    int p;
    int a;
    int b;
    int c;
    long e;
    int f;
    int g;

    samKilled = groundKilled = samMissed = groundMissed = airKilled = airMissed = primaryHit = secondaryHit = c = 0;
    g = 1;
    e = 0;

    p = commData->weaponCount[0];
    if (p > 15) {
        p = 15;
    }

    for (b = 0; (unsigned)b <= (unsigned)param && flightRecords[KILL_RECORD_OFFSET + b].status; b++) {
        f = flightRecords[KILL_RECORD_OFFSET + b].unitId;
        switch (flightRecords[KILL_RECORD_OFFSET + b].status & STATUS_TYPE_MASK) {
        case EVENT_EJECTED:
            if (b != 0) {
                c = 1;
            }
            break;
        case EVENT_AIR_KILL:
        case EVENT_AIR_KILL2:
            if (flightRecords[KILL_RECORD_OFFSET + b].status & STATUS_PRIMARY_HIT) {
                primaryHit = 1;
                airKilled++;
            } else if (flightRecords[KILL_RECORD_OFFSET + b].status & STATUS_SECONDARY_HIT) {
                secondaryHit = 1;
                airKilled++;
            } else if (unitTypeTable[f & UNIT_ID_MASK] & 0x40) {
                airMissed++;
            } else if (!(*(int *)&slotInfoTable[f * 16] & 0x500)) {
                airKilled++;
            } else {
                airMissed++;
            }
            break;
        case EVENT_SAM_KILL:
            if (flightRecords[KILL_RECORD_OFFSET + b].status & STATUS_PRIMARY_HIT) {
                primaryHit = 1;
                samKilled++;
            } else if (flightRecords[KILL_RECORD_OFFSET + b].status & STATUS_SECONDARY_HIT) {
                secondaryHit = 1;
                samKilled++;
            } else if (((struct SamDataEntry*)((unsigned char*)&weaponDataBlock + 0x156))[(f & UNIT_ID_MASK) + 1].field_0 == -1) {
                samMissed++;
            } else {
                samKilled++;
            }
            break;
        case EVENT_GROUND_KILL:
            if (flightRecords[KILL_RECORD_OFFSET + b].status & STATUS_PRIMARY_HIT) {
                primaryHit = 1;
                groundKilled++;
            } else if (flightRecords[KILL_RECORD_OFFSET + b].status & STATUS_SECONDARY_HIT) {
                secondaryHit = 1;
                groundKilled++;
            } else if (unitTypeTable[f & UNIT_ID_MASK] & 0x40) {
                groundMissed++;
            } else {
                if (!((gridFlags[(((flightRecords[KILL_RECORD_OFFSET + b].mapY & 0xff) >> 4) << 4) + ((unsigned char)flightRecords[KILL_RECORD_OFFSET + b].mapX >> 4)]) & 3)) {
                    groundKilled++;
                } else {
                    groundMissed++;
                }
            }
            break;
        case EVENT_WAYPOINT:
            g++;
            break;
        }
    }

    e = (long)((airKilled - airMissed * 2) * p * 25)
      + (long)((samKilled - samMissed * 2) * (gameData->difficulty + 1) * 50)
      + (long)((groundKilled - groundMissed * 2) * p * 20)
      + (long)(p * primaryHit * 200)
      + (long)(p * secondaryHit * 100);

    e = e * 2 / (g + 1);

    if (c != 0) {
        if (e < 0) {
            e = 0;
        }
        switch (commData->landingType) {
        case LANDING_CRASHED:
            e /= 2;
            break;
        case LANDING_EJECTED:
            e = e * 3 / 4;
            break;
        }
    }

    return e;
}

void showEventPopup(void) {
    int p;
    int a;

    (void)p;

    if (popupVisible == 1) {
        gfx_copyRect(1, 0, POPUP_SAVE_Y, 0, popupX, popupY, POPUP_WIDTH, POPUP_HEIGHT);
        popupVisible = 0;
    }
    a = flightRecords[curRecordIdx].status & STATUS_TYPE_MASK;
    switch (a) {
    case EVENT_AIR_KILL:
        if (slotInfoTable[(flightRecords[curRecordIdx].unitId & UNIT_ID_MASK) * 16] & 8) {
                    a = 0xf;
        } else {
            a = 0;
        }
        break;
    case EVENT_GROUND_KILL:
        a = 2;
        break;
    case EVENT_AIR_KILL2:
        a = 1;
        break;
    case EVENT_SAM_KILL:
        a = 2;
        break;
    case EVENT_BOMB_HIT:
        a = 3;
        break;
    case EVENT_EJECTED:
        if (curRecordIdx == 0) {
            a = 8;
        } else {
            if (commData->landingType == LANDING_SAFE) {
                ejectedFlag = 1;
                a = 7;
            } else if (commData->landingType == LANDING_CRASHED) {
                ejectedFlag = 1;
                a = 0xe;
            } else if (missionResult == 0) {
                ejectedFlag = 1;
                a = 0xb;
            } else {
                ejectedFlag = 1;
                a = 0xd;
            }
        }
        break;
    case EVENT_WAYPOINT:
        a = 0xa;
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
    gfx_copyRect(1, popupSpriteX[a], popupSpriteY[a], 0, popupX, popupY, POPUP_WIDTH, POPUP_HEIGHT);
    popupVisible = 1;
}
