--[[
    init.lua
    Created: 04/08/2024 14:52:16
    Description: Autogenerated script file for the map hideout_entrance_inside.
]]--
-- Commonly included lua functions and data
require 'common'
require 'CommonFunctions'
-- Package name
local hideout_entrance_inside = {}

-- Local, localized strings table
-- Use this to display the named strings you added in the strings files for the map!
-- Ex:
--      local localizedstring = MapStrings['SomeStringName']
local MapStrings = {}

-------------------------------
-- Map Callbacks
-------------------------------
---hideout_entrance_inside.Init(map)
--Engine callback function
function hideout_entrance_inside.Init(map)

  --This will fill the localized strings table automatically based on the locale the game is 
  -- currently in. You can use the MapStrings table after this line!
  MapStrings = COMMON.AutoLoadLocalizedStrings()
  COMMON.RespawnAllies()
  local partners = CH('Teammate1')
  AI:SetCharacterAI(partners, "ai.ground_partner", CH('PLAYER'), partners.Position)
  AI:EnableCharacterAI(partners)
  partners.CollisionDisabled = true

  if not SV.guildmasters_office.officially_joined then
      GROUND:Hide('Weev')
      GROUND:Hide('Drapion')
      GROUND:Hide('Arbok')
      GROUND:Hide('Kit')
      GROUND:Hide('Lilith')



  end



end
function Dialogue(sp, emote, txt)
  UI:SetSpeaker(sp)
  UI:SetSpeakerEmotion(emote)
  UI:WaitShowDialogue(txt)


end
---hideout_entrance_inside.Enter(map)
--Engine callback function
function hideout_entrance_inside.Enter(map)
  --Mon spawns
  if not SV.guildmasters_office.officially_joined then
    --Do nothing


  else
    
    local dMRKR = MRKR('dMrkr')
    local kit = CH('Kit')
    local lil = CH('Lilith')
    local dex = CH('Ditto')
  

    GROUND:TeleportTo(dex, dMRKR.Position.X, dMRKR.Position.Y, dMRKR.Direction)
    
  end


  
  local partners = CH('Teammate1')
  if SV.partner.entrance == 1 then
    --this is for when entering from outside
    local marker = MRKR('Partner_marker_1')
    GROUND:TeleportTo(partners, marker.Position.X, marker.Position.Y, marker.Direction)
  elseif SV.partner.entrance == 2 then
    local marker = MRKR('mrkr_1_partner')
    GROUND:TeleportTo(partners, marker.Position.X, marker.Position.Y, marker.Direction)
  elseif SV.partner.entrance == 3 then
    --For when entering from the shops
    local marker = MRKR('entrance_2_partner') --I can't add similar names to the markers because I'm dumb
    GROUND:TeleportTo(partners, marker.Position.X, marker.Position.Y, marker.Direction)





  end
  AI:DisableCharacterAI(partners)

  AI:SetCharacterAI(partners, "ai.ground_partner", CH('PLAYER'), partners.Position)
  AI:EnableCharacterAI(partners)
  partners.CollisionDisabled = true
  GAME:FadeIn(20)
  


end

---hideout_entrance_inside.Exit(map)
--Engine callback function
function hideout_entrance_inside.Exit(map)


end

---hideout_entrance_inside.Update(map)
--Engine callback function
function hideout_entrance_inside.Update(map)


end

---hideout_entrance_inside.GameSave(map)
--Engine callback function
function hideout_entrance_inside.GameSave(map)
  local partner = CH('Teammate1')
  SV.partner.positionX = partner.Position.X
	SV.partner.positionY = partner.Position.Y
	SV.partner.direction = DirToNum(partner.Direction)

end

---hideout_entrance_inside.GameLoad(map)
--Engine callback function
function hideout_entrance_inside.GameLoad(map)
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
function hideout_entrance_inside.warp_0_Touch(obj, activator)
  GAME:FadeOut(false, 20)
  SV.partner.entrance = 1
	GAME:EnterZone('thieves_hideout', -1, 6, 1)
 
