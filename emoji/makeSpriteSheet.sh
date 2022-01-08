#!/bin/bash
# Copyright (c) 2022 Sam Blenny
# SPDX-License-Identifier: MIT

GRAY="-colorspace gray -level 0%,99% -background white -alpha remove"
DITHER2="-monochrome"

# Scale and dither SVG sprite sheet to make 1-bit PNG sprite sheet
convert $GRAY $DITHER2 basic_emoji.svg basic_emoji.png

# Get rid of timestamp chunks so build is reproducible
pngcrush -rem alla basic_emoji.png basic_emoji.png.tmp
mv basic_emoji.png.tmp basic_emoji.png
