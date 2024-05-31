--[[
    init.lua
    Created: 05/17/2024 19:27:31
    Description: Autogenerated script file for the map twilight_town_east.
]]--
-- Commonly included lua functions and data
require 'common'
require 'CommonFunctions'
-- Package name
local twilight_town_east = {}

-- Local, localized strings table
-- Use this to display the named strings you added in the strings files for the map!
-- Ex:
--      local localizedstring = MapStrings['SomeStringName']
local MapStrings = {}

-------------------------------
-- Map Callbacks
-------------------------------
---twilight_town_east.Init(map)
--Engine callback function
function twilight_town_east.Init(map)

  --This will fill the localized strings table automatically based on the locale the game is 
  -- currently in. You can use the MapStrings table after this line!
  MapStrings = COMMON.AutoLoadLocalizedStrings()
  COMMON.RespawnAllies()
  local partners = CH('Teammate1')
  AI:SetCharacterAI(partners, "ai.ground_partner", CH('PLAYER'), partners.Position)
  AI:EnableCharacterAI(partners)
  partners.CollisionDisabled = true

end

---twilight_town_east.Enter(map)
--Engine callback function
function twilight_town_east.Enter(map)


  GAME:FadeIn(20)

end

---twilight_town_east.Exit(map)
--Engine callback function
function twilight_town_east.Exit(map)


end

---twilight_town_east.Update(map)
--Engine callback function
function twilight_town_east.Update(map)


end

---twilight_town_east.GameSave(map)
--Engine callback function
function twilight_town_east.GameSave(map)

  local partner = CH('Teammate1')
  SV.partner.positionX = partner.Position.X
	SV.partner.positionY = partner.Position.Y
	SV.partner.direction = DirToNum(partner.Direction)
end

---twilight_town_east.GameLoad(map)
--Engine callback function
function twilight_town_east.GameLoad(map)
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
function twilight_town_east.east_Touch(obj, activator)
  GAME:FadeOut(false, 20)
	SV.partner.entrance = 1
	GAME:EnterZone('conceal_forest', -1, 0, 3)



end
function twilight_town_east.signpost_Action(obj, activator)
  GAME:CutsceneMode(true)
  UI:ResetSpeaker()
  UI:WaitShowDialogue("<-- Entering [color=#fcacac]Twilight Town[color].\nUp, towards exploration.\n--> Towards Concealing Forest (danger of outlaws!)")
  GAME:CutsceneMode(false)


end
function twilight_town_east.twilight_entrance_Touch(obj, activator)
  local partner = CH('Teammate1')
  local player = CH('PLAYER')
  GAME:CutsceneMode(true)
  GROUND:CharTurnToChar(partner, player)
  SOUND:PlaySE('Battle/EVT_Emote_Exclaim_2')
  GROUND:CharSetEmote(partner, "exclaim", 1)
  CommonFunctions.Dialogue(partner, 3, "Surprised", activator:GetDisplayName() .. "![pause=0] Stop moving!")
  GROUND:CharTurnToCharAnimated(activator, partner,4)
  CommonFunctions.Dialogue(activator, 3, "Surprised", "What, what?!")
  GAME:WaitFrames(50)
  CommonFunctions.Dialogue(partner, 3, "Worried", "If we keep up that way, we'll end up in [color=#fcacac]Twilight Town[color].")
  CommonFunctions.Dialogue(partner, 3, "Worried", "And we really shouldn't show ourselves there.")
  CommonFunctions.Dialogue(partner, 3, "Pain", "Some of the Pokémon living there kind of already have my face, and we should try to keep yours as a secret for as long as possible.")
  GAME:WaitFrames(50)
  CommonFunctions.Dialogue(activator, 3, "Stunned", "Okay...")
  CommonFunctions.Dialogue(activator, 3, "Worried", "I guess you're right...")
  GAME:CutsceneMode(false)
end
function twilight_town_east.exit_up_Touch(obj, activator)
	local partner = CH('Teammate1')
	if SV.progression.chapter == 2 then
		UI:ResetSpeaker()
		UI:WaitShowDialogue("This path seems to lead to the dungeon you have to go.")
		UI:ChoiceMenuYesNo("Are you ready to head for it?")
		UI:WaitForChoice()
		local yesnoResult = UI:ChoiceResult()
		if yesnoResult then
			GAME:FadeOut(false, 20)
			
  			GAME:EnterZone('gelid_woods', -1, 0, 0)

		else

		end
	else
		--I'll code this later

	end

	
end
return twilight_town_east