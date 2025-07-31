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

// Cheataron. Complete Cheat package EventHandler
// (JOELwindows7)
//
// hehe, she a dom lol

class LMBH_Cheataron : EventHandler
{
    void scanCheats()
    {
        // just like m8f's, ..
		uint nClasses = AllActorClasses.size(); // get all Actors onboard!
		let counter = 0;
        for(uint i = 0; i < nClasses; i++)
        {
            let c = AllActorClasses[i];
            if(c is "LMBH_CheataronCheat")
            {
                // I expect all these cheats!
                let cheat = LMBH_CheataronCheat(getDefaultByType(c));
                //let item = 
                String name = c.getClassName(); // what's your name?
                String title = StringTable.Localize(cheat.title);
                String description = StringTable.Localize(cheat.description);
                if(name ~== "LMBH_CheataronCheat" || name ~== "LMBH_ExampleCheatTest" || name ~== "LMBH_Cheataron")
                {
                    continue; // wait no! not yourself, not the test! Descendants!!!, yes!..
                }
                Console.printf("\c[gray]- \c[white](\c[yellow]%s\c[white]) \c[gold]%s. \c-%s",name, title, description);
                counter++;
            }
        }
        if(counter <= 0)
        {
            Console.printf(StringTable.Localize("$CHEATARON_EMPTY"));
        }
        Console.printf(StringTable.Localize("$CHEATARON_FINALCOUNT"),counter);

    }

    override void NetworkProcess(consoleEvent e) 
    {
        let expectedCommand = 'LMBH:cheat'; // e.g. `LMBH:cheat:MyCheat`
        name eventname = e.name;
        if(e.name.indexOf(expectedCommand) > -1 )
        {
            
            let pmo = players[e.player].mo;
            array<string> splitren;
            e.name.split(splitren,":");
            if(splitren.size() < 3)
            {
                Console.printf(StringTable.Localize("$INTERNAL_BARRIER_MINUS"));
                Console.printf(StringTable.Localize("$CHEATARON_USAGE"));
                Console.printf(StringTable.Localize("$INTERNAL_BARRIER_MINUS"));
                Console.printf(StringTable.Localize("$CHEATARON_TITLENAME"));
                Console.printf(StringTable.Localize("$CHEATARON_TITLELIST"));
                scanCheats();
                Console.printf(StringTable.Localize("$INTERNAL_BARRIER_MINUS"));
                return;
            }
            let sayIt = StringTable.Localize("$CHEATARON_NOTFOUND");
            if(LMBH_CheataronCheat.isExist(splitren[2])) 
            {
                sayIt = StringTable.Localize("$CHEATARON_FOUND");
                Class<LMBH_CheataronCheat> theClass = splitren[2];
                let cheat = LMBH_CheataronCheat(GetDefaultByType(theClass));
                // print the title & desc
                String name = theClass.getClassName();
                String title = StringTable.Localize(cheat.title);
                String description = StringTable.Localize(cheat.description);
                Console.printf(StringTable.Localize("$INTERNAL_BARRIER_MINUS"));
                Console.printf(StringTable.Localize("$CHEATARON_EXECUTE"),title,name,description);
                Console.printf(StringTable.Localize("$INTERNAL_BARRIER_MINUS"));
                if(cheat.skipPlayerCheck)
                {
                    cheat.callCheat(e);
                } else 
                {
                    // Make sure this player is valid
                    // and has a PlayerPawn:
                    if (!PlayerInGame[e.Player])
                    {
                        Console.printf(StringTable.Localize("$CHEATARON_OUTRESOURCE_ERR_NOPLAYER"),e.Player);
                        //return;
                    } else 
                    {
                        let ppawn = players[e.Player].mo;
                        if (!ppawn)
                        {
                            Console.printf(StringTable.Localize("$CHEATARON_OUTRESOURCE_ERR_NOPAWN"),e.Player);
                            //return;
                        } else
                        {
                            cheat.callCheat(e);
                        }
                    }
                }
                
                
            }
            Console.printf(StringTable.Localize("$CHEATARON_SCAN"),splitren[2],sayIt);
            if(splitren[2] ~== "LMBH_ExampleCheatTest")
            {
                Console.printf(StringTable.Localize("$CHEATARON_TEMPLATEO"),splitren[2]);
                Console.printf(StringTable.Localize("$CHEATARON_USAGE"));
                Console.printf("\n");
                Console.printf(StringTable.Localize("$CHEATARON_DOWNLOAD"));
            }
        }
    }
}

class LMBH_CheataronCheat : Actor
{
    // var
    String name;
	String title;
	String description;
    bool skipPlayerCheck; // skip player pawn check

    // prop
    property name: name;
	property title: title;
	property description: description;
    property skipPlayerCheck: skipPlayerCheck;

    Default
    {

    }

    static bool isExist(Class<LMBH_CheataronCheat> theClass)
    {
        // scan if the class looked for is based on this very class.
        //let c = AllActorClasses[i]; // YOINK! here all actors loaded in GZDoom.
        if(theClass is 'LMBH_CheataronCheat')
        {
            return true;
        }
        return false;
    }

    virtual void callCheat(consoleEvent e)
    {
        // override your cheat call!
    }
}

// Example

class LMBH_ExampleCheatTest : LMBH_CheataronCheat
{
    Default
    {
        LMBH_CheataronCheat.name "LMBH_ExampleCheatTest"; // Cheat ID
        LMBH_CheataronCheat.title "Example"; // Title
        LMBH_CheataronCheat.description "Lorem Ipsum"; // The description of it, 
        //You can also select string from LANGUAGE with $ prefix!.
        LMBH_CheataronCheat.skipPlayerCheck false; // Skip PlayerPawn check. Recommended keep it false, unless the cheat is not about Player.
    }

    override void callCheat(consoleEvent e)
    {
        // override your cheat call!
        Console.printf(StringTable.Localize("$INTERNAL_BARRIER_MINUS"));
        Console.printf(StringTable.Localize("$CHEATARON_EXAMPLE"));
        Console.printf(StringTable.Localize("$INTERNAL_BARRIER_MINUS"));
    }
}

#include "scripts/Cheataron/ExampleCheats.zs"

// https://zdoom.org/wiki/GiveInventory_(ScriptUtil)
// https://zdoom.org/wiki/NetworkProcess