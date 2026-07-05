# F-15 Strike Eagle 2 source code reconstruction

<p align="center">
  <img src="screenshots/title.png" width="50%" alt="F-15 title screen">
</p>

This is a complete reconstruction of the source code for the MS-DOS version of the Microprose game F-15 Strike Eagle 2 v451.03 (the definitive 1991 Desert Storm expansion disk version).

The original game was written in a mixture of C and assembly. The C source code was compiled with the Microsoft C compiler v5.1.

The reconstruction aims to be bug-for-bug faithful, and the C routines yield code that's identical to the original at the CPU instruction level (when compiled with the same compiler with appropriate flags), while allowing for layout differences in the executables.

Given the fact that this game shares a lot of DNA with the game that preceeded it (F-19) and the one that came after (F-117), there is probably a lot of overlap, and this effort might lead to supporting those games in the future.

This is just the reconstruction project; porting to a modern OS, potential improvements and bugfixes are targeted by a separate [porting project](https://github.com/neuviemeporte/f15se2-ex).

This repository contains no game assets, executables or other copyrighted material, it's a clean rewrite of the game's source code based on analysis of the game binaries obtained from the original floppy disks, for preservation and historical research purposes, and as such should fall under the interoperability exemption of the DMCA.

Development journal: https://neuviemeporte.github.io/category/f15-se2

## Screenshots

<div align="center">
  <table>
    <tr>
      <td align="center">
        <a href="screenshots/screen1.png"><img src="screenshots/screen1.png" width="150"></a>
      </td>
      <td align="center">
        <a href="screenshots/screen2.png"><img src="screenshots/screen2.png" width="150"></a>
      </td>
      <td align="center">
        <a href="screenshots/screen3.png"><img src="screenshots/screen3.png" width="150"></a>
      </td>
    </tr>
    <tr>
      <td align="center">
        <a href="screenshots/screen4.png"><img src="screenshots/screen4.png" width="150"></a>
      </td>
      <td align="center">
        <a href="screenshots/screen5.png"><img src="screenshots/screen5.png" width="150"></a>
      </td>
      <td align="center">
        <a href="screenshots/screen6.png"><img src="screenshots/screen6.png" width="150"></a>
      </td>
    </tr>
  </table>
</div>

# Executables

The original game contains multiple executables, but only these were targets for source code reconstruction:

* `f15.com` - the game loader, originally written in obfuscated, self-modifying assembly code which included disk-based copy protection.
* `su.exe` - the setup executable, lets player pick the video and sound hardware they want to use and does some initialization work
* `start.exe` - the first stage of the game, handles the intro, mission selection and briefing
* `egame.exe` - the second stage of the game, the actual 3D flight engine
* `end.exe` - the third stage of the game with the mission debriefing, loader goes back to `start.exe` afterwards
* `mgraphic.exe` - the MCGA/VGA video driver overlay, dynamically loaded assembly routines for graphics handling
* `misc.exe` - utility overlay, several tiny assembly routines mostly for handling keyboard input

The remaining executables (including sound) are ignored in this project, see the [development journal](https://neuviemeporte.github.io/f15-se2/2022/12/08/firstlook.html) for rationale.

# Status

* `f15.com`, `su.exe`: fully reconstructed into a minimal, functionally equivalent loader executable (`f15.exe`) that works as a drop-in replacement with the original game.
* `start.exe`, `egame.exe`, `end.exe`: all C code has been reconstructed, the executables work with the original game
* `mgraphic.exe`, `misc.exe`: functional reimplementation in C completed

Bottom line, the reconstruction is pretty much complete and playable. Going forward, work on this project is going to be limited to bugfixes (a bug being defined by any divergence from the original game), code cleanup, refactoring and documentation. Otherwise, the reconstrucion is going to be kept preserved as is, and all improvements and extensions will be carried out under the new porting project.

# TODO

- support sound from loader
- add asound reconstruction
- clean build if possible, get rid of warnings
- make assembly code buildable with masm under dos, get rid of uasm and jwasm
- support verification for noasm build (for non-asm routines)
- look over data, make sure libc is extracted from egame/end, try to get the same data order, maybe binarily identical build is possible?
- implement game assets checksum on startup
- version watermark in release executables

# Building

The build system is just one simple Makefile that invokes the DOS toolchain in an emulator under the hood, and supports parallel builds. It should work on Linux and WSL.

Prerequisites:

* a copy of the MS C v5.1 compiler needs to be placed in the `dos/msc510` directory
* the `dosbox` emulator must be installed (vanilla dosbox v0.74 works best as it supports headless mode)

Clone the project and run the `build.sh` script. It will download and build additional git submodules as part of the build process.

## NOASM build

This is an additional build variant of the game with all assembly routines ported into C. Obviously, obtaining identical instructions as in the original is not possible here, so we lose the certainty that our reconstruction is 100% faithful with this build. As such, it's not part of the canonical reconstruction, but nevertheless an important stepping stone towards a major point, and useful in experimenting with and/or researching the game.

To obtain the NOASM build, run `make [-j] noasm`. The resulting executables will be built in `noasm_build/`, and for all intents and purposes should work identically like the standard reconstruction, i.e. just drop them in the game and expect them to work.

## 64bit build

There is an experimental, non-functional CMake-based 64bit build present, which is mostly used for finding compile-time bugs that are missed by the ancient DOS compiler. You can play with it by running the `build64.sh` script, but mind that the result is not expected to run. A 64bit port is *NOT* in this project's scope.

# Running

Just copy all the executables into a directory with the original game data files. Consider removing the original `f15.com` loader because it will take precedence over the reconstructed `f15.exe`, but the rest of the reconstruction (except for NOASM) should work fine with the original loader. The reconstructed `f15.exe` loader will automatically select VGA graphics, no sound and no joystick, while the original one lets you pick.

# Verification

The Makefile contains a target for automatically comparing the reconstruction with the original using the `mzdiff` tool, run `make [-j] verify` to perform the comparison and make sure any changes to the reconstructed source code did not make it divergent. This repo is a place to host a version of the game that is as close to the original as possible, so any contributions, while deeply welcome, need to make sure that consistency is not broken using this mechanism.

For reference, I'm using original binaries with the following MD5 sums to compare against:

* `start.exe`: packed: 320bc386921add664e4c18e86c9d6f90, unpacked: cf6e997ed4582cf82db6ec37d2b1a6fd
* `egame.exe`: packed: 9466f65ef34ede3e3533db42ab5b06dc, unpacked: ffc191b1caeafc3b6f435795f8ea868e
* `end.exe`: packed: f1401198c3a5b951dad0387ee3f73e7d, unpacked: e87480263bff1555f59709ce8eca2949

You will need to put these into the `bin` directory before being able to run the verification.

Depending on the unpacker used, the unpacked md5s might not match, but it should not matter if the packed original was the right one.
