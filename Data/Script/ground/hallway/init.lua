--[[
    init.lua
    Created: 04/30/2024 10:26:33
    Description: Autogenerated script file for the map hallway.
]]--
-- Commonly included lua functions and data
require 'common'

-- Package name
local hallway = {}

-- Local, localized strings table
-- Use this to display the named strings you added in the strings files for the map!
-- Ex:
--      local localizedstring = MapStrings['SomeStringName']
local MapStrings = {}

-------------------------------
-- Map Callbacks
-------------------------------
---hallway.Init(map)
--Engine callback function
function hallway.Init(map)

  --This will fill the localized strings table automatically based on the locale the game is 
  -- currently in. You can use the MapStrings table after this line!
  MapStrings = COMMON.AutoLoadLocalizedStrings()
  COMMON.RespawnAllies()
  local partners = CH('Teammate1')
  AI:SetCharacterAI(partners, "ai.ground_partner", CH('PLAYER'), partners.Position)
  AI:EnableCharacterAI(partners)
  partners.CollisionDisabled = true
end

---hallway.Enter(map)
--Engine callback function
function hallway.Enter(map)
  --Oh boy
  local partners = CH('Teammate1')
  AI:DisableCharacterAI(partners)

 
  if SV.partner.entrance == 0 then
    --do nothing
  elseif SV.partner.entrance == 1 then
    local marker = MRKR('marker_2')
		GROUND:TeleportTo(partners, marker.Position.X, marker.Position.Y, marker.Direction)
  elseif SV.partner.entrance == 2 then
    local marker = MRKR('marker_4')
		GROUND:TeleportTo(partners, marker.Position.X, marker.Position.Y, marker.Direction)
  elseif SV.partner.entrance == 3 then
    local marker = MRKR('marker_6')
		GROUND:TeleportTo(partners, marker.Position.X, marker.Position.Y, marker.Direction)
  elseif SV.partner.entrance == 4 then
    local marker = MRKR('marker_8')
		GROUND:TeleportTo(partners, marker.Position.X, marker.Position.Y, marker.Direction)
  elseif SV.partner.entrance == 5 then
    local marker = MRKR('marker_10')
		GROUND:TeleportTo(partners, marker.Position.X, marker.Position.Y, marker.Direction)
  end
  


  GAME:FadeIn(20)
  AI:SetCharacterAI(partners, "ai.ground_partner", CH('PLAYER'), partners.Position)
  AI:EnableCharacterAI(partners)
  partners.CollisionDisabled = true
end

---hallway.Exit(map)
--Engine callback function
function hallway.Exit(map)


end

---hallway.Update(map)
--Engine callback function
function hallway.Update(map)


end

---hallway.GameSave(map)
--Engine callback function
function hallway.GameSave(map)
  local partner = CH('Teammate1')
  SV.partner.positionX = partner.Position.X
	SV.partner.positionY = partner.Position.Y
	SV.partner.direction = DirToNum(partner.Direction)

end

---hallway.GameLoad(map)
--Engine callback function
function hallway.GameLoad(map)

  local partners = CH('Teammate1')
  GROUND:TeleportTo(partners, SV.partner.positionX, SV.partner.positionY, NumToDir(SV.partner.direction))
  

	AI:SetCharacterAI(partners, "ai.ground_partner", CH('PLAYER'), partners.Position)
  AI:EnableCharacterAI(partners)
  partners.CollisionDisabled = true
  GAME:FadeIn(20)

