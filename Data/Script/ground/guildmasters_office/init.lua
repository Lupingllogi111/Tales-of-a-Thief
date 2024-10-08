--[[
    init.lua
    Created: 02/22/2024 09:37:24
    Description: Autogenerated script file for the map guildmasters_office.
]]--
-- Commonly included lua functions and data
require 'common'
require 'ground.guildmasters_office.guildmasters_office_ch2'
-- Package name
local guildmasters_office = {}

-- Local, localized strings table
-- Use this to display the named strings you added in the strings files for the map!
-- Ex:
--      local localizedstring = MapStrings['SomeStringName']
local MapStrings = {}

-------------------------------
-- Map Callbacks
-------------------------------
---guildmasters_office.Init(map)
--Engine callback function
function guildmasters_office.Init(map)
  if not SV.guildmasters_office.officially_joined then
    SOUND:FadeOutBGM(1)
  end
  

  --This will fill the localized strings table automatically based on the locale the game is 
  -- currently in. You can use the MapStrings table after this line!
  MapStrings = COMMON.AutoLoadLocalizedStrings()
  COMMON.RespawnAllies()
  GROUND:Hide('Gummi')
  GROUND:Hide('Box')
  if SV.progression.chapter >= 2 then
    local partners = CH('Teammate1')
    AI:SetCharacterAI(partners, "ai.ground_partner", CH('PLAYER'), partners.Position)
    AI:EnableCharacterAI(partners)
    partners.CollisionDisabled = true


  end
end

---guildmasters_office.Enter(map)
--Engine callback function
function guildmasters_office.Enter(map)
  if SV.progression.chapter == 1 then
    if not SV.guildmasters_office.officially_joined then
    joiningTime()
    elseif SV.guildmasters_office.officially_joined then
    GROUND:Hide('Plusle')
    GROUND:Hide('Minun')
    SOUND:PlayBGM("Wigglytuff's Guild.ogg", true) 

    GAME:FadeIn(20)
    end
  elseif SV.progression.chapter == 2 then
    if SV.gelid_woods.beat_boss and not SV.progression.first_day_done then
      guildmasters_office_ch2.first_day_end()



    end

  end
  
  --[[
  if not SV.guildmasters_office.on_cutscene and SV.guildmasters_office.officially_joined then
    --Took this to its own function to not crowd the script.
    bossEasterEggs()
  end
  ]]--
  if SV.progression.chapter == 2 then
    if SV.progression.beat_boss and not SV.progression.first_day_done then
      hideout_entrance_ch2.completedMission()
  
    end
  end
end

---guildmasters_office.Exit(map)
--Engine callback function
function guildmasters_office.Exit(map)


end

---guildmasters_office.Update(map)
--Engine callback function
function guildmasters_office.Update(map)


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
---guildmasters_office.GameSave(map)
--Engine callback function
function guildmasters_office.GameSave(map)
  local partner = CH('Teammate1')
  SV.partner.positionX = partner.Position.X
	SV.partner.positionY = partner.Position.Y
	SV.partner.direction = DirToNum(partner.Direction)

end

---guildmasters_office.GameLoad(map)
--Engine callback function
function guildmasters_office.GameLoad(map)
  local partners = CH('Teammate1')
  GROUND:TeleportTo(partners, SV.partner.positionX, SV.partner.positionY, NumToDir(SV.partner.direction))
  

	AI:SetCharacterAI(partners, "ai.ground_partner", CH('PLAYER'), partners.Position)
  AI:EnableCharacterAI(partners)
  partners.CollisionDisabled = true
  GAME:FadeIn(20)

