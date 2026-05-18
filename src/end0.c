/* end0.c — compiled with /Gs /Zi (stack probes disabled, debug info) */
#include "offsets.h"
#include "pointers.h"
#include "debug.h"
#include "util.h"
#include "end.h"

void main(void) {
    int p;
    int a;
    int b;
    uint16 far *d;
    int e;
    register int seg;

    (void)a; (void)e;

    FP_SEG(d) = SEG_LOWMEM;
    FP_OFF(d) = OFF_IACA_START;
    seg = *d;
    FP_SEG(commData) = seg;
    FP_OFF(commData) = 0;
    FP_SEG(gameData) = seg;
    FP_OFF(gameData) = COMM_GAMEDATA_OFFSET;
    setupOverlaySlots(((int far *)commData)[COMM_GFXOVL_ADDR_OFFSET / 2]);
    setupOverlaySlots(((int far *)commData)[COMM_MISCOVL_ADDR_OFFSET / 2]);
    misc_jump_5e_clearKeyFlags();
    clearKeybuf();
    hercFlag = ((char far *)commData)[COMM_SETUP_MONOCHROME_OFFSET];
    installCBreakHandler();
    initGraphics();
    if (((int far *)commData)[COMM_SETUP_USEJOY_OFFSET / 2] == 1) {
        copyJoystickData((char far *)commData + COMM_SETUP_JOYDATA_OFFSET);
    } else {
        joyAxisX = joyAxisY = JOY_CENTER;
    }
    loadWorldStrings();
    b = gfx_jump_31();
    p = gfx_jump_17_bufSize();
    gfxBufSeg = allocBuffer(b);
    if (hasVgaMode == 1) {
        vgaBufSeg = allocBuffer(VGA_BUF_SIZE);
        vgaBufSeg2 = vgaBufSeg;
        vgaBufOffset = 0;
    }
    spriteBufSeg = allocBuffer(p);
    missionResult = 3;
    if (((int far *)commData)[COMM_SETUP_DONE_OFFSET / 2] == 2) {
        routine_24();
    }
    clearKeybuf();
    routine_25();
    routine_26();
    clearKeybuf();
    routine_27();
    restoreCbreakHandler();
    dosExit(EXIT_DEBRIEF);
}

char *formatFlightTime(int timeValue, char *buffer) {
    int p;
    int a;
    int b;
    int c;

    a = target1MiscBits[0] + target2MiscBits[0];
    nightMission = ((char)a & 3) == 0;
    if (target1Type[0] == 1 || target2Type[0] == 1) {
        nightMission = 0;
    }
    if (target1Type[0] == 4 || target2Type[0] == 4) {
        nightMission = 1;
    }
    timeValue += (a & 0xF) << 8;
    mystrcpy(buffer, str_timeFormat);
    p = (unsigned)timeValue / 0x708;
    buffer[0] += nightMission + 1;
    buffer[1] += p % 10;
    b = ((unsigned)timeValue / 30) % 60;
    buffer[3] += b / 10;
    buffer[4] += b % 10;
    c = ((unsigned)timeValue * 2) % 60;
    buffer[6] += c / 10;
    buffer[7] += c % 10;
    return buffer;
}


void waitForKeyOrJoy(void);

