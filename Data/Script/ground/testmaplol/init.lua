--[[
    init.lua
    Created: 05/01/2024 21:53:46
    Description: Autogenerated script file for the map testmaplol.
]]--
-- Commonly included lua functions and data
require 'common'

-- Package name
local testmaplol = {}

-- Local, localized strings table
-- Use this to display the named strings you added in the strings files for the map!
-- Ex:
--      local localizedstring = MapStrings['SomeStringName']
local MapStrings = {}

-------------------------------
-- Map Callbacks
-------------------------------
---testmaplol.Init(map)
--Engine callback function
function testmaplol.Init(map)

  --This will fill the localized strings table automatically based on the locale the game is 
  -- currently in. You can use the MapStrings table after this line!
  MapStrings = COMMON.AutoLoadLocalizedStrings()

end

---testmaplol.Enter(map)
--Engine callback function
function testmaplol.Enter(map)

  GAME:FadeIn(20)
  UI:WaitShowDialogue(STRINGS:Format("\\u266A"))
end

---testmaplol.Exit(map)
--Engine callback function
function testmaplol.Exit(map)


end

---testmaplol.Update(map)
--Engine callback function
function testmaplol.Update(map)


end

---testmaplol.GameSave(map)
--Engine callback function
function testmaplol.GameSave(map)


end

---testmaplol.GameLoad(map)
--Engine callback function
function testmaplol.GameLoad(map)

  GAME:FadeIn(20)

end

-------------------------------
-- Entities Callbacks
-------------------------------


return testmaplol

