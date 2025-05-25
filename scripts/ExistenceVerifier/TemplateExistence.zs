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

// Template for ExistenceVerifier. a DLC checking class for your ZDoom experience
/*

Copy this whole textfile, without ommitting above license notice to your mod.
change the namepace to yours. whatever starts from `LMBH_` , to yours such as `MyMod_`, everything.

Doing this makes that mod requires the main mod of yours, before they can play said patch DLC.

Remember, because it's GNU GPL, then you have to at least share this edit you do here.
& since it's not Lesser, that mean including everything even irrelevant about this. 
(I think, I'm not lawyer)
You don't have to share the IWAD(s) and/or PWAD(s) itself/themselves tho, keep that on the Steam and/or itch. I can pay it.
I want the source code! I hate P-

More Info: https://github.com/Perkedel/Lah-Mboh/blob/main/scripts/ExistenceVerifier/ExistenceVerifier.zs

Sauces:
- https://github.com/mmaulwurff/stupid-achievements. The `sa_achievement` Inspires this one, also the menu that lists it.

*/

class LMBH_Existence : LMBH_ExistenceVerifier
{
    Default
	{
		LMBH_ExistenceVerifier.name "LMBH_Existence"; // name to whatever you want. This would be the ID of it, for other format reasons
		LMBH_ExistenceVerifier.title "Template DLC"; // free text humane readable title
		LMBH_ExistenceVerifier.description "Lorem Ipsum"; // description of the DLC
		LMBH_ExistenceVerifier.nsfw false; // if the DLC is Not Suitable for Work. Our scanner will warn Doomers if they load that.
	}
}