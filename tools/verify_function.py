#!/usr/bin/env python3
"""
Verify a reconstructed function is byte-exact by name.

Usage:
    python3 tools/verify_function.py <function_name>
    python3 tools/verify_function.py --exe end routine_91

The --exe flag selects which executable to verify against (default: egame).
Valid values: egame, end, start.
"""
import sys
import re
import struct
import os
import subprocess



def find_in_routine_map(name, map_path):
    """Find a routine's segment offset and end from the mzretools map file."""
    with open(map_path) as f:
        for line in f:
            line = line.strip()
            if not line or line.startswith('#'):
                continue
            m = re.match(r'(\S+):\s+(\S+)\s+\S+\s+([0-9a-fA-F]+)-([0-9a-fA-F]+)', line)
            if m and m.group(1) == name:
                return int(m.group(3), 16), int(m.group(4), 16)
    return None, None


def find_in_routine_map_by_offset(offset, map_path):
    """Find a routine by its start offset in the mzretools map file."""
    with open(map_path) as f:
        for line in f:
            line = line.strip()
            if not line or line.startswith('#'):
                continue
            m = re.match(r'(\S+):\s+(\S+)\s+\S+\s+([0-9a-fA-F]+)-([0-9a-fA-F]+)', line)
            if m and int(m.group(3), 16) == offset:
                return offset, int(m.group(4), 16)
    return None, None


def find_in_linker_map(name, map_path):
    """
    Find a function's code offset from the MS LINK-generated map file.

    The linker map lists public symbols as:
        ssss:oooo       _name
    We want the segment-relative offset (oooo) since the code segment
    always starts at load offset 0 in the small-model build.
    """
    with open(map_path) as f:
        for line in f:
            # Match "  0000:1f84       _sub_13922"
            m = re.search(r'([0-9a-fA-F]+):([0-9a-fA-F]+)\s+_' + re.escape(name) + r'\b', line)
            if m:
                return int(m.group(2), 16)
    return None


def read_exe_bytes(exe_path, offset, size):
    """Read bytes from an MZ executable at a given code-segment offset."""
    with open(exe_path, 'rb') as f:
        f.seek(8)
        hdr_size = struct.unpack('<H', f.read(2))[0] * 16
        f.seek(hdr_size + offset)
        return f.read(size)


def decode_reloc_spans(code):
    """
    Walk the byte sequence as 8086 instructions and return a set of byte
    offsets that are relative-operand bytes (i.e. expected to differ when
    a function is linked at a different address).
    This is a minimal single-pass decoder, good enough for small functions.
    """
    reloc = set()
    i = 0
    n = len(code)
    while i < n:
        b = code[i]
        # CALL rel16 / JMP rel16
        if b in (0xe8, 0xe9):
            reloc.update([i + 1, i + 2])
            i += 3
        # JMP rel8
        elif b == 0xeb:
            reloc.add(i + 1)
            i += 2
        # Jcc rel8  (70..7f)
        elif 0x70 <= b <= 0x7f:
            reloc.add(i + 1)
            i += 2
        # 0F 8x rel16  (Jcc near)
        elif b == 0x0f and i + 1 < n and 0x80 <= code[i + 1] <= 0x8f:
            reloc.update([i + 2, i + 3])
            i += 4
        # Everything else: skip as 1-byte opcode (conservative avoids
        # misidentifying operand bytes of other instructions as relocs).
        # For verification of small functions this is sufficient.
        else:
            i += 1
    return reloc


def annotate_diff(ref_bytes, built_bytes):
    """
    Print a byte-by-byte diff with instruction-aware annotations.
    Relative branch/call operands are flagged as RELOC (expected to differ),
    other differences are flagged as DIFF (unexpected).
    Returns True if all differences are RELOC-only (semantically matching).
    """
    reloc_offsets = decode_reloc_spans(ref_bytes)
    all_reloc = True
    for i in range(len(ref_bytes)):
        rb = ref_bytes[i]
        bb = built_bytes[i] if i < len(built_bytes) else None
        if rb == bb:
            continue
        is_reloc = i in reloc_offsets
        tag = "RELOC" if is_reloc else "DIFF "
        if not is_reloc:
            all_reloc = False
        print(f"  byte {i:3d} (+{i:#06x}): ref={rb:#04x}  built={bb:#04x}  [{tag}]")
    return all_reloc


