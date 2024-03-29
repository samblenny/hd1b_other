# NeoDunggeunmo (Neo둥근모) Bitmap Font

Korean 16px glyph set for 1-bit monochrome

Current glyph coverage: see [neodgm.codepoints](neodgm.codepoints)


## Usage

These instructions were developed and tested on Debian 11, and they may also
work on Debian-derived distros such as Ubuntu. YMMV.


### Generating List of Character Codepoints

1. Get `otfinfo`: `sudo apt install lcdf-typetools`
2. Print the unicode codepoints for neodgm.ttf
   ```
   cd neodgm
   otfinfo -u neodgm.ttf > neodgm.codepoints
   ```
3. Use sed, or regular expression search and replace in a text editor,
   to edit `neodgm.codepoints` to remove the prefix and suffix around
   each hex codepoint.


### Generating PNG Glyph Grid Sprite Sheets

1. Make sure you have a working Go compiler, Imagemagick, pngcrush, and a bash shell

2. Run the svg sprite generator: `go run sprites.go`

3. Run the svg to png converter: `./makeSpriteSheet.sh`


## Legal


## NeoDunggeunmo (Neo둥근모)

This project uses glyphs from the NeoDunggeunmo (Neo둥근모) bitmap font as downloaded from
https://github.com/neodgm/neodgm/releases/tag/v1.521 in November 2021.

For NeoDunggeunmo copyright and license details (SIL Open Font License, Version 1.1), see:
- [neodgm/LICENSE-neodgm](neodgm/LICENSE-neodgm)
