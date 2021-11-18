# noto_kr

Korean glyph set for high-dpi 1-bit monochrome

Currently included glyph sets:
- Hangeul (Korean):  U+1100..U+11FF, U+3131..U+318E, U+AC00..U+D7A3


## Usage

### Generating List of Character Codepoints

To re-generate `hangeul.txt`, run `ruby gen_source_list.rb`


### Generating PNG Glyph Grid Sprite Sheet

1. Make sure you have a working Go compiler, Imagemagick, and a bash shell

2. Download Noto Sans SC font family using the download button at
   https://fonts.google.com/noto/specimen/Noto+Sans+KR

3. Unzip the `Noto_Sans_KR.zip` font archive, creating a `Noto_Sans_KR` directory
   of font files next to `sprites.go`

4. Do `go run sprites.go` to create temporary SVG sprite sheet(s)

5. Do `./makeSpriteSheet.sh` to convert sprite sheet(s) from SVG to PNG


## Unicode Reference Documents

- Hangul Jamo (1100–11FF): https://unicode.org/charts/PDF/U1100.pdf

- Hangul Compatibility Jamo (3130–318F): https://www.unicode.org/charts/PDF/U3130.pdf

- Hangul Syllables (AC00–D7AF): https://www.unicode.org/charts/PDF/UAC00.pdf

Note: the Unicode documents use the old "Hangul" Romanization according to the
now obsolete McCune-Reischauer system. The proper spelling is now Hangeul.


## Notes on Hangeul Normalization Forms NFC and NFD

The Hangeul character index here currently uses precomposed (NFC) syllables. It might
also be possible to encounter decomposed (NFD) syllables where a sequence of codepoints
represents a single glyph (syllable). Currently the codepoints in the Hangeul index file
will not handle NFD properly. That shortcoming could be fixed by creating a grapheme
cluster alias list file to map between the NFC and NFD forms (see blitstr/codegen).


## Legal

Unless otherwised noted, source code here for building sprite sheets is released under
the MIT license (see [../LICENSE](../LICENSE)). Typefaces and font files are covered by
their own copyrights and license notices.


## Noto Sans KR

This project uses glyphs from the Noto Sans KR typeface.

Noto Sans KR License Notice:
```
These fonts are licensed under the Open Font License.

You can use them freely in your products & projects - print or digital,
commercial or otherwise.

This isn't legal advice, please consider consulting a lawyer and see the
full license for all details.
```
Open Font License Link: https://scripts.sil.org/cms/scripts/page.php?site_id=nrsi&id=OFL
