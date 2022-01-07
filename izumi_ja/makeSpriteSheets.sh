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
