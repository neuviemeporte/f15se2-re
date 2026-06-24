#ifndef F15_SE2_CONST
#define F15_SE2_CONST

#define IRQ_VIDEO 0x10

#define DOS_ERROR_RMDIR 0x10
#define HALLFAME_RECORDSZ 32

#define THEATER_DS 6
#define THEATER_OTHER 4
#define DIFFICULTY_DEMO 4
#define HALLFAME_RECORDSZ 32
#define HALLFAME_SLOTS 8

#define MPS_TIMEOUT 120
#define ADV_TIMEOUT 180
#define PRINTMISS_TIMESTEP 100

#define SCREEN_WIDTH 320
#define SCREEN_HEIGHT 200

// briefing screen description text color, normal and highlighted
#define COLOR_BRIEF_DESC_NORMAL 7
#define COLOR_BRIEF_DESC_HL 8

#define FILENAME_LENGTH 13 // 8 + . + 3 + NULL

#define KEYCODE_ENTER 0xd
#define KEYCODE_ESC 0x1b
#define KEYCODE_UPARROW 0x4800
#define KEYCODE_LEFTARROW 0x4b00
#define KEYCODE_RIGHTARROW 0x4d00
#define KEYCODE_DNARROW 0x5000

#define CHAR_BELL 0x7

#define KEYCODE_ALTQ 0x1000
#define KEYCODE_BACKSPACE 0x8
#define KEYCODE_CTRLX 0x18

/* joystick axis values */
#define JOY_CENTER 128
#define JOY_DEADZONE_LO 78
#define JOY_DEADZONE_HI 178

/* graphics mode numbers from driver function 3f */
#define GFX_MODE_MDA 1
#define GFX_MODE_EGA 2
#define GFX_MODE_VGA 3

/* EGA DIP switch detection */
#define EGA_SWITCH_MASK 0xf
#define EGA_SWITCH_VALUE 9

/* font indices */
#define FONT_NORMAL 1
#define FONT_SMALL 4

/* number of theaters */
#define NUM_THEATERS 4
/* max difficulty level (0-based) */
#define MAX_DIFFICULTY 3

/* pilot roster layout */
#define PILOTS_PER_COLUMN 4
#define PILOT_COL_LEFT 16
#define PILOT_COL_RIGHT 160
#define PILOT_ROW_HEIGHT 44
#define PILOT_TOP_MARGIN 20
#define PILOT_ENTRY_WIDTH 143
#define PILOT_NAME_HEIGHT 8
#define MAX_PILOT_NAME_LEN 20

/* mission/world generation */
#define FIRST_REAL_ITEM 3
#define WORLD_COORD_SHIFT 5
#define DEFAULT_FUEL 19999

/* bearing constants (binary angle measurement) */
#define BEARING_NORTH 0x0000
#define BEARING_EAST  0x4000
#define BEARING_SOUTH 0x8000
#define BEARING_WEST  0xC000

/* color indices */
#define COLOR_WHITE 0xf
#define COLOR_GRAY 7
#define COLOR_RED 0xc
#define COLOR_TITLE 1
#define COLOR_COORDS 3

#define WORLD_BUFSZ 750 // 750
#define GRID_MAGIC 0x3232
#define TERRAIN_MAGIC 0x3131

#define SIGNATURE_3DG 0x3232
#define SIGNATURE_3DT 0x3131
#define SIGNATURE_3D3 0x3333
#define MAX_TILE_DATA 4000

#endif /* F15_SE2_CONST */
