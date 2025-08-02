// m8f Achievements amalgamates
// (JOELwindows7)

// library & original samples
#include "scripts/m8f/stupid-achievements/StupidAchievements.zs"
#include "scripts/m8f/stupid-achievements/ImpAchievements.zs"

// put rest of the achievement includes here!
// Once done, load this one up to main ZScript loads

class LMBH_MbohAchievementHandler : EventHandler
{
    
    //bool playerSelfDied = false;
    //string diedAtlevel = "";

    void checkCheat(consoleEvent e){
        let expectedCommand = 'LMBH:cheat'; // e.g. `LMBH:cheat:MyCheat`
        name eventname = e.name;
        let pmo = players[e.player].mo;
        array<string> splitren;
        e.name.split(splitren,":");
        if(e.isManual)
        {
            if(e.name.indexOf(expectedCommand) > -1 )
            {
                
                if(splitren.size() < 3)
                {
                    // not yet cheating
                    return;
                }
                //Console.printf("asl;kdjfaowiehfoawerhfoahkj");
                if(splitren[2] ~== "LMBH_ExampleCheatTest")
                {
                    // not cheat either yet
                    return;
                }
                
                if(splitren[2].length() == 0)
                {
                    // empty type
                    return;
                }
                

                // ultimately cheating, achieve now!
                LMBH_Achiever.achieve("LMBH_Achievement_YouCheated");
                // & tell everyone about it
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
                ppawn.A_GiveInventory("LMBH_CheatCoin",1);
            }
        }
    }

    void networkAchieve(consoleEvent e)
    {
        let expectedCommand = 'LMBH:achieve'; // e.g. `LMBH:achieve:LMBH_Achievment_MyAchieve`
        name eventname = e.name;
        let pmo = players[e.player].mo;
        array<string> splitren;
        e.name.split(splitren,":");
        if(!e.isManual)
        {
            if(e.name.indexOf(expectedCommand) > -1 )
            {
                if(splitren.size() < 3)
                {
                    // not enough arguments
                    return;
                }
                if(splitren[2].length() == 0)
                {
                    // empty achieve
                    return;
                }
                LMBH_Achiever.achieve(splitren[2]);
            }
        }
    }

    static bool IsVoodooDoll(PlayerPawn mo) 
    {
        // https://zdoom.org/wiki/Classes:PlayerPawn
        return !mo.player || !mo.player.mo || mo.player.mo != mo;
    }

    bool evalPlayerClass(PlayerPawn mo, string classname) {
        // https://zdoom.org/wiki/ZScript_classes
        // this errors
        // class<PlayerPawn> cls = classname;
        // if (cls) return mo is classname;
        // return mo is classname;
        // if(cls) {}
        string containes = "";
        if(classname.length() > 0) containes = classname;
        name moName = mo.getClassName();
        name namedClass = classname;
        string stringName = moName;
        
        // return moName == classname;
        // Console.printf("%s %s %d",moName,classname, moName.indexOf(containes));
        Console.printf("%s %s %d",moName,classname, stringName.indexOf(classname));
        // return (stringName.indexOf(classname) > -1) == true;
        // return (stringName.indexOf(classname) == 0);
        return (stringName.indexOf(containes) == 0);
        // return false;
        // return stringName == classname;
        // return moName == namedClass;
    }

