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

// Cheataron Examples. Built-in Cheats & Example Cheats
// (JOELwindows7)

class LMBH_OutOfResourceCheatKit : LMBH_CheataronCheat
{
    Default
    {
        LMBH_CheataronCheat.name "LMBH_OutOfResourceCheatKit"; // Cheat ID
        LMBH_CheataronCheat.title "$CHEATARON_OUTRESOURCE_TITLE"; // Title
        LMBH_CheataronCheat.description "$CHEATARON_OUTRESOURCE_DESC"; // The description of it, 
        //You can also select string from LANGUAGE with $ prefix!.
    }

    override void callCheat(consoleEvent e)
    {
        // https://zdoom.org/wiki/NetworkProcess
        // Make sure this player is valid
        // and has a PlayerPawn:
        if (!PlayerInGame[e.Player])
        {
            Console.printf(StringTable.Localize("$CHEATARON_OUTRESOURCE_ERR_NOPLAYER"),e.Player);
            return;
        }
        let ppawn = players[e.Player].mo;
        if (!ppawn)
        {
            Console.printf(StringTable.Localize("$CHEATARON_OUTRESOURCE_ERR_NOPAWN"),e.Player);
            return;
        }
        ppawn.A_GiveInventory("Backpack",9999);
        ppawn.A_GiveInventory("Megasphere");
        ppawn.A_GiveInventory("Clip",9999);
        ppawn.A_GiveInventory("ClipBox",9999);
        ppawn.A_GiveInventory("Cell",9999);
        ppawn.A_GiveInventory("CellPack",9999);
        ppawn.A_GiveInventory("RocketAmmo",9999);
        ppawn.A_GiveInventory("Shell",9999);
        ppawn.A_GiveInventory("ShellBox",9999);
        ppawn.A_GiveInventory("BFG9000");
        ppawn.A_GiveInventory("Chainsaw");
        ppawn.A_GiveInventory("Chaingun");
        ppawn.A_GiveInventory("SuperShotgun");
        ppawn.A_GiveInventory("Shotgun");
        ppawn.A_GiveInventory("PlasmaRifle");
        ppawn.A_GiveInventory("RocketLauncher");
        // https://github.com/ZDoom/gzdoom/tree/master/wadsrc/static/zscript/actors/doom/id24
        // https://github.com/ZDoom/gzdoom/blob/master/wadsrc/static/zscript/actors/doom/id24/id24ammo.zs
        string idName = "ID24Fuel";Class<Inventory> idThingy = idName;
        if(idThingy) ppawn.A_GiveInventory(idThingy,9999);
        idName = "ID24FuelTank"; idThingy = idName; if(idThingy) ppawn.A_GiveInventory(idThingy,9999);
        idName = "ID24CalamityBlade"; idThingy = idName; if(idThingy) ppawn.A_GiveInventory(idThingy);
        idName = "ID24Incinerator"; idThingy = idName; if(idThingy) ppawn.A_GiveInventory(idThingy);
    }
}