# F-15 Strike Eagle 2 source code reconstruction

This is a work in progress project to reconstruct the source code for the MS-DOS version of the Microprose game F-15 Strike Eagle 2 v451.03 (the definitive 1991 Desert Storm expansion disk version).

The original game was written in a mixture of C and assembly. The C source code was compiled with the Microsoft C compiler v5.1.

The reconstruction aims to be bug-for-bug faithful, and the C routines yield code that's identical to the original at the CPU instruction level (when compiled with the same compiler with appropriate flags), while allowing for layout differences in the executables.

Given the fact that this game shares a lot of DNA with the game that preceeded it (F-19) and the one that came after (F-117), there is probably a lot of overlap, and this effort might lead to supporting those games in the future.

This is just the reconstruction project; porting to a modern OS, potential improvements and bugfixes will be targeted by a separate project in the future.

This repository contains no game assets, executables or other copyrighted material, it's a clean rewrite of the game's source code based on my analysis of the game binaries obtained from the original floppy disks, for preservation and historical research purposes, and as such should fall under the interoperability exemption of the DMCA.

Development journal: https://neuviemeporte.github.io/category/f15-se2

# Executables

The game contains multiple executables, but only these are targets for source code reconstruction:

* `f15.com` - the game loader, originally written in obfuscated, self-modifying assembly code which included disk-based copy protection.
* `su.exe` - the setup executable, lets player pick the video and sound hardware they want to use and does some initialization work
* `start.exe` - the first stage of the game, handles the intro, mission selection and briefing
* `egame.exe` - the second stage of the game, the actual 3D flight engine
* `end.exe` - the third stage of the game with the mission debriefing, loader goes back to `start.exe` afterwards
* `mgraphic.exe` - the MCGA/VGA video driver overlay, dynamically loaded assembly routines for graphics handling
* `misc.exe` - utility overlay, several tiny assembly routines mostly for handling keyboard input

The remaining executables (including sound) are ignored in this project, see the [development journal](https://neuviemeporte.github.io/f15-se2/2022/12/08/firstlook.html) for rationale.

# Status

As of the time of writing this, the status of the reconstruction is as follows:

## `f15.com`/`su.exe`
* fully reconstructed into a minimal, functionally equivalent loader executable (`f15.exe`) that works as a drop-in replacement with the original game.

## `start.exe` 
* all C code has been reconstructed, the executable works with the original game
* porting of assembly routines into C in progress
* the data segment is still generated from assembly, all variables need to be moved to C
* code still contains placeholder names for routines and variables, needs experimentation, refactoring and comments to document the purpose of the code, especially around the mission generator. Work has begun on it already, but some routine/var/struct names are obtained from LLMs, so need to be take with a grain of salt.

## `egame.exe` 
* all C code has been reconstructed, the executable works with the original game
* porting of assembly routines into C in progress
* moving all variables into C in progress
* likewise refactoring needed

## `end.exe`
* all C code has been reconstructed, the executable works with the original game
* porting of assembly routines into C in progress, part of it is shared with `start/egame`
* the data segment is still generated from assembly, all variables need to be moved to C
* likewise refactoring needed

## `mgraphic.exe` 
* overlay header and overall layout understood
* minimal functional reimplementation in C completed, needs more testing

## `misc.exe`
* minimal functional reimplementation in C completed

## `asound.exe`
* some experimentation done on reconstruction, nothing workable yet
* will probably be ignored as it won't be useful in a modern port

# Building

Prerequisites:
* a copy of the MS C v5.1 compiler placed in the `dos/msc510` directory
* the `dosbox` emulator has been installed (vanilla dosbox v0.74 works best as it supports headless mode)

Clone the project and run `make` or `make -j` for parallel build inside. It will download and build the `mzretools` and `UASM` repositories as part of the build process.

# Verification

The Makefile contains a target for automatically comparing the reconstruction with the original using the `mzdiff` tool, run `make verify` to perform the comparison and make sure any changes to the reconstructed source code did not make it divergent. This repo is a place to host a version of the game that is as close to the original as possible, so any contributions, while deeply welcome, need to make sure that consistency is not broken using this mechanism.

For reference, I'm using original binaries with the following MD5 sums to compare against:

* `start.exe`: packed: 320bc386921add664e4c18e86c9d6f90, unpacked: cf6e997ed4582cf82db6ec37d2b1a6fd
* `egame.exe`: packed: 9466f65ef34ede3e3533db42ab5b06dc, unpacked: ffc191b1caeafc3b6f435795f8ea868e
* `end.exe`: packed: f1401198c3a5b951dad0387ee3f73e7d, unpacked: e87480263bff1555f59709ce8eca2949