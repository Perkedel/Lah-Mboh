/*
 * GNU General Public License, Version 3.0
 *
 * Copyright (c) 2025 Perkedel
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

// IWAD Detector
// (JOELwindows7)
/*
Do something to detect what IWAD you've just loaded here.

This can also be abused so you gotta hear me out 
how you supposed to avoid it, in a nutshell tho.

Let's say, you want to play a DOOM mod. Of course, being the mod,
you need to have a copy of DOOM II. But DOOM II is a paid product.
Don't worry, there is Freedoom! Now you used Freedoom.
Oh it crash, there's a message that says:
```
Do not use Freedoom! if you are poor, get lost!
```
Bruh, that's lowkey L on the author.

Stuffs like that. If you see that kinda thing, report the mod!
WAIT! before you report mods, you must DM me first! @JOELwindows7
You know where to find me. Spoiler: I don't use X.
Then report the mod, I'll hack this, & reupload it without mercy.
Or if you can't wait, learn how to SLADE, remove those nasty functions
& reupload it.

Additionally, to make things complicated, they of course would build those into
their main mod handlers & more. All at the same time:
Handlers, Actors, etc etc., with hidden unecessary function just to loathe
whatever IWAD replacement you used, and expect that you have legit DOOM.

I don't care if I can do it this 🏴‍☠️🏴‍☠️🏴‍☠️🏴‍☠️🏴‍☠️ Yaaaaaaaar, 
or even did paid Bethesda & friends for their rotten horses with my own money
regardless if it's basically parents' revenues or my own eventually.
It's just freaking nasty.
*/

class LMBH_IwadDetect : StaticEventHandler
{
    override void OnEngineInitialize()
    {
        // Freedoom has a special lump in its IWAD called `FREEDOOM`.
        /*
        I believe this is the way they abused the power. They just need to find this if it's there

        https://zdoom.org/wiki/Structs:Wads
        https://zdoom.org/wiki/Events_and_handlers
        https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/get-filehash?view=powershell-7.5

        not Wads.CheckNumForFullName("FREEDOOM") > -1
        */
        Console.printf(StringTable.Localize("$INTERNAL_BARRIER_MINUS"));
        Console.printf(StringTable.Localize("$IWDT_TITLENAME"));
        if(Wads.FindLump("FREEDOOM") > -1)
        {
            Console.printf(StringTable.Localize("$IWDT_FD"));
            Console.printf("MD5 = " .. LMBH_MD5.Hash(Wads.ReadLump(Wads.FindLump("FREEDOOM"))));
            //Console.printf("MD5 ".. Wads.GetLumpFullName(Wads.CheckNumForFullName("freedoom2.wad")) .." = " .. LMBH_MD5.Hash(Wads.ReadLump(Wads.CheckNumForFullName("freedoom2.wad"))));
            // Should be F075BFB458BDCAB7327806FBCEF2DCAF for v0.13.0 Stable
            // wait, why is it 1be355f49ebe57da2f324d9cc6fd9f5f in 3saster?
            // Oh shit, that's not the file! we're looking at the FREEDOOM marker lump! not the iwad file itself!
            // huh? I looked the iwad with 3saster and it's d41d8cd98f00b204e9800998ecf8427e
            // that's invalid file.
        }
        else if(Wads.FindLump("BLASPHEM") > -1) 
        {
            Console.printf(StringTable.Localize("$IWDT_BL"));
            Console.printf("MD5 = " .. LMBH_MD5.Hash(Wads.ReadLump(Wads.FindLump("BLASPHEM"))));
        }
        else
        {
            Console.printf(StringTable.Localize("$IWDT_UNKNOWN"));
        }
        if(Wads.FindLump("HDLTLUMP") > -1)
        {
            // acccording to since https://codeberg.org/mc776/LotansTomb/commit/0c4dfc6de674fffa243f8c7d5f11fca9a45c2cd0
            // and https://codeberg.org/mc776/HideousDestructor/commit/c118f07dbf348b4d23fa8779578ef56c058654b9
            Console.printf(StringTable.Localize("$IWDT_LT"));
            Console.printf("MD5 = " .. LMBH_MD5.Hash(Wads.ReadLump(Wads.FindLump("HDLTLUMP"))));
        }

        // Now here's the CheckNumForFullname one.
        /*
        This function according to somewhere **read files loaded**.
        whereas above FindLump finds whatever inside it.

        argh how to work this? not with CheckNumForFullName ?
        I gotta place it right next to this Mod PK3??????
        https://zdoom.org/wiki/Structs:Wads Article about it does not exist! pls document!
        */
        if(Wads.CheckNumForFullName("id24res.wad") > -1)
        {
            Console.printf(StringTable.Localize("$IWDT_ID24RES"));
            Console.printf("MD5 = " .. LMBH_MD5.Hash(Wads.ReadLump(Wads.CheckNumForFullName("id24res.wad"))));
        }
        else
        {
            //Console.printf("MD5 ID24RES.WAD = " .. LMBH_MD5.Hash(Wads.ReadLump(Wads.CheckNumForFullName("id24res.wad"))));
        }

        // Total Checklumps
        /*
        https://zdoom.org/wiki/GetLumpFullName
        */
        let totalLumps = Wads.GetNumLumps();
        // for(int i = 0; i < totalLumps; i++)
        // {
        //     Console.Printf("Lump %d name: %s | full name: %s", i, Wads.GetLumpName(i), Wads.GetLumpFullName(i));
        // }
        // too noisy!

        // whynt workkadsafalsdj

        /*
        This then can be used to check certain mods we gotta warn everyone for.
        */
        Console.printf(StringTable.Localize("$INTERNAL_BARRIER_MINUS"));
    }
}
/*
There are other ways one could make detection

Lump Filtering:
https://zdoom.org/wiki/Lump_filtering
Some numbers of Actors & Handlers were suspiciously put to a `filter/` directories. Either partial or fully.
This act is kinda most visible when you see that in SLADE, Archiver, or whatever.
The ZDoom has it this filtering that uses which folder in the filter, according to the hash of which IWAD it being played.
specifically, if it's `doom.freedoom`, it does this. Otherwise if it's `doom.id`, it does that.
But wait, don't get sus too fast! It could be filtered because of different object looks & alignments. or maybe
some features that are different from IWADs appart.
Remember, see the function that crashes when you used free replacement instead of legit DOOM.
Other mods may even double measure crash if you use shareware DOOM's (`doom.id.doom1.shareware`), in case that GZDoom fork is patched to remove anti-shareware-patching.
Yeah, let's not fight with Graf again. Basically it.

https://github.com/ZDoom/gzdoom/blob/master/wadsrc/static/zscript/events.zs
oh look, EventHandler itself is a StaticEventHandler. Interesting..

https://github.com/ZDoom/gzdoom/blob/master/src/d_iwad.cpp
*/