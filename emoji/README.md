# Emoji

Basic emoji 16px glyph set for 1-bit monochrome

Current glyph coverage: see [basic_emoji.codepoints](basic_emoji.codepoints)


## Usage

These instructions were developed and tested on Debian 11, and they may also
work on Debian-derived distros such as Ubuntu. YMMV.


### Generating List of Character Codepoints

[basic_emoji.codepoints](basic_emoji.codepoints) is a list of the
single-codepoint emoji from Unicode 14 and is meant to work with emoji glyphs
from GNU Unifont. [basic_emoji.codepoints](basic_emoji.codepoints) was created
by running the [basic_emoji.py](basic_emoji.py) python script, which extracts a
list of Basic_Emoji codepoints from
[../unicode/emoji-sequences.txt](../unicode/emoji-sequences.txt)


### Generating PNG Glyph Grid Sprite Sheets

1. Make sure you have a working Go compiler, Imagemagick, pngcrush, and a bash shell

2. Run the svg sprite generator: `go run sprites.go`

3. Run the svg to png converter: `./makeSpriteSheet.sh`


## Legal

### GNU Unifont Bitmap Glyphs

The emoji glyphs here come from GNU Unifont 14, used under the OFL-1.1 license option.
For Unifont license details, see:
- [../unifont/README.md](../unifont/README.md)
- [../unifont/OFL-1.1.txt](../unifont/OFL-1.1.txt)


### Unicode Data Files

The emoji codepoint list is derived from Unicode 14 Data Files.
For Unicode Data File license details, see:
- [../unicode/README.md](../unicode/README.md)
- [../unicode/LICENSE-Unicode](../unicode/LICENSE-Unicode)