end
function Dialogue(sp, state, emote, txt)
  if state == 0 then --Speaker is unknown and invisible
    UI:SetSpeaker(STRINGS:Format("\\uE040"), true, "", -1, "", RogueEssence.Data.Gender.Unknown)
  elseif state == 1 then --Speaker is unknown, but visible (AKA, you don't know their name)
    UI:SetSpeaker(STRINGS:Format("\\uE040"), true, sp.CurrentForm.Species, sp.CurrentForm.Form, sp.CurrentForm.Skin, sp.CurrentForm.Gender)
  elseif state == 2 then --Speaker is thinking to themselves. (Parenthesis are NOT included here.)
    UI:SetSpeaker("", true, sp.CurrentForm.Species, sp.CurrentForm.Form, sp.CurrentForm.Skin, sp.CurrentForm.Gender)
  else --Speaker speaks regularly
    UI:SetSpeaker(sp)
  end
  UI:SetSpeakerEmotion(emote)
  UI:WaitShowDialogue(txt)


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
function hallway.exit_left_Touch(obj, activator)
  GAME:FadeOut(false, 20)
  SV.partner.entrance = 2
	GAME:EnterZone('thieves_hideout', -1, 6, 3)

end
function hallway.entrance_1_Touch(obj, activator)
  GAME:FadeOut(false, 20)
  
	GAME:EnterZone('thieves_hideout', -1, 10, 0)


end
function hallway.entrance_2_Touch(obj, activator)
  GAME:FadeOut(false, 20)
  
	GAME:EnterZone('thieves_hideout', -1, 12, 0)


end
function hallway.entrance_3_Touch(obj, activator)
  GAME:FadeOut(false, 20)
  
	GAME:EnterZone('thieves_hideout', -1, 13, 0)
  
end
function hallway.exit_4_Touch(obj, activator)
  GAME:FadeOut(false, 20)
  
	GAME:EnterZone('thieves_hideout', -1, 14, 0)
  
end
function hallway.entrance_5_Touch(obj, activator)
  local partner = CH('Teammate1')
  local player = activator
  if not SV.guildmasters_office.officially_joined then
    GAME:CutsceneMode(true)

    if SV.guild.presented_to_dex and SV.guild.presented_to_lily and SV.guild.presented_to_lupin and SV.guild.presented_to_kathy and SV.guild.presented_to_celia and SV.guild.presented_to_illusion and SV.guild.presented_to_eve and SV.guild.presented_to_overcharge then
      --Presented to everyone, let entrance to the room.
      GROUND:CharTurnToChar(partner, player)
      Dialogue(partner, 3, "Normal", player:GetDisplayName().."!")
      GROUND:CharTurnToCharAnimated(player, partner, 4)
      GAME:WaitFrames(40)
      Dialogue(partner, 3, "Normal", "This leads to my room.")
      local choice = false --Yes = true, no = false
      UI:SetSpeakerEmotion("Worried")
      UI:ChoiceMenuYesNo("Are you sure you want to go to sleep already?")
		  UI:WaitForChoice()
		  choice = UI:ChoiceResult()
      if choice then --Yes
     
        Dialogue(partner, 3, "Normal", "Alright then!")
        GAME:WaitFrames(40)
        Dialogue(partner, 3, "Worried", "I'm pretty sure I only have one bed, but...")
        Dialogue(partner, 3, "Normal", "I'll improvise something.")
        Dialogue(partner, 3, "Normal", "Let's go.")
        GAME:FadeOut(false, 20)
        SOUND:FadeOutBGM(80)

        GAME:WaitFrames(120)
        SV.sleeping = true
        GAME:EnterZone('thieves_hideout', -1, 15, 1)

      else --No
        Dialogue(partner, 3, "Normal", "Okay.")
        Dialogue(partner, 3, "Normal", "Then let's keep looking around")

      end


    else
      --Not presented to everyone, don't let enter.
      GROUND:CharTurnToChar(partner, player)
      Dialogue(partner, 3, "Normal", player:GetDisplayName().."!")
      GROUND:CharTurnToCharAnimated(player, partner, 4)
      GAME:WaitFrames(40)
      Dialogue(partner, 3, "Normal", "This leads to my room.")
      Dialogue(partner, 3, "Worried", "I know you must be tired, but now is the perfect chance to talk to most of the members.")
      Dialogue(partner, 3, "Normal", "Why don't you introduce yourself to them all and then we can go to sleep?")

    end
    GAME:CutsceneMode(false)

  else
    --Normally enter the room.
    GAME:FadeOut(false, 20)
    GAME:EnterZone('thieves_hideout', -1, 15, 0)



  end
end
function hallway.Teammate1_Action(obj, activator)
  if not SV.guildmasters_office.officially_joined then
    GAME:CutsceneMode(true)

    GROUND:CharTurnToChar(obj, activator)
    GROUND:CharTurnToChar(activator, obj)
    Dialogue(obj, 3, "Normal", "This is the hallway that connects to the rooms of the members.")
    Dialogue(obj,3, "Worried", "There's not much else to say about it...")
    Dialogue(obj,3, "Normal", "So how about we enter some of the member's rooms?")
    Dialogue(obj,3, "Happy", "No one minds as long as you don't mess with anything that's not yours, so don't be afraid!")
    Dialogue(obj,3, "Worried", "But remember that also means that anyone can enter ours, so expect some visits on the mornings.")
    

    GAME:CutsceneMode(false)
  else


  end

end
function hallway.Debug_guy_Action(obj, activator)
  SV.guild.presented_to_dex = true
  SV.guild.presented_to_celia = true
  SV.guild.presented_to_kathy = true
  SV.guild.presented_to_lupin = true
  SV.guild.presented_to_lily = true
  SV.guild.presented_to_illusion = true
  SV.guild.presented_to_eve = true
  SV.guild.presented_to_overcharge = true
  SV.guildmasters_office.lets_explore_cut = true
  Dialogue(obj, 3, "Normal", "Set all needed variables to true!")
end
return hallway

