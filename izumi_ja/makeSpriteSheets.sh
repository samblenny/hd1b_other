#!/bin/bash
# Copyright (c) 2022 Sam Blenny
# SPDX-License-Identifier: MIT

GRAY="-colorspace gray -level 0%,75% -background white -alpha remove"
DITHER2="-ordered-dither o2x2,2"
SRC1="Izumi16.svg"
SRC2="Izumi16B.svg"

# Scale and dither SVG sprite sheet to make 1-bit PNG sprite sheet
convert $GRAY $DITHER2 Izumi16.svg Izumi16.png
convert $GRAY $DITHER2 Izumi16B.svg Izumi16B.png

# Get rid of timestamp chunks so build is reproducible
pngcrush -rem alla Izumi16.png Izumi16.png.tmp
pngcrush -rem alla Izumi16B.png Izumi16B.png.tmp
mv Izumi16.png.tmp Izumi16.png
mv Izumi16B.png.tmp Izumi16B.png
