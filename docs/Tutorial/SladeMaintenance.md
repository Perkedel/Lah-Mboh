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

## Pack this whole source code OR compile with the highest compression settings

Well, this is not just a SLADE stuffs. We recommend that you use the best compression format that features the highest compression result compared to other formats.  
No need to worry if you already used their modern versions. Those source ports should be able to load the most extremely compressed mod file just fine, albeit much longer.

**(FORUM GONE)** We found that by using `xz` or `7z`, you can achieve the best compression unlike everyone else. See [how we do it](/.github/workflows/packAll.yml) in this factory file.

```sh
# Packing in 7z
7z a -t7z -mx9 -m0=lzma2 -- Lah-Mboh.7z *
# This means use `7z` to pack into `.7z` at compression level 9, using algorithm `lzma2`
# `-tXX` = what type is it?
# `-m???` = the `m` means various options to adjust
# `-mx9` = compression 9 (MAX)
# `-m0=lzma2 = `0` setting number zero is `Algorithm`. set this setting to `lzma2`, the best of the best right now. 
# first is the output file, second is the target file. e.g., `*` means everything right here, put into `Lah-Mboh.7z`.
# By default, 7z uses lzma1, which should be enough for most cases, but we rather use the most improvement there is.
7z u Lah-Mboh.7z Lah-Mboh.txt # `u` = add more stuffs!. e.g. the WADINFO file

# Packing in xz. xz is like a gz, hence you firstly must pack into a tape archive (`tar`)
tar -cvf Lah-Mboh.tar Lah-Mboh.pk7 # create init pack
tar -uvf Lah-Mboh.tar Lah-Mboh.txt # add more stuffs
# in UNIX, you can combine single letter dash option arguments! instead of `-u -v -f`, it becomes `-uvf`
# `-c` = create
# `-v` = verbose the log
# `-f` = what the file output name will be?
xz -v9e Lah-Mboh.tar # Once everything's in, compress this tar! This will replace the tar with the compressed `tar.xz` one
# `-v` = verbose the log
# `-9` = compression 9 (MAX)
# `-e` = as extreme as you can!
# This will output `Lah-Mboh.tar.xz`

# Important Extra UNIX `did you know`s:
# `mv` is not just used to move file. it also can be used to just rename a file in their same place!
mv Lah-mboh.7z Lah-Mboh.pk7
# This example turns the file extension from `7z` into `pk7`.
# you can copy (`cp`) certain file into a commonly double-clickable extension files or vice versa to a standard compliance one, e.g.
cp Lah-Mboh.txt WADINFO
# create copy of our description text file into `WADINFO` so the filing system we're uploading to can automatically find it & read from it.
# Just in case.
```

> [!IMPORTANT]
> - GZDoom, derivatives, & other archive compatible source ports **do not support TAR nor its compressed form just yet**. If you wish to distribute in `tar.xz`, pack the source code into `7z`, rename it to `mod.pk7`, put this `mod.pk7` & your WADINFO `mod.txt` into `tar`, and then compress them into `.tar.xz`.
> - SLADE **does not support packing a folder into an archive file just yet**. 


## Sauce

- [Using PK3 as a WAD Replacement](https://zdoom.org/wiki/Using_ZIPs_as_WAD_replacement). ZDoom Wiki.
- [How to remove unused textures](https://www.doomworld.com/forum/topic/143255-how-to-remove-unused-textures-from-your-maps/). Obsidian.