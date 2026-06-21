# F14 Exact Function Mapping

This report only lists functions in the current repo that do the same thing as functions in the newer F14 source tree.

- Current repo: `/home/xor/games/f15se2-re/src`
- F14 source: `/home/xor/games/f14src/src`, `/home/xor/games/f14src/h`

Selection rule: include only direct wrappers to the same MicroProse API, or functions whose body/formula is the same. Same subsystem, similar renderer role, or likely porting references are intentionally excluded.

## Exact matches

| Current repo function | F14 function | Evidence | Notes |
|---|---|---|---|
| `openFileWrapper` in `src/egfileio.c` | `OpenFile` in `/home/xor/games/f14src/h/LIBRARY.H` | Current wrapper directly returns `openFile(path, mode)`; F14 library declares `OpenFile(file, attrib)`. | Same file-open service behind a wrapper. |
| `openFileWrapper` in `src/shared/filepic.c` | `OpenFile` in `/home/xor/games/f14src/h/LIBRARY.H` | Current wrapper directly returns `openFile(filename, mode)`. | Same shared start/end executable wrapper. |
| `createFileWrapper` in `src/egfileio.c` | `CreateFile` in `/home/xor/games/f14src/h/LIBRARY.H` | Current wrapper directly returns `createFile(filename, attr)`. | Same create-file service. |
| `closeFileWrapper` in `src/egfileio.c` | `CloseFile` in `/home/xor/games/f14src/h/LIBRARY.H` | Current wrapper directly calls `closeFile(handle)`. | Same close-file service. |
| `closeFileWrapper` in `src/shared/filepic.c` | `CloseFile` in `/home/xor/games/f14src/h/LIBRARY.H` | Current wrapper directly calls `fileClose(handle)`. | Same shared close-file service. |
| `misc_getKey` in `src/shared/ovlimpl.c` | `GetKey` in `/home/xor/games/f14src/h/LIBRARY.H` | Current implementation performs BIOS `INT 16h AH=00h` and returns `AX`; F14 declares the same key-read service. | Same blocking key read behavior. |
| `setViewPosition` in `src/eg3dcam.c` | `SetViewPos` in `/home/xor/games/f14src/src/3DOBJECT.C` | Both store the three viewer coordinates into global view-position variables. | Names differ only by style. |
| `signedRatio16` in `src/egflight.c` | `IntDiv` in `/home/xor/games/f14src/src/FLTMATH.C` | Both compute `((((abs(A) << 16) / abs(B)) >> 1) * signA * signB)`. | Same signed 15-bit fixed-point divide. |
| `valueToAngle` in `src/egflight.c` | `Iasin` in `/home/xor/games/f14src/src/FLTMATH.C` | Both handle `-0x8000`, index the trig table by `abs(value) >> 9`, interpolate by 256, and restore sign. | Same arcsin table interpolation. |
| `complementAngle` in `src/egflight.c` | `Iacos` in `/home/xor/games/f14src/src/FLTMATH.C` | Both return `0x4000 - asin(value)`. | Same arccos helper. |
| `isqrt` in `src/egflight.c` | `Sqrt` in `/home/xor/games/f14src/src/FLTMATH.C` | Both take `abs(N)`, return `1` for `< 4`, seed with `N >> 2`, and Newton-iterate until guesses differ by <= 1. | Same integer square root. |
| `clampRange` in `src/egmath.c` | `rng` in `/home/xor/games/f14src/src/SUPPORT.C` | Same branch order: above max returns max, in range returns value, below min returns min unless `<= -0x4000`, which wraps to max. | Same clamp-with-F-15 overflow behavior. |
| `clampValue` in `src/egmath.c` | `rng2` in `/home/xor/games/f14src/src/SUPPORT.C` | Both return max if above max, min if below min, otherwise original value. | Same normal clamp. |
| `rangeApprox` in `src/egmath.c` | `xydist` in `/home/xor/games/f14src/src/SUPPORT.C` | Both use `max(abs(x), abs(y)) + (min(abs(x), abs(y)) >> 1)`, capped at `0x7fff`. | Same fast 2D distance approximation. |
| `signOf` in `src/egmath.c` | `sgn` in `/home/xor/games/f14src/src/SUPPORT.C` | Both return `0`, `1`, or `-1` for zero, positive, or negative input. | Same sign helper. |
| `randomRange` in `src/egmath.c` | `rnd` in `/home/xor/games/f14src/src/SUPPORT.C` | Both return `((long)max * rand()) >> 15`. | Same deterministic range scaling from `rand()`. |
| `sinMul` in `src/egmath.c` | `sinX` in `/home/xor/games/f14src/src/SUPPORT.C` | Both multiply a fixed-point sine lookup by the supplied value. | Same formula; current names are `sine`/`fixedMulQ14`, F14 names are `Isin`/`TrgMul`. |
| `cosMul` in `src/egmath.c` | `cosX` in `/home/xor/games/f14src/src/SUPPORT.C` | Both call the sine multiply helper with `angle + 0x4000`. | Same cosine-by-phase-shift helper. |

## Exact wrapper call chains

These are exact composed operations, not single same-body functions.

| Current repo function | F14 equivalent operation | Evidence | Notes |
|---|---|---|---|
| `loadPic` in `src/shared/filepic.c` | `OpenFile` + `DecodePic` + `CloseFile` from `/home/xor/games/f14src/h/LIBRARY.H` | Current function opens the file, decodes the PIC into a segment, and closes it. | Same operation as manually composing F14 library calls. |
| `openShowPic` in `src/shared/filepic.c` | `OpenFile` + show/decode picture call + `CloseFile` | Current function opens, calls `showPicFile`, then closes. | Same open/show/close pattern used around F14 `LoadPicture`/picture services. |
| `openBlitClosePic` in `src/egpic.c` | `OpenFile` + picture blit/decode call + `CloseFile` | Current function opens, calls `picBlit`, then closes. | Same open/blit/close operation. |

## Excluded from exact report

These were in the broader first draft but are not exact enough for this report:

| Current repo function/group | F14 area | Why excluded |
|---|---|---|
| `render3DView`, `setup3DTransform`, `projectObjects`, `rasterize3DWorld` | `NDraw3D`, `Bgn3D`, `NHorz`, `End3D` | Same renderer responsibilities, but F14 split/reworked the flow and world format. |
| `load3D3`, `load3DT`, `load3DG`, `load15Flt3d3` | `LoadEMSObject`, `Load3DPlaneInfo`, `LoadTheWorld` | Same asset-loading domain, but different formats and EMS/data-record model. |
| `computeBearing` / `calcBearing` | `ARCTAN`, `Langle`, `XYangle` | Same purpose, but not the same body as the F14 routines. |
| Tactical map, threat, SAM, mission, debrief functions | `TAC.C`, `MAP.C`, `TEWS.C`, `SAMS.C`, `MENUS.C` | Same subsystem only; no exact same-function match confirmed. |