void animateFlightPath(int param_1)
{
    char local_18[22];
    int pad;

    if (popupVisible == 1) {
        gfx_jump_2a(1, 0, POPUP_SAVE_Y, 0, popupX, popupY, POPUP_WIDTH, POPUP_HEIGHT);
        popupVisible = 0;
    }
    clearRect((int *)param_1, 0xe9, 0x1e, 0x13f, 0x45);
    drawStringAt((int *)param_1, str_inFlight, 0xf0, 0x26);
loop_top:
        curRecordIdx++;
        if (flightRecords[curRecordIdx].status & STATUS_TYPE_MASK) {
            if ((flightRecords[curRecordIdx].status & STATUS_TYPE_MASK) == EVENT_TIMESTAMP) {
        clearRect((int *)param_1, 0xf0, 0x1e, 0x13f, 0x25);
        mystrcpy(dat_4824, str_timeLabel);
        mystrcat(dat_4824, formatFlightTime(*((int *)&flightRecords[curRecordIdx] - 1), local_18));
        drawStringAt((int *)param_1, dat_4824, 0xf0, 0x1e);
        gfx_jump_21(0);
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
        mystrcpy(dat_4824, str_timeZeros);
        my_ltoa(*(long *)&missionScore, local_18);
        mystrcat(dat_4824, local_18);
        clearRect((int *)param_1, 0xe8, 0x56, 0x13f, 0x5e);
        drawStringCentered((int *)param_1, dat_4824, 0xe8, 0x56, 0x57);
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
    gfx_jump_21(0);
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

void seedRandom(void) {
    TRACE(("seedRandom"));
    srandInit(getTimeOfDay());
}

int mapToScreenX(unsigned char param_1) {
    TRACE(("mapToScreenX"));
    return ((unsigned int)param_1 << 7) / MAP_SCALE_X;
}

int mapToScreenY(unsigned char param_1) {
    TRACE(("mapToScreenY"));
    return ((unsigned int)param_1 << 7) / MAP_SCALE_Y;
}

void drawClippedLine(int x1, int y1, int x2, int y2) {
    TRACE(("drawClippedLine"));
    drawClippedLineEx(x1, y1, x2, y2, mapViewX1, mapViewX2, mapViewY1, mapViewY2, 1);
}

void drawMapPixel(int x, int y, int color) {
    TRACE(("drawMapPixel"));
    drawClippedLine(x, y, x, y);
}

void plotMapPoint(int x, int y, int color) {
    int sx;
    int sy;
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

void drawStringAtPos(int *s, char far *str, int x, int y) {
    TRACE(("drawStringAtPos"));
    s[4] = x;
    s[5] = y;
    drawFarString(s, str);
}

void drawFarString(int *s, char far *str) {
    char buf[200];
    TRACE(("drawFarString"));
    farStrcpy(buf, str);
    gfx_jump_05_drawString(s, buf);
}

int isPointInRect(unsigned int *p)
{
    TRACE(("isPointInRect"));
    if (p[0] <= cursorX && p[2] >= cursorX && p[1] <= cursorY && p[3] >= cursorY)
        return 1;
    else
        return 0;
}

void drawFlightLine(int p1, int p2, int p3, int p4)
{
    TRACE(("drawFlightLine"));
    drawClippedLineEx(mapToScreenX(p1), mapToScreenY(p2), mapToScreenX(p3), mapToScreenY(p4), mapViewX1, mapViewX2, mapViewY1, mapViewY2, 1);
}

void drawWrappedText(int *page, char *str, unsigned int maxWidth, int x, int y, int lineHeight) {
    int p;
    char *a;
    uint8 *b;
    int c;
    int d;
    char *e;
    int8 f;
    unsigned int g;
    char buf[1000];

    e = str;
    a = str;
    b = str;
    p = page[6];
    page[5] = y;
    f = 1;
    do {
        if (f == 0) {
            return;
        }
        g = c = 0;
        while (g < maxWidth && *b != '\0' && *b != '\r' && *b != '\n') {
            g += gfx_jump_2f_charWidth(*b++, p);
            c++;
        }
        if (g >= maxWidth) {
            b--;
            c--;
        }
        while (*b != ' ' && *b != '\0' &&
               *b != '\r' && *b != '\n' && *b != '-' &&
               b > e) {
            b--;
            c--;
        }
        if (*b == '-') {
            c++;
        }
        if (*b == '\0') {
            f = 0;
        }
        if (c != 0) {
            memcopy(buf, a, c);
            buf[c] = 0;
            page[4] = x;
            gfx_jump_05_drawString(page, buf);
            page[5] += lineHeight;
            if (*b == '\r') {
                page[5] += 2;
            }
        }
        b++;
        a = b;
    } while (1);
}

int drawEventSprite(int param_1)
{
    TRACE(("drawEventSprite"));
    switch (flightRecords[param_1].status & STATUS_TYPE_MASK) {
        case EVENT_AIR_KILL:
        case EVENT_AIR_KILL2:
        spriteAir[4] = mapToScreenX(flightRecords[param_1].mapX) + mapViewX1 - 2;
        spriteAir[5] = mapToScreenY(flightRecords[param_1].mapY) + mapViewY1 - 2;
        if (slotInfoTable[(flightRecords[curRecordIdx].unitId & UNIT_ID_MASK) * 16] & 8) {
            spriteAir[1] = 0x11e;
        } else {
            spriteAir[1] = 0x12d;
        }
        return gfx_jump_11_blitSprite((int)spriteAir);
    case EVENT_GROUND_KILL:
        spriteGround[4] = mapToScreenX(flightRecords[param_1].mapX) + mapViewX1 - 2;
        spriteGround[5] = mapToScreenY(flightRecords[param_1].mapY) + mapViewY1 - 2;
        return gfx_jump_11_blitSprite((int)spriteGround);
    case EVENT_SAM_KILL:
        spriteSam[4] = mapToScreenX(flightRecords[param_1].mapX) + mapViewX1 - 2;
        spriteSam[5] = mapToScreenY(flightRecords[param_1].mapY) + mapViewY1 - 2;
        return gfx_jump_11_blitSprite((int)spriteSam);
    case EVENT_BOMB_HIT:
        spriteWaypoint[4] = mapToScreenX(flightRecords[param_1].mapX) + mapViewX1;
        spriteWaypoint[5] = mapToScreenY(flightRecords[param_1].mapY) + mapViewY1;
        return gfx_jump_11_blitSprite((int)spriteWaypoint);
    case EVENT_EJECTED:
        spriteSam[4] = mapToScreenX(flightRecords[param_1].mapX) + mapViewX1 - 2;
        spriteSam[5] = mapToScreenY(flightRecords[param_1].mapY) + mapViewY1 - 2;
        return gfx_jump_11_blitSprite((int)spriteSam);
    case EVENT_WAYPOINT:
        spriteWaypoint[4] = mapToScreenX(flightRecords[param_1].mapX) + mapViewX1;
        spriteWaypoint[5] = mapToScreenY(flightRecords[param_1].mapY) + mapViewY1;
        return gfx_jump_11_blitSprite((int)spriteWaypoint);
    }
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

    p = ((int far *)commData)[COMM_UNK8_OFFSET / 2];
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
            } else if (*(int *)&samDataTable[(f & UNIT_ID_MASK) * 0x20] == -1) {
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
      + (long)((samKilled - samMissed * 2) * (((int far *)gameData)[GAME_START_DIFFICULTY / 2] + 1) * 50)
      + (long)((groundKilled - groundMissed * 2) * p * 20)
      + (long)(p * primaryHit * 200)
      + (long)(p * secondaryHit * 100);

    e = e * 2 / (g + 1);

    if (c != 0) {
        if (e < 0) {
            e = 0;
        }
        switch (((int far *)commData)[COMM_SETUP_DONE_OFFSET / 2]) {
        case 1:
            e /= 2;
            break;
        case 2:
            e = e * 3 / 4;
            break;
        }
    }

    return e;
}

unsigned int drawFlightPath(int param_1, unsigned int param_2) {
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
    while (++a, (flightRecords[a].status & STATUS_TYPE_MASK) != 0 && (unsigned)a <= param_2) {
        gfx_jump_21(0);
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
    while (++a, (flightRecords[a].status & STATUS_TYPE_MASK) != 0 && (unsigned)a <= param_2) {
        if ((flightRecords[a].status & STATUS_TYPE_MASK) != EVENT_TIMESTAMP) {
            drawEventSprite(a);
        }
    }
    a--;
    return a;
}

void showEventPopup(void) {
    int p;
    int a;

    (void)p;

    if (popupVisible == 1) {
        gfx_jump_2a(1, 0, POPUP_SAVE_Y, 0, popupX, popupY, POPUP_WIDTH, POPUP_HEIGHT);
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
            if (((int far *)commData)[COMM_SETUP_DONE_OFFSET / 2] == 3) {
                ejectedFlag = 1;
                a = 7;
            } else if (((int far *)commData)[COMM_SETUP_DONE_OFFSET / 2] == 1) {
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
    gfx_jump_2a(0, popupX, popupY, 1, 0, POPUP_SAVE_Y, POPUP_WIDTH, POPUP_HEIGHT);
    gfx_jump_2a(1, popupSpriteX[a], popupSpriteY[a], 0, popupX, popupY, POPUP_WIDTH, POPUP_HEIGHT);
    popupVisible = 1;
}

void blinkWidget(int *param_1, int param_2) {
    int p;
    int a;
    int b;
    int c;
    TRACE(("blinkWidget"));
    (void)a;
    (void)c;
    if (param_1[0x17] == 0) {
        param_1[0x17] = 1;
        b = (unsigned)param_1[9] >> 4;
        p = param_1[9] & 0xF;
        if (param_1[9] != 0) {
            gfx_jump_29_switchColor(param_2, param_1[4], param_1[5], param_1[6], param_1[7], b, p);
        }
    } else {
        param_1[0x17] = 0;
        b = param_1[9] & 0xF;
        p = (unsigned)param_1[9] >> 4;
    }
    if (param_1[9] != 0) {
        gfx_jump_29_switchColor(param_2, param_1[4], param_1[5], param_1[6], param_1[7], b, p);
    }
}

void processDebriefInput(int *param_1, int *param_2, int param_3) {
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

    colorTablePtr = param_2[8] * 14 + (int)dat_1c8e;
    timerCounter2 = 0;
    d = e = 0;
    inputChanged = enterPressed = animDone = f = 0;
    if (joyRepeatFlag == 1) {
        timerCounter = 0;
        f = 1;
    }

    /* pre-loop joystick read */
    if (commData[COMM_SETUP_USEJOY_OFFSET / 2] == 1) {
        d = misc_jump_5d_readJoy(0);
        e = misc_jump_5d_readJoy(1);
        routine_134();
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
        if (commData[COMM_SETUP_USEJOY_OFFSET / 2] == 1) {
            d = misc_jump_5d_readJoy(0);
            e = misc_jump_5d_readJoy(1);
            routine_134();
        }

        /* quit check */
        if (quitFlag != 0) {
            cleanup();
            restoreCbreakHandler();
            dosExit(0);
        }

        /* animation */
        if (colorAnimEnabled == 1) {
            if ((unsigned char)timerCounter2 > 6) {
                timerCounter2 = 0;
                c = ((unsigned int *)colorTablePtr)[colorAnimIdx + 1] >> 4;
                b = ((unsigned int *)colorTablePtr)[colorAnimIdx + 1] & 0xF;
                gfx_jump_29_switchColor(param_3, param_2[4], param_2[5], param_2[6], param_2[7], c, b);
                colorAnimIdx++;
                colorAnimIdx = (unsigned)colorAnimIdx % *(unsigned int *)colorTablePtr;
            }
        }

        /* sprite section */
        if (!(param_2[0x18] & 0x800)) goto skip_sprite;
        if (!(param_2[0x18] & 0x1000)) goto skip_sprite;
        if ((unsigned char)timerCounter3 <= 0x12) goto skip_sprite;
        timerCounter3 = 0;
        if (spriteToggle != 0) {
            switch (flightRecords[curRecordIdx].status & STATUS_TYPE_MASK) {
            case EVENT_AIR_KILL:
            case EVENT_AIR_KILL2:
                spriteAirBlink[4] = mapToScreenX((char)flightRecords[curRecordIdx].mapX) + mapViewX1 - 2;
                spriteAirBlink[5] = mapToScreenY((char)flightRecords[curRecordIdx].mapY) + mapViewY1 - 2;
                if (slotInfoTable[(flightRecords[curRecordIdx].unitId & UNIT_ID_MASK) << 4] & 8) {
                    spriteAirBlink[1] = 0x11E;
                } else {
                    spriteAirBlink[1] = 0x12D;
                }
                gfx_jump_11_blitSprite((int)spriteAirBlink);
                break;
            case EVENT_SAM_KILL:
                spriteSamBlink[4] = mapToScreenX((char)flightRecords[curRecordIdx].mapX) + mapViewX1 - 2;
                spriteSamBlink[5] = mapToScreenY((char)flightRecords[curRecordIdx].mapY) + mapViewY1 - 2;
                gfx_jump_11_blitSprite((int)spriteSamBlink);
                break;
            case EVENT_GROUND_KILL:
                spriteGroundBlink[4] = mapToScreenX((char)flightRecords[curRecordIdx].mapX) + mapViewX1 - 2;
                spriteGroundBlink[5] = mapToScreenY((char)flightRecords[curRecordIdx].mapY) + mapViewY1 - 2;
                gfx_jump_11_blitSprite((int)spriteGroundBlink);
                break;
            case EVENT_BOMB_HIT:
                spriteWaypointBlink[4] = mapToScreenX((char)flightRecords[curRecordIdx].mapX) + mapViewX1;
                spriteWaypointBlink[5] = mapToScreenY((char)flightRecords[curRecordIdx].mapY) + mapViewY1;
                gfx_jump_11_blitSprite((int)spriteWaypointBlink);
                break;
            case EVENT_EJECTED:
                spriteSamBlink[4] = mapToScreenX((char)flightRecords[curRecordIdx].mapX) + mapViewX1 - 2;
                spriteSamBlink[5] = mapToScreenY((char)flightRecords[curRecordIdx].mapY) + mapViewY1 - 2;
                gfx_jump_11_blitSprite((int)spriteSamBlink);
                break;
            case EVENT_WAYPOINT:
                spriteWaypointBlink[4] = mapToScreenX((char)flightRecords[curRecordIdx].mapX) + mapViewX1;
                spriteWaypointBlink[5] = mapToScreenY((char)flightRecords[curRecordIdx].mapY) + mapViewY1;
                gfx_jump_11_blitSprite((int)spriteWaypointBlink);
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
        cursorY -= param_1[1];
        if ((int)param_1[4] > (int)cursorY) {
            cursorY = param_1[4];
        }
        inputChanged = 1;
    }
    if (h == KEYCODE_DNARROW) {
        cursorY += param_1[1];
        if (cursorY > (unsigned)param_1[5]) {
            cursorY = param_1[5];
        }
        inputChanged = 1;
    }
    if (h == KEYCODE_RIGHTARROW) {
        cursorX += param_1[0];
        if (cursorX > (unsigned)param_1[3]) {
            cursorX = param_1[3];
        }
        inputChanged = 1;
    }
    if (h == KEYCODE_LEFTARROW) {
        cursorX -= param_1[0];
        if ((int)param_1[2] > (int)cursorX) {
            cursorX = param_1[2];
        }
        if ((int)param_1[4] > (int)cursorY) {
            cursorX += param_1[0];
        }
        inputChanged = 1;
    }

    /* final cleanup */
    if (param_2[0x18] & 0x800) {
        if (param_2[0x18] & 0x1000) {
            drawEventSprite(curRecordIdx);
        }
    }
}

void processMenuItems(int param_1, int param_2, int param_3, int param_4, int param_5, int param_6) {
    char p[2]; char a[2]; int b; char c[2]; int d; int e; char f[2];
    int g; int h; int i; int j; int k; int l; int m; int n; int o;
    (void)param_2;
    (void)b; (void)e; (void)g; (void)h; (void)i; (void)j;
    (void)k; (void)l; (void)m; (void)n; (void)o;
    p[0] = 0x0d; p[1] = 0;
    c[0] = 0x89; c[1] = 0;
    a[0] = 0x8d; a[1] = 0;
    f[0] = 0x80; f[1] = 0;
    d = 0;
    for (; d < param_3; d++) {
        if (*(int *)((char *)param_1 + d * 0x32 + 0x2e) == 2) {
            selectedMenuItem = d;
            *(int *)((char *)param_1 + d * 0x32 + 0x2e) = 0;
            blinkWidget((int *)((char *)param_1 + d * 0x32), param_6);
            drawMenuItem(param_1, d, param_6);
        } else {
            if (*(int *)((char *)param_1 + d * 0x32 + 0x2e) != 3) {
                *(int *)((char *)param_1 + d * 0x32 + 0x2e) = 0;
            }
        }
    }
    cursorX = param_4;
    cursorY = param_5;
}
