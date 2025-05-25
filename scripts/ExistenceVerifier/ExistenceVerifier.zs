// Existence Verifier. Inherit this class on your DLC stuffs
// (JOELwindows7)

// Our scanner can scan your stuff the mod should look for & verify its existence.
// The result can be handed over to the handler you desire.
// thancc m8f for inspiration
// https://github.com/mmaulwurff/stupid-achievements
// the `sa_Achievement` which is that base achievement bit is what's the interest.
// As well as the menu that list those class of it (`sa_AchievementList`).
// again, this is not to be spawned.
// https://zdoom.org/wiki/Dictionary didn't know there is JSON-kindof thing here! I thought Godot was the only one had it.
// https://zdoom.org/wiki/Operators_(ZScript)
// https://zdoom.org/wiki/Using_inheritance
class ExistenceVerifier: Actor abstract
{
	Default
	{
		ExistenceVerifier.name "DLC_NAME";
		ExistenceVerifier.title "anDLC";
		ExistenceVerifier.description "DESC";
		ExistenceVerifier.nsfw false;
	}

	static bool isExist(Class<ExistenceVerifier> theClass)
	{
		// scan if the class looked for is based on this very class.
		//let c = AllActorClasses[i]; // YOINK! here all actors loaded in GZDoom.
		if(theClass is 'ExistenceVerifier')
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

class ExistenceHandler: StaticEventHandler
{
    //let expectedCommand = 'isDLCExist';
    // use Jekyll Dummy! the netevent
    override void NetworkProcess(consoleEvent e)
    {
        let expectedCommand = 'isDLCExist';
        name eventname = e.name;
        if(e.name.indexOf(expectedCommand) > -1)
        {
            let pmo = players[e.player].mo;
			if (!pmo)
				return;
            array<string> splitren;
            e.name.split(splitren,":");
            let sayIt = "NOT FOUND";
            if(ExistenceVerifier.isExist(splitren[1])) sayIt = "FOUND";
            Console.printf("DLC Class "..splitren[1].." is ".. sayIt);
        }
    }
}

// We might wanna extend them now, I guess? No? Just be it one piece?
extend class ExistenceVerifier
{
	// var
	String name;
	String title;
	String description;
	bool nsfw;

	// prop
	property name: name;
	property title: title;
	property description: description;
	property nsfw: nsfw;
}

// Example of DLC. You, inherit above class on your own PWAD
class ExampleDLCTest : ExistenceVerifier
{
	Default
	{
		ExistenceVerifier.name "ExampleDLCTest";
		ExistenceVerifier.title "Example";
		ExistenceVerifier.description "Lorem Ipsum";
		ExistenceVerifier.nsfw false;
	}
}