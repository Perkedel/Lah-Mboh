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

// Subtitling
/*
Idk how to subtitle like did with Strife. This is way too complicated already! Very unintuitive to trigger even, I failed miserably.
*/

//#ifndef SUBTITLING
//#define SUBTITLING
//#endif

class LMBH_Subtitling : StaticEventHandler
{
    float subtitleTime;
    //const defaultSubtitleTime = 5.0;


    static void playSubtitle(string text, float forHowLong, string prefixName="")
    {
        if(forHowLong)
            Cvar.GetCvar("LMBH_Subtitling_Timer").setFloat(forHowLong * 35);
        else
            Cvar.GetCvar("LMBH_Subtitling_Timer").setFloat(5.0 * 35);

        if(prefixName)
            Cvar.GetCvar("LMBH_Subtitling_Say").setString(String.format("%s:\n%s",StringTable.localize(prefixName),StringTable.localize(text)));
        else
            Cvar.GetCvar("LMBH_Subtitling_Say").setString(text);
    }

    override void RenderOverlay(RenderEvent e)
    {
        // https://github.com/mmaulwurff/target-spy/blob/94c7ab63dcb34d117b6c0b773259ffa69fd0f4cb/zscript/ts_event_handler.zs#L799
        int winX, winY, winWidth, winHeight;
        [winX, winY, winWidth, winHeight] = Screen.GetViewWindow();
        double posX = 0.25 * winWidth; //320
        //double posX = 0 * 320; //320
   	    double posY = 0.75 * winHeight; //200
   	    //double posY = 0.75 * 200; //200
        double toScaleBy = Cvar.GetCvar("LMBH_Subtitling_Scale").getFloat();
        double scaleBecomes = 2;
        if (toScaleBy > 0)
            scaleBecomes = toScaleBy;
        else
            scaleBecomes = 2;
        // https://zdoom.org/wiki/Renderstyle waaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaat
        if(Cvar.GetCvar("LMBH_Subtitling_Timer").getFloat() > 0)
        {
            // show here now
            string localized = StringTable.localize(Cvar.GetCvar("LMBH_Subtitling_Say").getString());
            string saying = Cvar.GetCvar("LMBH_Subtitling_Say").getString();
            HUDFont anFont = HUDFont.create(Font.GetFont("UbuntuS"));
            ////Screen.DrawText(smallfont, Font.CR_UNTRANSLATED, posX, posY, localized, DTA_Clean, true);
            ////Screen.DrawText(Font.GetFont("UbuntuS"), Font.CR_UNTRANSLATED, posX, posY, localized, DTA_Clean, true);
            ////Screen.DrawText(Font.GetFont("UbuntuS"), Font.CR_UNTRANSLATED, posX, posY, saying, DTA_Clean, false, DTA_Localize, true, DTA_VirtualWidth, winWidth, DTA_VirtualHeight, winHeight);
            //BaseStatusBar.DrawString(anFont, Vector2(0,0.75), DI_SCREEN_CENTER_BOTTOM|DI_TEXT_ALIGN_CENTER);
            //Screen.DrawText(Font.GetFont("UbuntuS"), Font.CR_UNTRANSLATED, posX, posY, saying, DTA_Clean, true, DTA_Localize, true);
            Screen.DrawText(Font.GetFont("UbuntuS"), Font.CR_UNTRANSLATED, posX, posY, saying, DTA_Clean, false, DTA_Localize, true,DTA_ScaleX, scaleBecomes, DTA_ScaleY, scaleBecomes);
        }
    }

    override void WorldTick()
    {
        //if(subtitleTime > 0)
        if(Cvar.GetCvar("LMBH_Subtitling_Timer").getFloat() > 0)
        {
            float holdIn = Cvar.GetCvar("LMBH_Subtitling_Timer").getFloat();
            Cvar.GetCvar("LMBH_Subtitling_Timer").SetFloat(holdIn - 1);
        }
    }
}