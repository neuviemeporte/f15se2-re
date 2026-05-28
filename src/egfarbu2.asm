; byte_228D0 - 3D object data buffer (0xADD4 bytes)
; Placed in its own segment so it starts at offset 0

FARBUF1_BSS SEGMENT PARA PUBLIC 'FAR_BSS'
    PUBLIC _byte_228D0
_byte_228D0 DB 0ADD4h DUP (?)
FARBUF1_BSS ENDS

END
