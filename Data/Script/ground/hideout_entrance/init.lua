 --[[
    init.lua
    Created: 02/08/2024 15:54:29
    Description: Autogenerated script file for the map hideout_entrance.
]]--
-- Commonly included lua functions and data
require 'common'
require 'CommonFunctions'
require 'ground.hideout_entrance.hideout_entrance_ch2'
-- Package name
local hideout_entrance = {}

-- Local, localized strings table
-- Use this to display the named strings you added in the strings files for the map!
-- Ex:
--      local localizedstring = MapStrings['SomeStringName']
local MapStrings = {}

-------------------------------
-- Map Callbacks
-------------------------------
---hideout_entrance.Init(map)
--Engine callback function
function hideout_entrance.Init(map)

  --This will fill the localized strings table automatically based on the locale the game is 
  -- currently in. You can use the MapStrings table after this line!
  MapStrings = COMMON.AutoLoadLocalizedStrings()
  
  GROUND:AddMapStatus("clouds_overhead")
  COMMON.RespawnAllies()
  local partners = CH('Teammate1')
  AI:SetCharacterAI(partners, "ai.ground_partner", CH('PLAYER'), partners.Position)
  AI:EnableCharacterAI(partners)
  partners.CollisionDisabled = true
end

---hideout_entrance.Enter(map)
--Engine callback function
function hideout_entrance.Enter(map)
	

	local partners = CH('Teammate1')
	AI:DisableCharacterAI(partners)
  if SV.partner.entrance == 0 then
    --nothing
  elseif SV.partner.entrance == 1 then
	--Exit
	local marker = MRKR('mrkr_2')
    GROUND:TeleportTo(partners, marker.Position.X, marker.Position.Y, marker.Direction)

  elseif SV.partner.entrance == 2 then
	--Lake
  end
  AI:SetCharacterAI(partners, "ai.ground_partner", CH('PLAYER'), partners.Position)
  AI:EnableCharacterAI(partners)
  partners.CollisionDisabled = true
  GAME:FadeIn(20)

  if SV.progression.chapter == 2 then
	if SV.gelid_woods.beat_boss then
		hideout_entrance_ch2.completedMission()

	end
  end




end

---hideout_entrance.Exit(map)
--Engine callback function
function hideout_entrance.Exit(map)


end

---hideout_entrance.Update(map)
--Engine callback function
function hideout_entrance.Update(map)


end

---hideout_entrance.GameSave(map)
--Engine callback function
function hideout_entrance.GameSave(map)
  local partner = CH('Teammate1')
  SV.partner.positionX = partner.Position.X
SV.partner.positionY = partner.Position.Y
SV.partner.direction = DirToNum(partner.Direction)

end

---hideout_entrance.GameLoad(map)
--Engine callback function
function hideout_entrance.GameLoad(map)
  local partners = CH('Teammate1')
  GROUND:TeleportTo(partners, SV.partner.positionX, SV.partner.positionY, NumToDir(SV.partner.direction))

	AI:SetCharacterAI(partners, "ai.ground_partner", CH('PLAYER'), partners.Position)
  AI:EnableCharacterAI(partners)
  partners.CollisionDisabled = true
  GAME:FadeIn(20)

end
function DirToNum(dir)
	--up is 0, upright is 1, ... up left is 7
	local num = -1
	if dir == Direction.Up then
		num = 0
	elseif dir == Direction.UpRight then
		num = 1
	elseif dir == Direction.Right then
		num = 2
	elseif dir == Direction.DownRight then
		num = 3
	elseif dir == Direction.Down then
		num = 4
	elseif dir == Direction.DownLeft then
		num = 5
	elseif dir == Direction.Left then
		num = 6
	elseif dir == Direction.UpLeft then
		num = 7
	end
	
	return num
	
end
--converts a number to a direction
function NumToDir(num)
	local dir = Direction.None
	if num % 8 == 0 then 
		dir = Direction.Up
	elseif num % 8 == 1 then
		dir = Direction.UpRight
	elseif num % 8 == 2 then
		dir = Direction.Right
	elseif num % 8 == 3 then
		dir = Direction.DownRight
	elseif num % 8 == 4 then
		dir = Direction.Down
	elseif num % 8 == 5 then
		dir = Direction.DownLeft
	elseif num % 8 == 6 then
		dir = Direction.Left
	elseif num % 8 == 7 then
		dir = Direction.UpLeft
	end

	return dir
end 
-------------------------------
-- Entities Callbacks
-------------------------------
function hideout_entrance.entrance_0_Touch(obj, activator)
  GAME:FadeOut(false, 20)
  SV.partner.entrance = 1
  GAME:EnterZone('thieves_hideout', -1, 7, 1)
end
function hideout_entrance.exit_left_Touch(obj, activator)
	
	GAME:FadeOut(false, 20)
	SV.partner.entrance = 0
	GAME:EnterZone('conceal_forest', -1, 2, 0)

	
end
function hideout_entrance.exit_right_Touch(obj, activator)
	local partner = CH('Teammate1')
	if not SV.progression.first_day_done then
		GAME:CutsceneMode(true)
		CommonFunctions.Dialogue(partner, 3, "Worried", activator:GetDisplayName() .. ",[pause=30] that leads to the lake next to the hideout, not out of it.")
		CommonFunctions.Dialogue(partner, 3, "Normal", "It's the other way to our mission!")
		CommonFunctions.Dialogue(partner, 3, "Normal", "If you still want to see it, I can show you after we're done for today!")


		GAME:CutsceneMode(false)

	else
		


	end
end
return hideout_entrance