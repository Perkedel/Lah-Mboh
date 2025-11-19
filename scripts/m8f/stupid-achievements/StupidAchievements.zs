// Due to cease of activity on the Git Repo, we decided to yoink it for conveniences
// https://github.com/mmaulwurff/stupid-achievements/blob/master/zscript/StupidAchievements.zs
// Yoinked by JOELwindows7
// Namepace `sa_` 👉 `LMBH_`
// Namepace `SA_` 👉 `LMBH_Achieve_`

/* Copyright Alexander 'm8f' Kromm (mmaulwurff@gmail.com) 2021
 * Laskow 2021
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

/**
 * @file StupidAchievements.zs
 *
 * This file contains Stupid Achievements, achievement script for GZDoom.
 *
 * This file contains all the ZScript code needed for Stupid Achievements to work.
 */

/**************************************************************************************************\
|*                                                                                                *|
|* Public part. Two classes: LMBH_Achiever and LMBH_Achievement.                                      *|
|*                                                                                                *|
\**************************************************************************************************/

/**
 * Don't forget to add this event handler to the game via AddEventHandlers in MAPINFO lump.
 */
class LMBH_Achiever : EventHandler
{

  /**
   * This function calls an achievement.
   *
   * It handles showing a notification and storing achievement progress.
   *
   * @param achievementClass class of something that is derived from LMBH_Achievement.
   *
   * Example:
   * LMBH_Achiever.achieve("MyFirstAchievement");
   */
  static
  void achieve(String achievementClass)
  {
    Class<LMBH_Achievement> checkFirst = achievementClass;
    if(!checkFirst)
    {
      Console.printf(StringTable.Localize("$LMBH_Achieve_NOTFOUND"),achievementClass);
      return;
    }
    achievePrivate(achievementClass);
  }

} // class LMBH_Achiever

/**
 * This class holds properties for achievements.
 *
 * To create your own achievements, subclass this class and override properties.
 *
 * This class is derived from Actor just to have properties. Do not spawn it or
 * it descendants on the level.
 */
class LMBH_Achievement : Actor abstract
{

  Default
  {
    // General title for achievements.
    LMBH_Achievement.title "$LMBH_Achieve_TITLE";

    // Specific name for this achievement.
    LMBH_Achievement.name "$LMBH_Achieve_NAME";

    // Specific description for this achievement.
    LMBH_Achievement.description "$LMBH_Achieve_DESCRIPTION";

    // Must be > 0. When limit is > 1, unlocking this achievement requires progress.
    LMBH_Achievement.limit 1;

    // Text that will be shown on achievement progress.
    LMBH_Achievement.progressTitle "$LMBH_Achieve_PROGRESS";

    // True if a notification is shown each time this achievement progress advances.
    LMBH_Achievement.isProgressVisible false;

    // Hidden achievements don't show up in Locked achievement list, and are only
    // visible when are achieved.
    LMBH_Achievement.isHidden false;

    // Overall duration of achievement notification, including animation.
    // In tics, 35 tics is a second.
    LMBH_Achievement.lifetime 35 * 3;

    // Duration of animation of achievement notification.
    // Notification can be not animated, see LMBH_animation_type Cvar.
    // If the notification is animated, there are two animations: appearing and disappearing.
    // In tics, 35 tics is a second.
    LMBH_Achievement.animationTime 35 / 4;

    // Background alpha map texture. Default: gradient to background, top to bottom.
    // Must exist.
    // Will be mercilessly scaled to box width and height.
    LMBH_Achievement.texture "graphics/m8f/LMBH_imp_gradb.png";

    LMBH_Achievement.fontName "NewSmallFont";

    // Border and background color. RGB: 0xRRGGBB.
    LMBH_Achievement.borderColor 0x222222;

    // Foreground color. RGB: 0xRRGGBB.
    LMBH_Achievement.boxColor 0x2222AA;

    // Achievement icon (optional).
    LMBH_Achievement.lockedIcon "";
    LMBH_Achievement.unlockedIcon "";

    // Text color. See Font struct for available colors.
    LMBH_Achievement.textColor Font.CR_White;

    // px, space between text and border.
    LMBH_Achievement.margin 10;

    // px, border width.
    LMBH_Achievement.border 1;
  }

} // class LMBH_Achievement

