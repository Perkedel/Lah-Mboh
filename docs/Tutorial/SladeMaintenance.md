# WAD Maintenance & Unused Lump Optimizations

There are ways to optimize your WAD file in total, to reduce size so it's easy to distribute & save hosting space used.

## Remove Unused Textures

SLADE can scan textures you didn't use on any of your maps. Finish up your maps, then activate, scan, & confirm whether or not you'd like to remove those unused materials.  
It is recommended that you do so if you are going to distribute it, since e.g., idgames receives lots of cool mods everyday & handling storages is a nightmare task for them. By ensuring only those stuffs contained, you will make everyone's lives easy.

Of course, doing this will delete those textures & other stuffs. Be sure to realize yourself before you doing this, & ensure you are completely done with the mod maps you're working.  
& for tests or pre-includers, this is not recommended.

## Remove source files from your WAD / PK3

Now, once you've packed it all up, open this PK3 again as Archive, & remove those source files (`.acs`, `.blend`, `.psd`, etc.) that are still left. These guys are **HUUge**. Just leave those original files on the source code folder itself.

Okay speaking of delete source project file in the PK3, pls share the full project folder to me, I want it. Everyone else also. Use GitHub, or GitLab, or yeah! **Codeberg**!

## Optimize PNG

Using the PNG Optimizer Trifecta, you can setup [these binaries]() onto your SLADE to enable right click Graphics Optimize PNG options.  
This action will compress your PNG texture files down to the tightest possible result, without causing any visible changes in the look.  
Doing this is **Absolutely Recommended**, especially for modern Source ports that supports it, where PNG is the today's modern standard, unlike legacy DOOM format (that contains limitation artifacts).

## Use MIDI, MIDI, & **MIDI**.

Many modern source ports do supports Audio as a music file. But as always, saving waveform is ***HUUUUUUUGE*** no matter how much compressed it already been. Therefore, MIDI, is the best option.  
Because, MIDI only contains instructions, how & when to press this instrument, & when to release that.

Additionally, **you don't need to convert the MIDI to MUS (Proprietary DMX music format) anymore**, since even the vanilla DOOM EXE by certain version (maybe 1.9) now uses MIDI instead. Well, you could, if you targets even the most legacy ones, you do you.  
Otherwise, just use MIDI, that's all, because MUS is nothing different & not open standard I think.

Now, for sourcing those MIDI files, that's for another day. Basically, make sure you are allowed to use it, best if no permission needed, & impose no restriction especially on Commercial use (Arcade Machine e.g.), Reupload, **EDIT!!**, etc.

## Sauce

- [How to remove unused textures](https://www.doomworld.com/forum/topic/143255-how-to-remove-unused-textures-from-your-maps/). Obsidian.