    // int kludgeWait = 1;
    void threadAchieveByClass(PlayerPawn pmo)
    {
        // if(!LMBH_AchievementNotReadyBug)
        // {
        //     Cvar.GetCvar("LMBH_AchievementNotReadyBug").SetBool(true);
        //     return; // try again after level complete and then enter the new level.
        // }
        // int wait = 10;
        // if(kludgeWait > 0)
        // {
        //     kludgeWait--;
        //     threadAchieveByClass(pmo);
        //     return;
        // } else 
        // {
        //     kludgeWait = 1;
        // }
        // shit! No switch case in string?! I am not Dev!!!
        // Class<LMBH_Achiever> ach = "LMBH_Achiever";
        // if(ach){
            if(!evalPlayerClass(pmo,"DoomPlayer")) LMBH_Achiever.achieve("LMBH_Achievement_NotDoomGuy"); // not DoomPlayer
            if(evalPlayerClass(pmo,"FurDaisy")) LMBH_Achiever.achieve("LMBH_Achievement_SolidSolidSolid"); // korp kat Furdoom Hexabun
            else if(evalPlayerClass(pmo,"DukeNukem")) LMBH_Achiever.achieve("LMBH_Achievement_PieceOfCake"); // Duke Nukem.
            else if(evalPlayerClass(pmo,"HDoomPlayer")) LMBH_Achiever.achieve("LMBH_Achievement_EichPlayer"); // yes.
            else if(evalPlayerClass(pmo,"HDoomPlayer")) Console.printf("alsdhfaiuwgerhffiuageriuyheriguhergiuhstriguheirtughiuthg"); // yes.
            // if(!evalPlayerClass(pmo,"DoomPlayer")) EventHandler.SendNetworkEvent("LMBH:achieve:LMBH_Achievement_NotDoomGuy"); // not DoomPlayer
            // if(evalPlayerClass(pmo,"FurDaisy")) EventHandler.SendNetworkEvent("LMBH:achieve:LMBH_Achievement_SolidSolidSolid"); // korp kat Furdoom Hexabun
            // else if(evalPlayerClass(pmo,"DukeNukem")) EventHandler.SendNetworkEvent("LMBH:achieve:LMBH_Achievement_PieceOfCake"); // Duke Nukem.
            // else if(evalPlayerClass(pmo,"HDoomPlayer")) EventHandler.SendNetworkEvent("LMBH:achieve:LMBH_Achievement_EichPlayer"); // yes.
            else {}
        // }
        
        // if(pmo.getClassName() == "FurDaisy") LMBH_Achiever.achieve("LMBH_Achievement_SolidSolidSolid"); // korp kat Furdoom Hexabun
        // else if(pmo.getClassName() == "HDoomPlayer") LMBH_Achiever.achieve("LMBH_Achievement_EichPlayer"); // yes.
        // bro wtf why error
        /*
        adress zeor.
        the achiever is not ready yet

        whole this time we mistyped the achievement class name & just vm aborts address zero! it should've been 404 not found!
        */
    }

    override void PlayerDied(PlayerEvent e) {
        // a player is dedd

        // TODO: track player death. remove death if respawn or disconnect.
        // track level they died on. if the respawn again on different level, achieve I'm died thank you forever.
        // get player pawn
        let pmo = players[e.playerNumber].mo;
        let pinfo = players[e.playerNumber];
        if(PlayerInGame[e.playerNumber] && pmo && !IsVoodooDoll(pmo) && !(Level.info.MapName ~== "TITLEMAP"))
        {
            // if that's you, track.
            pmo.A_GiveInventory("LMBH_Flag_YouDied", 1);
            Cvar.GetCvar("LMBH_wereDied", players[e.playerNumber]).SetBool(true);
            //Console.printf("kgldsjgsiodh");

            // first time died. Haylo!
            LMBH_Achiever.achieve("LMBH_Achievement_YouDied");

            
        }
    }

    override void PlayerRespawned(PlayerEvent e) {
        let pmo = players[e.playerNumber].mo;
        if(PlayerInGame[e.playerNumber] && pmo && !IsVoodooDoll(pmo) && !(Level.info.MapName ~== "TITLEMAP"))
        {
            // remove you died flag inventory
            pmo.A_TakeInventory("LMBH_Flag_YouDied");
            
        }
        Cvar.GetCvar("LMBH_wereDied", players[e.playerNumber]).SetBool(false);
    }

