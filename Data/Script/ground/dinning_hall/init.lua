--[[
    init.lua
    Created: 04/10/2024 13:02:13
    Description: Autogenerated script file for the map dinning_hall.
]]--
-- Commonly included lua functions and data
require 'common'

-- Package name
local dinning_hall = {}

-- Local, localized strings table
-- Use this to display the named strings you added in the strings files for the map!
-- Ex:
--      local localizedstring = MapStrings['SomeStringName']
local MapStrings = {}

-------------------------------
-- Map Callbacks
-------------------------------
---dinning_hall.Init(map)
--Engine callback function
function dinning_hall.Init(map)

  --This will fill the localized strings table automatically based on the locale the game is 
  -- currently in. You can use the MapStrings table after this line!
  MapStrings = COMMON.AutoLoadLocalizedStrings()
  COMMON.RespawnAllies()
  if not SV.guild.having_dinner then
    local partners = CH('Teammate1')
    AI:SetCharacterAI(partners, "ai.ground_partner", CH('PLAYER'), partners.Position)
    AI:EnableCharacterAI(partners)
    partners.CollisionDisabled = true
   
    GROUND:Hide('food')
    GROUND:Hide('food_2')
    GROUND:Hide('food_3')
    GROUND:Hide('food_4')
    GROUND:Hide('food_5')
    GROUND:Hide('food_6')
    GROUND:Hide('food_7')
    GROUND:Hide('food_8')
    GROUND:Hide('food_9')

    GROUND:Hide('food_10')
    GROUND:Hide('food_1')
    GROUND:Hide('celia_dinning')
    GROUND:Hide('Eve')
    GROUND:Hide('dex')
    GROUND:Hide('kit')
    GROUND:Hide('lilith')
    GROUND:Hide('boss')
    GROUND:Hide('kiran')
    GROUND:Hide('lily')

    GROUND:Hide('lucio')


    local celia = CH('Celia_regular')
    
    AI:SetCharacterAI(celia,                                      --[[Entity that will use the AI]]--
    "ai.ground_default",                         --[[Class path to the AI class to use]]--
    RogueElements.Loc(48, 72), --[[Top left corner pos of the allowed idle wander area]]--
    RogueElements.Loc(275, 143), --[[Width and Height of the allowed idle wander area]]--
    0.5,                                         --[[Wandering speed]]--
    32,                                          --[[Min move distance for a single wander]]--
    100,                                          --[[Max move distance for a single wander]]--
    130,                                         --[[Min delay between idle actions]]--
    320);                                        --[[Max delay between idle actions]]--

    


  else
    GROUND:Hide('Celia_regular')



  end

