# How to Install

This Doom mod is a patch WAD PK3, meaning you are still required to own a copy of the IWAD.

> [!NOTE]
> Oops, we accidentally make the whole mapping endeavor designed exclusively 
> for Freedoom lmao lololololollololo!!!!111one*oenoneoelvelntwelvefklasdj* 
> Apparently, we used textures that turns out may or may not, are full exclusive to FreeDoom, where 
> neither Doom 1 nor so on fullfills those to be parity with FreeDoom anymore haha! (hence you had to get completer PWADs to fill those gaps)
> Congratulations, fraggle, & friends. You've successfully **OutPizza'd the Hut down into Ristorante!**  
> **Incredible!! What an achievement!** This is not sarcasm btw. It's pure from me iyeay!
> And eh, we are targeting FreeDoom Phase 2 anyways.
> Don't believe us? Try it. `doom2.wad` or whatever id IWAD it, & compare.  
> Only the [Kinsie-test](https://forum.zdoom.org/viewtopic.php?f=42&t=57221) inspired room on the right tunnel were supposed to have blue checkerboards (GZDoom `-NOFLAT-`). Nowhere else.
> The console should not spit Texture Missing errors at all (Beside the ObAddon Texture 2 & 3 about `-GOTH-` & `-DOOM-` empty marker lumps, we'll fix that later).


## Dependencies:
- IWAD: [**`freedoom2.wad`**](https://freedoom.github.io/) (BEST IWAD). or [~~`doom2.wad`~~ (**PAID**, Werror! Incomplete Texture!)](https://store.steampowered.com/app/2280/DOOM__DOOM_II/)
- Source Port: [GZDoom latest](https://zdoom.org/downloads).
    - If you have [Project Brutality](https://github.com/pa1nki113r/Project_Brutality) that requires ROLLSPRITE precision: [**GZDoom v4.10.3**](https://zdoom.org/files/gzdoom/bin/), however **you'll lose ID24** that only comes since that v4.14.
    - Otherwise you must **use the latest version**!
- Mod PWADs:
    - [Voxel Vehicles](https://www.doomworld.com/idgames/prefabs/vvpck1_0) from NerdKoopa. **WAIT!!**, [**use this instead!**](/yoinks/vvpck1.0-mapUnconflict.pk3), because the original overrides MAP01!
    - [GZDoom Big City](https://www.doomworld.com/forum/topic/126802-gz_bigcity-a-gzdoom-city-sandbox-map-update-115-released-1952022/) from inkoalawetrust. We recommend to pick the full Map (1st dl) rather than just the prop.
    - see more on [`CREDITS.md`](CREDITS.md) section `Dependencies`
- Launcher (Optional, but Essentially Recommended): such as [Doom Runner](https://github.com/Youda008/DoomRunner), [lcferum's fork of ZDL](https://github.com/lcferrum/qzdl), etc etc.

> [!IMPORTANT]
> There are also PWADs we've preincluded for your convenience & other stuffs. See [`CREDITS.md`](CREDITS.md) for more info.

## Steps

Showing the easy & quick ways

1. Download GZDoom & Extract
2. Download FreeDoom ~~or purchase Doom WADs on Steam or GOG~~, & extract / locate the IWAD.
3. GZDoom should automatically find your commercial Doom WADs installed when you launch. But for others, you can simply place the desired IWAD inside the GZDoom executable folder (put the IWAD next to `GZDoom.exe` / `.bin`).
4. Launch GZDoom
5. Test everything correctly.
6. Once done, close GZDoom again, then drag this project folder / pk3 / pk7 onto the GZDoom.exe. It will launch with the PWAD PK3 in hand.
7. Select the same IWAD then launch.

> [!TIP]
> It is highly recommended to use Doom launchers of your favourite to make mod selections easy.  
> Due to high numbers of various mods, which each has different asset replacements & even experiences, it is always the best to organize the launch arguments.  
> Therefore, please use the launcher you desire to make your Dooming life a pleasure. iyeay!

## (TEMP) ID24 WIP Supports

GZDoom since v.4.13 added partial ID24 supports. Notably, the weapon for it. For the demon, is from a DECORATE mod, that replicates Legacy of Rust PWAD's demon, but without loading itself as a whole, just the demons.

Currently, Freedoom's coverage for ID24 (under [FD24](https://www.doomworld.com/forum/topic/146968-fd24-free-replacement-for-id24reswad/)) is still WIP, therefore you must buy [DOOM I + II](https://store.steampowered.com/app/2280/DOOM__DOOM_II/), & then add `id24res.wad` into your load order.

Until that's done, you may follow these objectives to install ID24 capability experience into your DOOM experience on any mod you'd like to experience.

- Ensure GZDoom is v4.13 & up. Unfortunately, mods that are not compatible by this version are no longer be able to properly experience ID24 fully.
- Purchase [DOOM I + II](https://store.steampowered.com/app/2280/DOOM__DOOM_II/). Add just `id24res.wad` into the load order. This contains the resources (texture, sprites, & sound) needed. **DO NOT SHARE THIS PWAD & ANY OF THE WAD CONTAINED WITH THIS PRODUCT!!**
- Download Obsidian Plague's [ID24 to DECORATE mod](https://www.doomworld.com/forum/topic/147764-actors-id24-to-gzdoom-port/). add this mod into your load order. This contains the definition & behaviour for such demons & various Things found in Legacy of Rust, without anything else as a whole. **PLS CREDIT THE FULL SAUCE TOPIC URL WHEN YOU REUPLOAD THIS!!**

When the Freedoom has completed the ID24 coverage, you will no longer need to download any of the ID24 coverage patch anymore. You will once again simply just leave the Freedoom Phase 2 IWAD alone. For original DOOM II however, again, you still need above procedures.