end
function hideout_entrance_inside.warp_1_Touch(obj, activator)
  if not SV.guildmasters_office.officially_joined then
    local partner = CH('Teammate1')
    local player = CH('PLAYER')
    GAME:CutsceneMode(true)

    GROUND:CharTurnToChar(partner, player)

		Dialogue(partner, "Normal", player:GetDisplayName().."!")
    GROUND:CharTurnToCharAnimated(player, partner, 5)
		Dialogue(partner, "Normal", "That's the way out of the hideout.")
		Dialogue(partner, "Worried", "Call me worrysome,[pause=20] but we should minimise the times we get in and out of the cave,[pause=30] especially this late.[br]You never know when there could be someone looking out for you.")
    Dialogue(partner, "Normal", "Let's stay inside and look around.")

    GAME:CutsceneMode(false)


  else --Go out
    GAME:FadeOut(false, 20)
    SV.partner.entrance = 0
    GAME:EnterZone('thieves_hideout', -1, 16, 0)
    

  end


end
function hideout_entrance_inside.Teammate1_Action(obj, activator)
  if not SV.guildmasters_office.officially_joined then
    GAME:CutsceneMode(true)

    GROUND:CharTurnToChar(obj, activator)
    GROUND:CharTurnToChar(activator, obj)
    Dialogue(obj, "Normal", "This is the first room that anyone coming in will see.")
    Dialogue(obj, "Normal", "This connects to the job boards, the dinning hall and the shops.")
    Dialogue(obj, "Normal", "Let's keep looking around for now.")

    GAME:CutsceneMode(false)
  else


  end

