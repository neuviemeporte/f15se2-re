#include "overlay.h"
#include "dosfunc.h"
#include "output.h"
#include "memory.h"
#include "offsets.h"

#include <STDDEF.H>

// Microprose overlay header format
#pragma pack(1)
struct OvlHeader {
    uint8 description[0x18]; // 00h-17h: description
    uint16 code_segment; // 18h-19h: total number of header paragraphs on disk, after relocation into memory becomes segment pointer into code
    uint16 base_segment; // 1ah-1bh: base load segment of overlay (relocated)
    uint16 first_slot; // 1ch-1dh: slot index (id) of first jump entry 
    uint16 size1; // 1eh-1fh: size1
    uint16 size2; // 20h-21h: size2
    uint16 jump_count; // 22h-23h: number of jump addresses 
    // 24h-...: array of jump offsets
    uint16 slot;
    // Extra description or padding data follows
};

uint16 overlay_load(const char* filename) {
    const size_t RESERVE_PARA = 0x400;
    const size_t EXTRA_PARA = 8; // original executable adds this many paragraphs for good measure
    size_t freeMem, alloc;
    uint16 ovlSegment, ovlSize;
    struct OvlHeader FAR *ovlHeader = NULL;
    int err;
    freeMem = dos_getfree();
    if (freeMem == 0) {
        ERROR("overlay_load(): unable to determine amount of free memory");
        return 0;
    }
    alloc = freeMem - RESERVE_PARA;
    ovlSegment = dos_alloc(alloc);
    DEBUG("overlay_load(): allocated block 0x%x of size %up (%lu) for overlay %s", ovlSegment, alloc, PARA_TO_BYTES(alloc), filename);
    if (ovlSegment == 0) {
        ERROR("overlay_load(): unable to allocate %u paragraphs", alloc);
        return 0;
    }
    err = dos_loadOverlay(filename, ovlSegment);
    if (err != 0) {
        ERROR("overlay_load(): unable to load overlay %s at 0x%x, error 0x%x", filename, ovlSegment, (int)err);
        dos_free(ovlSegment);
        return 0;
    }
    ovlHeader = MK_FP(ovlSegment, 0);
    ovlSize = (ovlHeader->size1 >> 4) + (ovlHeader->size2 >> 4); // overlay size in paragraphs
    DEBUG("overlay_load(): successfully loaded overlay, calculated size = %up (%lu)", ovlSize, PARA_TO_BYTES(ovlSize));
    if (ovlSize > alloc) {
        ERROR("overlay_load(): overrun allocated memory");
        dos_free(ovlSegment);
        return 0;
    }
    ovlSize += EXTRA_PARA;
    DEBUG("overlay_load(): shrinking overlay buffer to %up (%lu)", ovlSize, PARA_TO_BYTES(ovlSize));
    err = dos_resize(ovlSegment, ovlSize);
    if (err != 0) {
        ERROR("overlay_load: failed to resize overlay buffer to %up (%lu)", ovlSize, PARA_TO_BYTES(ovlSize));
        dos_free(ovlSegment);
        return 0;
    }
    return ovlSegment;
}

OverlayFunc overlay_functionAddress(const uint16 ovlLoadSegment, const uint16 funcNumber) {
    struct OvlHeader FAR *ovlHeader = MK_FP(ovlLoadSegment, 0);
    uint16 FAR* slotArray=&(ovlHeader->slot);
    return MK_FP(ovlHeader->code_segment, slotArray[funcNumber]);
}