/**************************************************************************************************\
|*                                                                                                *|
|* Private part. Read only if you are interested in implementation details.                       *|
|*                                                                                                *|
\**************************************************************************************************/

extend class LMBH_Achiever
{

  private static
  void achievePrivate(Class<LMBH_Achievement> achievementClass)
  {
    // if(!achievementClass)
    // {
    //   Console.printf(StringTable.Localize("$LMBH_Achieve_NOTFOUND"),achievementClass);
    // }
    let achievement = getDefaultByType(achievementClass);
    int count, state;
    [count, state] = updateAchievementState(achievement);

    let me = LMBH_Achiever(EventHandler.find("LMBH_Achiever"));

    if (!me.mNotificationEnabledCvar.getBool())
    {
      return;
    }

    switch (state)
    {
    case STATE_UNLOCKED: addTask(me, achievement, false, 0); break;
    case STATE_PROGRESS:
      if (achievement.isProgressVisible)
      {
        addTask(me, achievement, true,  count);
      }
      else
      {
        return;
      }
      break;
    case STATE_HIDE: return;
    }

    if (me.mTasks.size() == 1)
    {
      me.mTasks[0].start();
    }
  }

  private static
  void addTask( LMBH_Achiever me
              , readonly<LMBH_Achievement> achievement
              , bool isProgress
              , int  count
              )
  {
    int animationType = me.mAnimationTypeCvar.getInt();
    LMBH_Task newTask;
    switch (animationType)
    {
    case 0:  newTask = new("LMBH_SlideVerticallyTask"  ); break;
    case 1:  newTask = new("LMBH_SlideHorizontallyTask"); break;
    case 2:  newTask = new("LMBH_FadeInOutTask"        ); break;
    default: newTask = new("LMBH_NoAnimationTask"      ); break;
    }

    newTask.init(achievement, isProgress, count);

    me.mTasks.push(newTask);
  }

  override
  void onRegister()
  {
    mAnimationTypeCvar       = LMBH_Cvar.of("LMBH_animation_type");
    mNotificationEnabledCvar = LMBH_Cvar.of("LMBH_achieveNotification_enabled");
  }

  override
  void worldTick()
  {
    let task = getCurrentTask();
    int time = level.time;

    if (task && (task.isLoadedFromSave() || task.isFinished(time)))
    {
      mTasks.delete(0);

      let nextTask = getCurrentTask();
      if (nextTask)
      {
        nextTask.start();
      }
    }
  }

  override
  void renderOverlay(RenderEvent event)
  {
    let task = getCurrentTask();
    int time = level.time;

    if (task && !task.isLoadedFromSave() && !task.isFinished(time))
    {
      task.draw(time, event.fracTic);
    }
  }

  override
  void networkProcess(ConsoleEvent event)
  {
    if (event.name == "LMBH:testAchieve")
    {
      LMBH_Achiever.achieve("LMBH_TestAchievement");
    }
  }

  private
  LMBH_Task getCurrentTask() const
  {
    return(mTasks.size() == 0)
      ? NULL
      : mTasks[0];
  }

  enum AchievementStates
  {
    STATE_UNLOCKED, // Achievement is unlocked and must be shown to player.
    STATE_PROGRESS, // Achievement progressed, progress must be show to player.
    STATE_HIDE,     // Achievement was unlocked before, don't show it again.
  }

  /**
   * returns the updated achievement count and state.
   */
  private static
  int, int updateAchievementState(readonly<LMBH_Achievement> achievement)
  {
    String className  = achievement.getClassName();
    Cvar   c          = Cvar.getCvar("LMBH_achievements");
    String serialized = c.getString();
    let    dict       = Dictionary.fromString(serialized);
    String status     = dict.at(className);
    int    count      = status.toInt();
    int    limit      = achievement.limit;

    if (count >= limit)
    {
      return count, STATE_HIDE;
    }

    ++count;

    status = String.format("%d", count);
    dict.Insert(className, status);
    serialized = dict.toString();
    c.setString(serialized);

    if (count == limit)
    {
      return count, STATE_UNLOCKED;
    }
    else
    {
      return count, STATE_PROGRESS;
    }
  }

  private Array<LMBH_Task> mTasks;
  private LMBH_Cvar mAnimationTypeCvar;
  private LMBH_Cvar mNotificationEnabledCvar;

} // class LMBH_Achiever

