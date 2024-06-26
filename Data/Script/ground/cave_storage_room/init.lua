--[[
    init.lua
    Created: 12/31/2023 21:00:50
    Description: Autogenerated script file for the map guild_storage_room.
]]--
-- Commonly included lua functions and data
require 'common'

-- Package name
local cave_storage_room = {}

-- Local, localized strings table
-- Use this to display the named strings you added in the strings files for the map!
-- Ex:
--      local localizedstring = MapStrings['SomeStringName']
local MapStrings = {}

-------------------------------
-- Map Callbacks
-------------------------------
---guild_storage_room.Init(map)
--Engine callback function
function cave_storage_room.Init(map)

  --This will fill the localized strings table automatically based on the locale the game is 
  -- currently in. You can use the MapStrings table after this line!
  MapStrings = COMMON.AutoLoadLocalizedStrings()
  COMMON.RespawnAllies()
  
  local partner = CH('Teammate1')
  AI:SetCharacterAI(partner, "ai.ground_partner", CH('PLAYER'), partner.Position)
	AI:EnableCharacterAI(partner)
  partner.CollisionDisabled = true
end

---guild_storage_room.Enter(map)
--Engine callback function
function cave_storage_room.Enter(map)
  



  GAME:FadeIn(20)

end

---guild_storage_room.Exit(map)
--Engine callback function
function cave_storage_room.Exit(map)


end
function cave_storage_room.Teammate1_Action(obj, activator)
	GAME:CutsceneMode(true)
	GROUND:CharTurnToChar(obj, activator)
	GROUND:CharTurnToChar(activator, obj)

	

	if not SV.guildmasters_office.officially_joined then
	
	GROUND:CharTurnToCharAnimated(obj, activator, 5)
	GROUND:CharTurnToCharAnimated(activator, obj, 5)
	Dialogue(obj, "Normal", "This is the storage room.")
	Dialogue(obj, "Normal", elm:GetDisplayName().." makes sure all of the guild's items and treasure are in order.")
	Dialogue(obj, "Happy", "He's a very good fighter just behind [color=#00ffff]Celia[color], so don't try stealing anything from him!")
	Dialogue(obj, "Normal", "Some of the spare items that [color=#00ffff]Kathy[color] can't store because of space problems are also sent here.")
	

	
	

	end

	GAME:CutsceneMode(false)

end
function cave_storage_room.Keeper_Action(obj, activator)
  GROUND:CharTurnToChar(obj, activator)
  local partner = CH("Teammate1")
  local player = activator
  local elm = obj --Any resemblance to other characters in other realities is just a coincidence.

  GROUND:CharTurnToChar(partner, obj)

  if not SV.cave_storage_room.presented_to_elm then
	UI:SetSpeaker(STRINGS:Format("\\uE040"), true, elm.CurrentForm.Species, elm.CurrentForm.Form, elm.CurrentForm.Skin, elm.CurrentForm.Gender)
	UI:SetSpeakerEmotion('Pain')
	UI:WaitShowDialogue("How is it possible that I ended up being the one in charge of making sure that the guild's supplies are in their place?")
	UI:WaitShowDialogue("And it's always so disorganized!")
	UI:WaitShowDialogue("I know that I'm the one supposed to tidy everything up, but we aren't wild animals!")

	SOUND:PlaySE('Battle/EVT_Emote_Exclaim')
	GROUND:CharSetEmote(elm, "notice", 1)
	GAME:WaitFrames(70)
	GROUND:CharTurnToCharAnimated(elm, player, 5)
	GAME:WaitFrames(40)
	GROUND:CharTurnToCharAnimated(elm, partner, 5)
	GAME:WaitFrames(50)
	UI:SetSpeakerEmotion('Stunned')
	UI:WaitShowDialogue("Oh... [pause=50]I didn't see you there...")
	Dialogue(partner, "Happy", "Hi, "..elm:GetDisplayName().."!")
	Dialogue(partner, "Worried", "How are you doing today?")

	Dialogue(elm, "Sigh", "Just like always...[br]Having to tidy up all the resources of the guild and spare items of the members that are never in their place.")

	Dialogue(player, "Worried", "Sounds like a tough job...[pause=0] Fixing other people's mess is always a pain.")

	Dialogue(elm, "Sigh", "It is, I know.")
	Dialogue(elm, "Normal", "But enough about me.")
	Dialogue(elm, "Worried", "Who are you?")

	Dialogue(partner, "Happy", "Elm, this is " .. player:GetDisplayName()..".[br]He's a member that just joined us.")
	GAME:WaitFrames(50)

	Dialogue(elm, "Happy", "Nice to meet you then, "..player:GetDisplayName().."![br]A new face around is always welcome.")
	Dialogue(elm, "Normal", "I'm " .. elm:GetDisplayName()..", the one in charge of making sure that no one dares to get to th")


  else 
	if not SV.guildmasters_office.officially_joined then
		



	else
		


	end



  end
  




end
function Dialogue(sp, emote, txt)
  UI:SetSpeaker(sp)
  UI:SetSpeakerEmotion(emote)
  UI:WaitShowDialogue(txt)


end

---guild_storage_room.Update(map)
--Engine callback function
function cave_storage_room.Update(map)


end

---guild_storage_room.GameSave(map)
--Engine callback function
function cave_storage_room.GameSave(map)
 local partner = CH('Teammate1')
  SV.partner.positionX = partner.Position.X
	SV.partner.positionY = partner.Position.Y
	SV.partner.direction = DirToNum(partner.Direction)

end

---guild_storage_room.GameLoad(map)
--Engine callback function
function cave_storage_room.GameLoad(map)
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
function cave_storage_room.East_Exit_Touch(obj, activator)
	SV.partner.entrance = 1
	GAME:FadeOut(false, 20)
	GAME:EnterZone('thieves_hideout', -1, 9, 2)



end

return cave_storage_room

