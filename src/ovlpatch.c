/*
 * ovlpatch.c — C implementation of setupOverlaySlots() for virtual overlay.
 *
 * This function reads the virtual overlay header from DOS memory and populates
 * the far-call trampoline table (gfxFarTableExported[]) with far pointers to
 * f15.exe's code segment. Works identically for both real Mgraphic.exe and
 * the virtual overlay since both use the same OvlHeader field offsets.
 */

#include "inttype.h"
#include "pointers.h"
#include "gfx_impl.h"
#include "ovl.h"

/* External declaration of the far-call table in slot_trampoline.c */
extern GfxFarFn gfxFarTableExported[84];

/* Byte offsets for reading overlay header (same as ASM build) */
#define OVL_HDR_CODESEG 0x18   /* code segment */
#define OVL_HDR_FIRSTIDX 0x1C  /* first slot index */
#define OVL_HDR_SLOTCOUNT 0x22 /* number of slots */
#define OVL_HDR_FIRSTPTR 0x24  /* slot_offsets[] array (right after slotCount@0x22) */

/**
 * @brief Populate the far-call trampoline table with pointers from the overlay.
 *
 * Reads the virtual overlay header and fills gfxFarTableExported[] with far
 * pointers to functions in f15.exe's code segment. The offset array at
 * OVL_HDR_FIRSTPTR contains FP_OFF() values for each slot function.
 */
void setupOverlaySlots(uint16 ovlSeg) {
    uint16 codeSeg;   /* Overlay code segment (f15.exe's CS) */
    uint16 firstIdx;  /* First slot index (usually 0) */
    uint16 slotCount; /* Number of slots to patch */
    int16 i;

    /* Finding D: in NOASM the misc/sound drivers are never loaded, so
     * miscOvlAddr/sndOvlAddr are 0. Reading a "header" from segment 0 would
     * yield a garbage slotCount and corrupt gfxFarTableExported[]. Only the
     * gfx overlay (a real segment) does any work here. */
    if (ovlSeg == 0)
        return;

    /* Read overlay header fields from DOS memory via IACA/COMM */
    codeSeg = *(uint16 FAR *)MK_FP(ovlSeg, OVL_HDR_CODESEG);
    firstIdx = *(uint16 FAR *)MK_FP(ovlSeg, OVL_HDR_FIRSTIDX);
    slotCount = *(uint16 FAR *)MK_FP(ovlSeg, OVL_HDR_SLOTCOUNT);

    /* The trampoline table only covers the 84 gfx slots (0x00-0x53). The MISC
     * (firstIdx 0x5a) and SOUND (firstIdx 0x64) overlays fall outside it — in a
     * NO_ASM child those drivers are direct C, so skip patching for them rather
     * than writing past gfxFarTableExported[]. */
    if (firstIdx + slotCount > 84)
        return;

    /* Read slot_offsets[] array and populate trampoline table */
    for (i = 0; i < slotCount; i++) {
        uint16 off = *(uint16 FAR *)MK_FP(ovlSeg, OVL_HDR_FIRSTPTR + i * 2);
        gfxFarTableExported[firstIdx + i] = (GfxFarFn)MK_FP(codeSeg, off);
    }
}
