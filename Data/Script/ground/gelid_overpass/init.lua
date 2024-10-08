
--[[
    init.lua
    Created: 05/22/2024 12:12:39
    Description: Autogenerated script file for the map gelid_overpass.
]]--
-- Commonly included lua functions and data
require 'common'
require 'CommonFunctions'
require 'ground.gelid_overpass.gelid_overpass_ch2'
-- Package name
local gelid_overpass = {}

-- Local, localized strings table
-- Use this to display the named strings you added in the strings files for the map!
-- Ex:
--      local localizedstring = MapStrings['SomeStringName']
local MapStrings = {}

-------------------------------
-- Map Callbacks
-------------------------------
---gelid_overpass.Init(map)
--Engine callback function
function gelid_overpass.Init(map)

  --This will fill the localized strings table automatically based on the locale the game is 
  -- currently in. You can use the MapStrings table after this line!
  MapStrings = COMMON.AutoLoadLocalizedStrings()
  COMMON.RespawnAllies()
  GROUND:Hide('Explorer1')
  GROUND:Hide('Explorer2')
  GROUND:Hide('yamask')
 

end

---gelid_overpass.Enter(map)
--Engine callback function
function gelid_overpass.Enter(map)
 
  if not SV.gelid_woods.boss_intro and not SV.progression.first_day_done and not SV.gelid_woods.beat_boss then --first time
    UI:WaitShowTitle(GAME:GetCurrentGround().Name:ToLocal(), 50)
    GAME:WaitFrames(50)
    UI:WaitHideTitle(50)
    GAME:WaitFrames(60)
    GAME:CutsceneMode(true)
    SOUND:PlayBGM("In the Depths of the Pit.ogg", true) 
    gelid_overpass_ch2.firstIntro()
  elseif SV.gelid_woods.boss_intro and not SV.gelid_woods.beat_boss and not SV.progression.first_day_done then --every time you enter after the first cutscene, this loops
    UI:WaitShowTitle(GAME:GetCurrentGround().Name:ToLocal(), 50)
    GAME:WaitFrames(50)
    UI:WaitHideTitle(50)
    GAME:WaitFrames(60)
    GAME:CutsceneMode(true)
    SOUND:PlayBGM("In the Depths of the Pit.ogg", true) 
    gelid_overpass_ch2.repeatIntro()
  elseif SV.gelid_woods.boss_intro and SV.gelid_woods.beat_boss and not SV.progression.first_day_done then --The winning cutscene
    gelid_overpass_ch2.youWin()
  elseif SV.gelid_woods.boss_intro and SV.gelid_woods.beat_boss and SV.progression.first_day_done then --regular "go back"
    UI:WaitShowTitle(GAME:GetCurrentGround().Name:ToLocal(), 50)
    GAME:WaitFrames(50)
    UI:WaitHideTitle(50)
    GAME:WaitFrames(60)
    GAME:CutsceneMode(true)
    SOUND:PlayBGM("In the Depths of the Pit.ogg", true) 
    GAME:FadeIn(20)
  end



end

---gelid_overpass.Exit(map)
--Engine callback function
function gelid_overpass.Exit(map)


end

---gelid_overpass.Update(map)
--Engine callback function
function gelid_overpass.Update(map)


end

---gelid_overpass.GameSave(map)
--Engine callback function
function gelid_overpass.GameSave(map)


end

---gelid_overpass.GameLoad(map)
--Engine callback function
function gelid_overpass.GameLoad(map)

  GAME:FadeIn(20)

end


-------------------------------
-- Entities Callbacks
-------------------------------

return gelid_overpass

