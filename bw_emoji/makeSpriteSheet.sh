#!/bin/bash
# Copyright (c) 2022 Sam Blenny
# SPDX-License-Identifier: MIT

GRAY="-colorspace gray -level 0%,99% -background white -alpha remove"
DITHER2="-monochrome"

# Scale and dither SVG sprite sheet to make 1-bit PNG sprite sheet
convert $GRAY $DITHER2 bw_emoji.svg bw_emoji.png

# Get rid of timestamp chunks so build is reproducible
pngcrush -rem alla bw_emoji.png bw_emoji.png.tmp
mv bw_emoji.png.tmp bw_emoji.png
