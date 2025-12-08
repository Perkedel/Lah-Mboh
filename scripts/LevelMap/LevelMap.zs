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

// Level Map Post Processor thingy

class LMBH_LevelMap:StaticEventHandler
{
    override void WorldLoaded(WorldEvent e)
    {

    }
}

class LMBH_LevelMapPostProcessor:LevelPostProcessor
{
    // https://zdoom.org/wiki/Structs:LevelLocals
    // https://zdoom.org/wiki/LevelPostProcessor
    // https://zdoom.org/wiki/Structs:LevelInfo

    static void Utter()
    {
        Console.printf(StringTable.Localize("$INTERNAL_BARRIER_MINUS"));
        //Console.printf("\c[gold]%s\c-\n", levelInfo.levelName);
        //Console.printf("\c[gold]%s\c-\n", levelInfo.mapName);
        //Console.printf("|\c[gold]%s\c-|\n", level.levelName);
        Console.printf("|\c[gold]%s\c-|\n", Cvar.GetCvar("Level_NiceName").GetString());
        Console.printf(StringTable.Localize("$INTERNAL_BARRIER_MINUS"));
        //Console.printf("|\c[cyan]\[\c[blue]%s\c- (\c[orange]%s\c-)\c[cyan]\]\c-|\n", mapname, Cvar.GetCvar("Level_Checksum").GetString());
        Console.printf("|\c[cyan]\[\c[blue]%s\c- (\c[orange]%s\c-)\c[cyan]\]\c-|\n", Cvar.GetCvar("Level_Name").GetString(), Cvar.GetCvar("Level_Checksum").GetString());
        Console.printf("|\c[cyan]by \c[sapphire]%s\c-|\n", Cvar.GetCvar("Level_Author").GetString());

        Console.printf("|\c[red]\[\c[fire]%s\c[red]\]\c-|\n", Cvar.GetCvar("Level_Prohibition").GetString());
        Console.printf(StringTable.Localize("$INTERNAL_BARRIER_MINUS"));
        Console.printf("%s\n", StringTable.Localize("$LEVELMAP_TITLE"));
        Console.printf(StringTable.Localize("$INTERNAL_BARRIER_MINUS"));
    }

