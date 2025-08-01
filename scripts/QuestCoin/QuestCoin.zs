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

// Quest Coin
// (JOELwindows7)

/*
Abstract class of the same Strife Coin class, but it's not at all inherited from it.

Copy the https://zdoom.org/wiki/Classes:Coin and then rename it

NO!! I want the ZScript version!! https://github.com/ZDoom/gzdoom/blob/master/wadsrc/static/zscript/actors/strife/coin.zs

How do I unmerge it? maybe scrapp it off & instead start from scratch?
*/

class LMBH_QuestCoin : Inventory abstract
{
	Default
	{
		+DROPPED
		+NOTDMATCH
		+FLOORCLIP
		Inventory.MaxAmount 0x7fffffff;
		+INVENTORY.INVBAR
		Tag "$TAG_COIN";
		Inventory.Icon "I_CHCO";
		Inventory.PickupMessage "$TXT_COIN";
	}
	States
	{
	Spawn:
		CHCO A -1;
		Stop;
	}
	
	// Coin ---------------------------------------------------------------------

	override String PickupMessage ()
	{
		if (Amount == 1)
		{
			return Super.PickupMessage();
		}
		else
		{
			String msg = StringTable.Localize("$TXT_XGOLD");
			msg.Replace("%d", "" .. Amount);
			return msg;
		}
	}

	override bool HandlePickup (Inventory item)
	{
		if (item is "LMBH_QuestCoin")
		{
			if (Amount < MaxAmount)
			{
				if (MaxAmount - Amount < item.Amount)
				{
					Amount = MaxAmount;
				}
				else
				{
					Amount += item.Amount;
				}
				item.bPickupGood = true;
			}
			return true;
		}
		return false;
	}

	override Inventory CreateCopy (Actor other)
	{
		if (GetClass() == "LMBH_QuestCoin")
		{
			return Super.CreateCopy (other);
		}
		Inventory copy = Inventory(Spawn("LMBH_QuestCoin"));
		copy.Amount = Amount;
		copy.BecomeItem ();
		GoAwayAndDie ();
		return copy;
	}

	//===========================================================================
	//
	// ACoin :: CreateTossable
	//
	// Gold drops in increments of 50 if you have that much, less if you don't.
	//
	//===========================================================================

	override Inventory CreateTossable (int amt)
	{
		LMBH_QuestCoin tossed;

		if (bUndroppable || Owner == NULL || Amount <= 0)
		{
			return NULL;
		}
		if (amt == -1) amt = Amount >= 50? 50 : Amount >= 25? 25 : Amount >= 10? 10 : 1;
		else if (amt > Amount) amt = Amount;
		if (amt > 25)
		{
			Amount -= amt;
			tossed = LMBH_QuestCoin(Spawn("LMBH_QuestGold50"));
			tossed.Amount = amt;
		}
		else if (amt > 10)
		{
			Amount -= 25;
			tossed = LMBH_QuestCoin(Spawn("LMBH_QuestGold25"));
		}
		else if (amt > 1)
		{
			Amount -= 10;
			tossed = LMBH_QuestCoin(Spawn("LMBH_QuestGold10"));
		}
		else if (Amount > 1 || bKeepDepleted)
		{
			Amount -= 1;
			tossed = LMBH_QuestCoin(Spawn("LMBH_QuestCoin"));
		}
		else // Amount == 1 && !(ItemFlags & IF_KEEPDEPLETED)
		{
			BecomePickup ();
			tossed = self;
		}
		tossed.bSpecial = false;
		tossed.bSolid = false;
		tossed.DropTime = 30;
		if (tossed != self && Amount <= 0)
		{
			Destroy ();
		}
		return tossed;
	}
	
}

// 10 Gold ------------------------------------------------------------------

class LMBH_QuestGold10 : LMBH_QuestCoin abstract
{
	Default
	{
		Inventory.Amount 10;
		Tag "$TAG_10GOLD";
		Inventory.PickupMessage "$TXT_10GOLD";
	}
	States
	{
	Spawn:
		CRED A -1;
		Stop;
	}
}

// 25 Gold ------------------------------------------------------------------

class LMBH_QuestGold25 : LMBH_QuestCoin abstract
{
	Default
	{
		Inventory.Amount 25;
		Tag "$TAG_25GOLD";
		Inventory.PickupMessage "$TXT_25GOLD";
	}
	States
	{
	Spawn:
		SACK A -1;
		Stop;
	}
}

// 50 Gold ------------------------------------------------------------------

class LMBH_QuestGold50 : LMBH_QuestCoin abstract
{
	Default
	{
		Inventory.Amount 50;
		Tag "$TAG_50GOLD";
		Inventory.PickupMessage "$TXT_50GOLD";
	}
	States
	{
	Spawn:
		CHST A -1;
		Stop;
	}
}

// 300 Gold ------------------------------------------------------------------

class LMBH_QuestGold300 : LMBH_QuestCoin abstract
{
	Default
	{
		Inventory.Amount 300;
		Tag "$TAG_300GOLD";
		Inventory.PickupMessage "$TXT_300GOLD";
		Inventory.GiveQuest 3;
		+INVENTORY.ALWAYSPICKUP
	}
	States
	{
	Spawn:
		TOKN A -1;
		Stop;
	}
}