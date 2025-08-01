// m8f Achievements amalgamates
// (JOELwindows7)

// library & original samples
#include "scripts/m8f/stupid-achievements/StupidAchievements.zs"
#include "scripts/m8f/stupid-achievements/ImpAchievements.zs"

// put rest of the achievement includes here!
// Once done, load this one up to main ZScript loads

class LMBH_MbohAchievementHandler : StaticEventHandler
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

    override void PlayerDied(PlayerEvent e) {
        // a player is dedd

        // TODO: track player death. remove death if respawn or disconnect.
        // track level they died on. if the respawn again on different level, achieve I'm died thank you forever.
        // get player pawn
        let pmo = players[e.playerNumber].mo;
        if(PlayerInGame[e.playerNumber] && pmo)
        {
            // if that's you, track.
            pmo.A_GiveInventory("LMBH_Flag_YouDied", 1);
            Cvar.GetCvar("LMBH_wereDied", players[e.playerNumber]).SetBool(true);
            //Console.printf("kgldsjgsiodh");
        }
    }

    override void PlayerRespawned(PlayerEvent e) {
        let pmo = players[e.playerNumber].mo;
        if(PlayerInGame[e.playerNumber] && pmo)
        {
            // remove you died flag inventory
            pmo.A_TakeInventory("LMBH_Flag_YouDied");
            
        }
        Cvar.GetCvar("LMBH_wereDied", players[e.playerNumber]).SetBool(false);
    }

    override void PlayerSpawned(PlayerEvent e) {
        let pmo = players[e.playerNumber].mo;
        if(PlayerInGame[e.playerNumber] && pmo)
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
        }
        Cvar.GetCvar("LMBH_wereDied", players[e.playerNumber]).SetBool(false);
    }

    override void WorldLoaded(WorldEvent e) 
    {
        if(e.IsSavegame)
        {
            // let pmo = players[e.player].mo;
            // if(PlayerInGame[e.player] && pmo)
            // {
            //     pmo.A_TakeInventory("LMBH_Flag_YouDied");
            //     Cvar.GetCvar("LMBH_wereDied", players[e.player]).SetBool(false);
            // }
            //Cvar.GetCvar("LMBH_wereDied").SetBool(false);
        }
    }

    override void WorldUnloaded(WorldEvent e)
    {
        if(!e.IsSavegame)
        {
            // let pmo = players[e.player].mo;
            // if(PlayerInGame[e.player] && pmo)
            // {
            //     pmo.A_TakeInventory("LMBH_Flag_YouDied");
            //     Cvar.GetCvar("LMBH_wereDied", players[e.player]).SetBool(false);
            // }
            //Cvar.GetCvar("LMBH_wereDied").SetBool(false);
        }
    }

    override void NetworkProcess(consoleEvent e) {
        // check you cheated with `netevent LMBH:cheat:MyCheat`
        checkCheat(e);
    }

    // IDEA: hasMethod isDLC(). this is for existence verifier to check this way other than with inherited existence class.
    // the verifier scans all Handler and check if there is this method & execute with returning info data.
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

class LMBH_Achievement_EichPlay : LMBH_Achievement
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
        Don't worry, Joel is too. We got to shed this multiple time
        both because there are groups of troubling furries, and worse therians,
        and as well as... outright haters. Like Lex hating Superman.
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