// Due to cease of activity on the Git Repo, we decided to yoink it for conveniences
// https://github.com/mmaulwurff/stupid-achievements/blob/master/zscript/ImpAchievements.zs
// Yoinked by JOELwindows7
// Namepace `sa_` 👉 `LMBH_`
// Namepace `ia_` 👉 `SrA_` Serpentipede

/* Copyright Alexander 'm8f' Kromm (mmaulwurff@gmail.com) 2021
 *
 * This file is a part of Typist.pk3.
 *
 * Typist.pk3 is free software: you can redistribute it and/or modify it under
 * the terms of the GNU General Public License as published by the Free Software
 * Foundation, either version 3 of the License, or (at your option) any later
 * version.
 *
 * Typist.pk3 is distributed in the hope that it will be useful, but WITHOUT ANY
 * WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
 * A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along with
 * Typist.pk3.  If not, see <https://www.gnu.org/licenses/>.
 */

class SrA_EventHandler : EventHandler
{

  override
  void worldLoaded(WorldEvent event)
  {
    mIsImpDied = false;
  }

  override
  void worldUnloaded(WorldEvent event)
  {
    if (isImpsPresent() && !mIsImpDied)
    {
      LMBH_Achiever.achieve("SrA_Friend");
    }
  }

  override
  void worldThingDied(WorldEvent event)
  {
    if (isImp(event.thing))
    {
      LMBH_Achiever.achieve("SrA_OneKill");
      LMBH_Achiever.achieve("SrA_TenKills");
      LMBH_Achiever.achieve("SrA_100Kills");
      LMBH_Achiever.achieve("SrA_666Kills");

      if (event.thing.health < -200)
      {
        LMBH_Achiever.achieve("SrA_Overkill");
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
      LMBH_Achiever.achieve("SrA_Telefrag");
    }
    else if (event.damagetype == "Melee")
    {
      LMBH_Achiever.achieve("SrA_Melee");
    }
  }

  private
  bool isImp(Actor a)
  {
    bool isReplacingImp = ("DoomImp" == Actor.getReplacee(a.getClass()));
    bool isBasedOnImp   = (a is "DoomImp");
    return (isReplacingImp || isBasedOnImp);
  }

  private
  bool isImpsPresent()
  {
    let i = ThinkerIterator.create();
    Actor a;
    while (a = Actor(i.next()))
    {
      if (isImp(a)) return true;
    }
    return false;
  }

  private bool mIsImpDied;

} // class SrA_EventHandler

class SrA_OneKill : LMBH_Achievement
{
  Default
  {
    LMBH_Achievement.name "$Achieve_imp_initiate";
    LMBH_Achievement.description "$Achieve_imp_initiate_desc";
    LMBH_Achievement.borderColor 0xDDDD22;
    LMBH_Achievement.boxColor    0xFFFFFF;
    LMBH_Achievement.lockedIcon "graphics/m8f/LMBH_imp_icon.png";
    LMBH_Achievement.unlockedIcon "graphics/m8f/LMBH_imp_icon.png";
  }
}

class SrA_TenKills : LMBH_Achievement
{
  Default
  {
    LMBH_Achievement.name "Imp Killer";
    LMBH_Achievement.description "Kill 10 imps";
    LMBH_Achievement.limit 10;
    LMBH_Achievement.borderColor 0xDD2222;
    LMBH_Achievement.boxColor    0xDDDD22;
    LMBH_Achievement.lockedIcon "graphics/m8f/LMBH_imp_icon.png";
    LMBH_Achievement.unlockedIcon "graphics/m8f/LMBH_imp_icon.png";
  }
}

class SrA_100Kills : LMBH_Achievement
{
  Default
  {
    LMBH_Achievement.name "Imp Exterminator";
    LMBH_Achievement.description "Kill 100 imps";
    LMBH_Achievement.limit 100;
    LMBH_Achievement.borderColor 0x990000;
    LMBH_Achievement.boxColor    0xDD2222;
    LMBH_Achievement.lockedIcon "graphics/m8f/LMBH_imp_icon.png";
    LMBH_Achievement.unlockedIcon "graphics/m8f/LMBH_imp_icon.png";
  }
}

class SrA_666Kills : LMBH_Achievement
{
  Default
  {
    LMBH_Achievement.name "Imp Slayer";
    LMBH_Achievement.description "Kill 666 imps";
    LMBH_Achievement.limit 666;
    LMBH_Achievement.borderColor 0x000000;
    LMBH_Achievement.boxColor    0x990000;
    LMBH_Achievement.lockedIcon "graphics/m8f/LMBH_imp_icon.png";
    LMBH_Achievement.unlockedIcon "graphics/m8f/LMBH_imp_icon.png";
  }
}

class SrA_Telefrag : LMBH_Achievement
{
  Default
  {
    LMBH_Achievement.name "Telehopper";
    LMBH_Achievement.description "Telefrag an imp";
    LMBH_Achievement.borderColor 0x509e43;
    LMBH_Achievement.boxColor    0xcaa53b;
    LMBH_Achievement.isHidden true;
    LMBH_Achievement.lockedIcon "graphics/m8f/LMBH_imp_icon.png";
    LMBH_Achievement.unlockedIcon "graphics/m8f/LMBH_imp_icon.png";
  }
}

// This achievement is kind of broken: notification doesn't have enough time
// to show properly before the level ends.
class SrA_Friend : LMBH_Achievement
{
  Default
  {
    LMBH_Achievement.name "Imp Friend";
    LMBH_Achievement.description "Don't kill any imp on the level";
    LMBH_Achievement.borderColor 0x000000;
    LMBH_Achievement.boxColor    0x00AA00;
    LMBH_Achievement.lockedIcon "graphics/m8f/LMBH_imp_icon.png";
    LMBH_Achievement.unlockedIcon "graphics/m8f/LMBH_imp_icon.png";
  }
}

class SrA_Overkill : LMBH_Achievement
{
  Default
  {
    LMBH_Achievement.name "Overkill";
    LMBH_Achievement.description "Kill an imp more than usual";
    LMBH_Achievement.lockedIcon "graphics/m8f/LMBH_imp_icon.png";
    LMBH_Achievement.unlockedIcon "graphics/m8f/LMBH_imp_icon.png";
  }
}

class SrA_Melee : LMBH_Achievement
{
  Default
  {
    LMBH_Achievement.name "Come closer";
    LMBH_Achievement.description "Hit imps 100 times with melee attack";
    LMBH_Achievement.limit 100;
    LMBH_Achievement.lockedIcon "graphics/m8f/LMBH_imp_icon.png";
    LMBH_Achievement.unlockedIcon "graphics/m8f/LMBH_imp_icon.png";
  }
}