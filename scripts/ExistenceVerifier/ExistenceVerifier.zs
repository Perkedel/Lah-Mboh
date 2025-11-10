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

// Existence Verifier. Inherit this class on your DLC stuffs
// (JOELwindows7)

/*
Our scanner can scan your stuff the mod should look for & verify its existence.
The result can be handed over to the handler you desire.
thancc m8f for inspiration
https://github.com/mmaulwurff/stupid-achievements
the `sa_Achievement` which is that base achievement bit is what's the interest.
As well as the menu that list those class of it (`sa_AchievementList`).
again, this is not to be spawned.
https://zdoom.org/wiki/Dictionary didn't know there is JSON-kindof thing here! I thought Godot was the only one had it.
https://zdoom.org/wiki/Operators_(ZScript)
https://zdoom.org/wiki/Using_inheritance

Alas, to have a `Default` property initializer, it's on `Actor` only. `Thinker` whose been inherited from, lacks such.
*/
class LMBH_ExistenceVerifier: Actor abstract
{
    // TODO: investigate Corruption Card & how to use Lumps based instead
	Default
	{
		LMBH_ExistenceVerifier.name "DLC_NAME";
		LMBH_ExistenceVerifier.title "anDLC";
		LMBH_ExistenceVerifier.description "DESC";
		LMBH_ExistenceVerifier.nsfw false;
		LMBH_ExistenceVerifier.nsfl false;
	}

	static bool isExist(Class<LMBH_ExistenceVerifier> theClass)
	{
		// scan if the class looked for is based on this very class.
		//let c = AllActorClasses[i]; // YOINK! here all actors loaded in GZDoom.
		if(theClass is 'LMBH_ExistenceVerifier')
		{
			return true;
		}
		return false;
	}

	// does Zscript support overload like in Java?
	// I'd like to make variant of `isExist` that uses String as argument..
	// uhh nvm, but I still want it.

    // The Tester Command Line
}

class LMBH_ExistenceHandler: StaticEventHandler
{
	// https://zdoom.org/wiki/Dynamic_arrays
	array<string> existedDLCs;

    //let expectedCommand = 'isDLCExist';
    // use Jekyll Dummy! the netevent
	// https://zdoom.org/wiki/NetworkProcess
	// https://zdoom.org/wiki/Events_and_handlers#Networking
    override void NetworkProcess(consoleEvent e)
    {
        let expectedCommand = 'LMBH:isDLCExist'; // e.g. `LMBH:isDLCExist:MyDLC`
        name eventname = e.name;
        if(e.name.indexOf(expectedCommand) > -1 )
        {
            let pmo = players[e.player].mo;
			// if (!pmo)
			// 	return;
			// arg version
			array<string> splitren;
            e.name.split(splitren,":");
			// if(e.Args[0] > 0 && splitren.size() < 3)
			// {
			// 	let sayIt = StringTable.Localize("$EXISTENCE_NOTFOUND");
			// 	if(LMBH_ExistenceVerifier.isExist(e.Args[0])) sayIt = StringTable.Localize("$EXISTENCE_FOUND");
			// 	Console.printf(StringTable.Localize("$EXISTENCE_SCAN"),e.Args[0],sayIt);
			// 	if(e.Args[0] ~== "LMBH_ExampleDLCTest")
			// 	{
			// 		Console.printf(StringTable.Localize("$EXISTENCE_TEMPLATEO"),e.Args[0]);
			// 		Console.printf(StringTable.Localize("$EXISTENCE_USAGE"));
			// 		Console.printf("\n");
			// 		Console.printf(StringTable.Localize("$EXISTENCE_DOWNLOAD"));
			// 	}
			// 	return;
			// }
			// WHAT?! Arguments are int only?!?!?!??! disappointing!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
			// EventHandler.SendNetworkEvent("myevent", 666, 23, -1);

			// old

            if(splitren.size() < 3)
            {
				Console.printf(StringTable.Localize("$INTERNAL_BARRIER_MINUS"));
                Console.printf(StringTable.Localize("$EXISTENCE_USAGE"));
				Console.printf(StringTable.Localize("$INTERNAL_BARRIER_MINUS"));
				Console.printf(StringTable.Localize("$EXISTENCE_TITLENAME"));
				Console.printf(StringTable.Localize("$EXISTENCE_TITLELIST"));
				scanDLCs();
				Console.printf(StringTable.Localize("$INTERNAL_BARRIER_MINUS"));
                return;
            } else
			{

			}
            let sayIt = StringTable.Localize("$EXISTENCE_NOTFOUND");
            if(LMBH_ExistenceVerifier.isExist(splitren[2]))
			{
				sayIt = StringTable.Localize("$EXISTENCE_FOUND");
				Class<LMBH_ExistenceVerifier> theClass = splitren[2];
				let dlc = LMBH_ExistenceVerifier(GetDefaultByType(theClass));
				// print the title & desc
				String name = theClass.getClassName();
				String title = StringTable.Localize(dlc.title);
				String description = StringTable.Localize(dlc.description);
				Console.printf(StringTable.Localize("$INTERNAL_BARRIER_MINUS"));
				Console.printf(StringTable.Localize("$EXISTENCE_EXECUTE"),title,name,description);
				Console.printf(StringTable.Localize("$INTERNAL_BARRIER_MINUS"));
			}
            // Console.printf("DLC Class "..splitren[2].." is ".. sayIt);
            Console.printf(StringTable.Localize("$EXISTENCE_SCAN"),splitren[2],sayIt);
            if(splitren[2] ~== "LMBH_ExampleDLCTest")
            {
                Console.printf(StringTable.Localize("$EXISTENCE_TEMPLATEO"),splitren[2]);
                Console.printf(StringTable.Localize("$EXISTENCE_USAGE"));
                Console.printf("\n");
                Console.printf(StringTable.Localize("$EXISTENCE_DOWNLOAD"));
            }
        }
    }

