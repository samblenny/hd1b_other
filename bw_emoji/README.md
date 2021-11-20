# Emoji

Emoji glyph set for high-dpi 1-bit monochrome

Current glyph coverage: see [bw_emoji.codepoints](bw_emoji.codepoints)


## Usage

These instructions were developed and tested on Debian 11, and they may also
work on Debian-derived distros such as Ubuntu. YMMV.


### Generating List of Character Codepoints

1. Get `otfinfo`: `sudo apt install lcdf-typetools`

2. Print the unicode codepoints for the ttf file (-u doesn't get everything,
   so combine it with -g):
   ```
   cd notoemoji
   otfinfo -u NotoEmoji-Regular.ttf > tmp1
   otfinfo -g NotoEmoji-Regular.ttf >> tmp1
   cat tmp1 | sort | uniq > tmp2
   rm tmp1
   ```

3. Use sed, or regular expression search and replace in a text editor, to edit
   `tmp2` to remove the prefix and suffix around each hex codepoint and lines
   without a valid codepoint.

4. Remove duplicates that arise from removing the prefixes ans suffixes:
   ```
   cat tmp2 | sort | uniq > bw_emoji.codepoints
   ```


### Generating PNG Glyph Grid Sprite Sheets

1. Make sure you have a working Go compiler, Imagemagick, and a bash shell

2. Run the svg sprite generator: `go run sprites.go`

3. Run the svg to png converter: `./makeSpriteSheet.sh`


## Legal


## NotoEmoji Regular

This project uses glyphs from the NotoEmoji Regular font as downloaded from
https://github.com/googlefonts/noto-emoji/blob/v2020-09-16-unicode13_1/fonts/NotoEmoji-Regular.ttf
in November 2021.

For NotoEmoji copyright and license details (SIL Open Font License, Version 1.1), see:
- [notoemoji/LICENSE-notoemoji](notoemoji/LICENSE-notoemoji)
- [notoemoji/INFO-notoemoji](notoemoji/INFO-notoemoji)