end
function hideout_entrance_inside.Ditto_Action(obj, activator)
  local partner = CH('Teammate1')
  local player = activator
  local dex = obj

  GAME:CutsceneMode(true)
  GROUND:CharTurnToChar(partner, dex)

  if not SV.guild.presented_to_dex then --If you have never spoken to dex, presentation dialogue happens
    AI:DisableCharacterAI(partner)
    GROUND:MoveToPosition(player, 225, 217, false, 2)
    GROUND:MoveToPosition(partner, 230, 196, false, 2)
    GROUND:CharTurnToChar(partner, dex)
    GROUND:CharTurnToChar(player, dex)

    
      UI:SetSpeaker(STRINGS:Format("\\uE040"), true, dex.CurrentForm.Species, dex.CurrentForm.Form, dex.CurrentForm.Skin, dex.CurrentForm.Gender)
      UI:SetSpeakerEmotion('Determined')
      UI:WaitShowDialogue("I can't believe there hasn't been a single thing happening on my post...")
      UI:SetSpeakerEmotion('Angry')
      UI:WaitShowDialogue("AGAIN!")
      SOUND:PlaySE("Battle/EVT_Emote_Sweatdrop")
      local coro1 = TASK:BranchCoroutine(function() GROUND:CharSetEmote(partner, "sweatdrop", 1) end)
      local coro2 = TASK:BranchCoroutine(function() GROUND:CharSetEmote(player, "sweatdrop", 1) end)
      TASK:JoinCoroutines({coro1,coro2})
      GAME:WaitFrames(120)
      UI:SetSpeakerEmotion('Sigh')
      UI:WaitShowDialogue("I shouldn't be screaming like this...")
      UI:WaitShowDialogue("Just have to hope tomorrow is any better.")
      GAME:WaitFrames(90)
      Dialogue(partner, "Stunned", "Ermm...")
      Dialogue(partner, "Stunned", "Hi there, " .. dex:GetDisplayName()..".")
      SOUND:PlaySE('Battle/EVT_Emote_Exclaim_2')
      GROUND:CharSetEmote(dex, "exclaim", 1)
      Dialogue(dex, "Surprised", "Huh?!")

      GAME:WaitFrames(20)
      GROUND:CharTurnToCharAnimated(dex, partner, 3)
      GAME:WaitFrames(70)
      Dialogue(dex, "Sigh", "Oh, [pause=50]it's you, ".. partner:GetDisplayName().."...")
      Dialogue(dex, "Determined", "What did I tell you about sneaking behind me like that?")
      GAME:WaitFrames(60)
      Dialogue(player, "Stunned", "S-[pause=50]Sorry...[br]That was my bad.")
    
      GROUND:CharTurnToCharAnimated(dex, player, 5)
      GAME:WaitFrames(40)
      Dialogue(dex, "Normal", "Nah, no problem.")
      GAME:WaitFrames(60)
      Dialogue(dex, "Determined", "Wait...[br]Who are you?")
      GAME:WaitFrames(90)
      Dialogue(partner, "Happy", dex:GetDisplayName()..",[pause=30] this is ".. player:GetDisplayName()..".[br]He just joined us!")
      Dialogue(player, "Happy", "Hi!")
      Dialogue(dex, "Sad", "A new face around here?")
      GROUND:CharSetEmote(dex, "happy", 0)

      Dialogue(dex, "Joyous", "That's something very rarely seen here!")
      Dialogue(dex, "Worried", "It's been ages since someone joined!")
      GROUND:CharSetEmote(dex, "happy", 1)

      GAME:WaitFrames(40)
      GROUND:CharTurnToCharAnimated(player, partner, 5)
      GAME:WaitFrames(70)
      GROUND:CharTurnToCharAnimated(player, dex, 5)
      

      Dialogue(player, "Worried", "Didn't "..partner:GetDisplayName().. " join like...[pause=60] a few months ago?")
      GAME:WaitFrames(70)
      Dialogue(dex, "Joyous", "That's ages for me!")
      GROUND:CharTurnToCharAnimated(player, partner, 5)
      GROUND:CharTurnToCharAnimated(partner, player, 5)
      GAME:WaitFrames(70)
      Dialogue(partner, "Normal", player:GetDisplayName().. ",[pause=30] this is "..dex:GetDisplayName()..".")
      Dialogue(partner, "Normal", "He's the one in charge of guarding the hideout's entrance from anyone wandering too close.")
      GAME:WaitFrames(60)
      GROUND:CharTurnToCharAnimated(player, dex, 5)
      GROUND:CharTurnToCharAnimated(partner, dex, 5)

      Dialogue(dex, "Determined", "Or that's what I'm supposed to do.")
      Dialogue(dex, "Angry", "But no one is stupid enough to come even close!")
      Dialogue(dex, "Angry", "Most of the time I end up getting into dungeons on accident thinking I'm chasing someone, and the it turns out it's just a wild Pokémon!")
      Dialogue(dex, "Angry", "IT MAKES ME SO FRUSTRATED!")
      GAME:WaitFrames(90)
      Dialogue(dex, "Joyous", "But I never let it get me down!")
      Dialogue(dex, "Joyous", "I always hope it will be the day I finally do something productive!")
      GAME:WaitFrames(60)
      GROUND:CharSetEmote(dex, "sweating", 1)
      SOUND:PlaySE('Battle/EVT_Emote_Sweating')   
      Dialogue(dex, "Crying", "Please, let it be soon![br]Waaaaaah!")
      GAME:WaitFrames(40)
      SOUND:PlaySE("Battle/EVT_Emote_Sweatdrop")
      local coro1 = TASK:BranchCoroutine(function() GROUND:CharSetEmote(partner, "sweatdrop", 1) end)
      local coro2 = TASK:BranchCoroutine(function() GROUND:CharSetEmote(player, "sweatdrop", 1) end)
      TASK:JoinCoroutines({coro1,coro2})
      GAME:WaitFrames(90)

      Dialogue(partner, "Stunned", "I forgot to mention something.")
      Dialogue(partner, "Stunned", dex:GetDisplayName() .. " is very prone to mood swings.")
      Dialogue(player, "Stunned", "I could tell...")

      GAME:WaitFrames(80)
      Dialogue(partner, "Normal", "Anyway...")
      Dialogue(partner, "Worried", "What were you doing here all alone?")

      Dialogue(dex, "Worried", "I was just letting out some of my emotions.")
      Dialogue(dex, "Worried", "[color=#00ffff]Eve[color] said it could help with my mood swings.")

      Dialogue(partner, "Stunned", "Oh!")
      Dialogue(partner, "Worried", "Sorry if we disturbed you then...")

      Dialogue(dex, "Happy", "Oh no, don't worry about it!")
      Dialogue(dex, "Happy", "I'm happy to see you and meet " .. player:GetDisplayName() .. "!")

      Dialogue(partner, "Normal", "Oh![br]Alright then!")
      GAME:WaitFrames(80)
      Dialogue(partner, "Worried", "Well, we'll be going now.")
      Dialogue(partner, "Happy", "But it was nice seeing you, " .. dex:GetDisplayName() .. "!")
      Dialogue(player, "Happy", "Yeah, it was nice meeting you too!")
      Dialogue(dex, "Happy", "Likewise!")
      Dialogue(partner, "Happy", "See you tomorrow!")
     

      Dialogue(dex, "Happy", "See you!")
      GROUND:EntTurn(dex, Direction.DownRight)
      AI:SetCharacterAI(partner, "ai.ground_partner", CH('PLAYER'), partner.Position)
    AI:EnableCharacterAI(partner)
    partner.CollisionDisabled = true
    SV.guild.presented_to_dex = true
  else --If you have spoken to dex at least once, new dialogue happens
    if not SV.guildmasters_office.officially_joined then --If it's the first day (another interaction after the first dialogue), this same dialogue plays 
      Dialogue(partner, "Normal", player:GetDisplayName()..".")
      Dialogue(partner, "Worried", "We shouldn't bother " .. dex:GetDisplayName().." anymore today.")
      Dialogue(partner, "Normal", "Let's keep looking around and leave him alone.")



    else --If it's not the first day, new dialogue happens. This will change depending of events happening currently. Can't wait for this code to be so full of ifs
      if SV.progression.chapter == 2 then --If chapter 2
        if not SV.progression.first_day_done then --Before the first mission
          GROUND:CharTurnToChar(dex, player)
          CommonFunctions.Dialogue(dex, 3, "Happy", "Hi there, " .. player:GetDisplayName().."!")
          CommonFunctions.Dialogue(dex, 3, "Happy", "Ready to go out on your first mission?")
          CommonFunctions.Dialogue(dex, 3, "Sad", "Hopefully it will be more exciting than mine...")
          GROUND:EntTurn(dex, Direction.UpRight)
        elseif SV.progression.first_day_done then 
          GROUND:CharTurnToChar(dex, player)
          CommonFunctions.Dialogue(dex, 3, "Happy", "I heard how you beat those explorers!")
          CommonFunctions.Dialogue(dex, 3, "Sad", "It definitely was more exciting than walking around to find nothing,[pause=30] that's for sure")
        
          GROUND:EntTurn(dex, Direction.UpRight)

        end

      end





    end
  end
  GAME:CutsceneMode(false)
