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
    
end