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

            Class<LMBH_CheataronCheat> theClass = splitren[2];
            let cheat = LMBH_CheataronCheat(GetDefaultByType(theClass));

            if(e.isManual || splitren[2] ~== "LMBH_OutOfResourceCheatKit" || cheat.literallyCheat)
            {
                ppawn.A_GiveInventory("LMBH_CheatCoin",1);
                // ultimately cheating, achieve now!
                LMBH_Achiever.achieve("LMBH_Achievement_YouCheated");
                // & tell everyone about it
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

    bool evalPlayerClass(PlayerPawn mo, string classname, bool contains = false) {
        // https://zdoom.org/wiki/ZScript_classes
        // this errors
        // class<PlayerPawn> cls = classname;
        // if (cls) return mo is classname;
        // return mo is classname;
        // if(cls) {}
        // string containes = "";
        // if(classname.length() > 0) containes = classname;
        name moName = mo.getClassName();
        name namedClass = classname;
        string stringName = moName;

        // return moName == classname;
        // Console.printf("%s %s %d",moName,classname, moName.indexOf(containes));
        // Console.printf("%s %s %d",moName,classname, stringName.indexOf(classname));
        // return (stringName.indexOf(classname) > -1) == true;
        if(contains)
        {
            return (stringName.indexOf(classname) > -1);
        }
        return (stringName.indexOf(classname) == 0);
        // return (stringName.indexOf(containes) == 0);
        // return false;
        // return stringName == classname;
        // return moName == namedClass;
        // mistype achievement class lmao aldsfhakjsh
        // return stringName ~== classname;
    }

    // int kludgeWait = 1;
    void threadAchieveByClass(PlayerPawn pmo)
    {
        string patches = "";
        if(!evalPlayerClass(pmo,"DoomPlayer")) LMBH_Achiever.achieve("LMBH_Achievement_NotDoomGuy"); // not DoomPlayer
        if(evalPlayerClass(pmo,"DoomPlayer")) {} // You are already DoomPlayer bruh!
        else if(evalPlayerClass(pmo,"FURDaisy")) LMBH_Achiever.achieve("LMBH_Achievement_SolidFurry"); // korp kat Furdoom Hexabun
        else if(evalPlayerClass(pmo,"DukeNukem")) LMBH_Achiever.achieve("LMBH_Achievement_PieceOfCake"); // Duke Nukem.
        else if(evalPlayerClass(pmo,"HDoomPlayer")) LMBH_Achiever.achieve("LMBH_Achievement_EichPlayer"); // yes.
        else if(evalPlayerClass(pmo,"Yuri")) LMBH_Achiever.achieve("LMBH_Achievement_ForMotherlandUra"); // PillowBlaster Russian Overkill
        else if(evalPlayerClass(pmo,"Alosha")) LMBH_Achiever.achieve("LMBH_Achievement_ForMotherlandUra"); // PillowBlaster Russian Overkill
        else if(evalPlayerClass(pmo,"Marty")) LMBH_Achiever.achieve("LMBH_Achievement_ForMotherlandUra"); // PillowBlaster Russian Overkill
        else if(evalPlayerClass(pmo,"PB_PlayerPawn")) LMBH_Achiever.achieve("LMBH_Achievement_ProjectBrutality"); // p4ink1ller Project Brutality
        else if(evalPlayerClass(pmo,"BDoomer")) LMBH_Achiever.achieve("LMBH_Achievement_SergeantBrutal"); // Sergeant Mark IV Brutal DOOM
        else if(evalPlayerClass(pmo,"HDPlayerPawn")) LMBH_Achiever.achieve("LMBH_Achievement_HideousDestructor"); // mc776 Hideous Destructor
        else if(evalPlayerClass(pmo,"HDP_L",true)) LMBH_Achiever.achieve("LMBH_Achievement_HideousDestructor"); // mc776 Hideous Destructor
        else {}
        // bro wtf why error
        /*
        adress zeor.
        the achiever is not ready yet

        whole this time we mistyped the achievement class name & just vm aborts address zero! it should've been 404 not found!
        */

        // And also Player Skin Check
        // https://zdoom.org/wiki/PlayerSkinCheck
        /*
        if (PlayerSkinCheck() )
        {
            // "how did you get here?!"
            LMBH_Achiever.achieve("LMBH_Achievement_HowDidYouGotHere");
        }
        */
    }

    static void testSay()
    {
        Console.printf("testSay AAAAAAAAAAAAAAAAAAAAAAAA");
        // TODO: Call from ACS!
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
            Cvar.GetCvar("LMBH_wereMap", players[e.playerNumber]).SetString(Level.info.MapName);
            Cvar.GetCvar("LMBH_everDied", players[e.playerNumber]).SetBool(true);

            // first time died. Haylo!
            LMBH_Achiever.achieve("LMBH_Achievement_YouDied");

            // died 10 times same map
            if(Cvar.GetCvar("LMBH_deathCount_sameMap", players[e.playerNumber]).GetInt() >= 10)
            {
                Console.printf("\c[magenta]%s", StringTable.localize("$Achieve_SoHard"));
                LMBH_Achiever.achieve("LMBH_Achievement_SoHard");
            }

            // died 100 times in this GZDoom
            LMBH_Achiever.achieve("LMBH_Achievement_ServerHundredDeaths");
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
            // Console.printf("Player has %d died", pmo.CountInv("LMBH_Flag_YouDied"));
            if(pmo.CountInv("LMBH_Flag_YouDied") > 0 || Cvar.GetCvar("LMBH_wereDied", players[e.playerNumber]).GetBool())
            {
                Console.printf(StringTable.Localize("$Achieve_ImDieThankYouForever"));
                LMBH_Achiever.achieve("LMBH_Achievement_ImDieThankYouForever");
            }
            pmo.A_TakeInventory("LMBH_Flag_YouDied", 1);

            // Specific Classname
            threadAchieveByClass(pmo);

            // death same map
            if(Level.info.MapName != Cvar.GetCvar("LMBH_wereMap", players[e.playerNumber]).GetString()) Cvar.GetCvar("LMBH_everDied", players[e.playerNumber]).SetBool(false); // remove ever died if changed map

            if(Cvar.GetCvar("LMBH_everDied", players[e.playerNumber]).GetBool())
            {
                Cvar.GetCvar("LMBH_deathCount_sameMap", players[e.playerNumber]).SetInt(Cvar.GetCvar("LMBH_deathCount_sameMap", players[e.playerNumber]).GetInt() + 1);
            } else
            {
                Cvar.GetCvar("LMBH_deathCount_sameMap", players[e.playerNumber]).SetInt(0);
            }
            // bruh, windsurf wtf if wrong with your attention?! need Fidget spinner?!??!?


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

        // reset some counters
        // Cvar.GetCvar("LMBH_deathCount_sameMap").SetInt(0);
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

class LMBH_Achievement_ForMotherlandUra : LMBH_Achievement
{
    Default
    {
        // FOR MOTHER RUSSIA!
        /*
        URA!!!

        Russian Overkill
        */
        LMBH_Achievement.name "$Achieve_ForMotherlandUra";
        LMBH_Achievement.description "$Achieve_ForMotherlandUra_desc";
        LMBH_Achievement.borderColor 0xBB0000;
        LMBH_Achievement.boxColor    0xBB0000;
        LMBH_Achievement.lockedIcon "graphics/m8f/LMBH_imp_icon.png";
        LMBH_Achievement.unlockedIcon "graphics/m8f/LMBH_imp_icon.png";
        LMBH_Achievement.isHidden true;
    }
}

class LMBH_Achievement_ProjectBrutality : LMBH_Achievement
{
    Default
    {
        // Haha!! Chainsaw, the weapon of communication!
        /*

        Project Brutality
        */
        LMBH_Achievement.name "$Achieve_ProjectBrutality";
        LMBH_Achievement.description "$Achieve_ProjectBrutality_desc";
        LMBH_Achievement.borderColor 0x00FFFF;
        LMBH_Achievement.boxColor    0x000000;
        LMBH_Achievement.lockedIcon "graphics/m8f/LMBH_imp_icon.png";
        LMBH_Achievement.unlockedIcon "graphics/m8f/LMBH_imp_icon.png";
        LMBH_Achievement.isHidden true;
    }
}

class LMBH_Achievement_SergeantBrutal : LMBH_Achievement
{
    Default
    {
        // Don't forget Brutal Doom Sergeant Mark IV
        /*

        another Brutal we first know from.
        */
        LMBH_Achievement.name "$Achieve_SergeantBrutal";
        LMBH_Achievement.description "$Achieve_SergeantBrutal_desc";
        LMBH_Achievement.borderColor 0xFF1111;
        LMBH_Achievement.boxColor    0x000000;
        LMBH_Achievement.lockedIcon "graphics/m8f/LMBH_imp_icon.png";
        LMBH_Achievement.unlockedIcon "graphics/m8f/LMBH_imp_icon.png";
        LMBH_Achievement.isHidden true;
    }
}

class LMBH_Achievement_HDPlayerPawn : LMBH_Achievement
{
    Default
    {
        // mc776's Hideous Destructor
        /*
        https://codeberg.org/mc776/HideousDestructor/src/branch/main/actors/dcplayer.txt
        https://codeberg.org/mc776/HideousDestructor/src/branch/main/zscript/player.zs
        */
        LMBH_Achievement.name "$Achieve_HideousDestructor";
        LMBH_Achievement.description "$Achieve_HideousDestructor_desc";
        LMBH_Achievement.borderColor 0x002255;
        LMBH_Achievement.boxColor    0x000022;
        LMBH_Achievement.lockedIcon "graphics/m8f/LMBH_imp_icon.png";
        LMBH_Achievement.unlockedIcon "graphics/m8f/LMBH_imp_icon.png";
        LMBH_Achievement.isHidden true;
    }
}
// END SPECIFIC PLAYERCLASS NAMES

class LMBH_Achievement_SoHard : LMBH_Achievement
{
    Default
    {
        // Died 10 times.
        /*
        Parkour is hard, so does combat. Note this is not yet slaughterion
        */
        LMBH_Achievement.name "$Achieve_SoHard";
        LMBH_Achievement.description "$Achieve_SoHard_desc";
        LMBH_Achievement.borderColor 0xFF0090;
        LMBH_Achievement.boxColor    0x100000;
        LMBH_Achievement.lockedIcon "graphics/m8f/LMBH_imp_icon.png";
        LMBH_Achievement.unlockedIcon "graphics/m8f/LMBH_imp_icon.png";
        LMBH_Achievement.isHidden true;
    }
}

class LMBH_Achievement_ServerHundredDeaths : LMBH_Achievement
{
    Default
    {
        // Died 100 times total in this GZDoom you're at.
        /*
        Simple unspecific death tracker
        */
        LMBH_Achievement.name "$Achieve_ServerHundredDeaths";
        LMBH_Achievement.description "$Achieve_ServerHundredDeaths_desc";
        LMBH_Achievement.borderColor 0xAA0030;
        LMBH_Achievement.boxColor    0x050000;
        LMBH_Achievement.limit 100;
        LMBH_Achievement.isProgressVisible false;
        LMBH_Achievement.lockedIcon "graphics/m8f/LMBH_imp_icon.png";
        LMBH_Achievement.unlockedIcon "graphics/m8f/LMBH_imp_icon.png";
        LMBH_Achievement.isHidden true;
    }
}

// TODO: Toasty. MK Toasty & Stepmania toasty.
/*
Since world start, no damage, 250 kills.
*/

class LMBH_Achievement_HowDidYouGotHere : LMBH_Achievement
{
    Default
    {
        // Wear skin in this IWAD but from another IWAD.
        /*
        Simple unspecific death tracker
        */
        LMBH_Achievement.name "$Achieve_HowDidYouGotHere";
        LMBH_Achievement.description "$Achieve_HowDidYouGotHere_desc";
        LMBH_Achievement.borderColor 0x00AA30;
        LMBH_Achievement.boxColor    0x000500;
        LMBH_Achievement.limit 100;
        LMBH_Achievement.isProgressVisible false;
        LMBH_Achievement.lockedIcon "graphics/m8f/LMBH_imp_icon.png";
        LMBH_Achievement.unlockedIcon "graphics/m8f/LMBH_imp_icon.png";
        LMBH_Achievement.isHidden true;
    }
}