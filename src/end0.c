/* end0.c — compiled with /Gs /Zi (stack probes disabled, debug info) */
#include "offsets.h"
#include "pointers.h"
#include "debug.h"
#include "util.h"
#include "end.h"

typedef unsigned int MenuItemFlags;

#define MENUITEM_TYPE_MASK    0x0007 // 0b0000000000000111
#define MENUITEM_SELECTABLE   0x0008 // 0b0000000000001000
#define MENUITEM_ENABLED      0x0100 // 0b0000000100000000
#define MENUITEM_HAS_SPRITE   0x0800 // 0b0000100000000000
#define MENUITEM_SPRITE_BLINK 0x1000 // 0b0001000000000000

typedef struct MenuItem {
    int  hitX1;          /* 0x00 */
    int  hitY1;          /* 0x02 */
    int  hitX2;          /* 0x04 */
    int  hitY2;          /* 0x06 */

    int  colorX1;        /* 0x08 */
    int  colorY1;        /* 0x0a */
    int  colorX2;        /* 0x0c */
    int  colorY2;        /* 0x0e */
    int  colorTableIdx;  /* 0x10 */
    int  colorPair;      /* 0x12 */

    char label[0x18];    /* 0x14 .. 0x2b */

    int  unk_2c;         /* 0x2c */
    int  state;          /* 0x2e */
    MenuItemFlags flags; /* 0x30 */
} MenuItem;

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
    checkQuitFlag();
    clearKeybuf();
    showPostMissionAwards();
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

