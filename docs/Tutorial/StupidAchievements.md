# How to Stupid Achivements

> [!IMPORTANT]
> We have renamed the namepspace of this mod here from `sa_` into `LMBH_` & `LMBH_Achieve_`.  
> In this article, we're going to use the default `sa_` namespace. Whatever you call, should apply the same with according namespace you let or changed to.

[Download Stupid Achievements](https://github.com/mmaulwurff/stupid-achievements/releases)

## Creating Achievement

To create achievement, make a new ZScript class based on `sa_Achievement`, then adjust your parameter

```zscript
class ia_OneKill : sa_Achievement
{
  Default
  {
    sa_Achievement.name "Initiate";
    sa_Achievement.description "Kill one imp";
    sa_Achievement.borderColor 0xDDDD22;
    sa_Achievement.boxColor    0xFFFFFF;
    sa_Achievement.lockedIcon "graphics/sa_icon.png";
    sa_Achievement.unlockedIcon "graphics/sa_icon.png";
  }
}
```

full example template:

```
pls insert!
```

## Achieve & Progress

the `sa_Achivever.Achieve("nameAchievement")` progresses or complete the Achievement, based on how many times needed to get it done. If the number of the triggers / progress reaches its `sa_achievement.limit`, it will ***Unlock*** the Achievement.

Usually, you would place the call when something happened in the gameplay. Therefore, it's on a virtual function in an `EventHandler`. Load that handler to your entire mod (Recommended) or just a level (if you'd like to make the achievement works if Doomer is on specific level(s)).

```zscript
... // class ia_EventHandler : EventHandler

override
  void worldThingDied(WorldEvent event)
  {
    if (isImp(event.thing))
    {
        // when you killed imps for several times..
      sa_Achiever.achieve("ia_OneKill"); // has `sa_achievement.limit` of 1, so just one trigger completes it
      sa_Achiever.achieve("ia_TenKills"); // limit 10, completes in 10 triggers
      sa_Achiever.achieve("ia_100Kills"); // & so on.
      sa_Achiever.achieve("ia_666Kills"); // You can also make use of creative numbers, go crazy!

      if (event.thing.health < -200)
      {
        sa_Achiever.achieve("ia_Overkill");
      }

      mIsImpDied = true;
    }
  }

override
  void worldThingDamaged(WorldEvent event)
  {
    if (!isImp(event.thing)) return;

    if (event.damagetype == "Telefrag")
    {
      sa_Achiever.achieve("ia_Telefrag");
    }
    else if (event.damagetype == "Melee")
    {
      sa_Achiever.achieve("ia_Melee");
    }
  }

...
```

To apply this entire map, place the handler on your `MAPINFO`, at the definition of `GameInfo`

```zscript
gameinfo
{
  AddEventHandlers = "ia_EventHandler", "sa_Achiever"
}
```

Or, to make the particular achievement handler works only for certain level, in the `MAPINFO`, at your particular `Map` definition

```zscript
map MAP01 "Whatever"
{
    ...
    EventHandlers = "ia_specificEventHandler"
    ...
}
```

So on so forth, repeat for other specific levels you desire.