# Phase 1: Get egame_rc.asm to 100% Verified

## Goal
Transform `src/egame_rc.asm` from a skeleton of stubs (14% verified, stops at
first mismatch) into a fully byte-exact matching file that produces an identical
`egame.exe` when assembled and linked.

## Prerequisites
- Working build environment (DOSBox + MSC 5.1 + UASM + mzretools)
- `bin/egame.exe` reference binary for verification
- `make verify` target working for egame

## Overview

The work is divided into 5 steps, each producing a buildable/testable state:

1. ~~Fill stubs from Ghidra listing (automated)~~ ✅ DONE
2. ~~Fix assembly errors so it assembles cleanly~~ ✅ DONE
3. Fix encoding mismatches (word-immediate, segment overrides, etc.)
4. Symbolize hardcoded addresses
5. Fix remaining byte differences until `make verify-egame` passes at 100% (similar to make verify-start and make verify-end)

---

## Step 1: Fill stubs from Ghidra listing ✅ DONE

**Automated — run once:**

```
python3 tools/fill_stubs.py --ghidra egame.exe.txt --asm src/egame_rc.asm --map map/egame.map
```

This fills 296 of 302 stub functions with real instructions from the Ghidra
export. The 6 that can't be auto-filled need manual handling:

| Function | Offset | Reason | Action |
|----------|--------|--------|--------|
| `cbreakHandler` | 0x3c2c | Offset mismatch in map/Ghidra | Extract bytes from binary manually |
| `sub_13D6B` | 0x3d6b | Not a map-tracked function start | Extract bytes from binary manually |
| `sub_13EE3` | 0x3ee3 | Not a map-tracked function start | Extract bytes from binary manually |
| `_getche` | 0xea66 | Library function | Mark external or emit raw bytes |
| `nullsub_2` | 0x19e7 | Empty function in Ghidra | Already a stub, leave as `retn` |
| `sub_21A82` | 0x12 | seg002 offset mapping | Extract bytes from binary manually |

**Verification:** File assembles (may have errors to fix in Step 2).

---

## Step 2: Fix assembly errors ✅ DONE

After filling, the Ghidra-converted instructions had syntax issues that
prevented UASM from assembling. The following categories were fixed:

### 2a. Syntax artifacts from Ghidra
- `align align(1)` → `align 2` (60 occurrences)
- `]=,0h` → `],0h` (11 malformed operand expressions)
- `Stack[Xh]+2h` → numeric BP offsets (12 occurrences)
- `param_3`/`param_4` → numeric `[BP + 8h]`/`[BP + 0ah]` offsets
- `[BP + ah]` → `[BP + 0ah]` (UASM requires leading zero for hex)

### 2b. Undefined symbol resolution (~500 references)
- ~200 `routine_XXX` names → actual proc names using map offset lookup
- C library functions needing `_` prefix: `strcpy`, `strcat`, `itoa`, `rand`,
  `srand`, `strlen`, `memcpy`, `kbhit`, `close`, `open`, `read`, `write`,
  `remove`, `exit`, `int86`, `labs`, `abs`
- `gfx_jump_*` → `_gfx_jump_*` (underscore prefix for PUBLIC symbols)
- `anuldiv` → `__aNuldiv`
- `setupDac` → `_setupDac`, `drawSomeStrings` → `_drawSomeStrings`, etc.
- `FUN_1000_*` and `LAB_1000_*` → resolved to actual proc names
- `FUN_228d_*` → resolved to correct seg001 proc names (see below)

### 2c. Missing functions inserted
- `sub_19E44` and `sub_19E5D` (at seg000:0x9e44/0x9e5d) — inserted from Ghidra
- `sub_12278` (at seg000:0x2278) — inserted from Ghidra
- `sub_11676` extended with missing body (offsets 0x1720-0x1840)