extend class LMBH_Achievement
{

  String title;
  String name;
  String description;

  int    limit;
  String progressTitle;
  bool   isProgressVisible;

  int lifetime;
  int animationTime;

  String fontName;
  String texture;
  int    borderColor;
  int    boxColor;
  int    textColor;

  int margin;
  int border;

  bool isHidden;

  String lockedIcon;
  String unlockedIcon;

  property title         : title;
  property name          : name;
  property description   : description;
  property limit         : limit;
  property progressTitle : progressTitle;
  property isProgressVisible : isProgressVisible;
  property lifetime      : lifetime;
  property animationTime : animationTime;
  property fontName      : fontName;
  property texture       : texture;
  property borderColor   : borderColor;
  property boxColor      : boxColor;
  property textColor     : textColor;
  property margin        : margin;
  property border        : border;
  property isHidden      : isHidden;
  property lockedIcon    : lockedIcon;
  property unlockedIcon  : unlockedIcon;

} // class LMBH_Achievement

class LMBH_TestAchievement : LMBH_Achievement
{
  Default
  {
    LMBH_Achievement.name "Test name";
    LMBH_Achievement.description "Test description";
    LMBH_Achievement.limit 999999;
    LMBH_Achievement.isProgressVisible true;
    LMBH_Achievement.lockedIcon "LMBH_imp_icon";
    LMBH_Achievement.unlockedIcon "LMBH_imp_icon";
  }
} // class LMBH_TestAchievement

class LMBH_ // namespace
{

  enum Status
  {
    LOCKED,
    UNLOCKED
  }

  static
  String makeFullText(readonly<LMBH_Achievement> achievement, bool isProgress, int count)
  {
    return isProgress
      ? String.format( "%s%d/%d\n%s"
                     , StringTable.localize(achievement.progressTitle)
                     , count
                     , achievement.limit
                     , StringTable.localize(achievement.name)
                     )
      : String.format( "%s\n%s"
                     , StringTable.localize(achievement.title)
                     , StringTable.localize(achievement.name)
                     );
  }

  static
  TextureID switchIcon(readonly<LMBH_Achievement> achievement, bool isLocked)
  {
    return isLocked
      ? TexMan.checkForTexture(achievement.lockedIcon, TexMan.Type_Any)
      : TexMan.checkForTexture(achievement.unlockedIcon, TexMan.Type_Any);
  }