	// DONE: Scan all DLCs

	void scanDLCs()
	{
		// just like m8f's, ..
		uint nClasses = AllActorClasses.size(); // get all Actors onboard!
		let counter = 0;
		existedDLCs.clear();
		for (uint i = 0; i < nClasses; ++i)
		{
			// Let's itterate!
			let c = AllActorClasses[i];
			if (c is "LMBH_ExistenceVerifier")
			{
				// I expect all these existence verifiers!
				let existence = LMBH_ExistenceVerifier(getDefaultByType(c));
				//let item =
				String name = c.getClassName(); // what's your name?
				String title = StringTable.Localize(existence.title);
				String description = StringTable.Localize(existence.description);
				String sayNSFW = "";
				String sayNSFL = "";
				bool isNSFW = existence.nsfw;
				bool isNSFL = existence.nsfl;
				if (name ~== "LMBH_ExistenceVerifier" || name ~== "LMBH_ExampleDLCTest" || name ~== "LMBH_Existence")
				{
					continue; // wait no! not yourself, not the test! Descendants!!!, yes!..
				}
				if (isNSFW)
				{
					sayNSFW = " \c[gray]{\c[yellow]/!\\ \c[red][\c[yellow]NSFW\c[red]] \c[yellow]/!\\\c[gray]}\c-";
				}
				if (isNSFL)
				{
					sayNSFL = " \c[gray]{\c[red](X) \c[darkred][\c[red]NSFL\c[darkred]] \c[red](X)\c[gray]}\c-";
				}
				counter++;
				existedDLCs.push(name);
				Console.printf("\c[gray]- \c[white](\c[darkgreen]%s\c[white]) \c[green]%s%s%s\c-. \c-%s",name, title, sayNSFW, sayNSFL, description);
			}
		}
		if(counter <= 0)
		{
			Console.printf(StringTable.Localize("$EXISTENCE_EMPTY"));
		}
		Console.printf(StringTable.Localize("$EXISTENCE_FINALCOUNT"),counter);
	}

	//override void OnRegister()
	override void OnEngineInitialize()
	{
		Console.printf(StringTable.Localize("$INTERNAL_BARRIER_MINUS"));
		Console.printf(StringTable.Localize("$EXISTENCE_TITLENAME"));
		Console.printf(StringTable.Localize("$EXISTENCE_TITLELIST"));
		scanDLCs();
		Console.printf(StringTable.Localize("$INTERNAL_BARRIER_MINUS"));
	}
}

// We might wanna extend them now, I guess? No? Just be it one piece?
extend class LMBH_ExistenceVerifier
{
	// var
	String name;
	String title;
	String description;
	bool nsfw;
	bool nsfl;

	// prop
	property name: name;
	property title: title;
	property description: description;
	property nsfw: nsfw;
	property nsfl: nsfl;
}

// Example of DLC. You, inherit above class on your own PWAD
class LMBH_ExampleDLCTest : LMBH_ExistenceVerifier
{
	Default
	{
		LMBH_ExistenceVerifier.name "ExampleDLCTest";
		LMBH_ExistenceVerifier.title "Example";
		LMBH_ExistenceVerifier.description "Lorem Ipsum";
		LMBH_ExistenceVerifier.nsfw false;
		LMBH_ExistenceVerifier.nsfl false;
	}
}

#include "scripts/ExistenceVerifier/TemplateExistence.zs"
