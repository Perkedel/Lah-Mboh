# Quick Start guide

Alright. You want to contribute, or for yourselves? No problem! Take a loot at these important infos.

Unfortunately, this document does not provide beginner step by step. You can find those wild on YouTube e.g.

Despite so, we hope this helps you to start right away

## Softwares

You can use the following softwares, all in tandem: e.g.

- Lump Edits: Slade (BEST).
- Map Editor: Ultimate Doom Builder (BEST).
- General IDE: Visual Studio Code, Laplace (OKAY), Zed (BEST)
- MIDI editor: Sekaiju (OKAY)
- Pixel image drawing: Pixelorama (BEST), Aseprite

## Critical Stuffs

### have a sector, atleast

Make sure you have at least 1 sector. This provides a room for your Things to live, including Player starts

### At least a Player 1 Start

Make sure the map has Player 1 Start, first.

Without it, **the map will crash VM abort**

### At least a way to Exit

Usually, in form of Press Button. Having an `End Normal` ensures player understand the typical map assignments.

Without this, nor even ways in script, **will cause player to lock out forever**. This is usually undesired.

Optionally, you can have a secret exit using `End Secret` action.

### License & Copyrights

#### Yoinks

If you yoink stuffs, make sure you firstly review the license imposed with the file. Avoid yoinking stuffs that imposed restricted license.

The WADs you can yoink should have lenient license at the bottom of their accompanying text file, e.g.:

```
Authors MAY use the contents of this file as a base for
modification or reuse.  Permissions have been obtained from original
authors for any of their resources modified or included in this file.

You MAY distribute this file, provided you include this text
file, with no modifications.  You may distribute this file in any
electronic format (BBS, Diskette, CD, etc) as long as you include
this file intact.  I have received permission from the original
authors of any modified or included content in this file to allow
further distribution.
```

Watch carefully the `MAY use the contents` & the `MAY distribute this file`. Make sure that the former says `MAY`, hence the latter would `MAY`. This way, you are allowed to yoink this PWAD, making sure you credit them & include the accompanying text file, inside your WAD / PK3.

## Gameplay Experience

### Pistol Startable & Bullet Hoarding

All level must be finished with Pistol Start, where assuming playing with a challenge that every next level resets your weapons & inventory back to `Pistol` & `Fist / Brass Knuckle`.

Since so, if you provide strong enemy or hoards of enemies, provide the player an equivallently balanced weapons, & bunch of their ammunitions.

Remember, Overprepared is better than Underprepared. It is completely fine if many playtest found that they hoarded too many ammos to full. An enough amount of Underpreparedness will cause players to give up &/or use cheats.

### Difficulty Adjustment

This is pretty much optional, although it is not a bad practice either. e.g., you may apply playtester suggestions to balance out parts which are too easy, & which are too hard.

You can see the flag options in a Thing properties (With Thing select, Select some then Right Click).

The Skill flag that's on appears on that chosen Skill Level. There are also Multiplayer flags too.

## Packaging

There are serveral ways possible to compile your mods

- [PK3](). Just ZIP this project folder then rename the extension `.zip` into `.pk3`. The easiest way supported by modern source ports. Although be aware, that different source port has different directory structures. Here's in [ZDoom+]() & here's in [Eternity]()
- [Deutex](). Comprehensive tool that compiles this entire project into WAD compatible with all Source Port.

## Upload & Distributions

### For Us

You can submit your creation to us either by forking this repository, add your map & the MAPINFO definitions, and create Pull Request to us.

### For your own

You can pick which ways to upload your level

- idgames. for Finished Maps
- GitHub, GitLab, BitBucket, Codeberg, itch. For Total Conversions, Gameplay Mods, Full Game
- Steam, itch. for Commercial Full Game

> [!CAUTION]
> It is not recommended to publish your stuff solely on Forums with [Cloud Storage](CloudStorage.md) link or Direct Upload. Such area may not last long & can downtakes anytime.  
> At worst (such as unviable to idgames), you should pick long lasting area above such as GitHub, GitLab, BitBucket, or Codeberg. The Forum will be used for marketing.

> [!TIP]
> Be sure to redistribute every Doom maps & mods that allows redistribution, without editing anything. It's the one that says `MAY distribute this file` at the bottom of the accompanying text file.
> **Always remember to keep these 2 (WAD & TXT) together.

## Extra Tips

### Learn from Examples

Best way to learn Doom mapping is to look at examples. Lurk & download thousands of levels and mods whereever.

Unlike many modern games, WAD files can be easily read with nowadays tools & are never obfuscated, not to mention encrypted. This provides a semblance of inspiration & hope for the next Doom mappers & other Doom enthusiast to the next generations.

## Sources

- [Getting Started on Classic DOOM](https://www.doomworld.com/forum/topic/113477-new-to-classic-doom-read-this-tutorial-for-help/). Doomkid
- bbb
- ccc