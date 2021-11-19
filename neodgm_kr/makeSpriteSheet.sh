#!/bin/bash

GRAY="-colorspace gray -level 0%,99% -background white -alpha remove"
DITHER2="-monochrome"

# Scale and dither SVG sprite sheet to make 1-bit PNG sprite sheet
convert $GRAY $DITHER2 neodgm.svg neodgm.png