    protected void Apply(Name checksum, String mapname)
    {
        LevelInfo levelInfo = LevelInfo.FindLevelInfo(mapname);
        Cvar.GetCvar("Level_Name").SetString(mapname);
        //Cvar.GetCvar("Level_Checksum").SetString(checksum);
        Cvar.GetCvar("Level_Checksum").SetString(LevelInfo.MapChecksum(mapname));
        Cvar.GetCvar("Level_Author").SetString(levelInfo.AuthorName);
        Cvar.GetCvar("Level_NiceName").SetString(levelInfo.levelName);
        //string _prohibit = "AllowAll";
        string _prohibit = "";
        if (!level.IsJumpingAllowed()) _prohibit = _prohibit .. "NoJumping";
        //if (!level.IsJumpingAllowed()) _prohibit = "NoJumping";
        if (!level.IsCrouchingAllowed()) _prohibit = _prohibit .. "NoCrouching";
        if (!level.IsFreelookAllowed()) _prohibit = _prohibit .. "NoFreelook";
        Cvar.GetCvar("Level_Prohibition").SetString(_prohibit);

        Utter();

        // Post Process Examples
        // by map name
        /*
        switch(mapname)
        {
            case "MBOHTEST":
                break;
            default:
                break;
        }
        */ // string does not work, only Name does, just see Zdoom's below!
        if (mapname == "MBOHTEST")
        {
            // e.g., sticker change!
            // SetThingArgument(111,a,b);
            SetThingArgument(4223,0,4017); // set this sticker to use Mavrickle we got on decaldef!

            // TC Detections!!!!

            if(Cvar.getCvar("Safe_Detect_Total").GetString().IndexOf("Furdoom") > -1)
            {
                // If you load furdoom, add `SOLID SOLID SOLID` sticker right in the waiting room also!
                SetThingArgument(4225,0,42001); // set this sticker to SOLID SOLID SOLID!
                /*
                Furry Indonesia? SOLID SOLID SOLID!!
                */
            }
            else if(Cvar.getCvar("Safe_Detect_Total").GetString().IndexOf("HDoom") > -1)
            {
                /*
                Shake it baby!
                */
                SetThingArgument(4225,0,4022);
            }
            else if(Cvar.getCvar("Safe_Detect_Total").GetString().IndexOf("ProjectBrutality") > -1)
            {
                // Project Brutality yey!
                SetThingArgument(4225,0,4025);
            }
            else if(Cvar.getCvar("Safe_Detect_Total").GetString().IndexOf("BrutalDoom") > -1)
            {
                // Brutal doom yey!
                SetThingArgument(4225,0,4025);
            }
            else if(Cvar.getCvar("Safe_Detect_Total").GetString().IndexOf("DoomerBoardsProject") > -1)
            {
                // DBP map packs
                SetThingArgument(4223,0,4017);
            }
            else if(Cvar.getCvar("Safe_Detect_Total").GetString().IndexOf("KFDoom") > -1)
            {
                /*
                Don't you dare say I never saw you. Let's make this fair and square between us and you guys.
                I have certain likes, that obviously you'd be against presumably. That also does not mean some other too, no.
                I also have loathes of certain things, you'd have the same thought as I am. Though of course, I would play it nice than
                harshly. They're living beings also, what if they're not what we think they are?
                */
                SetThingArgument(4225,0,4023);
                /*
                And I can't lie, despite your offensive behaviours, your truths are way too much to deny.
                And that's how deep hole the rabbit hole goes.
                Though, due to the nature, no family of mine or I shall join your efforts. But surprise nothing
                when my employee would have been one of yours, coz I got no restrictions for this type tho.
                I only expect they behave before my rules when they're doing my house, that's it.
                */
            }
            else if(Cvar.getCvar("Safe_Detect_Total").GetString().IndexOf("Moonman") > -1)
            {
                /*
                This too. I tried it too.
                */
                SetThingArgument(4225,0,4024);
                // ngl, those kinds of file always be subject of loss. You know that, loss is loss, and loss is.. you guessed it, gone.
            }
            else if(Cvar.getCvar("Safe_Detect_Total").GetString().IndexOf("Grezzo2") > -1)
            {
                // Grezzo craziness
                SetThingArgument(4223,0,4017);
            } else {
                // No TC found! Usual DOOM / Freedoom it is. or not..?
                if(Cvar.getCvar("Raw_IWAD").GetString().IndexOf("FREEDOOM") > -1 && Cvar.getCvar("Raw_IWAD").GetString().IndexOf("FREEDOOM") <= 0)
                {
                    SetThingArgument(4225,0,4016); // You are playing Freedoom. Who wants to have a FREEDOOM (freedom, free from invasion)?
                }
                else if(Cvar.getCvar("Raw_IWAD").GetString().IndexOf("WADFUSION") > -1)
                {
                    SetThingArgument(4225,0,4020); // You are playing Wadfusion. Wadfusion be like..
                }
                else if(Cvar.getCvar("Raw_IWAD").GetString().IndexOf("DOOM") > -1)
                {
                    SetThingArgument(4225,0,4019); // You are playing usual DOOM. Here's DOOM logo attemption
                }
                else if(Cvar.getCvar("Raw_IWAD").GetString().IndexOf("HERETIC") > -1)
                {
                    SetThingArgument(4225,0,4017); // You are playing Heretic.
                }
                else if(Cvar.getCvar("Raw_IWAD").GetString().IndexOf("HEXEN") > -1)
                {
                    SetThingArgument(4225,0,4017); // You are playing Hexen.
                }
                else if(Cvar.getCvar("Raw_IWAD").GetString().IndexOf("STRIFE") > -1)
                {
                    SetThingArgument(4225,0,4017); // You are playing Strife.
                }
                else
                {
                    // Unknown IWAD!!!
                    SetThingArgument(4225,0,4017); // set this sticker mavrickle then.
                }
            }
        }
        // It it recommended to detect based on checksum, assuming the map won't change

    }

    // ZDoom itself already has its own LevelPostProcessor to fix issues
    // https://github.com/ZDoom/gzdoom/blob/e27cbe5bd938093eed11ddd345fc1425a41f7477/wadsrc/static/zscript/level_compatibility.zs
    // https://github.com/UZDoom/UZDoom/blob/trunk/wadsrc/static/zscript/level_compatibility.zs
}