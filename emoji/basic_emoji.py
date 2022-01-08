#!/usr/bin/python3
# Copyright (c) 2022 Sam Blenny
# SPDX-License-Identifier: MIT
"""Build a codepoint list for Basic_Emoji entries from emoji-sequences.txt.

Transformation Rules:
- Expand entries like "231A..231B" into 231A and 231B
- Include entries like "23F0" (Basic Multilingual Plane)
- Include entries like "1F004" (Supplementary Multilingual Plane)
- Transform entries like "00A9 FE0F" as "00A9" (drop the FE0F)
- Include U+FE0F (variation selector)
- Include U+FFFD (replacement character)
- Omit U+20E3 (combining enclosing keycap)
- Skip entries like "0023 FE0F 20E3" (keycap sequence)
- Skip entries like "1F1E6 1F1E8" (flag sequence)
- Skip tag sequences
- Skip modifier sequences

The basic principle is to filter for emoji that can be represented as one
codepoint. Emoji grapheme cluster sequences with modifiers and combiners
require fancier string parsing to render, and most of the fancy emoji also need
a color screen to display properly. Since this is intended for use on a
monochrome LCD, only include basic emoji. Including FE0F and 20E3 is meant to
let them resolve to their respective Unifont glyphs, rather than generating a
glyph lookup failure (since they can occur in normal strings).
"""
import re

INFILE = "../unicode/emoji-sequences.txt"
OUTFILE = "basic_emoji.codepoints"
codepoints = [0xFE0F, 0xFFFD]

basic_range = re.compile('([A-F0-9]+)\.\.([A-F0-9]+) +; Basic_Emoji')
basic_single = re.compile('([A-F0-9]+) +; Basic_Emoji')
basic_combo = re.compile('([A-F0-9]+) FE0F + ; Basic_Emoji')

with open(INFILE, "r") as f:
  for line in f:
    mr = basic_range.match(line)
    ms = basic_single.match(line)
    mc = basic_combo.match(line)
    if mr:
      # Expand low..hi ranges
      low = int(mr.group(1), 16)
      hi = int(mr.group(2), 16)
      for n in range(low, hi+1):
        codepoints.append(n)
    elif ms:
      cp = int(ms.group(1), 16)
      codepoints.append(cp)
    elif mc:
      cp = int(mc.group(1), 16)
      codepoints.append(cp)
    else:
      pass

with open(OUTFILE, "w") as f:
  unique_codepoints = list(set(codepoints))
  for cp in sorted(unique_codepoints):
    f.write('%04X\n' % cp)