end
function hideout_entrance_inside.Kit_Action(obj, activator)
  local player = activator
  local kit = obj
  GAME:CutsceneMode(true)
  local lilith = CH('Lilith')
  if SV.progression.chapter == 2 then
    if not SV.progression.first_day_done then
      GROUND:CharTurnToChar(kit, player)
      CommonFunctions.Dialogue(kit, 3, "Happy", "I can't wait to see what you're capable of, ".. player:GetDisplayName().."!")
      GROUND:EntTurn(kit, Direction.UpLeft)

    elseif SV.progression.first_day_done then 
      GROUND:CharTurnToChar(kit, player)
      CommonFunctions.Dialogue(kit, 3, "Happy", "Congratulations on beating those goons!")
      CommonFunctions.Dialogue(kit, 3, "Joyous", "Now " .. lilith:GetDisplayName() .. " lost the bet and I don't have to pay her anymore!")
      GROUND:EntTurn(kit, Direction.UpLeft)


    end



  end
  
  GAME:CutsceneMode(false)


end
function hideout_entrance_inside.Lilith_Action(obj, activator)
  local player = activator
  local lilith = obj
  GAME:CutsceneMode(true)

  if SV.progression.chapter == 2 then
    if not SV.progression.first_day_done then
      GROUND:CharTurnToChar(lilith, player)
      CommonFunctions.Dialogue(lilith, 3, "Normal", "Be careful out there, you two.")
      CommonFunctions.Dialogue(lilith, 3, "Normal", "Aggron's teams can be quite strong if you're unlucky.")

      GROUND:EntTurn(lilith, Direction.DownRight)

    elseif SV.progression.first_day_done then
      GROUND:CharTurnToChar(lilith, player)
  
      CommonFunctions.Dialogue(lilith, 3, "Happy", "You showed those explorers what was good, huh?")
      CommonFunctions.Dialogue(lilith, 3, "Normal", "Honestly, I knew you were going to win, but I wanted to clear the debt from [color=#00ffff]Kit[color].")
      GAME:WaitFrames(40)
      CommonFunctions.Dialogue(lilith, 3, "Normal", "Come on, you really think that I would seriously bet on something like this?")


      GROUND:EntTurn(lilith, Direction.DownRight)

    end



  end
  
  GAME:CutsceneMode(false)

