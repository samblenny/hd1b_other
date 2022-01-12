# hanzi

Simplified Chinese (hanzi) glyph set for 1-bit monochrome


## Usage

These instructions were developed and tested on Debian 11, and they may also
work on Debian-derived distros such as Ubuntu. YMMV.


### Generating List of Character Codepoints

To re-generate the list of Simplified Chinese character codepoints taken from the
kUnihanCore2020 list:

1. Download a copy of `Unihan.zip` from https://www.unicode.org/Public/14.0.0/ucd/Unihan.zip

2. Extract Unihan_DictionaryLikeData.txt from the zip archive into `../unicode/`

3. Run `ruby gen_gsource_lists.rb`

For additional context see:
- Article on TGH-2013 by Dr. Ken Lunde: https://ccjktype.fonts.adobe.com/2014/03/china-8105.html
- https://ccjktype.fonts.adobe.com/wp-content/uploads/2014/06/china-8105-06062014.txt


### Generating PNG Glyph Grid Sprite Sheet

1. Make sure you have a working Go compiler, Imagemagick, pngcrush, and a bash shell

2. Run the svg sprite generator: `go run sprites.go`

3. Run the svg to png converter: `./makeSpriteSheet.sh`


## Legal

### GNU Unifont Bitmap Glyphs

The hanzi glyphs here come from GNU Unifont 14, used under the OFL-1.1 license option.
For Unifont license details, see:
- [../unifont/README.md](../unifont/README.md)
- [../unifont/OFL-1.1.txt](../unifont/OFL-1.1.txt)


### Unicode Data Files

This uses character lists derived from Unicode Data Files at
https://www.unicode.org/Public/14.0.0/ucd/

For Unicode Data File license details, see:
- [../unicode/README.md](../unicode/README.md)
- [../unicode/LICENSE-Unicode](../unicode/LICENSE-Unicode)