    override void PlayerSpawned(PlayerEvent e) {
        let pmo = players[e.playerNumber].mo;
        if(PlayerInGame[e.playerNumber] && pmo && !IsVoodooDoll(pmo) && !(Level.info.MapName ~== "TITLEMAP"))
        {
            // if if they spawned with that inventory, if had, achieve. but otherwise, remove.
            // https://zdoom.org/wiki/A_TakeInventory
            Console.printf("Player has %d died", pmo.CountInv("LMBH_Flag_YouDied"));
            if(pmo.CountInv("LMBH_Flag_YouDied") > 0 || Cvar.GetCvar("LMBH_wereDied", players[e.playerNumber]).GetBool())
            {
                Console.printf(StringTable.Localize("$Achieve_ImDieThankYouForever"));
                LMBH_Achiever.achieve("LMBH_Achievement_ImDieThankYouForever");
            }
            pmo.A_TakeInventory("LMBH_Flag_YouDied", 1);

            // Specific Classname
            threadAchieveByClass(pmo);
        }
        Cvar.GetCvar("LMBH_wereDied", players[e.playerNumber]).SetBool(false);
    }

    override void WorldLoaded(WorldEvent e) 
    {
        // let pmo = players[e.player].mo;
        // if(PlayerInGame[e.player] && pmo && !IsVoodooDoll(pmo) && !(Level.info.MapName ~== "TITLEMAP"))
        // {
        //     // Specific Classname
        //     threadAchieveByClass(pmo);
        // }
        // if(e.IsSavegame)
        // {
        //     // let pmo = players[e.player].mo;
        //     // if(PlayerInGame[e.player] && pmo)
        //     // {
        //     //     pmo.A_TakeInventory("LMBH_Flag_YouDied");
        //     //     Cvar.GetCvar("LMBH_wereDied", players[e.player]).SetBool(false);
        //     // }
        //     //Cvar.GetCvar("LMBH_wereDied").SetBool(false);
        // }
    }

    override void WorldUnloaded(WorldEvent e)
    {
        // if(!e.IsSavegame)
        // {
        //     // let pmo = players[e.player].mo;
        //     // if(PlayerInGame[e.player] && pmo)
        //     // {
        //     //     pmo.A_TakeInventory("LMBH_Flag_YouDied");
        //     //     Cvar.GetCvar("LMBH_wereDied", players[e.player]).SetBool(false);
        //     // }
        //     //Cvar.GetCvar("LMBH_wereDied").SetBool(false);
        // }
    }

    override void NetworkProcess(consoleEvent e) {
        // check you cheated with `netevent LMBH:cheat:MyCheat`
        checkCheat(e);
        networkAchieve(e);
    }

    // IDEA: hasMethod isDLC(). this is for existence verifier to check this way other than with inherited existence class.
    // the verifier scans all Handler and check if there is this method & execute with returning info data.

    override void WorldTick()
    {

    }
}

class LMBH_Achievement_YouCheated : LMBH_Achievement
{
    Default
    {
        LMBH_Achievement.name "$Achieve_YouCheated";
        LMBH_Achievement.description "$Achieve_YouCheated_desc";
        //LMBH_Achievement.limit 9999999;
        //LMBH_Achievement.isProgressVisible true;
        // TODO: show always per session
        LMBH_Achievement.borderColor 0x00FFFF;
        LMBH_Achievement.boxColor    0x00FF00;
        LMBH_Achievement.lockedIcon "graphics/m8f/LMBH_imp_icon.png";
        LMBH_Achievement.unlockedIcon "graphics/m8f/LMBH_imp_icon.png";
    }
}

class LMBH_CheatCoin : Inventory
{
    Default
    {
        Inventory.PickupMessage "$CHEATARON_COIN";
        Inventory.Icon "I_CHAC";
        Tag "$Achieve_YouCheated";
        +INVENTORY.INVBAR;
        +FLOORCLIP;
        +DROPPED;
    }
    States
    {
        Spawn:
            CHCO B -1;
            Stop;
    }
}