end
function dinning_hall.Celia_regular_Action(obj, activator)
  local player = activator
  local partner = CH('Teammate1')
  local celia = obj
  GAME:CutsceneMode(true)

  GROUND:CharTurnToChar(partner, celia)
  GROUND:CharTurnToChar(celia, player)
  GROUND:CharTurnToChar(player, celia)


  if not SV.guild.presented_to_celia then
    --I have no idea how to make this accent. Pls, don't kill me.
    SOUND:PlaySE('Battle/EVT_Emote_Exclaim_2')
    GROUND:CharSetEmote(celia, "exclaim", 1)
    GAME:WaitFrames(60)
    UI:SetSpeaker(STRINGS:Format("\\uE040"), true, celia.CurrentForm.Species, celia.CurrentForm.Form, celia.CurrentForm.Skin, celia.CurrentForm.Gender)
    UI:SetSpeakerEmotion('Angry')
    UI:WaitShowDialogue("OY!")
    UI:WaitShowDialogue("What'chu think yer doin' here, eh?!")
    UI:WaitShowDialogue("Tryna steal some of me food 'fore dinner?")
    Dialogue(player, "Surprised", "What?!")
    Dialogue(partner, "Surprised", "N-No![br]We were just going to-")

    
    GROUND:CharSetEmote(celia, "happy", 0)

    UI:SetSpeaker(STRINGS:Format("\\uE040"), true, celia.CurrentForm.Species, celia.CurrentForm.Form, celia.CurrentForm.Skin, celia.CurrentForm.Gender)
    UI:SetSpeakerEmotion('Joyous')
    UI:WaitShowDialogue("Hehe,[pause=40] I was just toyin' with ye!")
    UI:WaitShowDialogue("I know ye'd neva try t'steal from any of us, ".. partner:GetDisplayName().."!")
    GROUND:CharSetEmote(celia, "happy", 1)
    Dialogue(partner, "Stunned", "Oh...")
    Dialogue(partner, "Sigh", "You scared me for a second there, " .. celia:GetDisplayName()..".")
    Dialogue(celia, "Happy", "Ye ain't da first mon that's said that, don't worry 'bout it.")
    GAME:WaitFrames(50)
    GROUND:CharTurnToChar(celia, player)
    Dialogue(celia, "Worried", "And who are ye?")
    Dialogue(celia, "Worried", "Never seen yer face 'round here...")
    Dialogue(partner, "Happy", celia:GetDisplayName()..",[pause=40] this is " .. player:GetDisplayName() ..".[br]He is the newest recruit to the guild!")
    Dialogue(player, "Stunned", "H-[pause=30]Hi...") --Player is still stunned from the shout from Celia. 

    GROUND:CharTurnToChar(partner, player)

    Dialogue(partner, "Normal", player:GetDisplayName()..",[pause=40] this is " .. celia:GetDisplayName() ..".[br]She may look tough at first, but get to know her, and you'll see she's sweeter than a piece of cake.[br]She is also our beloved cook and most experienced fighter.[br]She's the one in charge of making our dinner for everyone to enjoy.")
    Dialogue(partner, "Happy", "She does that very well too![br]I can assure you that you will love anything she cooks for you!")
    GAME:WaitFrames(40)
    GROUND:CharTurnToChar(celia, partner)

    Dialogue(celia, "Happy", "Oh sweetie, ye flatter me!") 
    GAME:WaitFrames(70)
  
    GROUND:CharTurnToChar(celia, player)
    Dialogue(celia, "Normal", "But anyways...") 
    Dialogue(celia, "Happy", "Nice to meet ye, "..player:GetDisplayName().."!") 
    Dialogue(celia, "Happy", "Hopefully ye'll feel comfortable 'round 'ere![br]Ye got one of the best partners in da place to call your friend!") 
    Dialogue(partner, "Stunned", "Ummm...[pause=40] actually...")
    GAME:WaitFrames(40)
    GROUND:CharTurnToCharAnimated(partner, player, 5)
    GAME:WaitFrames(50)
    GROUND:CharTurnToCharAnimated(partner, celia, 5)
    GAME:WaitFrames(20)

    Dialogue(partner, "Pain", "Nevermind...")
    Dialogue(partner, "Happy", "Thanks for the compliment!")

    GAME:WaitFrames(60)


    Dialogue(celia, "Worried", "...")
    GAME:WaitFrames(60)

    Dialogue(celia, "Normal", "'Nyways.")
    Dialogue(celia, "Happy", "Sorry fer the scare, " .. player:GetDisplayName().."!")
    GROUND:CharSetEmote(celia, "happy", 0)
    Dialogue(celia, "Joyous", "Haha!") 
    GROUND:CharSetEmote(celia, "happy", 1)
    GAME:WaitFrames(80)
    Dialogue(celia, "Normal", "Well, t'was nice meeting ye and all, but I've got to cook some more food fer tomorrow.")
    Dialogue(celia, "Happy", "I better see ye on da morning meeting!")

    Dialogue(partner, "Happy", "You will, don't worry!")
    Dialogue(partner, "Happy", "Bye for now, " .. celia:GetDisplayName().."!")
    Dialogue(player, "Happy", "Bye!")
    Dialogue(celia, "Happy", "See ye!")





    SV.guild.presented_to_celia = true
  else
    if not SV.guildmasters_office.officially_joined then
      GROUND:CharTurnToChar(partner, celia)
      GROUND:CharTurnToChar(celia, player)
      Dialogue(celia, "Happy", "I'm happy to've met ye, " .. player:GetDisplayName()..", but work waits fer none!")
      Dialogue(celia, "Normal", "I've gotta go back to me cooking, so I'd be very grateful if ye'd let me to it!")
      Dialogue(celia, "Happy", "See ye tomorrow, sweetie!")

    else --Another day
      if SV.progression.chapter == 2 then -- if chapter two
        if not SV.progression.first_day_done then
          GROUND:CharTurnToChar(obj, activator)
          CommonFunctions.Dialogue(obj, 3, "Worried", "Yes, " .. player:GetDisplayName() ..".[br]Me job 'ere is to cook everyday.")
          CommonFunctions.Dialogue(obj, 3, "Happy", "But don't ye think it makes me sad, or anythin'!")
          CommonFunctions.Dialogue(obj, 3, "Happy", "Now quit wastin' yer time with this ol' bag of bones and go do yer mission!")
    
          
    
    
    
        end
    
    
    
      end



    end

  end


  GAME:CutsceneMode(false)


end
function Dialogue(sp, emote, txt)
  UI:SetSpeaker(sp)
  UI:SetSpeakerEmotion(emote)
  UI:WaitShowDialogue(txt)


end
---dinning_hall.Enter(map)
--Engine callback function
function dinning_hall.Enter(map)

  GAME:FadeIn(20)

end

---dinning_hall.Exit(map)
--Engine callback function
function dinning_hall.Exit(map)


end

---dinning_hall.Update(map)
--Engine callback function
function dinning_hall.Update(map)


end
function Dialogue(sp, emote, txt)
  UI:SetSpeaker(sp)
  UI:SetSpeakerEmotion(emote)
  UI:WaitShowDialogue(txt)


end
---dinning_hall.GameSave(map)
--Engine callback function
function dinning_hall.GameSave(map)
  local partner = CH('Teammate1')
  SV.partner.positionX = partner.Position.X
	SV.partner.positionY = partner.Position.Y
	SV.partner.direction = DirToNum(partner.Direction)

end

---dinning_hall.GameLoad(map)
--Engine callback function
function dinning_hall.GameLoad(map)
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
function dinning_hall.exit_Touch(obj, activator)
  SV.partner.entrance = 2
  GAME:FadeOut(false, 20)
  GAME:EnterZone('thieves_hideout', -1, 7, 4)

end
function dinning_hall.Teammate1_Action(obj, activator)
	GAME:CutsceneMode(true)

	if not SV.guildmasters_office.officially_joined then
	
	GROUND:CharTurnToCharAnimated(obj, activator, 5)
	GROUND:CharTurnToCharAnimated(activator, obj, 5)
	Dialogue(obj, "Normal", "This is the dinning hall.")
	Dialogue(obj, "Normal", "Here, our cook [color=#00ffff]Celia[color] serves us dinner every night.")
	Dialogue(obj, "Sad", "I'm pretty sure we missed it today, but...")
	Dialogue(obj, "Happy", "You'll be delighted when you try her food tomorrow!")
	Dialogue(obj, "Happy", "Trust me,[pause=30] it's worth the wait!")

	end

	GAME:CutsceneMode(false)

end
return dinning_hall