end
function joiningTime()
  GAME:MoveCamera(120, 70, 1, false)

  local player = CH('PLAYER')
  local partner = CH('Teammate1')
  local boss = CH('Boss')
  local plusle = CH('Plusle')
  local minun = CH('Minun')

  GAME:CutsceneMode(true)
  GROUND:EntTurn(boss, Direction.Up)

  GAME:FadeIn(60)
  GAME:WaitFrames(160)
  Dialogue(boss, "Normal", "You're back.")
  GAME:WaitFrames(50)
  
  local coro1 = TASK:BranchCoroutine(function() GROUND:EntTurn(boss, Direction.UpLeft)
                                                GAME:WaitFrames(4) 
                                                GROUND:EntTurn(boss, Direction.Left)
                                                GAME:WaitFrames(4)
                                                GROUND:EntTurn(boss, Direction.DownLeft)
                                                GAME:WaitFrames(4)
                                                GROUND:EntTurn(boss, Direction.Down) end)

  
    local coro2 = TASK:BranchCoroutine(function() GAME:WaitFrames(15)
    GROUND:MoveInDirection(plusle, Direction.Up, 140, false, 1.5)  end)
  local coro3 = TASK:BranchCoroutine(function() GAME:WaitFrames(15)
     GROUND:MoveInDirection(minun, Direction.Up, 140, false, 1.5)  end)
     local coro4 = TASK:BranchCoroutine(function()
                                                GROUND:MoveInDirection(player, Direction.Up, 150, false, 1.5)  end)
  local coro5 = TASK:BranchCoroutine(function() --GAME:WaitFrames(20)
                                                GROUND:MoveInDirection(partner, Direction.Up, 150, false, 1.5)  end)

                                                
  TASK:JoinCoroutines({coro1,coro2,coro3,coro4,coro5})
  SOUND:PlayBGM("Wigglytuff's Guild.ogg", true) 

  GAME:WaitFrames(60)
  Dialogue(boss, "Normal", "I suppose that if " .. player:GetDisplayName() .. " is here, that means he has passed the test?")
  Dialogue(plusle, "Happy", "That's right!")
  Dialogue(plusle, "Happy", "And dare I say he passed with flying colors!")
  Dialogue(boss, "Normal", "Oh?[br]How so?")
  GAME:WaitFrames(60)

  Dialogue(minun, "Normal", "Both " .. partner:GetDisplayName() .. " and " .. player:GetDisplayName() .. " worked so well as a team!")
  Dialogue(minun, "Stunned", "We didn't even stand a chance!")
  GROUND:EntTurn(plusle, Direction.UpRight)
  GAME:WaitFrames(4) 
  GROUND:EntTurn(plusle, Direction.Right)
  GAME:WaitFrames(40) 
  Dialogue(plusle, "Worried", "Come on,[pause=30] I wouldn't say that...")
  GROUND:EntTurn(minun, Direction.UpLeft)
  GAME:WaitFrames(4) 
  GROUND:EntTurn(minun, Direction.Left)
  GAME:WaitFrames(40) 
  Dialogue(minun, "Stunned", "You know I'm right!")
  Dialogue(plusle, "Worried", "...")
  GAME:WaitFrames(70) 

  Dialogue(plusle, "Sigh", "Okay, yeah.")
  local coro1 = TASK:BranchCoroutine(function()
    GROUND:EntTurn(plusle, Direction.UpLeft)
                                                GAME:WaitFrames(5) 
                                                GROUND:EntTurn(plusle, Direction.Up) end)
  local coro2 = TASK:BranchCoroutine(function() --GAME:WaitFrames(20)
  GROUND:EntTurn(minun, Direction.UpRight)
  GAME:WaitFrames(5) 
  GROUND:EntTurn(minun, Direction.Up)  end)

    
  TASK:JoinCoroutines({coro1,coro2})
  GAME:WaitFrames(60) 

  Dialogue(plusle, "Happy", "They work surprisingly good together for hating each other's guts a few hours ago!")
  local coro1 = TASK:BranchCoroutine(function() GROUND:EntTurn(player, Direction.UpRight)
    GAME:WaitFrames(5) 
    GROUND:EntTurn(player, Direction.Right) end)
    local coro2 = TASK:BranchCoroutine(function() GROUND:EntTurn(partner, Direction.UpLeft)
      GAME:WaitFrames(5) 
      GROUND:EntTurn(partner, Direction.Left) end)
  TASK:JoinCoroutines({coro1,coro2})
  GAME:WaitFrames(70) 
  Dialogue(player, "Worried", "You think so?")
  GAME:WaitFrames(70) 
  Dialogue(partner, "Worried", "Well,[pause=30] it's true that we were really in sync back there...")
  Dialogue(player, "Worried", "And we complimented our moves pretty well too...")
  GAME:WaitFrames(120) 
  GROUND:CharSetEmote(player, "happy", 0)
  GROUND:CharSetEmote(partner, "happy", 0)
  Dialogue(partner, "Happy", "Maybe we are a great team!")
  Dialogue(player, "Happy", "Maybe!")
  GROUND:CharSetEmote(player, "happy", 1)
  GROUND:CharSetEmote(partner, "happy", 1)

  GAME:WaitFrames(100) 

  Dialogue(boss, "Normal", "Now...")

  local coro1 = TASK:BranchCoroutine(function() GROUND:EntTurn(player, Direction.UpRight)
    GAME:WaitFrames(4) 
    GROUND:EntTurn(player, Direction.Up) end)
    local coro2 = TASK:BranchCoroutine(function() GROUND:EntTurn(partner, Direction.UpLeft)
      GAME:WaitFrames(4) 
      GROUND:EntTurn(partner, Direction.Up) end)
  TASK:JoinCoroutines({coro1,coro2})
  GAME:WaitFrames(60) 

  Dialogue(boss, "Normal", "How about you show me the object I sent you to fetch?")
  Dialogue(player, "Surprised", "Oh right![pause=0] I forgot!")
  Dialogue(player, "Happy", "Here!")
  GROUND:MoveInDirection(player, Direction.Up, 20, false, 1.5)
  GAME:WaitFrames(60) 
  SOUND:FadeOutBGM(80)
  SOUND:PlaySE('Item_Grab')

  GROUND:Unhide('Gummi')
  Monologue(player:GetDisplayName().." left the Gummi on the table.")
  GAME:WaitFrames(80) 
  Dialogue(boss, "Normal", "...")
  Dialogue(boss, "Normal", "...")
  Dialogue(boss, "Normal", "...")
  Dialogue(boss, "Normal", "[speed=0.1]...")

  GAME:WaitFrames(100) 
  UI:SetSpeaker('', true, player.CurrentForm.Species, player.CurrentForm.Form, player.CurrentForm.Skin, player.CurrentForm.Gender)
  UI:SetSpeakerEmotion("Stunned")
  UI:WaitShowDialogue("(She's taking her time...)")
  GAME:WaitFrames(60) 

  Dialogue(boss, "Normal", "...")
  Dialogue(boss, "Normal", "I suppose this makes it official then.")

  SOUND:PlayBGM("Wigglytuff's Guild.ogg", true) 
  Dialogue(boss, "Happy", "Welcome to the guild, " .. player:GetDisplayName() .. "!")
  GAME:WaitFrames(60) 
  UI:SetSpeaker('', true, player.CurrentForm.Species, player.CurrentForm.Form, player.CurrentForm.Skin, player.CurrentForm.Gender)
  UI:SetSpeakerEmotion("Sigh")
  UI:WaitShowDialogue("(I don't know why I was so nervous there...)")
  GAME:WaitFrames(60) 

  Dialogue(player, "Stunned", "Yay...[pause=50] I guess?")
  GAME:WaitFrames(60) 
  Dialogue(player, "Worried", "So do I just leave the Gummi there?")
  Dialogue(boss, "Normal", "You can keep it.[br]It may not be too useful to you, since it's a Golden Gummi, but you should keep it regardless.")

  --I think this is how you do it?
  local bagSpace = GAME:GetPlayerBagLimit()
  local itemAmount = GAME:GetPlayerBagCount() + GAME:GetPlayerEquippedCount()
    if bagSpace > itemAmount then
      Dialogue(boss, "Normal", "Make sure to keep it safe.[pause=0] Gummis are not as common as you may think.")
      GAME:GivePlayerItem("gummi_gold")
      GROUND:Hide('Gummi')
      
    elseif bagSpace == itemAmount then
      Dialogue(boss, "Worried", "Though I can see your bag is pretty much filled.")
      GAME:GivePlayerStorageItem("gummi_gold")
      
      Dialogue(boss, "Normal", "I'll make sure it is taken to storage, so don't worry about it.")
    end
    GROUND:AnimateInDirection(player, "Walk", Direction.Up, Direction.Down, 20, 3, 1.5) --This means "move down while facing up using the walk animation"
  GAME:WaitFrames(50) 

  Dialogue(boss, "Normal", "For now, " .. plusle:GetDisplayName() .. " and " .. minun:GetDisplayName() .. ", you are dismissed.")
  Dialogue(boss, "Normal", "We will sort " .. player:GetDisplayName().."'s details now, and I'm sure you don't want to hear that, do you?")
  GROUND:EntTurn(plusle, Direction.UpRight)
  GAME:WaitFrames(4) 
  GROUND:EntTurn(plusle, Direction.Right)
  GAME:WaitFrames(40) 

  Dialogue(plusle, "Happy", "Let's go, bro! I really need to sleep today.")
  Dialogue(plusle, "Pain", "That fight got me really beat.")
  GROUND:EntTurn(minun, Direction.UpLeft)
  GAME:WaitFrames(4) 
  GROUND:EntTurn(minun, Direction.Left)
  Dialogue(minun, "Pain", "That makes two.")
  Dialogue(minun, "Pain", "I just wanna crash on my bed...")

  GROUND:EntTurn(partner, Direction.UpLeft)
  GAME:WaitFrames(4) 
  GROUND:EntTurn(partner, Direction.Left)
  GAME:WaitFrames(4) 
  GROUND:EntTurn(partner, Direction.DownLeft)
  GAME:WaitFrames(4) 
  GROUND:EntTurn(partner, Direction.Down)
  GAME:WaitFrames(50) 

  Dialogue(partner, "Happy", "Goodbye, team [color=#FFA5FF]Overcharge[color]![br]It was a nice battle!")
  GROUND:EntTurn(player, Direction.UpRight)
  GAME:WaitFrames(4) 
  GROUND:EntTurn(player, Direction.Right)
  GAME:WaitFrames(4) 
  GROUND:EntTurn(player, Direction.DownRight)
  GAME:WaitFrames(4) 
  GROUND:EntTurn(player, Direction.Down)
  GAME:WaitFrames(50) 
  Dialogue(player, "Happy", "Yeah![br]I gotta admit it was fun!")
  Dialogue(player, "Happy", "You guys were so strong!")
  SOUND:FadeOutBGM(80)

  GROUND:EntTurn(player, Direction.DownRight)
  GAME:WaitFrames(70) 

  Dialogue(player, "Happy", "Specially you, ".. minun:GetDisplayName() ..", was it?")
  GROUND:EntTurn(minun, Direction.UpLeft)

  Dialogue(minun, "Stunned", "[speed=0.2]...")
  GAME:WaitFrames(70) 

  Dialogue(minun, "Stunned", "You really think so?")
  Dialogue(player, "Happy", "Yeah!")
  Dialogue(player, "Worried", "I never thought I'd say this but...")
  Dialogue(player, "Happy", "I want to battle you again sometime!")

  Dialogue(minun, "Stunned", "...")
  GAME:WaitFrames(70) 
  SOUND:PlayBGM("Wigglytuff's Guild.ogg", true) 

  Dialogue(minun, "Happy", "Th-[pause=50]Thank you!")
  Dialogue(minun, "Happy", "I'd be glad to battle you again!")

  GAME:WaitFrames(50)
  Dialogue(plusle, "Happy", "Already becoming friends with the newbie, huh?")
  GROUND:EntTurn(minun, Direction.UpLeft)
  GAME:WaitFrames(6)
  GROUND:EntTurn(minun, Direction.Left)
  GAME:WaitFrames(6)

  Dialogue(minun, "Normal", "Maybe...")


  GAME:WaitFrames(70)

  Dialogue(plusle, "Normal", "Alright,[pause=40] let's get going!")
  Dialogue(minun, "Happy", "I'll race you there!")
  SOUND:PlaySE('Battle/EVT_Emote_Exclaim_2')
  GROUND:CharSetEmote(plusle, "exclaim", 1)
  GROUND:EntTurn(player, Direction.Down)
  GROUND:EntTurn(plusle, Direction.Down)
 
  GROUND:MoveInDirection(minun, Direction.Down, 100, true, 3)
  GAME:WaitFrames(70)

  Dialogue(plusle, "Sigh", "And there he goes...")
  Dialogue(player, "Stunned", "I thought he was shy.")

  GROUND:EntTurn(plusle, Direction.DownRight)
  GAME:WaitFrames(4)
  GROUND:EntTurn(plusle, Direction.Right)
  GAME:WaitFrames(4)
  GROUND:EntTurn(plusle, Direction.UpRight)
  GAME:WaitFrames(4)
  GROUND:EntTurn(plusle, Direction.Up)

  Dialogue(plusle, "Worried", "He is with those that he doesn't know very well.")
  Dialogue(plusle, "Happy", "I've seen that smile he gave you like three times in my life!")
  Dialogue(plusle, "Happy", "He must have taken a liking to you!")
  GAME:WaitFrames(30)

  Dialogue(player, "Worried", "You think so?")
  Dialogue(plusle, "Happy", "I do!")

  GAME:WaitFrames(50)
  Dialogue(plusle, "Normal", "Now, if you'll excuse me, I have to go after my brother.")
  GROUND:EntTurn(plusle, Direction.UpRight)
  GAME:WaitFrames(4)
  GROUND:EntTurn(plusle, Direction.Right)
  GAME:WaitFrames(4)
  GROUND:EntTurn(plusle, Direction.DownRight)
  GAME:WaitFrames(4)
  GROUND:EntTurn(plusle, Direction.Down)
  GAME:WaitFrames(60)

  Dialogue(plusle, "Shouting", minun:GetDisplayName().."![br]Don't you dare get lost again!")
  GROUND:MoveInDirection(plusle, Direction.Down, 100, true, 3)

  GAME:WaitFrames(80)
  Dialogue(partner, "Worried", "Those two never cease to amaze me...")
  GAME:WaitFrames(80)

  Dialogue(boss, "Normal", "Let's get back to the point,[pause=40] if you please.")

  local coro1 = TASK:BranchCoroutine(function() GROUND:EntTurn(player, Direction.DownRight)
    GAME:WaitFrames(4) 
    GROUND:EntTurn(player, Direction.Right)
    GAME:WaitFrames(4)
    GROUND:EntTurn(player, Direction.UpRight)
    GAME:WaitFrames(4)
    GROUND:EntTurn(player, Direction.Up) end)
  local coro2 = TASK:BranchCoroutine(function() GROUND:EntTurn(partner, Direction.DownLeft)
    GAME:WaitFrames(4) 
    GROUND:EntTurn(partner, Direction.Left)
    GAME:WaitFrames(4)
    GROUND:EntTurn(partner, Direction.UpLeft)
    GAME:WaitFrames(4)
    GROUND:EntTurn(partner, Direction.Up) end)
  TASK:JoinCoroutines({coro1,coro2})
  GAME:WaitFrames(60) 
  Dialogue(boss, "Normal", "First of all, we must sort your team.")
  GAME:WaitFrames(80) 

  Dialogue(player, "Worried", "Team?")


  Dialogue(boss, "Normal", "Yes.[br]Everyone knows that being alone while being wanted is never a good idea.[br]And that is why by being on groups of two or more is always better.")
  local coro1 = TASK:BranchCoroutine(function() GROUND:EntTurn(player, Direction.UpRight)
    GAME:WaitFrames(6) 
    GROUND:EntTurn(player, Direction.Right) end)
  local coro2 = TASK:BranchCoroutine(function() GROUND:EntTurn(partner, Direction.UpLeft)
    GAME:WaitFrames(6) 
    GROUND:EntTurn(partner, Direction.Left) end)
  TASK:JoinCoroutines({coro1,coro2})
 
  Dialogue(partner, "Worried", "Have you seen the teams from [color=#03f8fc]Aggron's Guild[color]?")
  Dialogue(partner, "Normal", "Something like that.")
  GAME:WaitFrames(50) 

  Dialogue(boss, "Normal", "Something like that indeed.")
  local coro1 = TASK:BranchCoroutine(function() GROUND:EntTurn(player, Direction.UpRight)
    GAME:WaitFrames(6) 
    GROUND:EntTurn(player, Direction.Up) end)
  local coro2 = TASK:BranchCoroutine(function() GROUND:EntTurn(partner, Direction.UpLeft)
    GAME:WaitFrames(6) 
    GROUND:EntTurn(partner, Direction.Up) end)
  TASK:JoinCoroutines({coro1,coro2})
  Dialogue(boss, "Normal", "Did you have anyone in mind to team up with?")
  SOUND:FadeOutBGM(80)
  Dialogue(player, "Worried", "Anyone in mind...?")
  GAME:WaitFrames(100) 

  Dialogue(boss, "Normal", "If you don't mind me suggesting...")
  Dialogue(boss, "Normal", "I think you two would make a great team together.")
  GROUND:CharSetEmote(player, "shock", 1)
  GROUND:CharSetEmote(partner, "shock", 1)

  SOUND:PlaySE('Battle/EVT_Emote_Shock')
  GAME:WaitFrames(100) 

  Dialogue(partner, "Surprised", "What?!")
  Dialogue(player, "Surprised", "We met each other today!")
  Dialogue(player, "Stunned", "I don't want to sound rude, but...")
  Dialogue(player, "Stunned", "People that just met can't form a succesful team, can they?") --Funny reference to literally every pmd game ever made.
  Dialogue(player, "Worried", "I mean...")
  Dialogue(player, "Worried", plusle:GetDisplayName() .. ' and '.. minun:GetDisplayName() .." are literally brothers.")
  Dialogue(player, "Worried", "How could we work better than them?")

  GAME:WaitFrames(100) 

  Dialogue(boss, "Worried", "Well, there's for sure no certainty that you will make a good team...")
  Dialogue(boss, "Normal", "But seeing what " .. plusle:GetDisplayName() .. " and " .. minun:GetDisplayName() .." say about what you two did together on mission that was supposed to be for " .. player:GetDisplayName().." only...")
  GAME:WaitFrames(50) 
  
  Dialogue(partner, "Stunned", "...") --Bro forgot she didn't have to fight
  Dialogue(boss, "Normal", "I'm sure you two can make a good team together.")
  Dialogue(boss, "Normal", "Of course, this is just a suggestion, [pause=50]and it will depend solely on you.")
  GAME:WaitFrames(80) 

  UI:SetSpeaker('', true, player.CurrentForm.Species, player.CurrentForm.Form, player.CurrentForm.Skin, player.CurrentForm.Gender)
  UI:SetSpeakerEmotion("Worried")
  UI:WaitShowDialogue("(It's not like I have anyone better to join...)")

  GROUND:EntTurn(player, Direction.UpRight)
  GAME:WaitFrames(6) 
  GROUND:EntTurn(player, Direction.Right)
  GAME:WaitFrames(40) 
  Dialogue(player, "Happy", "If she wants to,[pause=50] I've got no objections!")
  GAME:WaitFrames(40) 


  GROUND:EntTurn(partner, Direction.UpLeft)
  GAME:WaitFrames(6) 
  GROUND:EntTurn(partner, Direction.Left)
  GAME:WaitFrames(80) 
  GROUND:CharSetEmote(partner, "sweating", 1)
  SOUND:PlaySE('Battle/EVT_Emote_Sweating')
  GAME:WaitFrames(110)
  Dialogue(partner, "Stunned", "Well,[pause=40] ummm...")
  GAME:WaitFrames(50)   
  Dialogue(partner, "Worried", "It's true that I've waited for someone to form a proper team with,[pause=60] but...")
  

  GAME:WaitFrames(70)   

  Dialogue(partner, "Worried", "Are you sure you want to team up with me[pause=50] out of everyone here?")
  GAME:WaitFrames(100)   
  
  Dialogue(player, "Worried", "Well...")
  Dialogue(player, "Worried", "It's not like I have a lot of options.")
  Dialogue(player, "Worried", "And going solo is definitely not an option for me.")
  
  GAME:WaitFrames(70)   
  Dialogue(partner, "Worried", "...")
  GAME:WaitFrames(80)   

  Dialogue(partner, "Worried", "Well, if you really want to...")
  Dialogue(partner, "Happy", "I've got no problem with it!")
  Dialogue(partner, "Happy", "It'll be nice to finally have someone to talk to!")
  Dialogue(boss, "Normal", "That's settled then.")

  local coro1 = TASK:BranchCoroutine(function() GROUND:EntTurn(player, Direction.UpRight)
    GAME:WaitFrames(6) 
    GROUND:EntTurn(player, Direction.Up) end)
  local coro2 = TASK:BranchCoroutine(function() GROUND:EntTurn(partner, Direction.UpLeft)
    GAME:WaitFrames(6) 
    GROUND:EntTurn(partner, Direction.Up) end)
  TASK:JoinCoroutines({coro1,coro2})
  GAME:WaitFrames(50) 

  Dialogue(boss, "Normal", "Now that this is done, we need a team name for you two.")
  GAME:WaitFrames(50) 

  Dialogue(partner, "Stunned", "Oh, right.[br]I forgot about that...")

  Dialogue(partner, "Worried", "Guess I never really thought about one before,[pause=50] being alone and all that.")
 
  GAME:WaitFrames(70) 
  Dialogue(partner, "Worried", "...")
  GAME:WaitFrames(70) 

  Dialogue(partner, "Pain", "I don't have any ideas...")
  Dialogue(partner, "Pain", "Geez, putting names on things is truly not my thing.")
  GAME:WaitFrames(50) 

  local coro1 = TASK:BranchCoroutine(function() GROUND:EntTurn(player, Direction.UpRight)
    GAME:WaitFrames(6) 
    GROUND:EntTurn(player, Direction.Right) end)
  local coro2 = TASK:BranchCoroutine(function() GROUND:EntTurn(partner, Direction.UpLeft)
    GAME:WaitFrames(6) 
    GROUND:EntTurn(partner, Direction.Left) end)
  TASK:JoinCoroutines({coro1,coro2})
  GAME:WaitFrames(70) 
  Dialogue(partner, "Worried", player:GetDisplayName() .. ",[pause=50] would you mind choosing one for us?")
  Dialogue(partner, "Happy", "I don't have any preferences, so choose whatever you feel like choosing!")
  GAME:WaitFrames(50) 
  Dialogue(player, "Worried", "Anything?[br]You don't mind?")
  GAME:WaitFrames(40) 
  Dialogue(partner, "Worried", "It's not like I have any ideas myself.")
  GAME:WaitFrames(60) 
  UI:SetSpeaker('', true, player.CurrentForm.Species, player.CurrentForm.Form, player.CurrentForm.Skin, player.CurrentForm.Gender)
  UI:SetSpeakerEmotion("Worried")
  UI:WaitShowDialogue("(What could a good team name be?)")

  UI:NameMenu("What will you name your team?", "Remember you don't need to put 'Team' in it.", 60)
  UI:WaitForChoice()
  local team = UI:ChoiceResult()
  GAME:SetTeamName(team)
  GAME:WaitFrames(60) 

  Dialogue(player, "Normal", "What about " .. GAME:GetTeamName() .. "?")
  Dialogue(partner, "Worried", "Team " .. GAME:GetTeamName() .. "?")
  Dialogue(player, "Normal", "Yeah.")
  Dialogue(player, "Worried", "What do you think?")

  GAME:WaitFrames(60) 
  Dialogue(partner, "Worried", "...")

  Dialogue(player, "Sad", "It sucks, I know...")

  Dialogue(partner, "Normal", "No, it doesn't!")
  Dialogue(partner, "Happy", "I think it sounds great!")
  GAME:WaitFrames(60) 

  Dialogue(boss, "Normal", "I must say it has some charm to it.")
  GAME:WaitFrames(60) 
  Dialogue(player, "Stunned", "You think so?")
  Dialogue(partner, "Happy", "That's definitely better than any I had in mind!")

  local coro1 = TASK:BranchCoroutine(function() GROUND:EntTurn(player, Direction.UpRight)
    GAME:WaitFrames(6) 
    GROUND:EntTurn(player, Direction.Up) end)
  local coro2 = TASK:BranchCoroutine(function() GROUND:EntTurn(partner, Direction.UpLeft)
    GAME:WaitFrames(6) 
    GROUND:EntTurn(partner, Direction.Up) end)
  TASK:JoinCoroutines({coro1,coro2})

  Dialogue(partner, "Determined", "Let's use that one as our team name!")

  GAME:WaitFrames(60) 
  Dialogue(boss, "Happy", "Very well, we're almost done now!")
  Dialogue(boss, "Normal", "We just need a place for him to stay.")
  Dialogue(boss, "Worried", "But...[br]We have little to none of that...")
  Dialogue(boss, "Worried", "A hideout carved inside a cave has its drawbacks...")

  GAME:WaitFrames(60) 

  Dialogue(partner, "Normal", player:GetDisplayName() .. " can stay in my room if he wants to.")
  Dialogue(partner, "Worried", "It would feel nice to finally have someone to share it with...")
  GAME:WaitFrames(60) 

  Dialogue(boss, "Normal", player:GetDisplayName().."?")
  Dialogue(player, "Happy", "Sure!")
  Dialogue(player, "Pain", "Better than sleeping in a warehouse,[pause=20] or something.")

  Dialogue(boss, "Normal", "Alright.")
  GAME:WaitFrames(30) 

  SOUND:PlaySE('Item_Grab')
  GROUND:Unhide('Box')
  GAME:WaitFrames(70) 
  Dialogue(boss, "Normal", "This is for you, " .. player:GetDisplayName() .. ".")

  Dialogue(player, "Normal", "Oh?")
  
  GROUND:EntTurn(player, Direction.UpRight)
  GAME:WaitFrames(60) 
  SOUND:PlaySE('Item_Grab')
  GROUND:Hide('Box')
  Monologue(player:GetDisplayName() .. " grabbed the box and opened it.")
  
  Monologue("Inside, there was...")
	SOUND:FadeOutBGM(60)

  SOUND:PlayFanfare("Fanfare/Item")
  Monologue("A Normal Map...")
  SOUND:PlayFanfare("Fanfare/Item")
  Monologue("An old but strong looking Treasure Bag...")
  SOUND:PlayFanfare("Fanfare/Item")
  Monologue("And a stolen and modified Badge!")

  GAME:WaitFrames(80) 
  SOUND:PlayBGM("Wigglytuff's Guild.ogg", true) 
  Dialogue(player, "Worried", "What's all of this?")

  Dialogue(boss, "Normal", "This is the basic needs for anyone that desires to explore, [pause=50]whether with Aggron's Guild, or with us.")
  Dialogue(boss, "Normal", "A map to know your location,[pause=50] a bag to carry items, [pause=50]and a badge to display your membership, team name, and rank.")
  GAME:WaitFrames(80) 
  Dialogue(boss, "Normal", "It's not only decorative, however.[br]It will also let you warp out of dungeons together with other Pokémon,[pause=40] among other things.")
  
  _DATA.Save.ActiveTeam:SetRank("rookie")

  SOUND:PlaySE('Battle/EVT_Emote_Confused_2')
  GROUND:CharSetEmote(player, "question", 1)
  GAME:WaitFrames(90) 

  Dialogue(player, "Worried", "Did you say rank?")

  GROUND:CharTurnToCharAnimated(partner, player, 5)
  GROUND:CharTurnToCharAnimated(player, partner, 5) --DID THIS EXIST FROM THE BEGGINING AND I DIDN'T KNOW??

  GAME:WaitFrames(50) 

  Dialogue(partner, "Normal", "Rank is what tells other Pokémon how...")
  Dialogue(partner, "Worried", "Let's say 'good', you are at being a thief.")
  Dialogue(partner, "Normal", "Complete tasks succesfully and your rank will increase.")

  Dialogue(player, "Worried", "Tasks?")
  GAME:WaitFrames(70) 

  Dialogue(boss, "Normal", "That will be explained to you tomorrow.")
  GROUND:CharAnimateTurn(player, Direction.Up, 5, true)
  GROUND:CharAnimateTurn(partner, Direction.Up, 5, false)
  GAME:WaitFrames(50) 

  Dialogue(boss, "Normal", "For now, take the remaining of the day left to rest,[pause=50] or you can explore our hideout if you wish.")

  Dialogue(boss, "Happy", "You're dismissed, team " .. GAME:GetTeamName() .. ".")

  
  GROUND:CharTurnToCharAnimated(partner, player, 5)
  GROUND:CharTurnToCharAnimated(player, partner, 5)
  Dialogue(partner, "Happy", "Come on, " .. player:GetDisplayName() .."!")
  Dialogue(partner, "Normal", "I can show you around, if you want.")
  Dialogue(partner, "Worried", "Though, I'm sure you must be tired after that test...")
  Dialogue(player, "Worried", "I am tired, [pause=30]that's for sure...")
  GAME:WaitFrames(60) 
  Dialogue(player, "Normal", "But I think that knowing my way in here should be a priority.")
  Dialogue(partner, "Happy", "Perfect!")
  Dialogue(partner, "Normal", "Then let's go!")

  GAME:FadeOut(false, 40)
  GAME:EnterZone('thieves_hideout', -1, 6, 0)



