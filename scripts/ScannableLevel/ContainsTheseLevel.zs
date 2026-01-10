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
// Insert the level that should appear in Car GPS level select now dialog
// (JOELwindows7)
/*
We use namespace LMBH_ .
You can use the following template:

```
class LMBH_Level_MyLevelName: LMBH_ScannableLevelName
{
	Default
	{
		LMBH_ScannableLevelName.level "MYLEVEL"; // Doom Level WAD filename.
		LMBH_ScannableLevelName.label "$MYLEVEL"; // What to label this level as. You can use $ prefix to select string from LANGUAGE lump.
        // You can also leave label blank to make the label the file name (`level` var) which also choose the string in LANGUAGE if available.
		LMBH_ScannableLevelName.prefixLabel ""; // Important tags or whatever before inside parenthesis
	}
}
```
*/

// You can now have it inline!
// here old stuff
/*
        hardCodeLevels.push(HardCodeLevelName.Create("MBH01", String.Format("(MEGAWAD) %s", StringTable.Localize("$MBOHADV"))));
		hardCodeLevels.push(HardCodeLevelName.Create("JUSTFITE", StringTable.Localize("$JUSTFITE")));
		hardCodeLevels.push(HardCodeLevelName.Create("RIGHTFRN", StringTable.Localize("$RIGHTFRN")));
		hardCodeLevels.push(HardCodeLevelName.Create("PLMSKY1", StringTable.Localize("$PLMSKY1")));
		hardCodeLevels.push(HardCodeLevelName.Create("MECHSKY1", StringTable.Localize("$MECHSKY1")));
		hardCodeLevels.push(HardCodeLevelName.Create("CHORALBE", StringTable.Localize("$CHORALBE")));
		hardCodeLevels.push(HardCodeLevelName.Create("FREELD", StringTable.Localize("$FREELD")));
		hardCodeLevels.push(HardCodeLevelName.Create("TELEFAST", StringTable.Localize("$TELEFAST")));
		hardCodeLevels.push(HardCodeLevelName.Create("DONUTER", StringTable.Localize("$DONUTER")));
		hardCodeLevels.push(HardCodeLevelName.Create("PORTALA", StringTable.Localize("$PORTALA")));
		hardCodeLevels.push(HardCodeLevelName.Create("TOTITLE", StringTable.Localize("$TOTITLE")));
		hardCodeLevels.push(HardCodeLevelName.Create("TOTITLE2", StringTable.Localize("$TOTITLE2")));
		hardCodeLevels.push(HardCodeLevelName.Create("TOTITLE3", StringTable.Localize("$TOTITLE3")));
		hardCodeLevels.push(HardCodeLevelName.Create("MORATE", StringTable.Localize("$MORATE")));
		hardCodeLevels.push(HardCodeLevelName.Create("SELDUAR", String.Format("(DM) %s", StringTable.Localize("$SELDUAR"))));
		hardCodeLevels.push(HardCodeLevelName.Create("DODTEL", StringTable.Localize("$DODTEL")));
		hardCodeLevels.push(HardCodeLevelName.Create("WRWDEMO", StringTable.Localize("$WRWDEMO")));
		hardCodeLevels.push(HardCodeLevelName.Create("MRWDEMO", StringTable.Localize("$MRWDEMO")));
		hardCodeLevels.push(HardCodeLevelName.Create("T_SCTTG", StringTable.Localize("$T_SCTTG")));
		hardCodeLevels.push(HardCodeLevelName.Create("T_CUZOM", StringTable.Localize("$T_CUZOM")));
		hardCodeLevels.push(HardCodeLevelName.Create("T_RSPAWN", StringTable.Localize("$T_RSPAWN")));
		hardCodeLevels.push(HardCodeLevelName.Create("T_CA_OUT", StringTable.Localize("$T_CA_OUT")));
		hardCodeLevels.push(HardCodeLevelName.Create("T_NJ_BGL", StringTable.Localize("$T_NJ_BGL")));
		// hardCodeLevels.push(HardCodeLevelName.Create("LOADFOL", StringTable.Localize("$LOADFOL"))); // Sorry, map wads cannot be in a subfolder unlike everyone else.
		hardCodeLevels.push(HardCodeLevelName.Create("LoadFolder/LOADFOL", StringTable.Localize("$LOADFOL"))); // Unless we explicitly say the folder too?
		// hardCodeLevels.push(HardCodeLevelName.Create("T_SMMU", StringTable.Localize("$SMMUTEST")));
		//hardCodeLevels.push(HardCodeLevelName.Create("SMMUTEST", StringTable.Localize("$SMMUTEST")));
		hardCodeLevels.push(HardCodeLevelName.Create("Chubzdoomer/CHBZSD", StringTable.Localize("$CHBZSD")));
		//hardCodeLevels.push(HardCodeLevelName.Create("TEST", StringTable.Localize("$_GENERIC_TEST")));
*/

