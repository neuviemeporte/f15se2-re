#!/bin/bash
BUILDDIR=build64
[ -d "$BUILDDIR" ] || cmake -S . -B $BUILDDIR
cmake --build $BUILDDIR -j -- -s --no-print-directory
