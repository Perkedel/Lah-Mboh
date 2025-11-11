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

// Subtitler
/*
Idk how to subtitle like did with Strife. This is way too complicated already! Very unintuitive to trigger even, I failed miserably.
*/

class LMBH_Subtitler : StaticEventHandler
{
    float subtitleTime;
    //const defaultSubtitleTime = 5.0;


    static void playSubtitle(string text, float forHowLong, string prefixName="")
    {
        if(forHowLong)
            Cvar.GetCvar("LMBH_Subtitler_Timer").setFloat(forHowLong * 35);
        else
            Cvar.GetCvar("LMBH_Subtitler_Timer").setFloat(5.0 * 35);

        if(prefixName)
            Cvar.GetCvar("LMBH_Subtitler_Say").setString(String.format("%s:\n%s",StringTable.localize(prefixName),StringTable.localize(text)));
        else
            Cvar.GetCvar("LMBH_Subtitler_Say").setString(text);
    }

    override void RenderOverlay(RenderEvent e)
    {
        double posX = 0 * 320;
   	    double posY = 0.75 * 200;
        // https://zdoom.org/wiki/Renderstyle waaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaat
        if(Cvar.GetCvar("LMBH_Subtitler_Timer").getFloat() > 0)
        {
            // show here now
            string localized = StringTable.localize(Cvar.GetCvar("LMBH_Subtitler_Say").getString());
            Screen.DrawText(smallfont, Font.CR_UNTRANSLATED, posX, posY, localized, DTA_Clean, true);
        }
    }

    override void WorldTick()
    {
        //if(subtitleTime > 0)
        if(Cvar.GetCvar("LMBH_Subtitler_Timer").getFloat() > 0)
        {
            float holdIn = Cvar.GetCvar("LMBH_Subtitler_Timer").getFloat();
            Cvar.GetCvar("LMBH_Subtitler_Timer").SetFloat(holdIn - 1);
        }
    }
}