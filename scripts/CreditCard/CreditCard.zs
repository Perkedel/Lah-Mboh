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

// Credit Card. Coin but it's your debt
// (JOELwindows7)

/*
Credit Card.

You can now ask an NPC to borrow you a money. But there's a caveat!
Each coin you borrow means 1 Debt Point. Be sure not to overflow.

at certain end of something you must repay this much Debt, or else you'll be punished.

Most Debtors would also even add Interest Rates. This means, you have to repay this much Debt + the Interest.

So you have:
- Class Debt. the coin you borrow in total.
- Total Interest. Each Level has different rate.

You can repay the debt back at any NPC of Debt.
*/