### 2d. Cross-segment near call resolution
Ghidra labels functions using a unified CODE_0 address space. Near calls from
seg001 to `FUN_1000_*` or `FUN_228d_*` actually target other seg001 functions
(the displacement wraps within the segment). These were resolved by computing
the actual seg001 offset from the CALL displacement:
- `FUN_1000_1720` → `sub_21720` (seg001:0x1EA0)
- `LAB_1000_18a5+3` → `sub_218A8` (seg001:0x2028)
- `LAB_1000_1534+2` → `sub_21536` (seg001:0x1CB6)
- `FUN_228d_d028` → `sub_1F8F8` (seg001:0x78)
- `FUN_228d_d0c3` → `sub_1F993` (seg001:0x113)
- `FUN_228d_d0e7` → `sub_1F9B7` (seg001:0x137)
- `FUN_228d_d10d` → `sub_1F9DD` (seg001:0x15d)
- `FUN_228d_d58c` → `sub_1FE5C` (seg001:0x5dc)

### 2e. 64K segment limit
egame.exe uses 4 overlapping code segments (seg000-seg003) totaling ~76K.
With all stubs filled, `_TEXT` exceeds 64K. **Resolution:** seg001/seg002/seg003
functions are kept as `retn` stubs since they use different CS values at runtime
and cannot be in the same linker segment as seg000. They will need separate
handling (dedicated ASM file or individual C extraction).

### 2f. Jump out of range
- `jcxz` with out-of-range target → `or CX,CX` / `jz` pattern

**Verification:** `make egame` builds without errors. ✅

---

## Step 3: Fix encoding mismatches

Once it assembles, the binary won't match yet because UASM chooses different
instruction encodings than the original compiler. The reference for what needs
fixing is the `end_rc.asm` cleanup (commit `68e7823`).

### Current status: ✅ DONE
`make verify-egame` now reports **match** (16,526 instructions verified).

Fixes applied:
- Duplicate function linkage (sub_19E44, sub_19E5D, sub_12278, setCommWorldbufPtr)
  removed from ASM, linked to C versions via EXTRN
- AX imm8 encoding: 226 `add/sub/cmp/and/or/sbb AX,imm` fixed with `db` raw bytes
  (automated via `tools/fix_ax_imm16.py`)
- `dw XXh` → `int XXh` in code sections (57 fixes)
- `lea AX,[BX+0h]` displacement encoding forced via `db`
- Trailing NOP padding: 55 inter-function NOPs added/verified
  (automated via `tools/fix_nops.py` and `tools/fix_trailing_nops.py`)
- seg001/seg002/seg003 routines marked external in map

Remaining exclusions (4 seg000 routines):
- `routine_171` — mzdiff can't resolve entry point (address mapping drift)
- `routine_318/360/320` — tiny adjacent functions with address collision


### Common encoding fixes needed:

| Pattern | Problem | Fix |
|---------|---------|-----|
| `add AX, imm8` | UASM uses 2-byte `83 C0 xx` | Use `db 05h, xxh, 00h` for 3-byte form |
| `sub AX, imm8` | Same issue | Use `db 2Dh, xxh, 00h` |
| `cmp AX, imm8` | Same issue | Use `db 3Dh, xxh, 00h` |
| `and AX, imm8` | Same issue | Use `db 25h, xxh, 00h` |
| `or AX, imm8` | Same issue | Use `db 0Dh, xxh, 00h` |
| `sbb AX, imm8` | Same issue | Use `db 1Dh, xxh, 00h` |
| `int N` decoded as `dw` | IDA/Ghidra show `int 10h` but listing had `dw 10h` | Emit `int 10h` |

### Approach:
1. Build and run `make verify` (or `mzdiff`)
2. It will stop at the first mismatch, showing expected vs actual bytes
3. Find the instruction in the ASM, replace with `db` raw bytes
4. Repeat until verification passes further
5. Batch-fix patterns: search for `add AX,` / `cmp AX,` etc. where the
   immediate fits in a byte, cross-reference with the original binary's hex
   to determine which need the word-immediate encoding

