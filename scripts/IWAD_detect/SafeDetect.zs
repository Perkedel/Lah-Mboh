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

// SafeDetect
/*
This is a spin-off of our IWAD Detect beside.

Here from what we learn from Wads struct, we can instead use this power for good.
e.g., to warn streamers if they unrealizingly loaded a severely NSFW mods such as H.
or worse, you don't want to talk about it.
Again, we scan if the loaded lumps we had here in any namespace contains those files that found in there.
*/

class LMBH_SafeDetect : StaticEventHandler
{
    Array<string> nsfwKeywords;
    Array<string> nsflKeywords;

    override void OnEngineInitialize()
    {
        // It is advised to do this Hardcode, I think.
        /*
        Coz if I use user modifiable table, it gonna mess. Yes we can easily edit it this,
        but what if irresponsible forker destroyed our table? yeah idk, it's complicated.
        so yeah, get it here
        */
        Console.printf(StringTable.Localize("$INTERNAL_BARRIER_MINUS"));
        Console.printf(StringTable.Localize("$SFDT_TITLENAME"));

        // initialize
        Cvar.GetCvar('isNSFWrn').SetInt(0);
        Cvar.GetCvar('isNSFLrn').SetInt(0);

        // H
        if(Wads.FindLump("HDMFN033",0,Wads.AnyNameSpace) > -1 && Wads.FindLump("DICKA0",0,Wads.AnyNameSpace) > -1)
        {
            //isNSFWrn = 1;
            Cvar.GetCvar('isNSFWrn').SetInt(1);
            nsfwKeywords.push("HDoom");
        }

        // Bring your Own USB NSFW
        if(Wads.FindLump("Ngocrot",0,Wads.AnyNameSpace) > -1 && Wads.FindLump("sperma",0,Wads.AnyNameSpace) > -1)
        {
            //isNSFWrn = 1;
            Cvar.GetCvar('isNSFWrn').SetInt(1);
            nsfwKeywords.push("Ngocrot");
        }

        // NSFL now..
        // Lah-piye
        if(Wads.FindLump("PiyeToh",0,Wads.AnyNameSpace) > -1 && Wads.FindLump("PiyeIki",0,Wads.AnyNameSpace) > -1)
        {
            //isNSFWrn = 1;
            Cvar.GetCvar('isNSFLrn').SetInt(1);
            nsflKeywords.push("Lah-Piye");
        }

        // MM
        if(Wads.FindLump("MMBLA1",0,Wads.AnyNameSpace) > -1 && Wads.FindLump("MM100I01",0,Wads.AnyNameSpace) > -1)
        {
            //isNSFWrn = 1;
            Cvar.GetCvar('isNSFLrn').SetInt(1);
            nsflKeywords.push("Moonman");
        }

        //KF
        if(Wads.FindLump("HRTLABS",0,Wads.AnyNameSpace) > -1 && Wads.FindLump("YWNB",0,Wads.AnyNameSpace) > -1)
        {
            //isNSFWrn = 1;
            Cvar.GetCvar('isNSFLrn').SetInt(1);
            nsflKeywords.push("KFDoom");
        }

        // Verdicts!
        if(isNSFWrn > 0)
        {
            //Console.printf("\c[orange]WARNING\c-: \c[pink]NSFW\c- Mod PWAD PK3 are being loaded! \c[red]TURN OFF STREAMING NOW!!!\c-\nList of detected \c[pink]NSFW\c- stuffs:");
            Console.printf(StringTable.Localize("$SFDT_NSFWFOUND"));
            for(int i = 0; i < nsfwKeywords.size(); i++)
            {
                Console.printf("\c[gray]- \c[gold]"..nsfwKeywords[i]);
            }
            Console.printf("");
        }

        if(isNSFLrn > 0)
        {
            // Lah-piye & other controversial mods
            //Console.printf("\c[red]CRITICAL\c-: \c[red]NSFL\c- Mod PWAD PK3 are being loaded! \c[red]TURN OFF STREAMING NOW & PURGE THE REPLAY OFF THOSE UNWORTHY PLATFORMS IMMEDIATELY!!!\c-\nList of detected \c[red]NSFL\c- stuffs:");
            Console.printf(StringTable.Localize("$SFDT_NSFLFOUND"));
            for(int i = 0; i < nsflKeywords.size(); i++)
            {
                Console.printf("\c[gray]- \c[orange]"..nsflKeywords[i]);
            }
            Console.printf("");
        }

        if(isNSFWrn <= 0 && isNSFLrn <= 0)
        {
            Console.printf(StringTable.Localize("$SFDT_GOODTOGO"));
        }
        Console.printf(StringTable.Localize("$INTERNAL_BARRIER_MINUS"));
    }
}
/*
there you have it.
And hey, No censor at all. In fact I hate it. Just... the other people could above these flag CVARs & those list arrays to do something nasty.
If those mods do that, hack them. Reupload them without mercy, disregarding any copyrights whatsoever. Keep its license tho if you don't want trouble.
Even it's from the Source port itself, hopefully not. I've been sensing high numbers of sus lately.
*/