void animateFlightPath(int gfxPage)
{
    char local_18[22];
    int pad;

    if (popupVisible == 1) {
        gfx_jump_2a(1, 0, POPUP_SAVE_Y, 0, popupX, popupY, POPUP_WIDTH, POPUP_HEIGHT);
        popupVisible = 0;
    }
    clearRect((int *)gfxPage, 0xe9, 0x1e, 0x13f, 0x45);
    drawStringAt((int *)gfxPage, str_inFlight, 0xf0, 0x26);
loop_top:
        curRecordIdx++;
        if (flightRecords[curRecordIdx].status & STATUS_TYPE_MASK) {
            if ((flightRecords[curRecordIdx].status & STATUS_TYPE_MASK) == EVENT_TIMESTAMP) {
        clearRect((int *)gfxPage, 0xf0, 0x1e, 0x13f, 0x25);
        mystrcpy(scoreString, str_timeLabel);
        mystrcat(scoreString, formatFlightTime(*((int *)&flightRecords[curRecordIdx] - 1), local_18));
        drawStringAt((int *)gfxPage, scoreString, 0xf0, 0x1e);
        gfx_jump_21(0);
        if (prevDrawX == 0 && prevDrawY == 0) {
            drawFlightLine((int)var_194, (int)var_195, (int)flightRecords[curRecordIdx].mapX, (int)flightRecords[curRecordIdx].mapY);
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
        clearRect((int *)gfxPage, 0xe8, 0x56, 0x13f, 0x5e);
        drawStringCentered((int *)gfxPage, scoreString, 0xe8, 0x56, 0x57);
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
        drawFlightLine((int)var_194, (int)var_195, (int)flightRecords[curRecordIdx].mapX, (int)flightRecords[curRecordIdx].mapY);
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

int mapToScreenX(unsigned char mapCoord) {
    TRACE(("mapToScreenX"));
    return ((unsigned int)mapCoord << 7) / MAP_SCALE_X;
}

int mapToScreenY(unsigned char mapCoord) {
    TRACE(("mapToScreenY"));
    return ((unsigned int)mapCoord << 7) / MAP_SCALE_Y;
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

int isPointInRect(MenuItem *p)
{
    TRACE(("isPointInRect"));
    if (p->hitX1 <= cursorX && p->hitX2 >= cursorX && p->hitY1 <= cursorY && p->hitY2 >= cursorY)
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

int drawEventSprite(int recordIdx)
{
    TRACE(("drawEventSprite"));
    switch (flightRecords[recordIdx].status & STATUS_TYPE_MASK) {
        case EVENT_AIR_KILL:
        case EVENT_AIR_KILL2:
        spriteAir[4] = mapToScreenX(flightRecords[recordIdx].mapX) + mapViewX1 - 2;
        spriteAir[5] = mapToScreenY(flightRecords[recordIdx].mapY) + mapViewY1 - 2;
        if (slotInfoTable[(flightRecords[curRecordIdx].unitId & UNIT_ID_MASK) * 16] & 8) {
                    spriteAir[1] = 0x11e;
        } else {
            spriteAir[1] = 0x12d;
        }
        return gfx_jump_11_blitSprite((int)spriteAir);
    case EVENT_GROUND_KILL:
        spriteGround[4] = mapToScreenX(flightRecords[recordIdx].mapX) + mapViewX1 - 2;
        spriteGround[5] = mapToScreenY(flightRecords[recordIdx].mapY) + mapViewY1 - 2;
        return gfx_jump_11_blitSprite((int)spriteGround);
    case EVENT_SAM_KILL:
        spriteSam[4] = mapToScreenX(flightRecords[recordIdx].mapX) + mapViewX1 - 2;
        spriteSam[5] = mapToScreenY(flightRecords[recordIdx].mapY) + mapViewY1 - 2;
        return gfx_jump_11_blitSprite((int)spriteSam);
    case EVENT_BOMB_HIT:
        spriteWaypoint[4] = mapToScreenX(flightRecords[recordIdx].mapX) + mapViewX1;
        spriteWaypoint[5] = mapToScreenY(flightRecords[recordIdx].mapY) + mapViewY1;
        return gfx_jump_11_blitSprite((int)spriteWaypoint);
    case EVENT_EJECTED:
        spriteSam[4] = mapToScreenX(flightRecords[recordIdx].mapX) + mapViewX1 - 2;
        spriteSam[5] = mapToScreenY(flightRecords[recordIdx].mapY) + mapViewY1 - 2;
        return gfx_jump_11_blitSprite((int)spriteSam);
    case EVENT_WAYPOINT:
        spriteWaypoint[4] = mapToScreenX(flightRecords[recordIdx].mapX) + mapViewX1;
        spriteWaypoint[5] = mapToScreenY(flightRecords[recordIdx].mapY) + mapViewY1;
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

unsigned int drawFlightPath(int gfxPage, unsigned int maxRecord) {
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
    while (++a, (flightRecords[a].status & STATUS_TYPE_MASK) != 0 && (unsigned)a <= maxRecord) {
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

void blinkWidget(MenuItem *item, int gfxPage) {
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
            gfx_jump_29_switchColor(gfxPage, item->colorX1, item->colorY1, item->colorX2, item->colorY2, b, p);
        }
    } else {
        item->state = 0;
        b = item->colorPair & 0xF;
        p = (unsigned)item->colorPair >> 4;
    }
    if (item->colorPair != 0) {
        gfx_jump_29_switchColor(gfxPage, item->colorX1, item->colorY1, item->colorX2, item->colorY2, b, p);
    }
}

void processDebriefInput(int *cursorBounds, MenuItem *menuItem, int gfxPage) {
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

    colorTablePtr = menuItem->colorTableIdx * 14 + (int)dat_1c8e;
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
                gfx_jump_29_switchColor(gfxPage, menuItem->colorX1, menuItem->colorY1, menuItem->colorX2, menuItem->colorY2, c, b);
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

void processMenuItems(MenuItem *items, int unused, int itemCount, int cursorStartX, int cursorStartY, int gfxPage) {
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

void routine_96(MenuItem *param_1, int param_2, int param_3) {
    char p[2]; char a[2]; char b[2]; int c; char d[2]; int e; int f;
    int g; int h; int i; int j; int k; int l; int m;
    char n[2]; int o;
    register int si;
    (void)c; (void)e; (void)f; (void)g; (void)h; (void)i;
    (void)j; (void)k; (void)l; (void)m;
    p[0] = 0x0a; p[1] = 0;
    b[0] = 0x89; b[1] = 0;
    a[0] = 0x8d; a[1] = 0;
    d[0] = 0x80; d[1] = 0;
    si = param_1[param_2].flags;
    if (!(si & MENUITEM_HAS_SPRITE))
        return;
    if ((si & MENUITEM_TYPE_MASK) != 7)
        goto section2;
    /* Section 1: mission complete display */
    clearRect((int *)param_3, 0xeb, 0x0a, 0x13f, 0x95);
    ((int *)param_3)[2] = 0;
    mystrcpy(dat_4824, b);
    mystrcat(dat_4824, str_pressExit);
    drawWrappedText((int *)param_3, dat_4824, 0x50, 0xf0, 0x82, 8);
    clearRect((int *)param_3, 0xf0, 0x64, 0x12c, 0x7e);
    if (popupVisible == 1) {
        gfx_jump_2a(1, 0, POPUP_SAVE_Y, 0, popupX, popupY, POPUP_WIDTH, POPUP_HEIGHT);
        popupVisible = 0;
    }
    curRecordIdx = 0;
    var_192 = drawFlightPath(param_3, 0x270f);
    *(long *)&missionScore = calcMissionScore(var_192);
    mystrcpy(dat_4824, str_dot1);
    mystrcat(dat_4824, str_overall1);
    drawStringCentered((int *)param_3, dat_4824, 0xe8, 0x46, 0x57);
    mystrcpy(dat_4824, str_missionRating1);
    drawStringCentered((int *)param_3, dat_4824, 0xe8, 0x4e, 0x57);
    mystrcpy(dat_4824, str_dot2);
    my_ltoa(*(long *)&missionScore, (char *)n);
    mystrcat(dat_4824, (char *)n);
    drawStringCentered((int *)param_3, dat_4824, 0xe8, 0x56, 0x57);
    if (commData[0x30 / 2] != 0) {
        drawStringCentered((int *)param_3, str_trainingScore, 0xe8, 0x60, 0x57);
        drawStringCentered((int *)param_3, str_notRecorded, 0xe8, 0x68, 0x57);
    } else {
        mystrcpy(dat_4824, str_dot3);
        mystrcat(dat_4824, str_careerTotal);
        drawStringCentered((int *)param_3, dat_4824, 0xe8, 0x6c, 0x57);
        mystrcpy(dat_4824, str_dot4);
        my_ltoa(*(long far *)&gameData[0x32 / 2] + *(long *)&missionScore, (char *)n);
        mystrcat(dat_4824, (char *)n);
        drawStringCentered((int *)param_3, dat_4824, 0xe8, 0x74, 0x57);
    }
    ((int *)param_3)[2] = 0x0d;
    mystrcpy(dat_4824, str_missionSummary);
    drawStringCentered((int *)param_3, dat_4824, 0xe8, 0x14, 0x57);
    ((int *)param_3)[2] = 0;
    mystrcpy(dat_4824, str_priSecTargets);
    drawStringAt((int *)param_3, dat_4824, 0xf0, 0x1e);
    my_itoa(primaryHit + secondaryHit, dat_4824);
    drawStringAt((int *)param_3, dat_4824, 0x131, 0x1e);
    mystrcpy(dat_4824, str_otherTargets);
    drawStringAt((int *)param_3, dat_4824, 0xf0, 0x26);
    my_itoa(groundKilled + airKilled - primaryHit - secondaryHit, dat_4824);
    drawStringAt((int *)param_3, dat_4824, 0x131, 0x26);
    mystrcpy(dat_4824, str_enemyPlanes);
    drawStringAt((int *)param_3, dat_4824, 0xf0, 0x2e);
    my_itoa(samKilled, dat_4824);
    drawStringAt((int *)param_3, dat_4824, 0x131, 0x2e);
    mystrcpy(dat_4824, str_friendlyTargets);
    drawStringAt((int *)param_3, dat_4824, 0xf0, 0x36);
    my_itoa(groundMissed + airMissed + samMissed, dat_4824);
    drawStringAt((int *)param_3, dat_4824, 0x131, 0x36);
    ejectedFlag = 1;
section2:
    if (!(param_1[param_2].flags & MENUITEM_SPRITE_BLINK))
        return;
    if (ejectedFlag != 1)
        goto eventDisplay;
    ejectedFlag = 0;
    popupVisible = 0;
    gfx_jump_11_blitSprite(var_102);
    curRecordIdx = prevDrawX = prevDrawY = 0;
    clearRect((int *)param_3, 0xeb, 0x0a, 0x13f, 0x95);
    *(long *)&missionScore = calcMissionScore(0x100);
    mystrcpy(dat_4824, str_dot5);
    mystrcat(dat_4824, str_overall2);
    drawStringCentered((int *)param_3, dat_4824, 0xe8, 0x64, 0x57);
    mystrcpy(dat_4824, str_missionRating2);
    drawStringCentered((int *)param_3, dat_4824, 0xe8, 0x6c, 0x57);
    mystrcpy(dat_4824, str_dot6);
    my_ltoa(*(long *)&missionScore, (char *)n);
    mystrcat(dat_4824, (char *)n);
    drawStringCentered((int *)param_3, dat_4824, 0xe8, 0x74, 0x57);
eventDisplay:
    clearRect((int *)param_3, 0xeb, 0x0a, 0x13f, 0x63);
    ((int *)param_3)[2] = 0x0d;
    mystrcpy(dat_4824, str_missionEvent);
    drawStringCentered((int *)param_3, dat_4824, 0xe8, 0x14, 0x57);
    mystrcpy(dat_4824, str_time);
    mystrcat(dat_4824, formatFlightTime(var_193[curRecordIdx * 3], (char *)n));
    drawStringAt((int *)param_3, dat_4824, 0xf0, 0x1e);
    o = flightRecords[curRecordIdx].unitId & 0x7f;
    switch (flightRecords[curRecordIdx].status & 0x3f) {
    case 1:
    case 12:
        e = dat_424e[o * 8];
        if (e != 0) {
            mystrcpy(dat_4824, worldStrings[e]);
            mystrcat(dat_4824, str_destroyed4);
            mystrcat(dat_4824, worldStrings[var_425c[o * 16] & 0x7f]);
            mystrcat(dat_4824, str_destroyed1);
        } else {
            mystrcpy(dat_4824, worldStrings[var_425c[o * 16] & 0x7f]);
            mystrcat(dat_4824, str_destroyed2);
        }
        break;
    case 3:
        mystrcpy(dat_4824, (char *)(o * 32 + 0x198));
        mystrcat(dat_4824, str_shotDown2);
        mystrcat(dat_4824, (char *)(o * 32 + 0x19f));
        mystrcat(dat_4824, str_shotDown);
        break;
    case 2:
        mystrcpy(dat_4824, worldStrings[o]);
        mystrcat(dat_4824, str_destroyed3);
        break;
    case 10:
        e = dat_424e[o * 8];
        if (e != 0) {
            mystrcpy(dat_4824, worldStrings[e]);
            mystrcat(dat_4824, str_rearmed3);
            mystrcat(dat_4824, worldStrings[var_425c[o * 16] & 0x7f]);
            mystrcat(dat_4824, str_rearmed1);
        } else {
            mystrcpy(dat_4824, worldStrings[var_425c[o * 16] & 0x7f]);
            mystrcat(dat_4824, str_rearmed2);
        }
        break;
    case 5:
        mystrcpy(dat_4824, str_hitBy);
        mystrcat(dat_4824, (char *)(o * 18 + 0x3f8));
        mystrcat(dat_4824, str_missile);
        break;
    case 8:
        if (curRecordIdx == 0) {
            mystrcpy(dat_4824, str_takeoffPoint);
            e = dat_424e[dat_4804 * 8];
            if (e != 0) {
                mystrcat(dat_4824, worldStrings[e]);
            } else {
                mystrcat(dat_4824, worldStrings[(unsigned char)var_425c[dat_4804 * 16]]);
            }
        } else {
            mystrcpy(dat_4824, str_missionEnd);
            switch (commData[0x26 / 2]) {
            case 1:
                mystrcat(dat_4824, str_crashed);
                break;
            case 2:
                if (commData[0x28 / 2] == 0 && missionResult != 0) {
                    mystrcat(dat_4824, str_goodBailout);
                } else if (commData[0x28 / 2] == 0 && missionResult == 0) {
                    mystrcat(dat_4824, str_captured);
                } else {
                    mystrcat(dat_4824, str_bailedDied);
                }
                break;
            case 3:
                mystrcat(dat_4824, str_goodLanding);
                break;
            }
        }
        break;
    default:
        break;
    }
    drawWrappedText((int *)param_3, dat_4824, 0x50, 0xf0, 0x26, 8);
    if ((unsigned char)flightRecords[curRecordIdx].status & 0x80) {
        mystrcpy(dat_4824, str_primaryObj);
        drawStringCentered((int *)param_3, dat_4824, 0xe8, ((int *)param_3)[5], 0x57);
    }
    if ((unsigned char)flightRecords[curRecordIdx].status & 0x40) {
        mystrcpy(dat_4824, str_secndryObj);
        drawStringCentered((int *)param_3, dat_4824, 0xe8, ((int *)param_3)[5], 0x57);
    }
    *(long *)&missionScore = calcMissionScore(curRecordIdx);
    mystrcpy(dat_4824, str_cumulative2);
    mystrcat(dat_4824, str_cumulative);
    drawStringCentered((int *)param_3, dat_4824, 0xe8, 0x46, 0x57);
    mystrcpy(dat_4824, str_missionRating3);
    drawStringCentered((int *)param_3, dat_4824, 0xe8, 0x4e, 0x57);
    mystrcpy(dat_4824, str_pressSelect);
    my_ltoa(*(long *)&missionScore, (char *)n);
    mystrcat(dat_4824, (char *)n);
    drawStringCentered((int *)param_3, dat_4824, 0xe8, 0x56, 0x57);
    showEventPopup();
    mystrcpy(dat_4824, b);
    mystrcat(dat_4824, str_pressNext);
    drawWrappedText((int *)param_3, dat_4824, 0x50, 0xf0, 0x82, 8);
}

// 224a
int routine_60(MenuItem *param_1, int param_2, int param_3, int param_4, int param_5) {
    char p[2]; int a; int b; char c[2]; int d; char e[2]; int f;
    int g; char h[2]; int i; char j[10]; int k; int l; int m; int n; int o;
    register int si; 
    (void)param_2;
    (void)d; (void)g; (void)j; (void)k; (void)l; (void)m; (void)n; (void)o;
    p[0] = 0x0d; p[1] = 0;
    e[0] = 0x89; e[1] = 0;
    c[0] = 0x8d; c[1] = 0;
    h[0] = 0x80; h[1] = 0;
    gfx_jump_50();
    colorAnimEnabled = 0;
    i = 0;
    while (isPointInRect(&param_1[i]) == 0 && i < param_3)
        i++;
    joyRepeatFlag = 0;
    for (;;) {
        do {
            // 22a8
            gfx_jump_50();
            si = i * 0x32;
            if ((param_1[i].flags & MENUITEM_ENABLED) == 0) {
                colorAnimEnabled = 1;
            }
            // 22d4
            processDebriefInput((int *)param_4, &param_1[i], param_5);
        } while (inputChanged == 0 && enterPressed == 0);
        // 22e8
        if (enterPressed != 0) { // 22f2
            if (i != selectedMenuItem) { // 22fa
                i = 0;
                while (isPointInRect(&param_1[i]) == 0 && i < param_3)
                    i++;
            } // 2320
            // 232c
            if (param_1[selectedMenuItem].colorTableIdx != 0)
                goto done;
            b = 0x0b;
            a = 9;
            gfx_jump_29_switchColor(param_5, param_1[selectedMenuItem].colorX1, param_1[selectedMenuItem].colorY1, param_1[selectedMenuItem].colorX2, param_1[selectedMenuItem].colorY2, 0x0b, 9);
            b = 3;
            gfx_jump_29_switchColor(param_5, param_1[selectedMenuItem].colorX1, param_1[selectedMenuItem].colorY1, param_1[selectedMenuItem].colorX2, param_1[selectedMenuItem].colorY2, 3, a);
            b = 0x0d;
            gfx_jump_29_switchColor(param_5, param_1[selectedMenuItem].colorX1, param_1[selectedMenuItem].colorY1, param_1[selectedMenuItem].colorX2, param_1[selectedMenuItem].colorY2, 0x0d, a);
            goto done;
        } // 23c2
        i = 0;
        while (isPointInRect(&param_1[i]) == 0 && i < param_3)
            i++;
        if (i != selectedMenuItem) {
            if ((param_1[i].flags & MENUITEM_SELECTABLE) != 0) {
                for (f = 0; f < param_3; f++) {
                    if (param_1[f].state != 0 &&
                        param_1[i].unk_2c == param_1[f].unk_2c) {
                        blinkWidget(&param_1[f], param_5);
                    }
                }
                if (param_1[selectedMenuItem].colorTableIdx == 0) {
                    b = 9;
                    a = 6;
                    gfx_jump_29_switchColor(param_5, param_1[selectedMenuItem].colorX1, param_1[selectedMenuItem].colorY1, param_1[selectedMenuItem].colorX2, param_1[selectedMenuItem].colorY2, 9, 6);
                    b = 3;
                    gfx_jump_29_switchColor(param_5, param_1[selectedMenuItem].colorX1, param_1[selectedMenuItem].colorY1, param_1[selectedMenuItem].colorX2, param_1[selectedMenuItem].colorY2, 3, a);
                    b = 0x0d;
                    gfx_jump_29_switchColor(param_5, param_1[selectedMenuItem].colorX1, param_1[selectedMenuItem].colorY1, param_1[selectedMenuItem].colorX2, param_1[selectedMenuItem].colorY2, 0x0d, a);
                    b = 0x0b;
                    gfx_jump_29_switchColor(param_5, param_1[selectedMenuItem].colorX1, param_1[selectedMenuItem].colorY1, param_1[selectedMenuItem].colorX2, param_1[selectedMenuItem].colorY2, 0x0b, a);
                }
                if (param_1[selectedMenuItem].colorTableIdx == 1) {
                    b = 8;
                    a = 7;
                    gfx_jump_29_switchColor(param_5, param_1[selectedMenuItem].colorX1, param_1[selectedMenuItem].colorY1, param_1[selectedMenuItem].colorX2, param_1[selectedMenuItem].colorY2, 8, 7);
                }
                blinkWidget(&param_1[i], param_5);
            }
            selectedMenuItem = i;
            routine_96(param_1, i, param_5);
        }
    }
done:
    return i;
}
