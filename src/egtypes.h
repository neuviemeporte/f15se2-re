#ifndef F15_SE2_EGTYPES
#define F15_SE2_EGTYPES
/* egame.exe compat macros + hardware/comm/overlay constants. */

#define AIRCRAFT_MODELS_OFFSET 0xADD4
#define DOS_SET_IRQH 0x25
#define PORT_PIT_TIME0 0x40
#define PORT_PIT_CNTRL 0x43
#define COMM_GFXOVL_SEG 0x1a
#define COMM_SNDOVL_SEG 0x1c
#define COMM_MISCOVL_SEG 0x1e
#define COMM_GFXBUF_PTR 0x20
#define COMM_HERC_FLAG 0x24
#define COMM_SETUP_DONE_OFFSET 0x26
#define COMM_SETUP_GFXMODE_OFFSET 0x30
#define COMM_UNK7 0x38 /* weaponType */
#define COMM_JOYDATA_OFF 0x48
#define COMM_USEJOY_OFF 0x72
#define COMM_GFXMODE_OFFSET 0x78
#define COMM_WORLDBUF 0x7a
#define OFF_IACA_START 0x4f0
#define COMM_GAMEDATA_OFFSET 0x120e
#define IRQ_CBREAK 0x1b
#define GAMEDATA_THEATER 0x38
#define GAMEDATA_DIFFICULTY 0x3e
#define GAMEDATA_UNK4 0x40
#define WAYPT_PRIMARY 1
#define WAYPT_SECONDARY 2
#define WAYPT_BASE 3
#define IRQ_VIDEO 0x10
#define OVL_HDR_CODESEG 0x18
#define OVL_HDR_FIRSTIDX 0x1c
#define OVL_HDR_SLOTCOUNT 0x22
#define OVL_HDR_FIRSTPTR 0x24
#define UNIT_STATE_COUNT 100

typedef enum {
    VIEW_COCKPIT = 0,
    VIEW_REAR = 0x41,
    VIEW_LEFT = 0x42,
    VIEW_RIGHT = 0x43,
    VIEW_FORWARD = 0x44, /* fullscreen forward, no cockpit */
    VIEW_EXT_DYNAMIC = 0x84,
    VIEW_EXT_SIDE = 0x85,
    VIEW_EXT_UNUSED = 0x86, /* external, similar to 0x88 */
    VIEW_EXT_FOLLOW = 0x87,
    VIEW_EXT_TARGET = 0x88, /* player aircraft towards target? */
    VIEW_MISSILE = 0x89,
    VIEW_TARGET = 0x8b,
    VIEW_EJECT = 0x8c
} ViewMode;

#endif /* F15_SE2_EGTYPES */