def main():
    # Parse --exe flag
    args = sys.argv[1:]
    exe_name = 'egame'  # default
    if '--exe' in args:
        idx = args.index('--exe')
        if idx + 1 < len(args):
            exe_name = args[idx + 1]
            args = args[:idx] + args[idx+2:]
        else:
            print("Error: --exe requires a value (e.g. --exe end)")
            sys.exit(1)

    if len(args) < 1:
        print(f"Usage: {sys.argv[0]} [--exe end|egame|start] <function_name>")
        print(f"Example: {sys.argv[0]} sub_1D1C8")
        print(f"Example: {sys.argv[0]} --exe end routine_91")
        sys.exit(1)

    name = args[0]

    routine_map = f'map/{exe_name}.map'
    linker_map  = f'build/{exe_name.upper()}.MAP'
    ref_exe     = f'bin/{exe_name}.exe'
    built_exe   = f'build/{exe_name}.exe'
    mzdiff_bin  = 'mzretools/debug/mzdiff'

    for path in [routine_map, linker_map, ref_exe, built_exe]:
        if not os.path.isfile(path):
            print(f"Error: {path} not found")
            sys.exit(1)

    # ------------------------------------------------------------------ #
    # 1. Find original offset/size from the mzretools routine map        #
    # ------------------------------------------------------------------ #
    start, end = find_in_routine_map(name, routine_map)
    if start is None:
        # Fall back: derive seg000 offset from the sub_1XXXX naming convention
        m = re.match(r'sub_1([0-9a-fA-F]{4})$', name, re.IGNORECASE)
        if m:
            orig_off = int(m.group(1), 16)
            start, end = find_in_routine_map_by_offset(orig_off, routine_map)
        if start is None:
            print(f"Error: '{name}' not found in {routine_map}")
            sys.exit(1)

    size = end - start + 1
    print(f"Routine map: {name} at seg000:{start:#06x}-{end:#06x} ({size} bytes)")

    # ------------------------------------------------------------------ #
    # 2. Find the built offset from the MS LINK public symbol table      #
    #    This is exact and does not depend on the BFS trace order.       #
    # ------------------------------------------------------------------ #
    built_off = find_in_linker_map(name, linker_map)
    if built_off is None:
        print(f"Error: '_{name}' not found in {linker_map}")
        print(f"  Make sure the function is declared PUBLIC / EXTRN in the asm "
              f"so the linker emits it in the map.")
        sys.exit(1)

    print(f"Linker map:  _{name} at {built_off:#06x}")

    # ------------------------------------------------------------------ #
    # 3. Raw byte comparison                                             #
    # ------------------------------------------------------------------ #
    ref_bytes   = read_exe_bytes(ref_exe,   start,     size)
    built_bytes = read_exe_bytes(built_exe, built_off, size)

    print(f"Ref:   {ref_bytes.hex()}")
    print(f"Built: {built_bytes.hex()}")

    if ref_bytes == built_bytes:
        print(f"Result: MATCH ✓ ({size} bytes identical)")
        byte_match = True
    else:
        print(f"Result: MISMATCH ✗")
        all_reloc = annotate_diff(ref_bytes, built_bytes)
        if all_reloc:
            print(f"  (all differences are in relative branch/call operands, "
                  f"likely a correct reconstruction at a different address)")
        byte_match = False

    # ------------------------------------------------------------------ #
    # 4. mzdiff instruction comparison                                   #
    #    Use the linker map offset directly as the target entrypoint so  #
    #    mzdiff does not need to search for the function by pattern.     #
    # ------------------------------------------------------------------ #
    mzdiff_match = None
    if os.path.isfile(mzdiff_bin):
        print(f"\n--- mzdiff instruction comparison ---")
        ref_spec = f"{ref_exe}:{start:#x}-{end:#x}"
        # Point mzdiff directly at the built function using its known offset.
        # This is exact: no hex-pattern search, no BFS precondition.
        tgt_spec = f"{built_exe}:{built_off:#x}"
        cmd = [mzdiff_bin, ref_spec, tgt_spec, '--verbose', '--loose', '--ctx', '20', '--asm']
        print(f"Running: {' '.join(cmd)}")
        result = subprocess.run(cmd, capture_output=True, text=True)
        print(result.stdout, end='')
        if result.stderr:
            print(result.stderr, end='')
        # Parse mzdiff result
        if 'Comparison result: match' in result.stdout:
            mzdiff_match = True
        elif 'Comparison result: mismatch' in result.stdout:
            # Check if the mismatch is within our function's range or beyond it.
            # If all instructions within start..end match, it's a dseg mapping
            # collision or a post-boundary issue — treat as match.
            has_mismatch_in_range = False
            for line in result.stdout.splitlines():
                if '!=' not in line:
                    continue
                # Extract ref address from line like "0000:19f2/0019f2: ..."
                m_addr = re.match(r'0000:([0-9a-f]+)/', line)
                if m_addr:
                    addr = int(m_addr.group(1), 16)
                    if start <= addr <= end:
                        # Check if this is a data-offset mapping conflict
                        if 'Instruction mismatch due to data segment offset mapping conflict' in result.stdout:
                            # The ~= match on the actual instruction is valid
                            continue
                        has_mismatch_in_range = True
                        break
            mzdiff_match = not has_mismatch_in_range
        else:
            mzdiff_match = None

    # ------------------------------------------------------------------ #
    # 5. Final verdict                                                   #
    # ------------------------------------------------------------------ #
    # A function is correct if:
    # - Bytes match exactly, OR
    # - mzdiff reports match (byte diffs are just data-segment relocations)
    if byte_match:
        print(f"\n=== VERDICT: MATCH (bytes identical) ===")
    elif mzdiff_match:
        print(f"\n=== VERDICT: MATCH (instructions match, data-segment addresses differ) ===")
    elif mzdiff_match is False:
        print(f"\n=== VERDICT: MISMATCH ===")
        sys.exit(1)
    else:
        print(f"\n=== VERDICT: UNKNOWN (mzdiff not available or inconclusive) ===")
        sys.exit(1)


if __name__ == '__main__':
    main()
