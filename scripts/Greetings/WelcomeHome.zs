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

// Special Greet welcome. Let's just use ZScript?
// Oh also m8f's technique yess.
// (JOELwindows7)

class LMBH_GreetableCharacter : Actor
{
	// use m8f achievement tricks!!!!!!!
	string name; // your target class. e.g. DoomPlayer
	string friendlyName; // friendly name. e.g. Doomguy
	string reactionary; // reaction descriptions. e.g. "Hey welcome back!"
	float greetTime; // how long this appears

	property name: name;
	property friendlyName: friendlyName;
	property reactionary: reactionary;
	property greetTime: greetTime;

	Default
	{
		LMBH_GreetableCharacter.name "LMBH_GreetableCharacter";
		LMBH_GreetableCharacter.friendlyName "EXAMPLE";
		LMBH_GreetableCharacter.reactionary "";
		LMBH_GreetableCharacter.greetTime 5.0;
	}

	void _greetNow()
	{
		// private call first, then the overrides
		// do the greeting special!
		//Console.printf("...... %s ........", name);
		// https://zdoom.org/wiki/Structs:Console use MidPrint?
		// actually, the FrameMe uses DRAW TEXT
		// https://github.com/LocalInsomniac/FrameMe
		// https://zdoom.org/wiki/Structs:Screen
		// https://zdoom.org/wiki/DrawText
		// https://zdoom.org/wiki/Structs:Font
		// https://zdoom.org/wiki/ZScript_global_variables
		// https://zdoom.org/wiki/ZScript_special_words
		// https://zdoom.org/wiki/DrawString_(BaseStatusBar) DrawString?!??!?!?!

		// only work in render draw
		//Screen.DrawText(smallfont, Font.CR_UNTRANSLATED, 0.5, 0.25, String.Format("Welcome Home, %s", friendlyName));

		// call an ACS function!
		//Console.MidPrint(smallfont, String.Format("Welcome Home, %s", friendlyName));

		// okay your turn
		greetNow();
	}

	virtual void greetNow()
	{
		// override the function!
	}
}

class LMBH_WelcomeHome : EventHandler
{
	//LMBH_GreetableCharacter greetableCharacter;
	float greetTimer;
	bool greeting;

	override void WorldLoaded(WorldEvent e)
	{
		// grab all the name class!

		// then match the class name immediately!
		//MatchClass(playerClass);

		// reset timer
		Cvar.FindCvar("LMBH_WelcomeHome_GreetTimer").SetFloat(0.0);
	}

	static void MatchClass(string playerClass, int playerNumber)
	{
		Cvar.FindCvar("LMBH_WelcomeHome_currentClass").SetString(playerClass);
	}

	static void scanCharacter(string playerClass, int playerNumber)
	{
		MatchClass(playerClass, playerNumber);
	}

