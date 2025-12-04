# How to `TEXTURES.txt`

There is a new procedure in DOOM texturing, by defining your texture sturffs in a text file rather than legacy TEXTUREx lumps.

Simply create a new text file at the root of your project WAD: `TEXTURES.txt`.

This definition uses humanely recognizable syntax like many other plain text based lumps. & in SLADE, double clicking this file opens the same TEXTURE table editor, with added features unlike with legacy TEXTUREx.

## Conversion

In SLADE, you can convert your old TEXTUREx lumps into new TEXTURES.txt plain text definitions. It's in the right click menu.

## Multiple `TEXTURES` files

You can have multiple TEXTURES tables. as long as the text file starts with `TEXTURES`, you can make as many as table file you want, e.g. to sort it like:
- `TEXTURES-door.txt`
- `TEXTURES-floor.txt`
- `TEXTURES-sprites.txt`
- etc. etc.