// MEGAWAD
//class LMBH_Level_MbohAdventure: LMBH_ScannableLevelName{ Default{ LMBH_ScannableLevelName.level "MBH01"; LMBH_ScannableLevelName.label String.Format("(MEGAWAD) %s", StringTable.Localize("$MBOHADV")); } }
class LMBH_Level_MbohAdventure: LMBH_ScannableLevelName{ Default{ LMBH_ScannableLevelName.level "MBH01"; LMBH_ScannableLevelName.label "$MBOHADV"; LMBH_ScannableLevelName.prefixLabel "MEGAWAD";} } // what a hassle! string property must be constant parameter

// DONE: continue convert above!! Codeium, take over! copy above to below, put them like this inline.

// Morale Revenants
class LMBH_Level_Morate: LMBH_ScannableLevelName{ Default{ LMBH_ScannableLevelName.level "MORATE"; LMBH_ScannableLevelName.label "$MORATE"; } }
//class LMBH_Level_Selduar: LMBH_ScannableLevelName{ Default{ LMBH_ScannableLevelName.level "SELDUAR"; LMBH_ScannableLevelName.label String.Format("(DM) %s", StringTable.Localize("$SELDUAR")); } }
class LMBH_Level_Selduar: LMBH_ScannableLevelName{ Default{ LMBH_ScannableLevelName.level "SELDUAR"; LMBH_ScannableLevelName.label "$SELDUAR"; LMBH_ScannableLevelName.prefixLabel "DM";} }

// Random JOELwindows7
class LMBH_Level_Freeld: LMBH_ScannableLevelName{ Default{ LMBH_ScannableLevelName.level "FREELD"; LMBH_ScannableLevelName.label "$FREELD"; } }
class LMBH_Level_JustFite: LMBH_ScannableLevelName{ Default{ LMBH_ScannableLevelName.level "JUSTFITE"; LMBH_ScannableLevelName.label "$JUSTFITE"; } }
class LMBH_Level_RightFrn: LMBH_ScannableLevelName{ Default{ LMBH_ScannableLevelName.level "RIGHTFRN"; LMBH_ScannableLevelName.label "$RIGHTFRN"; } }
class LMBH_Level_Telefast: LMBH_ScannableLevelName{ Default{ LMBH_ScannableLevelName.level "TELEFAST"; LMBH_ScannableLevelName.label "$TELEFAST"; } }
class LMBH_Level_Meditate: LMBH_ScannableLevelName{ Default{ LMBH_ScannableLevelName.level "MEDITATE"; LMBH_ScannableLevelName.label "$MEDITATE"; } }
class LMBH_Level_Portala: LMBH_ScannableLevelName{ Default{ LMBH_ScannableLevelName.level "PORTALA"; LMBH_ScannableLevelName.label "$PORTALA"; } }
class LMBH_Level_Dodtel: LMBH_ScannableLevelName{ Default{ LMBH_ScannableLevelName.level "DODTEL"; LMBH_ScannableLevelName.label "$DODTEL"; } }
class LMBH_Level_T_Cuzom: LMBH_ScannableLevelName{ Default{ LMBH_ScannableLevelName.level "T_CUZOM"; LMBH_ScannableLevelName.label "$T_CUZOM"; } }
class LMBH_Level_T_Rspawn: LMBH_ScannableLevelName{ Default{ LMBH_ScannableLevelName.level "T_RSPAWN"; LMBH_ScannableLevelName.label "$T_RSPAWN"; } }
class LMBH_Level_TTLake: LMBH_ScannableLevelName{ Default{ LMBH_ScannableLevelName.level "TTLAKE"; LMBH_ScannableLevelName.label "$TTLAKE"; } }

