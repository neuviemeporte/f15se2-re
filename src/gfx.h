#ifndef F15_SE2_GFX
#define F15_SE2_GFX

#define INT_VID_MODESET 0
#define MODE_640_350 0x10

#define PORT_MDA_STATUS 0x3ba
#define PORT_CGA_STATUS 0x3da

/* Bug? Bit 7 does notthing in the MDA status port according to docs */
#define MDA_STATUS_RETRACE 0x80 
#define CGA_STATUS_RETRACE 0x8

#endif /* F15_SE2_GFX */
