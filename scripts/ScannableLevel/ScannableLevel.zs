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
// Scannable Level
// (JOELwindows7)
/*
Inherit ScannableLevelName below to become scannable & appear in our level select menu!
*/

// TODO: move to CorruptionCard like Lump based!

class LMBH_ScannableLevelName : Actor Abstract
{
	// use m8f's ways of StupidAchievement. Extract the parameter into HardCodeLevelName!
	string level;
	string label;
    string prefixLabel;

	property level: level; // doom map filename
	property label: label; // humane readable name. read through String Localize, use `$` now to select from LANGUAGE lump
	property prefixLabel: prefixLabel; // Prefix of the label;

	Default
	{
		LMBH_ScannableLevelName.level "TEST";
		LMBH_ScannableLevelName.label "";
		LMBH_ScannableLevelName.prefixLabel "";
	}
}

class LMBH_ScannableLevelHandler: StaticEventHandler
{
	// same goes with the handler.

}