  static
  void drawAchievement( int textX, int textY
                      , int boxX, int boxY
                      , int borderX, int borderY
                      , int borderWidth, int borderHeight
                      , int boxWidth, int boxHeight
                      , int iconX, int iconY
                      , int iconWidth, int iconHeight
                      , double alpha
                      , TextureID texture
                      , TextureID icon
                      , int borderColor
                      , int boxColor
                      , Font fnt
                      , int textColor
                      , String text
                      )
  {
    // border
    Screen.DrawTexture( texture // not needed here, really, but something has to be here.
                      , NO_ANIMATION
                      , borderX
                      , borderY
                      , DTA_DestWidth  , borderWidth
                      , DTA_DestHeight , borderHeight
                      , DTA_FillColor  , borderColor
                      , DTA_Alpha      , alpha
                      );

    // box
    Screen.DrawTexture( texture
                      , NO_ANIMATION
                      , boxX
                      , boxY
                      , DTA_DestWidth    , boxWidth
                      , DTA_DestHeight   , boxHeight
                      , DTA_FillColor    , boxColor
                      , DTA_AlphaChannel , true
                      , DTA_Alpha        , alpha
                      );

    // text
    Screen.DrawText( fnt
                   , textColor
                   , textX
                   , textY
                   , text
                   , DTA_Alpha         , alpha
                   , DTA_CleanNoMove_1 , true
                   );

    // icon
    Screen.DrawTexture( icon
                   , NO_ANIMATION
                   , iconX
                   , iconY
                   , DTA_DestWidth    , iconWidth
                   , DTA_DestHeight   , iconHeight
                   , DTA_Alpha        , alpha
                   );
  }

  static
  int countLines(String s)
  {
    int nBytes = s.length();
    int nLines = 1;
    for (int i = 0; i < nBytes; ++i)
    {
      nLines += (s.byteAt(i) == 10);
    }
    return nLines;
  }

  const NO_ANIMATION = 0; // == false

} // LMBH_ namespace

class LMBH_Task abstract
{

  virtual
  void draw(int levelTime, double fracTic) {}

  bool isFinished(int levelTime) const
  {
    return levelTime > mBirthTime + mAchievement.lifetime;
  }

  bool isLoadedFromSave() const
  {
    return mAchievement == NULL;
  }

  void start()
  {
    mBirthTime = level.time;
  }

  void init(readonly<LMBH_Achievement> achievement, bool isProgress, int count)
  {
    mAchievement = achievement;

    mText    = LMBH_.makeFullText(achievement, isProgress, count);
    mNLines  = LMBH_.countLines(mText);
    mFont    = achievement.fontName;
    mTexture = TexMan.checkForTexture(achievement.texture, TexMan.Type_Any);
    mIcon    = LMBH_.switchIcon(achievement, isProgress);

    mHorizontalPositionCvar = LMBH_Cvar.of("LMBH_horizontal_position");
    mVerticalPositionCvar   = LMBH_Cvar.of("LMBH_vertical_position");
  }

  protected readonly<LMBH_Achievement> mAchievement;

  protected String    mText;
  protected int       mNLines;
  protected String    mFont;
  protected TextureID mTexture;
  protected TextureID mIcon;

  protected int mBirthTime;

  protected LMBH_Cvar mHorizontalPositionCvar;
  protected LMBH_Cvar mVerticalPositionCvar;

} // class LMBH_Task abstract

class LMBH_NoAnimationTask : LMBH_Task
{

  override
  void draw(int levelTime, double fracTic)
  {
    Font aFont = Font.GetFont(mFont);
    int textWidth    = CleanXFac_1 * aFont.stringWidth(mText);
    int textHeight   = CleanYFac_1 * aFont.getHeight() * mNLines;

    int boxWidth     = mAchievement.margin * 2 + textWidth;
    int boxHeight    = mAchievement.margin * 2 + textHeight;

    int borderWidth  = mAchievement.border * 2 + boxWidth;
    int borderHeight = mAchievement.border * 2 + boxHeight;

    int x, y;
    [x, y] = getXY(borderWidth, borderHeight, levelTime, fracTic);

    int textX   = x + mAchievement.margin + mAchievement.border;
    int textY   = y + mAchievement.margin + mAchievement.border;

    int boxX    = x + mAchievement.border;
    int boxY    = y + mAchievement.border;
    int borderX = x;
    int borderY = y;

    int iconWidth  = borderHeight;
    int iconHeight = iconWidth;
    int iconX      =  (mHorizontalPositionCvar.getInt() == 0)
                   ? boxWidth
                   : boxX - iconWidth;
    int iconY      = borderY;

    double alpha = getAlpha(levelTime, fracTic);

    LMBH_.drawAchievement( textX, textY
                       , boxX, boxY
                       , borderX, borderY
                       , borderWidth, borderHeight
                       , boxWidth, boxHeight
                       , iconX, iconY
                       , iconWidth, iconHeight
                       , alpha
                       , mTexture
                       , mIcon
                       , mAchievement.borderColor
                       , mAchievement.boxColor
                       , aFont
                       , mAchievement.textColor
                       , mText
                       );
  }
  enum HorizontalPosition
  {
    HPOS_LEFT,
    HPOS_RIGHT,
  }