	// https://zdoom.org/wiki/ScriptCall
	static void GreetPackage(string playerClass, int playerNumber)
	{
		MatchClass(playerClass, playerNumber);

		string currentClass = playerClass;
		string friendlyName = "Gamer";
		string reactionary = StringTable.localize("");
		// string totalSay = String.Format("Welcome Home, %s (%s)\n\n%s\n\n", greetableCharacter.friendlyName, playerClass, greetableCharacter.reactionary);
		string totalSay = "";

		// Inevitable hardcode patches
		if(playerClass.indexOf("HDP_L") > -1)
		{
			// Hideous Destructor https://codeberg.org/mc776/HideousDestructor
			// https://codeberg.org/mc776/HideousDestructor/src/branch/main/mapinfo.txt
			currentClass = "HDPlayerPawn";
		} else {
			currentClass = playerClass;
		}

		// print out selected class. use HUDMessage!
		// LMBH_GreetableCharacter_YOURCLASSHERE
		// string toFetch = "LMBH_GreetableCharacter_" + playerClass; // likely not work, let's just stick to string.format
		// https://zdoom.org/wiki/ZScript_global_variables
		string toFetch = String.Format("LMBH_GreetableCharacter_%s", currentClass);
		Console.debugPrintf(DMSG_SPAMMY, "Greet %s", toFetch);
		Class<LMBH_GreetableCharacter> whatFetch = toFetch;
		if(whatFetch)
		{
			let greetableCharacter = LMBH_GreetableCharacter(GetDefaultByType(whatFetch));
			if(greetableCharacter is "LMBH_GreetableCharacter")
			{
				// call the class function
				Console.debugPrintf(DMSG_SPAMMY, "yes yes");
				greetableCharacter._greetNow();
				Cvar.FindCvar("LMBH_WelcomeHome_GreetTimer").SetFloat(greetableCharacter.greetTime * 35);
				//greetTimer = greetableCharacter.greetTime;
				
				friendlyName = StringTable.localize(greetableCharacter.friendlyName);
				reactionary = StringTable.localize(greetableCharacter.reactionary);
				
			} else {
				Console.debugPrintf(DMSG_SPAMMY, "no no");
			}
		} else
		{
			Console.debugPrintf(DMSG_SPAMMY, "no no NO no no no no");
		}
		totalSay = String.Format(StringTable.localize("Welcome Home, %s (%s)\n\n%s\n\n"), friendlyName, playerClass, reactionary);
		Console.printf(StringTable.Localize("$INTERNAL_BARRIER_MINUS"));
		Console.Printf(String.Format("%s",totalSay));
		Console.printf(StringTable.Localize("$INTERNAL_BARRIER_MINUS"));
	}

	override void RenderOverlay(RenderEvent e)
	{
		// https://zdoom.org/wiki/Renderstyle waaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaat
		
		// obtain class now
		string toFetch = String.Format("LMBH_GreetableCharacter_%s", Cvar.FindCvar("LMBH_WelcomeHome_currentClass").GetString());
		Class<LMBH_GreetableCharacter> whatFetch = toFetch;

		string currentClass = CVar.FindCvar("LMBH_WelcomeHome_currentClass").GetString();
		string friendlyName = "Gamer";
		string reactionary = "";
		double posX = 0 * 320;
		double posY = 0.75 * 200;


		// draw the text here!
		if(greeting)
		{
			if(whatFetch)
			{
				let greetableCharacter = LMBH_GreetableCharacter(GetDefaultByType(whatFetch));
				if(greetableCharacter)
				{
					currentClass = CVar.FindCvar("LMBH_WelcomeHome_currentClass").GetString();
					friendlyName = greetableCharacter.friendlyName;
					reactionary = greetableCharacter.reactionary;
				}
			}
			string totalSay = String.Format("Welcome Home, %s \nClass = %s\n\n%s\n\n", friendlyName, currentClass, reactionary);
			//Screen.DrawText(smallfont, Font.CR_UNTRANSLATED, 0.5, 0.25, String.Format("Welcome Home, %s", friendlyName));
			Screen.DrawText(smallfont, Font.CR_UNTRANSLATED, posX, posY, totalSay, DTA_Clean, true);

			// each tick is 35. what to do?!
			// https://zdoom.org/wiki/Definitions#Units_of_time
			//Cvar.FindCvar("LMBH_WelcomeHome_GreetTimer").SetFloat(Cvar.FindCvar("LMBH_WelcomeHome_GreetTimer").GetFloat() - (1/35));
		}
	}

	override void WorldTick()
	{
		// if(greetTimer > 0.0)
		if(Cvar.FindCvar("LMBH_WelcomeHome_GreetTimer").GetFloat() > 0.0)
		{
			greeting = true;
			// greetTimer = greetTimer - (1/35);
			Cvar.FindCvar("LMBH_WelcomeHome_GreetTimer").SetFloat(Cvar.FindCvar("LMBH_WelcomeHome_GreetTimer").GetFloat() - (1));
		} else 
		{
			greeting = false;
		}
	}
}

#include "scripts/Greetings/ExampleWelcomeHome.zs"

