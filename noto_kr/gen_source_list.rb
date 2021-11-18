#!/usr/bin/ruby
# coding: utf-8
require "set"

INDEX_OUT = "hangul_index.txt"

# Hangul Jamo (1100–11FF)
# Hangul Compatibility Jamo (3131–318E)
# Hangul Syllables (AC00–D7A3)

jamo = (0x1100..0x11ff).to_a.map { |c| c.to_s(16) }.join("\n")
compat_jamo = (0x3131..0x318e).to_a.map { |c| c.to_s(16) }.join("\n")
syllables = (0xac00..0xd7a3).to_a.map { |c| c.to_s(16) }.join("\n")

File.open(INDEX_OUT, "w") { |f|
  f.puts(jamo)
  f.puts(compat_jamo)
  f.puts(syllables)
}