end
function Dialogue(sp, emote, txt)
  UI:SetSpeaker(sp)
  UI:SetSpeakerEmotion(emote)
  UI:WaitShowDialogue(txt)


end
function Monologue(str)
	UI:ResetSpeaker(false)
	UI:SetCenter(true)
	UI:SetAutoFinish(true)
	UI:WaitShowDialogue(str)
	UI:SetAutoFinish(false)
	UI:SetCenter(false)
end 
function bossEasterEggs()
 --Funny actions for the boss.
  --If you have officially joined, and are not on a story cutscene, choose an easter egg randomly.
  SV.guildmasters_office.action = math.random(1, 20)

  --Now tp to the correct places before the game fades in.
  if SV.guildmasters_office.action >= 15 then
    --75% chance to do nothing
  elseif SV.guildmasters_office.action == 17 or SV.guildmasters_office.action == 16 then
    --10% chance to be watering plants
  elseif SV.guildmasters_office.action == 18 or SV.guildmasters_office.action == 19 then
    --10% chance to be checking the loot.
  elseif SV.guildmasters_office.action == 20 then
    --5% chance for a special lore event 





  end
  --Numbers are not accurate cus I can't do math lol

end
-------------------------------
-- Entities Callbacks
-------------------------------
function guildmasters_office.exit_0_Touch(obj, activator)
  GAME:FadeOut(false, 20)
  SV.partner.entrance = 0
  GAME:EnterZone('thieves_hideout', -1, 6, 0)




end

return guildmasters_office