end
function hideout_entrance_inside.Weev_Action(obj, activator)
  GAME:CutsceneMode(true)
  if SV.progression.chapter == 2 then
    if not SV.progression.first_day_done then
      GROUND:CharTurnToChar(obj, activator)
      CommonFunctions.Dialogue(obj, 3, "Normal", "We've heard a lot of good things about this guild, so we decided to pay a visit all the way from another continent.")
      CommonFunctions.Dialogue(obj, 3, "Pain", "You lot really know how to hide yourselves, don't you?")

      GROUND:EntTurn(obj, Direction.UpLeft)

    elseif SV.progression.first_day_done then
      GROUND:CharTurnToChar(obj, activator)
      CommonFunctions.Dialogue(obj, 3, "Normal", "Hmm, I have heard about your ")
      CommonFunctions.Dialogue(obj, 3, "Pain", "You lot really know how to hide yourselves, don't you?")

      GROUND:EntTurn(obj, Direction.UpLeft)
    end



  end
  GAME:CutsceneMode(false)


end
function hideout_entrance_inside.Drapion_Action(obj, activator)
  GAME:CutsceneMode(true)
  local weavile = CH('Weev')
  if SV.progression.chapter == 2 then
    if not SV.progression.first_day_done then
      GROUND:CharTurnToChar(obj, activator)
      CommonFunctions.Dialogue(obj, 3, "Normal", "Lady " .. weavile:GetDisplayName() .. " wanted to come and see this guild because of all of the things she has heard about it.")
      CommonFunctions.Dialogue(obj, 3, "Normal", "I gotta say, I'm impressed with the amount of Pokémon in here...")

      GROUND:EntTurn(obj, Direction.Down)



    end



  end
  GAME:CutsceneMode(false)
end
function hideout_entrance_inside.Arbok_Action(obj, activator)
  
  GAME:CutsceneMode(true)
  if SV.progression.chapter == 2 then
    if not SV.progression.first_day_done then
      GROUND:CharTurnToChar(obj, activator)
      CommonFunctions.Dialogue(obj, 3, "Worried", "It wassss really hard to get here.")
      CommonFunctions.Dialogue(obj, 3, "Normal", "You do a great job at hiding the place, that'sss for ssssure.")

      GROUND:EntTurn(obj, Direction.UpRight)



    end



  end
  GAME:CutsceneMode(false)
end

function hideout_entrance_inside.Signpost_Action(obj, activator)
  GAME:CutsceneMode(true)
  UI:ResetSpeaker()
  UI:WaitShowDialogue("Left: Dinning Hall\nRight: Shops 'n storage\nForward: Interior")
  GAME:CutsceneMode(false)

end
function hideout_entrance_inside.left_exit_Touch(obj, activator)
  GAME:FadeOut(false, 20)
  GAME:EnterZone('thieves_hideout', -1, 8, 0)

end
function hideout_entrance_inside.exit_right_Touch(obj, activator)
  SV.partner.entrance = 0
  GAME:FadeOut(false, 20)
  GAME:EnterZone('thieves_hideout', -1, 9, 0)
end
return hideout_entrance_inside
