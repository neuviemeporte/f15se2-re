#ifndef F15_SE2_ENDTYPES
#define F15_SE2_ENDTYPES
/* Shared debrief types and constants (not owned by a single translation unit). */
#include "inttype.h"
#include "struct.h"
#include "sassert.h"

/* Flight record status field bitmasks */
#define STATUS_TYPE_MASK    0x3F  /* lower 6 bits: event type */
#define STATUS_PRIMARY_HIT  0x80  /* primary target was hit */
#define STATUS_SECONDARY_HIT 0x40 /* secondary target was hit */

/* Flight record event types (status & STATUS_TYPE_MASK) */
#define EVENT_AIR_KILL      1
#define EVENT_GROUND_KILL   2
#define EVENT_SAM_KILL      3
#define EVENT_BOMB_HIT      5
#define EVENT_EJECTED       8
#define EVENT_TIMESTAMP     9
#define EVENT_WAYPOINT      10
#define EVENT_AIR_KILL2     12

/* Map coordinate conversion divisors */
#define MAP_SCALE_X         0x92  /* horizontal: (coord << 7) / 0x92 */
#define MAP_SCALE_Y         0xC3  /* vertical:   (coord << 7) / 0xC3 */

/* Unit ID / slot index mask */
#define UNIT_ID_MASK        0x7F

/* Popup overlay dimensions (pixels) */
#define POPUP_WIDTH         48
#define POPUP_HEIGHT        40
#define POPUP_SAVE_Y        150  /* Y offset for popup save area */

/* VGA double-buffer size in paragraphs */
#define VGA_BUF_SIZE        15500

/* Normal debrief exit code */
#define EXIT_DEBRIEF        0x23

/* Font/color index for title text */
#define FONT_TITLE          13

/* Landing type values (commData->landingType) */
#define LANDING_CRASHED     1
#define LANDING_EJECTED     2
#define LANDING_SAFE        3

/* Max record count sentinel for drawFlightPath */
#define ALL_RECORDS         9999

/* calcMissionScore: compute score for all events */
#define SCORE_ALL_EVENTS    0x100

typedef uint16 MenuItemFlags;

#define MENUITEM_TYPE_MASK    0x0007 // 0b0000000000000111
#define MENUITEM_SELECTABLE   0x0008 // 0b0000000000001000
#define MENUITEM_ENABLED      0x0100 // 0b0000000100000000
#define MENUITEM_HAS_SPRITE   0x0800 // 0b0000100000000000
#define MENUITEM_SPRITE_BLINK 0x1000 // 0b0001000000000000

#pragma pack(1)
typedef struct MenuItem {
    int16  hitX1;          /* 0x00 */
    int16  hitY1;          /* 0x02 */
    int16  hitX2;          /* 0x04 */
    int16  hitY2;          /* 0x06 */

    int16  colorX1;        /* 0x08 */
    int16  colorY1;        /* 0x0a */
    int16  colorX2;        /* 0x0c */
    int16  colorY2;        /* 0x0e */
    int16  colorTableIdx;  /* 0x10 */
    int16  colorPair;      /* 0x12 */

    int16  labelData1[5];  /* 0x14-0x1D */
    int16 *pagePtr;        /* 0x1E */
    int16  labelData2[4];  /* 0x20-0x27 */
    struct SpriteParams *spriteNormal; /* 0x28 */
    struct SpriteParams *spriteBlink;  /* 0x2A */

    int16  groupId;        /* 0x2c: items sharing a groupId blink together */
    int16  state;          /* 0x2e */
    MenuItemFlags flags; /* 0x30 */
} MenuItem;
#pragma pack()
STATIC_ASSERT(sizeof(struct MenuItem) == 44 + 3 * sizeof(void*));

/* FlightRecord: 6 bytes per record */
typedef struct {
    char mapX;
    char mapY;
    char status;
    char unitId;
    char unk4;
    char unk5;
} FlightRecord;

/* WeaponDataBlock: a 4006-byte data block loaded from disk and read by byte
 * offset through the macro views in endata.h (planeArray, samWeaponTable,
 * nightMission, ...). Split into 200-byte chunks only to stay under MSC 5.1's
 * aggregate-initializer limit; treat it as an opaque block. */
#pragma pack(1)
struct WeaponDataBlock {
    unsigned char c0[200];
    unsigned char c200[200];
    unsigned char c400[200];
    unsigned char c600[200];
    unsigned char c800[200];
    unsigned char c1000[200];
    unsigned char c1200[200];
    unsigned char c1400[200];
    unsigned char c1600[200];
    unsigned char c1800[200];
    unsigned char c2000[200];
    unsigned char c2200[200];
    unsigned char c2400[200];
    unsigned char c2600[200];
    unsigned char c2800[200];
    unsigned char c3000[200];
    unsigned char c3200[200];
    unsigned char c3400[200];
    unsigned char c3600[200];
    unsigned char c3800[200];
    unsigned char c4000[6];
};
#pragma pack()

#endif /* F15_SE2_ENDTYPES */