  enum VerticalPosition
  {
    VPOS_TOP,
    VPOS_BOTTOM,
  }

  protected virtual
  double getAlpha(int levelTime, double fracTic)
  {
    return 1;
  }

  protected virtual
  int, int getXY(int width, int height, int levelTime, double fracTic)
  {
    int horizontalPosition = mHorizontalPositionCvar.getInt();
    int verticalPosition   = mVerticalPositionCvar.getInt();
    int x = 0;
    int y = 0;

    switch (horizontalPosition)
    {
    case HPOS_LEFT:  x = 0; break;
    case HPOS_RIGHT: x = Screen.getWidth() - width; break;
    }

    switch (verticalPosition)
    {
    case VPOS_TOP:    y = 0; break;
    case VPOS_BOTTOM: y = Screen.getHeight() - height; break;
    }

    return x, y;
  }

} // class LMBH_NoAnimationTask

class LMBH_AnimationTask : LMBH_NoAnimationTask abstract
{
  protected
  int getStartX(int width)
  {
    int horizontalPosition = mHorizontalPositionCvar.getInt();
    switch (horizontalPosition)
    {
    case HPOS_LEFT:  return -width;
    case HPOS_RIGHT: return Screen.getWidth();

    default: Console.printf("unknown horizontal position"); return 0;
    }
  }

  protected
  int getStartY(int height)
  {
    int verticalPosition = mVerticalPositionCvar.getInt();
    switch (verticalPosition)
    {
    case VPOS_TOP:  return -height;
    case VPOS_BOTTOM: return Screen.getHeight();

    default: Console.printf("unknown vertical position"); return 0;
    }
  }

  protected
  double getFractionIn(double time)
  {
    return clamp(time / mAchievement.animationTime, 0, 1);
  }

  protected
  double getFractionOut(double time)
  {
    int lifetime      = mAchievement.lifetime;
    int animationTime = mAchievement.animationTime;
    return clamp((time - (lifetime - animationTime)) / animationTime, 0, 1);
  }

  protected static
  int getValueBetween(int start, int target, double fraction)
  {
    return int(round(start * (1 - fraction) + target * fraction));
  }

} // class LMBH_AnimationTask

class LMBH_SlideHorizontallyTask : LMBH_AnimationTask
{

  override
  int, int getXY(int width, int height, int levelTime, double fracTic)
  {
    int time = levelTime - mBirthTime;

    int targetX, targetY;
    [targetX, targetY] = super.getXY(width, height, levelTime, fracTic);

    if (time < mAchievement.animationTime)
    {
      // return slide in xy
      int    startX   = getStartX(width);
      double fraction = getFractionIn(time + fracTic);
      int    currentX = getValueBetween(startX, targetX, fraction);

      return currentX, targetY;
    }
    else if (time > mAchievement.lifetime - mAchievement.animationTime)
    {
      // return slide out xy
      int    startX   = getStartX(width);
      double fraction = getFractionOut(time + fracTic);
      int    currentX = getValueBetween(targetX, startX, fraction);

      return currentX, targetY;
    }
    else
    {
      // return stay in place xy:
      return targetX, targetY;
    }
  }

} // class LMBH_SlideHorizontallyTask

class LMBH_SlideVerticallyTask : LMBH_AnimationTask
{

