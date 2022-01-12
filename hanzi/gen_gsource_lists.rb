#!/usr/bin/ruby
# coding: utf-8
# Copyright (c) 2022 Sam Blenny
# SPDX-License-Identifier: MIT
require "set"

C20_IN = "../unicode/Unihan_DictionaryLikeData.txt"
C20_RE = Regexp.compile(/U\+(.*)\tkUnihanCore2020.*G.*/)
PUNCTUATION_IN = "cjk_punctuation.txt"
INDEX_OUT = "hanzi.codepoints"

# Write index file with hex codepoints for UnihanCore2020 Source G + CJK punctuation
# Source G is Simplified Chinese
c20 = File.read(C20_IN).lines
        .select { |n| C20_RE.match n }
        .map { |n| C20_RE.match(n)[1] }
File.open(INDEX_OUT, "w") { |f|
  f.puts("# UnihanCore2020 Source G")
  g_count = 0
  skip_count = 0
  for n in c20 do
    if n.to_i(16) <= 0x1ffff then
      f.puts(n)
      g_count += 1
    else
      # Unifont only supports Plane 0 (BMP) and Plane 1 (SMP).
      # There are about 196 Plane 2 (SIP) characters in Source G that Unifont does not
      # currently have glyphs for (AFIK... maybe I'm wrong?), so just skip them.
      skip_count += 1
    end
  end
  puts "Wrote #{g_count} character codepoints from UnihanCore2020 Source G to #{INDEX_OUT}"
  puts "Skipped #{skip_count} Source G codepoints >= U+20000 (no glyph support in Unifont)"
  punct = File.read(PUNCTUATION_IN).strip
  puts "Copied #{punct.size} lines (codepoints & comments) from #{PUNCTUATION_IN} to #{INDEX_OUT}"
  f.puts(punct)
}

# Expected Output:
# Wrote 8053 character codepoints from UnihanCore2020 Source G to hanzi.codepoints
# Skipped 196 Source G codepoints >= U+20000 (no glyph support in Unifont)
# Copied 701 lines (codepoints & comments) from cjk_punctuation.txt to hanzi.codepoints
