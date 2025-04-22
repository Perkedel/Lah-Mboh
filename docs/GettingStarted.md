# Getting Started with DOOM & Modding

[DOOM](https://doomwiki.org/wiki/Doom) is a First Person Shooter game. The Pioneer of the pioneer, descended from games like [Wolfenstein 3D](https://doomwiki.org/wiki/Wolfenstein_3D), [Hovertank 3D](https://en.wikipedia.org/wiki/Hovertank_3D), & [Catacomb 3D](https://doomwiki.org/wiki/Catacomb_3D). 
It was very revolutionary, that every similar games were called `Doom Clones`, and so much so since the appearance of [Quake](https://doomwiki.org/wiki/Quake) where at this point, it's now THE genre of First Person Shooter.

Not only become the basis of the FPS mechanic, DOOM itself since its first release in 1993 already has abundant amount of mods made for it, for varying types of Source Ports. All thanks to such source code releases & the community behind those DOOM projects to improve upon. 

## Setup

> [!IMPORTANT]
> Buying DOOM is no longer necessary just to start DOOM Modding experience. The [Freedoom](https://freedoom.github.io/) should already have
> covered mods designed for DOOM I, II, and both Final DOOM (TNT: Evilution & Plutonia Experiment). 
> (We thank you deeply for the community that realizes such project, without it, we still have to sparsdat & do unstable hackery stuffs)  
> Despite being crashing the aesthetics (e.g. Mods containing monster variants designed after DOOM's), It should not affect the gaming experience badly overall. 
> You may buy & use [DOOM I + II](https://store.steampowered.com/app/2280/DOOM__DOOM_II/) IWADs if you wish, but again, **It IS COMPLETELY NOT necessary** hence it's **COMPLETELY OPTIONAL**.

It is very easy to setup yourself DOOM modding experience. All you need is to pick your favourite DOOM.exe (called Source Port, because it was modernized from the [source code](https://github.com/id-Software/DOOM)), have the IWAD (Internal Where's All the Data, the main DOOM game data), & your choice of mods. 
The following is the minimum atleast setup you can do to get started:

### Ingredients

- Get Modern DOOM.exe (a.k.a. Source Port). You have choices! You can choose more than one, for collection.
    - [DSDA-Doom](https://github.com/kraflab/dsda-doom). Default MBF21, Demo Support. **BEST MBF21 DEMO Support**
    - [Chocolate Doom](https://www.chocolate-doom.org/wiki/index.php/Downloads). Default Vanilla Strict Accurate. **BEST HISTORIC**
    - [VKDoom](https://vkdoom.org/download). Default Modding Aesthetics. **BEST MODDING**. 👈 I picked this one
    - [Zandronum](https://zandronum.com/download). Multiplayer. **BEST MULTIPLAYER SERVER-SIDE**.
    - [GZDoom](https://zdoom.org/downloads). Default Modding Latest Features. **BEST MODDING LATEST**. 
    - There are so many more, sorry I can't list all.
- Get IWAD (Internal WAD, the main game data). Source Ports does not provide the DOOM data itself since it's still on sale, therefore you must obtain the IWAD yourself. You also have choice, but you can only choose one of these
    - [Freedoom](https://freedoom.github.io/). **Default All**. **BEST GRATIS LIBRE**. Default IWAD should be: `freedoom2.wad` (Freedom Phase 2). 👈 I picked this one
    - [Doom I + II](https://store.steampowered.com/app/2280/DOOM__DOOM_II/). Default Strict Aesthetic. **PAID**, **PIONEER**. Default IWAD should be: `doom2.wad` (DOOM II). This rerelease also packs other IWADs including both Final DOOM, Xbox PWAD of No rest for the living, & NEW: Legacy of Rust that uses new ID24 weapons & demons.
- Get Mods. You can find mods from the following websites:
    - [Doomworld.com](https://www.doomworld.com/). There are [Total Conversions](https://www.doomworld.com/forum/86-total-conversions-full-games/), [Maps](https://www.doomworld.com/forum/4-map-releases-development/), and other [Gameplay Mods](https://www.doomworld.com/forum/83-gameplay-mods/)
    - [idgames Archive](https://www.doomworld.com/idgames). All the rest of the mods including other special files are typically found in the idgames Archive.
    - [ModDB](https://www.moddb.com/mods?filter=t&kw=&released=&genre=&theme=&players=&timeframe=&game=172&rtx=). Lots of other mods, and some if not on idgames
    - [itch.io](https://itch.io/game-mods/tag-doom). Sometimes also on itch.io too as well.
    - [ZDoom forum](https://forum.zdoom.org/index.php?sid=5d3c199fff371517a31b05c0130727f8). There are [Total Conversions](https://forum.zdoom.org/viewforum.php?f=19&sid=5cc88a122e8ed676c4847d71b1e2528e), [Maps](https://forum.zdoom.org/viewforum.php?f=42&sid=ae12c3d2a1591cf6c6fa46815e321e5d), and other [Gameplay Mods](https://forum.zdoom.org/viewforum.php?f=43)
- Get Launchers. You can just drag & drop mods to your DOOM.exe (then Source Port should automatically load your purchased DOOM IWAD & whatever IWAD in its folder), but it'd be much easier with Launchers!
    - [DoomRunner](https://github.com/Youda008/DoomRunner/releases). **RECOMMENDED**, Place your IWAD, Map PWADs & Mod PWADs, and your source ports accordingly & build your presets consists of what mods & what map packs.
    - [nstlaurent's idgames wrangled launcher](https://github.com/nstlaurent/DoomLauncher). idgames at your hands, manages idgames mods & your source ports. [Thread](https://www.doomworld.com/forum/topic/69346-doom-launcher-doom-frontend-database-v376-102024/)
    - [lcferrum's fork of ZDL](https://github.com/lcferrum/qzdl/releases).
    
### Configuring

Minimally, assembling your experience should roughly goes like this:

1. Extract your files to correct destinations. Pay attention to the following folders to categorize those files, to make ease of your experience
    - Source Ports. Followed by the Author or Organization, each containing the DOOM binaries
    - Maps. Followed by the Author, each containing their PWADs
    - Mods. Followed by the Author, each containing their PWADs
    - IWAD. Followed by the Author, each containing their IWADs
2. Equip your launcher. Add your files & binaries to each boxes. e.g., DoomRunner finds your stuff automatically based on which folder you assigned for.
3. Build your profile. Launchers have profile where you can assemble your load order. You can make each profile for each Total Conversion, Gameplay Mods, and the unmodded one.
4. Select IWAD & Maps
5. Enjoy

> [!TIP]
> Sometimes you may encounter Mod files in `.pk3`, or rarely `.pk7`. PK3 are ZIP files you can also load into your DOOM.exe that supports it (such as GZDoom, Eternity, etc.). 
> Reasons that big mods packs it in PK3 is because it's much easier to develop & much more stable compared to traditional `.wad`. 
> The mod development starts in a folder, then filled with files placed on specific sub-folder. Once done, one simply ZIP this folder, rename its extension to `.pk3` then sent to everyone.
> The PK7, is also the same, but in 7z instead of ZIP. This is typically found on even bigger mods, where the space used would be overbloated if it was PK3.
> For more details, [click here to read the article on ZDoom Wiki](https://zdoom.org/wiki/Using_ZIPs_as_WAD_replacement)
> 
> Another important thing, especially with WIP mods, is that sometimes you are presented with only a source code folder without the actual PK3 release.  
> **DON'T PANIC!** You can actually load the folder as if it's a PK3 as well, it will works. Infact, this is how mod devs test their mods.

## Iyey

> [!NOTE]
> If you ask, we indeed have DOOM I + II. Just prefers Freedoom since it covers also both Final DOOM in 1 single IWAD, whereas original DOOM IWADs, do not.  
> Soon, Freedoom is also covering ID24, under [FD24](https://www.doomworld.com/forum/topic/146968-fd24-free-replacement-for-id24reswad/)

### Sauces
- [DOOM Awesome guide](https://github.com/snakers4/awesome_doom_quickstart). snakers4.

by JOELwindows7  
Perkedel Technologies  
CC4.0-BY-SA