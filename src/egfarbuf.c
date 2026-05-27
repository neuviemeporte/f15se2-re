/* Far buffer definitions for egame.exe
 * These are large far arrays that in the original binary lived in a
 * separate far segment (CODE_4 at paragraph 0x228D) below DGROUP.
 * byte_228D0: 0xADD4 bytes (3D object data buffer)
 * byte_2D6A4: 0x520C bytes (15FLT.3D3 loading buffer)
 */
#include "egame.h"

/* Static far arrays - placed in their own far segment by MSC */
unsigned char far byte_228D0[0xADD4];
unsigned char far byte_2D6A4[0x520C];