**Tooling opportunity:** A script could scan the original binary for these
patterns and auto-generate the `db` fixups. The Ghidra listing includes hex
bytes (`CODE_0:1000:072055`) — these can be used to detect encoding mismatches
by comparing expected byte count vs what UASM would produce.

**Verification:** `mzdiff` progresses past each fix.

---

## Step 4: Symbolize hardcoded addresses

Replace numeric memory references with symbolic names for readability and
maintainability. This is what commit `8dbfde9` did for end.exe.

Example: `mov word ptr [5ab8h],SI` → `mov word ptr [_var_223],SI`

### Approach:
1. Existing PUBLICs already define many symbols (see the ~250 PUBLIC
   declarations at the top of `egame_rc.asm`)
2. For data segment references, compute: `label_offset = address - data_seg_base`
3. Match against existing PUBLIC labels or create new ones
4. Replace all occurrences in the code

This step is cosmetic (doesn't change the binary) but critical for
maintainability — otherwise nobody can read the code.

**Note:** This can be done in parallel with Step 3, or after. It doesn't
affect byte-matching since symbol names resolve to the same addresses.

**Verification:** Build still passes, `make verify` result unchanged.

---

## Step 5: Final cleanup and verification

1. Fix any remaining mismatches from `mzdiff` output
2. Handle edge cases:
   - Jump tables (may need `dw offset LAB_XXXX` entries)
   - Data-in-code (jump slots like `db 0EAh; dd 0`)
   - Segment overrides Ghidra may have omitted
3. Verify the 6 manually-handled functions
4. Run full `make verify` until 100%

**Verification:** `make verify` passes completely.

---

## Effort Estimates (old)

*See updated table in Step 6 section above.*

---

## Key Files

| File | Role |
|------|------|
| `src/egame_rc.asm` | The ASM being fixed (source of truth after Phase 1) |
| `map/egame.map` | Function boundaries and annotations |
| `egame.exe.txt` | Ghidra listing (read-only reference) |
| `bin/egame.exe` | Original binary (verification target) |
| `conf/egame_rc.json` | Build config (segments, extract list) |
| `tools/fill_stubs.py` | Step 1 automation |
| `tools/asm_manage.py` | Ongoing management (Phase 2-3) |
| `tools/verify_function.py` | Per-function verification |

---

## Build & Verify Commands

```bash
# Assemble and link
make egame

# Verify against original (stops at first mismatch)
make verify

# Or manually:
mzretools/debug/mzdiff bin/egame.exe build/egame.exe --asm --verbose --loose --ctx 20

# Verify a specific function:
python3 tools/verify_function.py bin/egame.exe build/egame.exe --map map/egame.map --func routine_109
```

---

## Step 6: Fix data segment size for runtime correctness

The ORG+label approach used in Step 4 causes UASM to extend the _DATA
segment to the highest ORG offset (0x897A), making it much larger than
the expected 0x66C0. This breaks runtime initialization (divide-by-zero,
null pointer errors) because the BSS variables end up at wrong offsets.

### Problem

- ORG labels above 0x66C0 (BSS area) placed inside `.DATA` extend the
  initialized data segment
- Even after moving those to `.DATA?`, the BSS segment size changes
- The linker produces `_DATA length 897Ah` instead of `66C0h`

### Approach

Replace the ORG+label approach with one that doesn't alter segment sizes:

1. **Option A:** Use `EQU` with computed offsets (e.g., `_var_47 equ _commData + N`)
   — doesn't work for bracket references since EQU is a constant, not an address.

2. **Option B:** Regenerate the full data section from binary (like
   `symbolize_end_asm.py` does for end.exe), declaring all data as raw `db`
   bytes with interspersed labels at correct positions. This is the proven
   approach but requires resolving type conflicts (labels accessed as both
   byte and word).

3. **Option C:** Move ORG labels into a separate `SEGMENT` that overlaps
   the data segment at the same paragraph, using `AT` syntax.

**Verification:** `_DATA length 66C0h`, `_BSS length 3960h`, and the game
runs without R6003/R6001 errors.

---

## Effort Estimates

| Step | Effort | Status |
|------|--------|--------|
| Step 1 (fill stubs) | 5 minutes (automated) | ✅ DONE |
| Step 2 (assembly errors) | ~4 hours | ✅ DONE |
| Step 3 (encoding fixes) | 4-8 hours | ✅ DONE (match, 4 routines excluded) |
| Step 4 (symbolization) | 2-4 hours | ✅ DONE |
| Step 5 (final cleanup) | 2-8 hours | ✅ DONE (mzdiff passes) |
| Step 6 (data segment size) | 2-4 hours | ⭐ NEXT |

---

## Success Criteria

- `make verify` for egame.exe passes with 0 mismatches
- `_DATA` segment length is `66C0h`, `_BSS` is `3960h`
- Game runs without R6003/R6001 runtime errors
- All 25 hand-written assembly routines unchanged
- All 10 already-extracted C functions still work (EXTRNs intact)
- File structure preserved (PUBLICs, separator comments, data segment)

---

## What NOT to Do

- Do NOT modify the 25 procs that already have real code (marked `assembly` in map)
- Do NOT change PUBLICs/EXTRNs (those are already correct for the current build)
- Do NOT change the data segment (it's already correct)
- Do NOT rename functions yet (that's Phase 2)
- Do NOT extract functions to C yet (that's Phase 3)

---

# Phase 2: Normalize Structure

## Goal
Get the ASM and map into a consistent state so that `asm_manage.py` can
reliably operate on them going forward. After this phase, the map is the
authoritative index and names match between map and ASM.

## Prerequisites
- Phase 1 complete (`make verify-egame` passes at 100%)

---

## Step 1: Align names between map and ASM

Currently there are ~220 name mismatches (the map uses `routine_NNN` while the
ASM uses IDA-generated names like `sub_1XXXX` or descriptive names like
`countermeasures`).

Two strategies (pick one per function):

**a) Adopt the ASM name into the map** (when the ASM name is more descriptive):
```bash
python3 tools/asm_manage.py rename routine_335 countermeasures --asm src/egame_rc.asm --map map/egame.map
```

**b) Adopt the map name into the ASM** (when the map name is canonical):
```bash
python3 tools/asm_manage.py rename routine_292 routine_292 --asm src/egame_rc.asm --map map/egame.map
```
(This finds the ASM proc by offset and renames it to match the map.)

### Approach
1. Run `python3 tools/asm_manage.py verify-sync --asm src/egame_rc.asm --map map/egame.map`
2. Review each NAME MISMATCH and decide which name to keep
3. For descriptive names (e.g., `countermeasures`, `drawCockpit`) → update map
4. For generic stubs (`sub_1XXXX`) → either keep as-is or adopt map's `routine_NNN`
5. Run `verify-sync` again to confirm zero mismatches

**Verification:** `verify-sync` reports 0 NAME MISMATCH issues. `make verify-egame` still passes.

---

## Step 2: Mark existing extracted functions correctly in map

Currently the map only has 1 function marked `complete` but there are 10
EXTRN declarations for functions already extracted to C. Update the map:

```bash
python3 tools/asm_manage.py sync --asm src/egame_rc.asm --map map/egame.map
```

Then manually mark each extracted function as `complete` in the map if not
already done. The `verify-sync` PREMATURE EXTRN warnings will guide this.

**Verification:** `verify-sync` reports 0 PREMATURE EXTRN or ORPHAN EXTRN issues.

---

## Step 3: Decide on extraction style

Choose between:
- **stub style** (egame current): `proc near` / `retn` / `endp` — proc block remains
- **equ style** (end current): `funcName equ _funcName` — proc block removed entirely

Recommendation: **equ style** — it's cleaner, produces smaller diffs when
extracting, and matches what AJenbo already does on end.exe.

To batch-convert existing stubs:
```bash
python3 tools/asm_manage.py convert-equ --asm src/egame_rc.asm --map map/egame.map
```

**Verification:** `make verify-egame` still passes.

---

## Step 4: Clean up ORPHAN EXTRNs

Some EXTRNs reference functions not in the map (e.g., `_forceRange`,
`_sub_15540`). These are likely:
- Functions whose map names don't match (fixed in Step 1)
- Functions from utility modules linked separately
- Genuine orphans that can be removed

Resolve each one.

**Verification:** `verify-sync` reports 0 issues total.

---

## Effort Estimate

| Step | Effort |
|------|--------|
| Name alignment | 1-2 hours (mostly decisions, script does the work) |
| Map annotations | 30 minutes |
| Style conversion | 5 minutes (automated) |
| Orphan cleanup | 30 minutes |

Total: ~2-3 hours.

---

# Phase 3: Ongoing Reconstruction Workflow

## Goal
Establish the standard workflow both contributors use when reconstructing
egame.exe functions in C. No disassembler in the build loop. The `.asm` +
`.map` are the source of truth.

## Prerequisites
- Phase 2 complete (`verify-sync` passes cleanly)

---

## The Workflow

When either contributor reconstructs a function:

### 1. Write the C implementation

Add the function to the appropriate `egameN.c` file. Use the ASM as reference
(it now has real instructions, not stubs). Use `msc_hash.py` to match stack
frame layout.

### 2. Add declaration to header

Add the function prototype to `src/egame.h`.

### 3. Extract from ASM

```bash
python3 tools/asm_manage.py extract <funcname> --asm src/egame_rc.asm --map map/egame.map
```

This does three things automatically:
- Replaces the proc body with `funcName equ _funcName`
- Adds `EXTRN _funcName:PROC` at the top
- Marks the function `complete` in the map

### 4. Build and verify

```bash
make egame
make verify-egame
# Or verify just the one function:
python3 tools/verify_function.py bin/egame.exe build/egame.exe --map map/egame.map --func <funcname>
```

### 5. Commit

```bash
git add src/egameN.c src/egame.h src/egame_rc.asm map/egame.map
git commit -m "Reconstruct <funcname> in egameN.c"
```

---

## Handling Shared/Utility Functions

If a function is shared between executables (e.g., already in `util.c` from
start.exe/end.exe), just:
1. Add it to the appropriate shared source file if not already there
2. Run `asm_manage.py extract` to wire it up in egame's ASM
3. Verify

---

## Handling Assembly-Only Functions

Some functions (interrupt handlers, hardware I/O) will stay as assembly
permanently. These are already marked `assembly` in the map and have real
instruction bodies. No action needed — they're already done.

---

## Renaming During Reconstruction

When you figure out what a function actually does and want to give it a
meaningful name:

```bash
python3 tools/asm_manage.py rename routine_292 loadMissionData --asm src/egame_rc.asm --map map/egame.map
```

This updates both the ASM (proc/endp, all call sites) and the map atomically.

---

## Progress Tracking

```bash
python3 tools/asm_manage.py status --map map/egame.map
```

Output:
```
Map: map/egame.map
  Total routines:    400
  External/detached: 63 (excluded from stats)
  Actionable:        337
  Complete (C):      1
  Assembly:          20
  Done:              21/337 (6.2%)
  Remaining:         316
```

---

## Conflict Avoidance

Since both contributors edit `egame_rc.asm`:
- **Extraction** only touches the proc body (small, localized change) + adds
  one EXTRN line. Low merge-conflict risk.
- **Renaming** touches call sites across the file. Coordinate via issue/PR.
- The `.map` file is append-friendly (annotations added to end of line).
- Communicate which functions you're working on to avoid duplicated effort.

---

## Tools Reference

| Command | When to use |
|---------|-------------|
| `asm_manage.py extract <func>` | After writing C implementation |
| `asm_manage.py rename <old> <new>` | When you learn what a function does |
| `asm_manage.py status` | Check progress |
| `asm_manage.py verify-sync` | Before committing, ensure consistency |
| `asm_manage.py list --filter remaining` | Find next function to work on |
| `verify_function.py` | Verify a single function matches |
| `msc_hash.py` | Match stack frame variable layout |
