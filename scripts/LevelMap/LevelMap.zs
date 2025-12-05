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

            // If you load freedoom, add `SOLID SOLID SOLID` sticker right in the waiting room also!
            if(Cvar.getCvar("Safe_Detect_Total").GetString().IndexOf("Furdoom") > -1)
            {
                SetThingArgument(4225,0,42001); // set this sticker to SOLID SOLID SOLID!
            }
        }
        // It it recommended to detect based on checksum, assuming the map won't change

    }

    // ZDoom itself already has its own LevelPostProcessor to fix issues
    // https://github.com/ZDoom/gzdoom/blob/e27cbe5bd938093eed11ddd345fc1425a41f7477/wadsrc/static/zscript/level_compatibility.zs
    // https://github.com/UZDoom/UZDoom/blob/trunk/wadsrc/static/zscript/level_compatibility.zs
}