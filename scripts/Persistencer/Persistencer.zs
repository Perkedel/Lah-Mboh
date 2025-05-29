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

// Persistence attemption
// (JOELwindows7)

class LMBH_Persistencer : StaticEventHandler
{
    override void WorldLoaded(WorldEvent e)
    {
        // Save Last loaded level IDs
        /*
        For like Undo something. If a save becomes incompatible, try load that level last time we had.
        Note, this won't save your Complex Tracking Mod PK3 map packs from said ACS module changes.
        */
        // https://zdoom.org/wiki/Structs:WorldEvent
        // https://zdoom.org/wiki/SetCVarString
        //https://zdoom.org/wiki/Structs:CVar
        //SetCVARString("LMBH_lastLoadedLevel", level.mapName);
        // & then the FIFO queques! 0 is IN, 1 2 3 up, last is OUT.
        Cvar.FindCvar("LMBH_lastLoadedLevelFIFO9").SetString(Cvar.FindCvar("LMBH_lastLoadedLevelFIFO8").GetString());
        Cvar.FindCvar("LMBH_lastLoadedLevelFIFO8").SetString(Cvar.FindCvar("LMBH_lastLoadedLevelFIFO7").GetString());
        Cvar.FindCvar("LMBH_lastLoadedLevelFIFO7").SetString(Cvar.FindCvar("LMBH_lastLoadedLevelFIFO6").GetString());
        Cvar.FindCvar("LMBH_lastLoadedLevelFIFO6").SetString(Cvar.FindCvar("LMBH_lastLoadedLevelFIFO5").GetString());
        Cvar.FindCvar("LMBH_lastLoadedLevelFIFO5").SetString(Cvar.FindCvar("LMBH_lastLoadedLevelFIFO4").GetString());
        Cvar.FindCvar("LMBH_lastLoadedLevelFIFO4").SetString(Cvar.FindCvar("LMBH_lastLoadedLevelFIFO3").GetString());
        Cvar.FindCvar("LMBH_lastLoadedLevelFIFO3").SetString(Cvar.FindCvar("LMBH_lastLoadedLevelFIFO2").GetString());
        Cvar.FindCvar("LMBH_lastLoadedLevelFIFO2").SetString(Cvar.FindCvar("LMBH_lastLoadedLevelFIFO1").GetString());
        Cvar.FindCvar("LMBH_lastLoadedLevelFIFO1").SetString(Cvar.FindCvar("LMBH_lastLoadedLevelFIFO0").GetString());
        Cvar.FindCvar("LMBH_lastLoadedLevelFIFO0").SetString(Cvar.FindCvar("LMBH_lastLoadedLevel").GetString());

        // real value
        Cvar.FindCvar("LMBH_lastLoadedLevel").SetString(level.mapName);

        /*
        https://zdoom.org/wiki/Savegame
        Oh God, the save is complicated still.
        You can extract .zds file as a zip file. You'll have 3 files:
        - global.json. overral save data
        - info.json. the save descriptions read by the load and save menu
        - map map json. save data also, map specific?
        - snapshot picture in png
        */

    }
}