class LMBH_Achievement_ImDieThankYouForever : LMBH_Achievement
{
    Default
    {
        // Complete a level after you died.
        // korone lmao https://youtu.be/saJajDpS8Cc?si=5FBMrszboNWQfJ0R
        LMBH_Achievement.name "$Achieve_ImDieThankYouForever";
        LMBH_Achievement.description "$Achieve_ImDieThankYouForever_desc";
        LMBH_Achievement.borderColor 0xA0FF0A;
        LMBH_Achievement.boxColor    0x0AFFA0;
        LMBH_Achievement.lockedIcon "graphics/m8f/LMBH_imp_icon.png";
        LMBH_Achievement.unlockedIcon "graphics/m8f/LMBH_imp_icon.png";
    }
}

class LMBH_Achievement_YouDied : LMBH_Achievement
{
    Default
    {
        // First time died
        LMBH_Achievement.name "$Achieve_YouDied";
        LMBH_Achievement.description "$Achieve_YouDied_desc";
        LMBH_Achievement.borderColor 0xffff00;
        LMBH_Achievement.boxColor    0x0099ff;
        LMBH_Achievement.lockedIcon "graphics/m8f/LMBH_imp_icon.png";
        LMBH_Achievement.unlockedIcon "graphics/m8f/LMBH_imp_icon.png";
    }
}

class LMBH_Flag_YouDied : Inventory
{
    Default
    {
        +INVENTORY.KEEPDEPLETED;
        +INVENTORY.UNCLEARABLE;
        +INVENTORY.UNDROPPABLE;
        +INVENTORY.UNTOSSABLE;
        Tag "_YouDied";
    }
    States
    {
        Spawn:
            TNT1 A -1;
            Stop;
    }
}

// SPECIFIC PLAYERCLASS NAMES

class LMBH_Achievement_EichPlayer : LMBH_Achievement
{
    Default
    {
        // No need to explain. You adult should know.
        LMBH_Achievement.name "$Achieve_EichPlay";
        LMBH_Achievement.description "$Achieve_EichPlay_desc";
        LMBH_Achievement.borderColor 0xA0FF0A;
        LMBH_Achievement.boxColor    0x0AFFA0;
        LMBH_Achievement.lockedIcon "graphics/m8f/LMBH_imp_icon.png";
        LMBH_Achievement.unlockedIcon "graphics/m8f/LMBH_imp_icon.png";
        LMBH_Achievement.isHidden true;
    }
}

class LMBH_Achievement_SolidFurry : LMBH_Achievement
{
    Default
    {
        // "I'm not furry!", while you secretly like Protogen
        /*
        Don't worry, Joel is too. 
        */
        LMBH_Achievement.name "$Achieve_SolidSolidSolid";
        LMBH_Achievement.description "$Achieve_SolidSolidSolid_desc";
        LMBH_Achievement.borderColor 0xBB5500;
        LMBH_Achievement.boxColor    0x0A55FF;
        LMBH_Achievement.lockedIcon "graphics/m8f/LMBH_imp_icon.png";
        LMBH_Achievement.unlockedIcon "graphics/m8f/LMBH_imp_icon.png";
        LMBH_Achievement.isHidden true;
    }
}

class LMBH_Achievement_NotDoomGuy : LMBH_Achievement
{
    Default
    {
        // You're not.. DoomPlayer. Who are you?
        /*
        Where's Doomguy?
        */
        LMBH_Achievement.name "$Achieve_NotDoomGuy";
        LMBH_Achievement.description "$Achieve_NotDoomGuy_desc";
        LMBH_Achievement.borderColor 0xBB0000;
        LMBH_Achievement.boxColor    0xBBBBBB;
        LMBH_Achievement.lockedIcon "graphics/m8f/LMBH_imp_icon.png";
        LMBH_Achievement.unlockedIcon "graphics/m8f/LMBH_imp_icon.png";
        LMBH_Achievement.isHidden true;
    }
}

// END SPECIFIC PLAYERCLASS NAMES