  override
  int, int getXY(int width, int height, int levelTime, double fracTic)
  {
    int time = levelTime - mBirthTime;

    int targetX, targetY;
    [targetX, targetY] = super.getXY(width, height, levelTime, fracTic);

    if (time < mAchievement.animationTime)
    {
      // return slide in xy
      int    startY   = getStartY(height);
      double fraction = getFractionIn(time + fracTic);
      int    currentY = getValueBetween(startY, targetY, fraction);

      return targetX, currentY;
    }
    else if (time > mAchievement.lifetime - mAchievement.animationTime)
    {
      // return slide out xy
      int    startY   = getStartY(height);
      double fraction = getFractionOut(time + fracTic);
      int    currentY = getValueBetween(targetY, startY, fraction);

      return targetX, currentY;
    }
    else
    {
      // return stay in place xy:
      return targetX, targetY;
    }
  }

} // class LMBH_SlideVerticallyTask

class LMBH_FadeInOutTask : LMBH_AnimationTask
{

  override
  double getAlpha(int levelTime, double fracTic)
  {
    int time = levelTime - mBirthTime;

    if (time < mAchievement.animationTime)
    {
      return getFractionIn(time + fracTic);
    }
    else if (time > mAchievement.lifetime - mAchievement.animationTime)
    {
      return 1 - getFractionOut(time + fracTic);
    }
    else
    {
      return super.getAlpha(levelTime, fracTic);
    }
  }

} // class LMBH_FadeInOutTask

/**
 * This class provides access to a user or server Cvar.
 *
 * Accessing Cvars through this class is faster because calling Cvar.GetCvar()
 * is costly. This class caches the result of Cvar.GetCvar() and handles
 * loading a savegame.
 */
class LMBH_Cvar
{

  static
  LMBH_Cvar of(String name)
  {
    let result = new("LMBH_Cvar");
    result._name = name;
    return result;
  }

  bool   isDefined() { load(); return (_cvar != NULL);   }

  String getString() { load(); return _cvar.GetString(); }
  bool   getBool()   { load(); return _cvar.GetInt();    }
  int    getInt()    { load(); return _cvar.GetInt();    }
  double getFloat()  { load(); return _cvar.GetFloat();  }

// private: ////////////////////////////////////////////////////////////////////

  private
  void load()
  {
    if (_cvar == NULL)
    {
      _cvar = Cvar.getCvar(_name, players[consolePlayer]);

      if (_cvar == NULL)
      {
        Console.printf("Cvar %s not found.", _name);
      }
    }
  }

  private String          _name;
  private transient Cvar  _cvar;

} // class tt_Cvar

class LMBH_AchievementList : OptionMenu // LMBH_TF_TooltipOptionMenu
{

  protected
  void fill(Menu parent, OptionMenuDescriptor desc, int status)
  {
    Super.init(parent, desc);

    // this function is called each time menu is opened, so remove everything.
    mDesc.mItems.clear();

    String serialized = Cvar.getCvar("LMBH_achievements").getString();
    let    dict       = Dictionary.fromString(serialized);

    uint nClasses = AllActorClasses.size();
    for (uint i = 0; i < nClasses; ++i)
    {
      let c = AllActorClasses[i];
      if (c is "LMBH_Achievement")
      {
        String name = c.getClassName();

        if (name == "LMBH_Achievement" || name == "LMBH_TestAchievement")
        {
          continue;
        }

        let achievement = LMBH_Achievement(getDefaultByType(c));
        int count       = dict.at(name).toInt();
        let item        = new("LMBH_AchievementItem").init(achievement, count);

        if (item.getStatus() != status)
        {
          continue;
        }

        if (item.getStatus() == LMBH_.LOCKED && achievement.isHidden)
        {
          continue;
        }

        int nLines = item.getNLines();

        add(item);
        for (int i = 0; i < nLines; ++i)
        {
          addLine();
        }
      }
    }

    mDesc.mScrollPos    = 0;
    mDesc.mSelectedItem = FirstSelectable();
    mDesc.CalcIndent();
  }

