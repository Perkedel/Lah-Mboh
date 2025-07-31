// m8f Achievements amalgamates
// (JOELwindows7)

// library & original samples
#include "scripts/m8f/stupid-achievements/StupidAchievements.zs"
#include "scripts/m8f/stupid-achievements/ImpAchievements.zs"

// put rest of the achievement includes here!
// Once done, load this one up to main ZScript loads

class LMBH_MbohAchievementHandler : EventHandler
{
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

    override void NetworkProcess(consoleEvent e) {
        // check you cheated with `netevent LMBH:cheat:MyCheat`
        checkCheat(e);
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
        Inventory.Icon "I_CHCO";
        +INVENTORY.INVBAR;
        +FLOORCLIP;
        +DROPPED;
    }
    States
    {
        Spawn:
            CHCO A -1;
            Stop;
    }
}