# Legris' Script of Restart Map Upon Death

A script that restarts map is all player in the level died

## Decorate
```Decorate
Actor PlayerCounter 228
{
    States
    {
    Spawn:
     TNT1 A 1 A_JumpIfInventory("1Player", 1, "1Player")
     TNT1 A 1 A_JumpIfInventory("2Player", 1, "2Player")
     TNT1 A 1 A_JumpIfInventory("3Player", 1, "3Player")
     TNT1 A 1 A_JumpIfInventory("4Player", 1, "4Player")
     TNT1 A 1 A_JumpIfInventory("5Player", 1, "5Player")
     TNT1 A 1 A_JumpIfInventory("6Player", 1, "6Player")
     TNT1 A 1 A_JumpIfInventory("7Player", 1, "7Player")
     TNT1 A 1 A_JumpIfInventory("8Player", 1, "8Player")
     Loop
    1Player:
     TNT1 A 1 A_JumpIfInventory("PlayerDED", 1, "MapRestart")
     Loop
    2Player:
     TNT1 A 1 A_JumpIfInventory("PlayerDED", 2, "MapRestart")
     Loop
    3Player:
     TNT1 A 1 A_JumpIfInventory("PlayerDED", 3, "MapRestart")
     Loop
    4Player:
     TNT1 A 1 A_JumpIfInventory("PlayerDED", 4, "MapRestart")
     Loop
    5Player:
     TNT1 A 1 A_JumpIfInventory("PlayerDED", 5, "MapRestart")
     Loop
    6Player:
     TNT1 A 1 A_JumpIfInventory("PlayerDED", 6, "MapRestart")
     Loop
    7Player:
     TNT1 A 1 A_JumpIfInventory("PlayerDED", 7, "MapRestart")
     Loop
    8Player:
     TNT1 A 1 A_JumpIfInventory("PlayerDED", 8, "MapRestart")
     Loop
    MapRestart:
     TNT1 A 1 ACS_NamedExecute("MapRestart")
    }
}

Actor PlayerDED : Inventory
{
    Inventory.MaxAmount 8
}

Actor 1Player : Inventory
{
    Inventory.MaxAmount 1
}

Actor 2Player : Inventory
{
    Inventory.MaxAmount 1
}

Actor 3Player : Inventory
{
    Inventory.MaxAmount 1
}

Actor 4Player : Inventory
{
    Inventory.MaxAmount 1
}

Actor 5Player : Inventory
{
    Inventory.MaxAmount 1
}

Actor 6Player : Inventory
{
    Inventory.MaxAmount 1
}

Actor 7Player : Inventory
{
    Inventory.MaxAmount 1
}

Actor 8Player : Inventory
{
    Inventory.MaxAmount 1
}
```

## ACS

```ACS
#include "zcommon.acs"

Script "PlayerCountCheck" ENTER
{
    if (PlayerCount()>=2) {
        if (PlayerCount()>=3) {
            if (PlayerCount()>=4) {
                if (PlayerCount()>=5) {
                    if (PlayerCOunt()>=6) {
                        if (PlayerCount()>=7) {
                            if (PlayerCount()>=8) {
                                GiveActorInventory(1, "8Player", 1);
                            } else {
                                GiveActorInventory(1, "7Player", 1);
                            }
                        } else {
                            GiveActorInventory(1, "6Player", 1);
                        }
                    } else {
                        GiveActorInventory(1, "5Player", 1);
                    }
                } else {
                    GiveActorInventory(1, "4Player", 1);
                }
            } else {
                GiveActorInventory(1, "3Player", 1);
            }
        } else {
            GiveActorInventory(1, "2Player", 1);
        }
    } else {
        GiveActorInventory(1, "1Player", 1);
    }
}

Script "PlayerDED" DEATH
{
    GiveActorInventory(1, "PlayerDED", 1);
}

Script "MapRestart" (void)
{
    Exit_Normal(0);
}
```

## Sauce

https://www.doomworld.com/forum/topic/147232-if-all-players-dead-restart-map-script/