require 'common'
require 'CommonFunctions'
guildmasters_office_ch2 = {}

function guildmasters_office_ch2.first_day_end()
    local player = CH('PLAYER')
    local partner = CH('Teammate1')
    local boss = CH('Boss')
    local mrkr1 = MRKR('Talk1')
    local mrkr2 = MRKR('Talk2')
    local mrkrBoss = MRKR('Talk3')
    GAME:MoveCamera(120, 133, 1, false)

    AI:DisableCharacterAI(partner)
    GAME:CutsceneMode(true)
    --Move the markers and add the boss'
    GROUND:TeleportTo(player, mrkr1.Position.X, mrkr1.Position.Y, mrkr1.Direction)
    GROUND:TeleportTo(partner, mrkr2.Position.X, mrkr2.Position.Y, mrkr2.Direction)
    GROUND:TeleportTo(boss, mrkrBoss.Position.X, mrkrBoss.Position.Y, mrkrBoss.Direction)

    GAME:FadeIn(20)
    GAME:WaitFrames(60)
    CommonFunctions.Dialogue(boss, 3, "Normal", "Welcome back, team ".. GAME:GetTeamName() .. ".[br]How did your mission go?")
    GAME:WaitFrames(60)
    CommonFunctions.Dialogue(partner, 3, "Happy", "It was a success!")
    CommonFunctions.Dialogue(partner, 3, "Happy", "We have the treasure!")
    CommonFunctions.Dialogue(boss, 3, "Normal", "Let's see...")

    SOUND:PlaySE('Item_Grab')
    CommonFunctions.Monologue(partner:GetDisplayName().." handed " .. boss:GetDisplayName() .. " the chest.")
    GAME:WaitFrames(60)

    SOUND:PlaySE('Battle/EVT_Emote_Shock')
    GROUND:CharSetEmote(boss, "shock", 1)
    GAME:WaitFrames(100)
    CommonFunctions.Dialogue(boss, 3, "Surprised", "These markings!")
    CommonFunctions.Dialogue(boss, 3, "Stunned", "Can it really be what I think it is?")
    CommonFunctions.Dialogue(partner, 3, "Worried", "You know what it is?")
    CommonFunctions.Dialogue(partner, 3, "Worried", "We couldn't open the chest at all when we tried...")
    GAME:WaitFrames(40)
    SOUND:PlaySE('Battle/EVT_Emote_Confused_2')
    
    GROUND:CharSetEmote(player, "question", 1)
    GROUND:CharSetEmote(partner, "question", 1)

    GAME:WaitFrames(100)

    CommonFunctions.Dialogue(player, 3, "Worried", "What's this thing?")
    GAME:WaitFrames(60)
    CommonFunctions.Dialogue(boss, 3, "Normal", "If my theory is correct, it should be something we've been looking for for a long time...")
    GAME:WaitFrames(60)
    CommonFunctions.Dialogue(partner, 3, "Surprised", "You don't mean...?")
    CommonFunctions.Dialogue(boss, 3, "Normal", "Yes, " .. partner:GetDisplayName()..".[br]It's exactly what you think.")
   
    GAME:WaitFrames(50)
    SOUND:PlaySE('Battle/EVT_Emote_Confused_2')
    GROUND:CharSetEmote(player, "question", 1)
    GAME:WaitFrames(110)
    CommonFunctions.Dialogue(player, 3, "Worried", "What are you two talking about?")
    GROUND:CharTurnToCharAnimated(partner, player, 4)
    GROUND:CharTurnToCharAnimated(player, partner, 4)

    CommonFunctions.Dialogue(partner, 3, "Normal", "I'll tell you about it later.")
    GAME:WaitFrames(70)
    GROUND:CharTurnToCharAnimated(partner, boss, 4)
    GROUND:CharTurnToCharAnimated(player, boss, 4)
    CommonFunctions.Dialogue(boss, 3, "Normal", "I'll have to admit,[pause=40] you did your mission very quickly.")
    CommonFunctions.Dialogue(boss, 3, "Normal", "So quickly in fact that the rest of the teams are still doing their business outside.")
    GAME:WaitFrames(60)
    CommonFunctions.Dialogue(boss, 3, "Happy", "Congratulations you two![br]I see that putting you in the same team wasn't a mistake!")
    CommonFunctions.Dialogue(partner, 3, "Happy", "Gee,[pause=30] thanks!")
    CommonFunctions.Dialogue(player, 3, "Happy", "It wasn't that bad!")
  
    GAME:WaitFrames(60)
    CommonFunctions.Dialogue(player, 3, "Worried", "What are you going to do with that chest now?")
    CommonFunctions.Dialogue(boss, 3, "Normal", "Well,[pause=40] if you haven't been able to open it, it means that it's locked under some sort of powerful lock.")
    CommonFunctions.Dialogue(boss, 3, "Normal", "[color=#00ffff]Jacques[color] and me have been friends for a long while,[pause=40] and we know someone that could help us.")
    CommonFunctions.Dialogue(boss, 3, "Worried", "Though,[pause=30] that someone is pretty far away,[pause=30] so it will most likely take a while for someone to go and send it back.")
    CommonFunctions.Dialogue(player, 3, "Worried", "I see...")
    GAME:WaitFrames(60)
    CommonFunctions.Dialogue(boss, 3, "Normal", "For now,[pause=40] you two are free to do whatever you want until dinner,[pause=30] but don't go too far.")
    GROUND:CharTurnToCharAnimated(partner, player, 4)
    GROUND:CharTurnToCharAnimated(player, partner, 4)
    GAME:WaitFrames(60)
    CommonFunctions.Dialogue(partner, 3, "Happy", "We did it!")
    CommonFunctions.Dialogue(partner, 3, "Happy", "Our first mission was a success!")
    GROUND:EntTurn(player, Direction.Down)
    GROUND:EntTurn(partner, Direction.Down)
    GAME:WaitFrames(40)
    GROUND:CharSetAction(player, RogueEssence.Ground.PoseGroundAction(player.Position, player.Direction, RogueEssence.Content.GraphicsManager.GetAnimIndex("Pose")))
    GROUND:CharSetAction(partner, RogueEssence.Ground.PoseGroundAction(partner.Position, partner.Direction, RogueEssence.Content.GraphicsManager.GetAnimIndex("Pose")))
    GROUND:CharSetEmote(boss, "happy", 0)

    GAME:WaitFrames(120)
    GAME:FadeOut(false, 20)
    GAME:EnterZone('peaceful_lake', -1, 0, 0)
    



    GAME:CutsceneMode(false)


end