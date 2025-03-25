#ifndef F15_SE2_CONST
#define F15_SE2_CONST

#define IRQ_VIDEO 0x10

#define DOS_ERROR_RMDIR 0x10
#define HALLFAME_RECORDSZ 0x20

#define THEATER_DS 6
#define THEATER_OTHER 4
#define DIFFICULTY_DEMO 4
#define HALLFAME_RECORDSZ 0x20
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

#define WORLD_BUFSZ 0x2ee // 750
#define GRID_MAGIC 0x3232
#define TERRAIN_MAGIC 0x3131

#define SIGNATURE_3DG 0x3232
#define SIGNATURE_3DT 0x3131
#define SIGNATURE_3D3 0x3333
#define MAX_TILE_DATA 4000

#endif /* F15_SE2_CONST */
