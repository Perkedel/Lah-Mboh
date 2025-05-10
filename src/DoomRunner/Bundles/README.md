# DoomRunner Bundles

These are file references bundle files you can add to your [DoomRunner](https://github.com/Youda008/DoomRunner). It contains only the references to which mods to be loaded.

They are in `.dmb` files, & they are just a **plain text file** with each line a file reference path.  
Read those files, especially on the core dependencies of what mods you should acquire.

It is also possible to put a `.dmb` file in another `.dmb` file!

## Get started

Add the bundles in the [`Add These to Runner`](/src/DoomRunner/Bundles/000-Add_These_To_Runner/) directory. You need:

- `Core`. Mods loaded most first
- `HUD`. Mods that enhances HUD
- `Testers`. Test Levels including Lah-Mboh
- `PreMods`. Mods that enhances gameplay

The `HUD_Alt` file is optional. This will be used instead of `HUD` for a Total Conversion mod that benefits such alternative HUDs, such as Project Brutality.

## Play your maps & mods!

You can now load your favourite maps & mods. Later in the future, we will also have pre-configuration bundles for you to just plop it in by reference.  
These bundles will be at `Load Favourite TC Extras`. It will contain mod load of TC, extra enhancements, enhanced replacements, & various game changing mods.

## Changing File Structure

Since everyone's computers are different, the way the Bundle references (using Absolute Path) are not compatible cross machine, unless they happen to have the same absolute structures. as in the origin computer.

This standardization is currently under construction, so stay tuned. In the mean time, **you can edit those Bundles using your favourite text editor** & adjust those paths accordingly. It is very important to note & not lose the tail-end filename of these filepaths.