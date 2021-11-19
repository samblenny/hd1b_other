# JF Dot Izumi Gothic 16 Bitmap Font

Japanese glyph set for high-dpi 1-bit monochrome

Current glyph coverage: see [Izumi16.codepoints](Izumi16.codepoints)


## Usage

These instructions were developed and tested on Debian 11, and they may also
work on Debian-derived distros such as Ubuntu. YMMV.


### Generating List of Character Codepoints

1. Get `otfinfo`: `sudo apt install lcdf-typetools`
2. Unpack the fonts: `unpackFontFiles.sh`
3. Print the unicode codepoints for Izumi16.ttf (same as Izumi16B.ttf)
   ```
   cd Izumi16
   otfinfo -u JF-Dot-Izumi16.ttf > Izumi16.codepoints
   ```
4. Use sed, or regular expression search and replace in a text editor,
   to edit `Izum16.codepoints` to remove the prefix and suffix around
   each hex codepoint.


### Generating PNG Glyph Grid Sprite Sheets

1. Make sure you have a working Go compiler, Imagemagick, and a bash shell

2. Run the svg sprite generators:
   ```
   go run sprites_regular.go
   go run sprites_bold.go
   ```

3. Run the svg to png converter: `./makeSpriteSheets.sh`


## Legal


## JF Dot Izumi Gothic 16

This project uses glyphs from the JF Dot Izumi 16 Gothic bitmap font as downloaded from
http://jikasei.me/font/jf-dotfont/ in November 2021.

As I understand it, Izumi is licensed under the closest equivalent of Public
Domain that is possible under Japanese copyright law, which is a bit different
than under US copyright law.

For detais, see:
- [INFO-Izumi16](INFO-Izumi16)
- [INFO-Izumi16B](INFO-Izumi16B)
