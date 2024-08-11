require 'common'

CommonFunctions = {}
function CommonFunctions.Monologue(str)
	UI:ResetSpeaker(false)
	UI:SetCenter(true)
	UI:SetAutoFinish(true)
	UI:WaitShowDialogue(str)
	UI:SetAutoFinish(false)
	UI:SetCenter(false)
end 
function CommonFunctions.Dialogue(sp, state, emote, txt)
    if state == 0 then --Speaker is unknown and invisible
        UI:SetSpeaker(STRINGS:Format("\\uE040"), true, "", -1, "", RogueEssence.Data.Gender.Unknown)
    elseif state == 1 then --Speaker is unknown, but visible (AKA, you don't know their name)
        UI:SetSpeaker(STRINGS:Format("\\uE040"), true, sp.CurrentForm.Species, sp.CurrentForm.Form, sp.CurrentForm.Skin, sp.CurrentForm.Gender)
    elseif state == 2 then --Speaker is thinking to themselves. (Parenthesis are NOT included here.)
        UI:SetSpeaker("", true, sp.CurrentForm.Species, sp.CurrentForm.Form, sp.CurrentForm.Skin, sp.CurrentForm.Gender)
    else --Speaker speaks regularly
        UI:SetSpeaker(sp)
    end
    if state ~= 0 then
        UI:SetSpeakerEmotion(emote)
    end
    UI:WaitShowDialogue(txt)
end
function CommonFunctions.Wakey()
	GAME:CutsceneMode(true)
    GROUND:Hide('fire')

    local player = CH('PLAYER')
    local partner = CH('Teammate1')
    local kit = CH('Kit')
    SV.meeting_done = false
    GROUND:RemoveMapStatus("dark")
    GROUND:Unhide('Kit')
    GROUND:CharSetAnim(partner, "Laying", true)
    GROUND:CharSetAnim(player, "Laying", true)
    GAME:MoveCamera(70, 142, 1, false)
    GAME:WaitFrames(180)
    UI:ResetSpeaker()
    UI:WaitShowDialogue("Goooood morning, team " .. GAME:GetTeamName() .."!")
    GAME:FadeIn(20)
    GAME:WaitFrames(60)
    CommonFunctions.Dialogue(kit, 3, "Normal", "It's a bright new day, so get moving!")
    GAME:WaitFrames(60)

    GROUND:CharSetDrawEffect(partner, DrawEffect.Trembling)
    GAME:WaitFrames(10)
    GROUND:CharSetDrawEffect(player, DrawEffect.Trembling)
    GAME:WaitFrames(10)
    GROUND:CharEndDrawEffect(partner, DrawEffect.Trembling)
    GAME:WaitFrames(10)
    GROUND:CharEndDrawEffect(player, DrawEffect.Trembling)
    GAME:WaitFrames(60)
    CommonFunctions.Dialogue(player, 3, "Dizzy", "Ugh...")
    CommonFunctions.Dialogue(partner, 3, "Dizzy", "Good morning, " .. player:GetDisplayName() .. "...")
    GAME:WaitFrames(30)
    GROUND:CharSetAnim(partner, "Wake", false)
    GROUND:CharSetAnim(player, "Wake", false)
    GAME:WaitFrames(60)
    GROUND:CharTurnToChar(player, kit)
    GAME:WaitFrames(60)
    CommonFunctions.Dialogue(kit, 3, "Normal", "Come on, don't look at me like that.")

    CommonFunctions.Dialogue(kit, 3, "Normal", "You're the last ones, so get moving.")
    GROUND:MoveInDirection(kit, Direction.Left, 120, false, 2)
    GROUND:Hide('Kit')
    GAME:WaitFrames(80)
    GROUND:CharTurnToCharAnimated(player, partner, 4)
    CommonFunctions.Dialogue(partner, 3, "Worried", "I guess that means it's time to get this day started, huh?")
    CommonFunctions.Dialogue(partner, 3, "Happy", "Come on,[pause=30] I'm right behind you!")


    SOUND:PlayBGM("Wigglytuff's Guild.ogg", true) 
    GAME:MoveCamera(0, 0, 20, true)
    AI:SetCharacterAI(partner, "ai.ground_partner", CH('PLAYER'), partner.Position)
    AI:EnableCharacterAI(partner)
    partner.CollisionDisabled = true
  
    
    SV.refreshed_shop_stock = false
    GAME:GroundSave()
	GAME:CutsceneMode(false)
    

end



function CommonFunctions.DissolveMeeting()
    local player = CH('PLAYER')
    local partner = CH('Teammate1')
    local kit = CH('Kit')
    local lilith = CH('Lilith')
    local eve = CH('Eve')
    local dex = CH('Dex')
    local lily = CH('Lily')
    local celia = CH('Celia')
    local kiran = CH('Kiran')
    local lucio = CH('Lucio')
    local boss = CH("Ma'am")
    GAME:WaitFrames(40)
    GAME:FadeIn(20)
    GAME:WaitFrames(60)

    CommonFunctions.Dialogue(boss, 3, "Normal", "Good luck on your missions.")

    GROUND:CharSetEmote(eve, "happy", 0)
    GROUND:CharSetEmote(lily, "happy", 0)
    GROUND:CharSetEmote(celia, "happy", 0)
    GROUND:CharSetEmote(dex, "happy", 0)
    GROUND:CharSetEmote(lucio, "happy", 0)
    GROUND:CharSetEmote(kiran, "happy", 0)
    GROUND:CharSetEmote(kit, "happy", 0)
    GROUND:CharSetEmote(lilith, "happy", 0)
    GROUND:CharSetEmote(player, "happy", 0)
    GROUND:CharSetEmote(partner, "happy", 0)


    UI:SetSpeaker("Everyone", true, "", -1, "", RogueEssence.Data.Gender.Unknown)
    UI:WaitShowDialogue("Yeah!")

    GROUND:CharSetEmote(eve, "happy", 1)
    GROUND:CharSetEmote(lily, "happy", 1)
    GROUND:CharSetEmote(celia, "happy", 1)
    GROUND:CharSetEmote(dex, "happy", 1)
    GROUND:CharSetEmote(lucio, "happy", 1)
    GROUND:CharSetEmote(kiran, "happy", 1)
    GROUND:CharSetEmote(kit, "happy", 1)
    GROUND:CharSetEmote(lilith, "happy", 1)
    GROUND:CharSetEmote(player, "happy", 1)
    GROUND:CharSetEmote(partner, "happy", 1)
    

    GAME:WaitFrames(60)
    
    local mrkrKiran = MRKR("kiran_mrkr")
    local mrkrLucio = MRKR("lucio_mrkr")

    local coro1 = TASK:BranchCoroutine(function() GROUND:MoveInDirection(kit, Direction.Down, 120, false, 2) end)
    local coro1 = TASK:BranchCoroutine(function() GROUND:MoveInDirection(lilith, Direction.Down, 120, false, 2) end)
    local coro2 = TASK:BranchCoroutine(function() GROUND:MoveToPosition(kiran, mrkrKiran.Position.X, mrkrKiran.Position.Y, false, 2)
                                                  GROUND:EntTurn(kiran, mrkrKiran.Direction) 
                                                  GROUND:TeleportTo(kiran, mrkrKiran.Position.X, mrkrKiran.Position.Y, mrkrKiran.Direction) end)
    local coro3 = TASK:BranchCoroutine(function() GROUND:MoveToPosition(lucio, mrkrLucio.Position.X, mrkrLucio.Position.Y, false, 2)
                                                  GROUND:EntTurn(lucio, mrkrLucio.Direction) 
                                                  GROUND:TeleportTo(lucio, mrkrLucio.Position.X, mrkrLucio.Position.Y, mrkrLucio.Direction) end)
    local coro4 = TASK:BranchCoroutine(function() GAME:WaitFrames(20) 
                                                  GROUND:MoveToPosition(dex, 170, 360, false, 2) end)
    local coro5 = TASK:BranchCoroutine(function() GAME:WaitFrames(40) 
                                                    GROUND:MoveToPosition(celia, 170, 360, false, 2) end)
    local coro6 = TASK:BranchCoroutine(function()  GAME:WaitFrames(40) 
                                                    GROUND:MoveToPosition(lily, 170, 360, false, 2) end)
    local coro7 = TASK:BranchCoroutine(function() GAME:WaitFrames(50) 
                                                    GROUND:MoveToPosition(eve, 186, 195, false, 2)
                                                    GROUND:MoveToPosition(eve, 348, 195, false, 2) end)
    local coro8 = TASK:BranchCoroutine(function()  GROUND:MoveInDirection(boss, Direction.Up, 120, false, 2)end)
 
    TASK:JoinCoroutines({coro1,coro2,coro3,coro4,coro5,coro6,coro7,coro8})
    GAME:WaitFrames(60)
    GROUND:CharTurnToCharAnimated(partner, player, 5)
    GROUND:CharTurnToCharAnimated(player, partner, 5)
    CommonFunctions.Dialogue(partner, 3, "Normal", "Today is a")
end