// Yoinke
class LMBH_Level_Chbzsd: LMBH_ScannableLevelName{ Default{ LMBH_ScannableLevelName.level "Chubzdoomer/CHBZSD"; LMBH_ScannableLevelName.label "$CHBZSD"; } }
class LMBH_Level_Plmsky1: LMBH_ScannableLevelName{ Default{ LMBH_ScannableLevelName.level "PLMSKY1"; LMBH_ScannableLevelName.label "$PLMSKY1"; } }
class LMBH_Level_Mechsky1: LMBH_ScannableLevelName{ Default{ LMBH_ScannableLevelName.level "MECHSKY1"; LMBH_ScannableLevelName.label "$MECHSKY1"; } }
class LMBH_Level_WrwDemo: LMBH_ScannableLevelName{ Default{ LMBH_ScannableLevelName.level "WRWDEMO"; LMBH_ScannableLevelName.label "$WRWDEMO"; } }
class LMBH_Level_MrwDemo: LMBH_ScannableLevelName{ Default{ LMBH_ScannableLevelName.level "MRWDEMO"; LMBH_ScannableLevelName.label "$MRWDEMO"; } }
class LMBH_Level_T_Nj_Bgl: LMBH_ScannableLevelName{ Default{ LMBH_ScannableLevelName.level "T_NJ_BGL"; LMBH_ScannableLevelName.label "$T_NJ_BGL"; } }

// TESTS
class LMBH_Level_Choralbe: LMBH_ScannableLevelName{ Default{ LMBH_ScannableLevelName.level "CHORALBE"; LMBH_ScannableLevelName.label "$CHORALBE"; } }
class LMBH_Level_T_Scttg: LMBH_ScannableLevelName{ Default{ LMBH_ScannableLevelName.level "T_SCTTG"; LMBH_ScannableLevelName.label "$T_SCTTG"; } }
class LMBH_Level_ToFolder: LMBH_ScannableLevelName{ Default{ LMBH_ScannableLevelName.level "TOFOLDER"; LMBH_ScannableLevelName.label "$TOFOLDER"; } }
class LMBH_Level_Loadfol: LMBH_ScannableLevelName{ Default{ LMBH_ScannableLevelName.level "LoadFolder/LOADFOL"; LMBH_ScannableLevelName.label "$LOADFOL"; } }
class LMBH_Level_Totitle: LMBH_ScannableLevelName{ Default{ LMBH_ScannableLevelName.level "TOTITLE"; LMBH_ScannableLevelName.label "$TOTITLE"; } }
class LMBH_Level_Totitle2: LMBH_ScannableLevelName{ Default{ LMBH_ScannableLevelName.level "TOTITLE2"; LMBH_ScannableLevelName.label "$TOTITLE2"; } }
class LMBH_Level_Totitle3: LMBH_ScannableLevelName{ Default{ LMBH_ScannableLevelName.level "TOTITLE3"; LMBH_ScannableLevelName.label "$TOTITLE3"; } }
class LMBH_Level_T_Ca_Out: LMBH_ScannableLevelName{ Default{ LMBH_ScannableLevelName.level "T_CA_OUT"; LMBH_ScannableLevelName.label "$T_CA_OUT"; } }
class LMBH_Level_Donuter: LMBH_ScannableLevelName{ Default{ LMBH_ScannableLevelName.level "DONUTER"; LMBH_ScannableLevelName.label "$DONUTER"; } }
// okeh thancc

// Break it down!
// Example Level Name
class LMBH_Level_KinsieTestLevelName: LMBH_ScannableLevelName
{
	Default
	{
		LMBH_ScannableLevelName.level "TEST";
		LMBH_ScannableLevelName.label "$_GENERIC_TEST";
	}
}

// Example Level Name 2
class LMBH_Level_FurdoomTestLevelName: LMBH_ScannableLevelName
{
	Default
	{
		LMBH_ScannableLevelName.level "TESTMAP";
		LMBH_ScannableLevelName.label "$_GENERIC_TEST_2";
	}
}

// And..
class LMBH_Level_SMMUTestLevelName: LMBH_ScannableLevelName
{
	Default
	{
		LMBH_ScannableLevelName.level "SMMUTEST";
		LMBH_ScannableLevelName.label "$SMMUTEST";
	}
}