  private
  void add(OptionMenuItem item)
  {
    mDesc.mItems.push(item);
  }

  private
  void addLine()
  {
    add(new("OptionMenuItemStaticText").init(""));
  }

} // class LMBH_AchievementList

class LMBH_UnlockedAchievements : LMBH_AchievementList
{

  override
  void init(Menu parent, OptionMenuDescriptor desc)
  {
    fill(parent, desc, LMBH_.UNLOCKED);
  }

} // class LMBH_UnlockedAchievements

class LMBH_LockedAchievements : LMBH_AchievementList
{

  override
  void init(Menu parent, OptionMenuDescriptor desc)
  {
    fill(parent, desc, LMBH_.LOCKED);
  }

} // class LMBH_AchievementList

class LMBH_AchievementItem : OptionMenuItemCommand
{

  LMBH_AchievementItem init(readonly<LMBH_Achievement> achievement, int count)
  {
    mAchievement = achievement;
    mStatus      = (count < achievement.limit) ? LMBH_.LOCKED : LMBH_.UNLOCKED;

    String progress = (mStatus == LMBH_.LOCKED && count > 0)
      ? String.format("\nProgress: %d/%d", count, achievement.limit)
      : "\n";
    mText = String.format( "%s\n%s%s"
                         , StringTable.localize(achievement.name)
                         , StringTable.localize(achievement.description)
                         , progress
                         );
    mNLines  = LMBH_.countLines(mText);
    mFont    = Font.GetFont(achievement.fontName);
    mTexture = TexMan.checkForTexture(achievement.texture, TexMan.Type_Any);
    mIcon    = LMBH_.switchIcon(achievement, mStatus == LMBH_.LOCKED); // [las]

    Super.init("", "", centered: true);
    return self;
  }

  int getNLines()
  {
    return mNLines;
  }

  int getStatus()
  {
    return mStatus;
  }

  override
  int draw(OptionMenuDescriptor desc, int textY, int x, bool selected)
  {
    int menuOffset = 16 * CleanXfac_1;

    int textWidth  = int(round(Screen.getWidth() * 0.6));
    int textHeight = CleanYFac_1 * mFont.getHeight() * mNLines;

    int textX = (Screen.getWidth() - textWidth) / 2;

    int horizontalMargin = mFont.getHeight() / 4;

    int boxWidth  = mAchievement.margin * 2 + textWidth + 2 * menuOffset;
    int boxHeight = horizontalMargin    * 2 + textHeight;

    int borderWidth  = mAchievement.border * 2 + boxWidth;
    int borderHeight = mAchievement.border * 2 + boxHeight;

    int boxX    = textX - mAchievement.margin - menuOffset;
    int boxY    = textY - horizontalMargin;

    int borderX = boxX - mAchievement.border;
    int borderY = boxY - mAchievement.border;

    int iconWidth  = borderHeight;
    int iconHeight = iconWidth;
    int iconX =  boxX - int(iconWidth * 1.1);
    int iconY =  textY - mAchievement.margin / 2;

    LMBH_.drawAchievement( textX, textY
                       , boxX, boxY
                       , borderX, borderY
                       , borderWidth, borderHeight
                       , boxWidth, boxHeight
                       , iconX, iconY
                       , iconWidth, iconHeight
                       , OPAQUE
                       , mTexture
                       , mIcon
                       , mAchievement.borderColor
                       , mAchievement.boxColor
                       , mFont
                       , mAchievement.textColor
                       , mText
                       );

    return textX - menuOffset;
  }

  const OPAQUE = 1.0;

  private readonly<LMBH_Achievement> mAchievement;
  private String mText;
  private Font   mFont;
  private int    mNLines;
  private TextureID mTexture;
  private TextureID mIcon;
  private int    mStatus;

} // class LMBH_AchievementItem