require 'common'
require 'CommonFunctions'
gelid_overpass_ch2 = {}

function gelid_overpass_ch2.firstIntro()
    local markerP1 = MRKR('cut_mrkr1')
    local markerPa1 = MRKR('cut_mrkr2')
    local growlithe = CH('Explorer1')
    local espur = CH('Explorer2')
    local archaeologist = CH('yamask')
    local player = CH('PLAYER')
    local partner = CH('Teammate1')
   
    GAME:MoveCamera(192, 192, 1, false)
    GAME:FadeIn(20)
    local coro1 = TASK:BranchCoroutine(function() GROUND:MoveToPosition(player, player.Position.X, markerP1.Position.Y, false, 2) end)
    local coro2 = TASK:BranchCoroutine(function() GROUND:MoveToPosition(partner, partner.Position.X, markerP1.Position.Y, false, 2) end)
    TASK:JoinCoroutines({coro1,coro2})
    GAME:WaitFrames(30)
    GROUND:CharTurnToCharAnimated(player, partner, 4)
    GROUND:CharTurnToCharAnimated(partner, player, 4)
  
    GAME:WaitFrames(40)
    CommonFunctions.Dialogue(player, 3, "Worried", "How long do you think it's left until we come across them?")
  
    GROUND:CharAnimateTurn(partner, Direction.Up, 4, false) 
    GAME:WaitFrames(60)

    CommonFunctions.Dialogue(partner, 3, "Worried", "Well, this looks like the path that leads to Skyscraper Mountain...")
  
    GROUND:CharTurnToCharAnimated(partner, player, 4)
    CommonFunctions.Dialogue(partner, 3, "Normal", "If they haven't passed through here already, it's just a matter of time until they do.")
    CommonFunctions.Dialogue(player, 3, "Worried", "But how much time will that take?")
    SOUND:FadeOutBGM(70)
    GAME:WaitFrames(60)
  
    SOUND:PlaySE('Battle/EVT_Emote_Exclaim_2')
    local coro1 = TASK:BranchCoroutine(function() GROUND:CharSetEmote(partner, "exclaim", 1)
                                                  GROUND:CharAnimateTurn(partner, Direction.Up, 4, false) end)
    local coro2 = TASK:BranchCoroutine(function() GROUND:CharSetEmote(player, "exclaim", 1)
                                                  GROUND:CharAnimateTurn(player, Direction.Up, 4, true) end)
    TASK:JoinCoroutines({coro1,coro2})
    CommonFunctions.Dialogue(player, 0, "", "Come on, sir![br]We are about to get out of this dungeon!")
    CommonFunctions.Dialogue(player, 0, "", "Yeah![pause=0] Just hold on for a bit longer!")
    GAME:WaitFrames(70)
    CommonFunctions.Dialogue(partner, 3, "Surprised", "Not too long apparently![br]Hide!")
    GROUND:CharAnimateTurn(player, Direction.Right, 4, false)
    CommonFunctions.Dialogue(player, 3, "Surprised", "But where?")
    
    GROUND:CharAnimateTurn(partner, Direction.Left, 4, false)
    GAME:WaitFrames(40)
    GROUND:CharAnimateTurn(partner, Direction.UpLeft, 4, true)
    GAME:WaitFrames(50)
  
    SOUND:PlaySE('Battle/EVT_Emote_Exclaim')
    GROUND:CharSetEmote(partner, "notice", 1)
    GAME:WaitFrames(50)
    GROUND:CharAnimateTurn(partner, Direction.Left, 4, true)
    GAME:WaitFrames(60)
    
    
    local coro1 = TASK:BranchCoroutine(function() GROUND:CharAnimateTurn(player, Direction.Left, 4, true) end)
    local coro2 = TASK:BranchCoroutine(function() CommonFunctions.Dialogue(partner, 3, "Surprised", "Over there![pause=40] Behind those trees!") end)
    TASK:JoinCoroutines({coro1,coro2})
  
    local coro1 = TASK:BranchCoroutine(function() GROUND:MoveToPosition(player, markerP1.Position.X, markerP1.Position.Y, false, 2) 
                                                  GROUND:CharAnimateTurn(player, Direction.UpRight, 4, false) end)
    local coro2 = TASK:BranchCoroutine(function() GROUND:MoveToPosition(partner, markerPa1.Position.X, markerPa1.Position.Y, false, 2) 
                                                  GROUND:CharAnimateTurn(partner, Direction.UpRight, 4, false) end)
    TASK:JoinCoroutines({coro1,coro2})
  
    GAME:MoveCamera(192, 135, 60, false)
    GAME:WaitFrames(60)
      local marker_gr = MRKR('mrkr_fi')
      local marker_es = MRKR('mrkr_es')
      local marker_ya = MRKR('mrkr_ya')
      GROUND:Unhide('Explorer1')
      GROUND:Unhide('Explorer2')
      GROUND:Unhide('yamask')
  
    local coro1 = TASK:BranchCoroutine(function() --GROUND:MoveToPosition(growlithe, 190, 24, false, 2) 
                                                --GAME:WaitFrames(40)
                                                  GROUND:MoveToPosition(growlithe, marker_gr.Position.X, marker_gr.Position.Y, false, 2)
                                                   end)
  
    local coro2 = TASK:BranchCoroutine(function() GROUND:MoveToPosition(archaeologist, marker_ya.Position.X, marker_ya.Position.Y, false, 2) 
                                            --GAME:WaitFrames(40)
                                                 end)
  
  
    local coro3 = TASK:BranchCoroutine(function() --GROUND:MoveToPosition(espur, 190, 24, false, 2) 
                                                GROUND:MoveToPosition(espur, marker_es.Position.X, marker_es.Position.Y, false, 2)
                                                --GAME:WaitFrames(40)
                                                 end)
     TASK:JoinCoroutines({coro1,coro2,coro3})

     local coro1 = TASK:BranchCoroutine(function()  GROUND:CharTurnToCharAnimated(growlithe, archaeologist, 4) end)

        local coro2 = TASK:BranchCoroutine(function()  GROUND:CharTurnToCharAnimated(espur, archaeologist, 4) end)


        local coro3 = TASK:BranchCoroutine(function()  GROUND:CharTurnToCharAnimated(archaeologist, growlithe, 4) end)
        TASK:JoinCoroutines({coro1,coro2,coro3})
    
    
    GAME:WaitFrames(70)
  
    SOUND:PlayBGM("Heartwarming.ogg", true) 
    CommonFunctions.Dialogue(growlithe, 1, "Happy", "See mister?[br]We are down from the mountain safe and sound!")
    GAME:WaitFrames(50)
  
    GROUND:CharTurnToCharAnimated(archaeologist, espur, 4)
    CommonFunctions.Dialogue(espur, 1, "Happy", "We told you nothing would happen with us around!")
    GAME:WaitFrames(50)
    GROUND:CharSetEmote(archaeologist, "sweating", 1)
    SOUND:PlaySE('Battle/EVT_Emote_Sweating')
    GAME:WaitFrames(80)
    CommonFunctions.Dialogue(archaeologist, 1, "Worried", "But it's still so cold!")
    CommonFunctions.Dialogue(espur, 1, "Happy", "Well, sir![pause=30] That's because we aren't completely safe yet!")
    GROUND:CharTurnToCharAnimated(archaeologist, growlithe)
    CommonFunctions.Dialogue(growlithe, 1, "Happy", "We still have to go through another dungeon!")
    CommonFunctions.Dialogue(growlithe, 1, "Joyous", "But not to worry![br]Team [color=#FFA5FF]Poképals[color] will make sure you get home safe and sound!")
   
    GAME:WaitFrames(50)
    SOUND:PlaySE('Battle/EVT_Emote_Shock')
    GROUND:CharSetEmote(archaeologist, "shock", 1) 
    GAME:WaitFrames(90)
    CommonFunctions.Dialogue(archaeologist, 1, "Surprised", "There's more?!")

    GROUND:CharAnimateTurn(archaeologist, Direction.Down, 4, true) 
    GROUND:CharSetDrawEffect(archaeologist, DrawEffect.Trembling)
    CommonFunctions.Dialogue(archaeologist, 1, "Pain", "Oh no...")
   
    GROUND:CharSetEmote(growlithe, "question", 1)
    SOUND:PlaySE('Battle/EVT_Emote_Confused_2')
    CommonFunctions.Dialogue(growlithe, 1, "Worried", "Is something the matter sir?")
    CommonFunctions.Dialogue(espur, 1, "Worried", "Are you cold?")
  
    GAME:WaitFrames(50)
    GROUND:CharEndDrawEffect(archaeologist, DrawEffect.Trembling)
    GROUND:CharTurnToCharAnimated(archaeologist, espur, 4)
    CommonFunctions.Dialogue(archaeologist, 1, "Surprised", "Yes![br]And I have a very important treasure on me!")
    CommonFunctions.Dialogue(archaeologist, 1, "Pain", "I would never recover if someone were to steal it!")
    GAME:WaitFrames(60)

    CommonFunctions.Dialogue(espur, 1, "Happy", "There's no need to worry about that mister!")
    GROUND:CharTurnToCharAnimated(archaeologist, growlithe, 4)
    CommonFunctions.Dialogue(growlithe, 1, "Happy", "Yeah![br]If any evildoer wants to take that treasure, they'll have to go through us first!")
    
    GAME:WaitFrames(20)

    SOUND:PlaySE("Battle/EVT_Emote_Sweatdrop")
    GROUND:CharSetEmote(archaeologist, "sweatdrop", 1)
    GAME:WaitFrames(90)
    CommonFunctions.Dialogue(archaeologist, 2, "Pain", "(That's what's worrying me...)")

    GAME:MoveCamera(145, 225, 60, false)
    GAME:WaitFrames(60)
    GROUND:CharTurnToCharAnimated(player,partner,4)
    GROUND:CharTurnToCharAnimated(partner,player,4)
    GAME:WaitFrames(60)
    CommonFunctions.Dialogue(partner, 3, "Normal", "You heard that?")
    CommonFunctions.Dialogue(player, 3, "Normal", "That has to be who we're looking for, right?")
    CommonFunctions.Dialogue(partner, 3, "Normal", "Let's stop them before they leave!")
        
    local coro1 = TASK:BranchCoroutine(function() GROUND:CharAnimateTurn(partner, Direction.Right, 4, false)  end)

    local coro2 = TASK:BranchCoroutine(function() GROUND:CharAnimateTurn(player, Direction.Right, 4, false) end)

    local coro3 = TASK:BranchCoroutine(function() GAME:MoveCamera(192, 135, 60, false) end)
    TASK:JoinCoroutines({coro1,coro2,coro3})
    GAME:WaitFrames(60)
    CommonFunctions.Dialogue(espur, 1, "Happy", "Alright, that's enough break for now![br]Let's tackle this dungeon, partner!")
    CommonFunctions.Dialogue(growlithe, 1, "Happy", "Let's go, partner!")
    CommonFunctions.Dialogue(archaeologist, 1, "Pain", "...")
   
    SOUND:FadeOutBGM(80)

    local mrkr_stPl = MRKR('mrkr_stop1')
    local mrkr_stPart = MRKR('mrkr_stop2')
    local coro1 = TASK:BranchCoroutine(function() GROUND:MoveToPosition(growlithe, 159, 190, false, 2)   
                                                  SOUND:PlaySE('Battle/EVT_Emote_Exclaim')
                                                  GROUND:CharSetEmote(growlithe, "notice", 1) end)

    local coro2 = TASK:BranchCoroutine(function() GROUND:MoveToPosition(espur, 210, 190, false, 2)
                                                GROUND:CharSetEmote(espur, "notice", 1) 
                                                GROUND:CharSetEmote(archaeologist, "notice", 1)end)

    local coro3 = TASK:BranchCoroutine(function() GAME:MoveCamera(192, 192, 30, false) end)

    local coro4 = TASK:BranchCoroutine(function()   GAME:WaitFrames(20)
                                                    GROUND:MoveToPosition(archaeologist, 184, 190, false, 2) end)

    local coro5 = TASK:BranchCoroutine(function()   GAME:WaitFrames(20)
                                                    GROUND:MoveToPosition(player, mrkr_stPl.Position.X, mrkr_stPl.Position.Y, false, 2)
                                                    GROUND:CharAnimateTurn(player, Direction.Up, 4, true) end)
    local coro6 = TASK:BranchCoroutine(function()   GAME:WaitFrames(20)
                                                    GROUND:MoveToPosition(partner, mrkr_stPart.Position.X, mrkr_stPart.Position.Y, false, 2) 
                                                    GROUND:CharAnimateTurn(partner, Direction.Up, 4, true) end)


    TASK:JoinCoroutines({coro1,coro2,coro3,coro4,coro5,coro6})

    GAME:WaitFrames(60)
    SOUND:PlayBGM("A13. Threat.ogg", true) 
    CommonFunctions.Dialogue(partner, 3, "Determined", "Not so fast!")
    
    GAME:WaitFrames(80)
    SOUND:FadeOutBGM(1)

    SOUND:PlayBGM("Heartwarming.ogg", true) 

    CommonFunctions.Dialogue(espur, 1, "Happy", "Oh, hello![br]Do you need help to get back to town?")
    GAME:WaitFrames(40)

    CommonFunctions.Dialogue(partner, 1, "Worried", "Errm...[pause=50] what?")
    GAME:WaitFrames(60)
   
    CommonFunctions.Dialogue(growlithe, 1, "Happy", "We are " .. growlithe:GetDisplayName() .. " and " .. espur:GetDisplayName() .. " from team [color=#FFA5FF]Poképals[color]!")
   
    GAME:WaitFrames(60)

    CommonFunctions.Dialogue(growlithe, 3, "Worried", "We are kind of in the middle of a mission right now...")
    CommonFunctions.Dialogue(growlithe, 3, "Happy", "But there's no problem in tagging along if you need to get back down!")
    GAME:WaitFrames(60)
    CommonFunctions.Dialogue(player, 1, "Stunned", "Umm...[pause=40] No, thank you?")
    SOUND:FadeOutBGM(50)

    GAME:WaitFrames(30)
    GROUND:CharSetEmote(growlithe, "question", 1)
    SOUND:PlaySE('Battle/EVT_Emote_Confused_2')
    GAME:WaitFrames(90)

    CommonFunctions.Dialogue(growlithe, 3, "Worried", "Then what are you doing here?")
    GAME:WaitFrames(30)

    GROUND:CharTurnToCharAnimated(espur, growlithe, 4)
    CommonFunctions.Dialogue(espur, 3, "Worried", "Do you think they could be going to Skyscraper Mountain for something?")
    GROUND:CharTurnToCharAnimated(growlithe, espur, 4)
    CommonFunctions.Dialogue(growlithe, 3, "Worried", "For what?")
    CommonFunctions.Dialogue(espur, 3, "Surprised", "Do you think they are archaeologists too?")
    GAME:WaitFrames(50)

    GROUND:CharAnimateTurn(espur, Direction.Down, 4, true)
    GROUND:CharAnimateTurn(growlithe, Direction.Down, 4, false)
    CommonFunctions.Dialogue(growlithe, 3, "Worried", "Are you two archaeologists too?")
    GROUND:CharSetDrawEffect(archaeologist, DrawEffect.Trembling)

    CommonFunctions.Dialogue(espur, 3, "Worried", "Maybe you know mister " .. archaeologist:GetDisplayName().. " too!")
    CommonFunctions.Dialogue(espur, 3, "Happy", "He's even got an amazing treasure on him!")
    GROUND:CharTurnToCharAnimated(espur, archaeologist, 4)
    CommonFunctions.Dialogue(espur, 3, "Happy", "Isn't that right mister-")
  
    SOUND:PlaySE('Battle/EVT_Emote_Exclaim_2')
    GROUND:CharSetEmote(espur, "exclaim", 1)
    GAME:WaitFrames(50)
    CommonFunctions.Dialogue(espur, 3, "Stunned", "Are you alright mister?")
    GROUND:CharTurnToCharAnimated(growlithe, archaeologist, 4)

    SOUND:PlaySE('Battle/EVT_Emote_Exclaim_2')
    GROUND:CharSetEmote(growlithe, "exclaim", 1)
    GAME:WaitFrames(60)
    CommonFunctions.Dialogue(growlithe, 3, "Stunned", "What's wrong, sir?")
    GAME:WaitFrames(60)
    GROUND:CharEndDrawEffect(archaeologist, DrawEffect.Trembling)
    CommonFunctions.Dialogue(archaeologist, 3, "Stunned", "I think...[pause=40] those two...[pause=50] may be outlaws...")

    SOUND:PlaySE('Battle/EVT_Emote_Shock')
    
    local coro1 = TASK:BranchCoroutine(function() GROUND:CharSetEmote(espur, "shock", 1)
                                                    GROUND:CharAnimateTurn(espur, Direction.Down, 3, true) end)

    local coro2 = TASK:BranchCoroutine(function() GROUND:CharSetEmote(growlithe, "shock", 1)
                                                    GROUND:CharAnimateTurn(growlithe, Direction.Down, 3, false)  end)

    
    TASK:JoinCoroutines({coro1,coro2})

    GAME:WaitFrames(100)

    SOUND:PlayBGM("A13. Threat.ogg", true) 
    CommonFunctions.Dialogue(growlithe, 3, "Surprised", "Ou-[pause=30]Outlaws?!")
    CommonFunctions.Dialogue(espur, 3, "Surprised", "Real outlaws?!")

    SOUND:PlaySE("Battle/EVT_Emote_Sweatdrop")
    GROUND:CharSetEmote(player, "sweatdrop", 1)
    GROUND:CharSetEmote(partner, "sweatdrop", 1)
    GAME:WaitFrames(90)
    CommonFunctions.Dialogue(partner, 3, "Worried", "Erm... [pause=50]No?")
    GROUND:CharTurnToCharAnimated(player, partner, 4)

    CommonFunctions.Dialogue(player, 3, "Stunned", "I don't think that's gonna work...")


    SOUND:PlaySE('Battle/EVT_Emote_Sweating')
    GROUND:CharSetEmote(growlithe, "sweating", 1)
    GROUND:CharSetEmote(espur, "sweating", 1)
    GAME:WaitFrames(100)
    GROUND:CharTurnToCharAnimated(growlithe, espur, 4)
    GROUND:CharTurnToCharAnimated(espur, growlithe, 4)
    CommonFunctions.Dialogue(growlithe, 3, "Stunned", "What do we do?")
    CommonFunctions.Dialogue(espur, 3, "Determined", "We have to focus on protecting our client![pause=30] Just like when we trained!")
    CommonFunctions.Dialogue(growlithe, 3, "Determined", "You're right![br]Let's do this, partner!")

    local coro1 = TASK:BranchCoroutine(function() 
        GROUND:CharAnimateTurn(espur, Direction.Down, 3, true) end)

    local coro2 = TASK:BranchCoroutine(function() 
        GROUND:CharAnimateTurn(growlithe, Direction.Down, 3, false)  end)

    local coro3 = TASK:BranchCoroutine(function() 
            GROUND:CharAnimateTurn(player, Direction.Up, 4, false)  end)
   

    TASK:JoinCoroutines({coro1,coro2,coro3})

    CommonFunctions.Dialogue(espur, 3, "Determined", "If you want to steal mister Yamask's treasure, you'll have to go through us first!")
    CommonFunctions.Dialogue(growlithe, 3, "Determined", "We'll show you what's good, evildoers!")
    GAME:FadeOut(true,1)
    SOUND:PlayBattleSE("EVT_Battle_Flash")
    GAME:WaitFrames(5)

    GAME:FadeIn(1)
    GAME:WaitFrames(50)
    CommonFunctions.Dialogue(partner, 3, "Determined", "Looks like we're not going to do this peacefully!")
    CommonFunctions.Dialogue(player, 3, "Determined", "Let's see who shows who what's good!")
    GAME:FadeOut(true,1)
    SOUND:PlayBattleSE("EVT_Battle_Flash")
    GAME:WaitFrames(5)
    GAME:FadeIn(1)
    GAME:WaitFrames(50)
    CommonFunctions.Dialogue(growlithe, 3, "Determined", "Mister Yamask, stay back![br]Things are about to get hot!")
    COMMON.BossTransition(false)
    GAME:CutsceneMode(false)
    --Enter the map.
    GAME:EnterZone("gelid_woods", 1, 0, 0)
    

end
function gelid_overpass_ch2.repeatIntro()
    local growlithe = CH('Explorer1')
    local espur = CH('Explorer2')
    local archaeologist = CH('yamask')
    local player = CH('PLAYER')
    local partner = CH('Teammate1')
    GAME:CutsceneMode(true)
    
    local mrkr_stPl = MRKR('mrkr_stop1')
    local mrkr_stPart = MRKR('mrkr_stop2')
    GROUND:TeleportTo(growlithe, 159, 190, Direction.Right)
    GROUND:TeleportTo(espur, 210, 190, Direction.Left)
    GROUND:TeleportTo(archaeologist, 184, 190, Direction.Left)
    GAME:MoveCamera(192, 192, 1, false)
    GAME:WaitFrames(70)
    GAME:FadeIn(20)
    GAME:WaitFrames(80)
    CommonFunctions.Dialogue(growlithe, 3, "Happy", "We really sent those evildoers packing, didn't we?")
    GROUND:CharTurnToCharAnimated(archaeologist, espur, 4)

    CommonFunctions.Dialogue(espur, 3, "Happy", "We really did!")
    CommonFunctions.Dialogue(espur, 3, "Joyous", "They won't have the guts to come back if they know what's good for them!")
   
    GAME:WaitFrames(60)

    CommonFunctions.Dialogue(growlithe, 3, "Normal", "You can rest now, mister Yamask!")

    GROUND:CharTurnToCharAnimated(archaeologist, growlithe, 4)
    GAME:WaitFrames(50)
    CommonFunctions.Dialogue(archaeologist, 3, "Worried", "Are you sure?[br]They didn't seem like they would be giving up anytime soon...")

    SOUND:PlaySE('Battle/EVT_Emote_Exclaim_2')
    GROUND:CharSetEmote(growlithe, "exclaim", 1)
    GROUND:CharSetEmote(archaeologist, "exclaim", 1)
    GROUND:CharSetEmote(espur, "exclaim", 1)

    UI:ResetSpeaker()
    UI:WaitShowDialogue("There they are!")
    local coro1 = TASK:BranchCoroutine(function() 
        GROUND:CharAnimateTurn(espur, Direction.Down, 4, true) end)

    local coro2 = TASK:BranchCoroutine(function() 
        GROUND:CharAnimateTurn(growlithe, Direction.Down, 4, false)  end)

    local coro3 = TASK:BranchCoroutine(function() 
            GROUND:CharAnimateTurn(archaeologist, Direction.Down, 4, true)  end)
   
    local coro4 = TASK:BranchCoroutine(function() GROUND:MoveToPosition(player, mrkr_stPl.Position.X, mrkr_stPl.Position.Y, false, 2) 
                 end)
    local coro5 = TASK:BranchCoroutine(function() GROUND:MoveToPosition(partner, mrkr_stPart.Position.X, mrkr_stPart.Position.Y, false, 2) end)
    TASK:JoinCoroutines({coro1,coro2,coro3,coro4,coro5})
   
    GAME:WaitFrames(70) 
    SOUND:PlayBGM("A13. Threat.ogg", true) 
    CommonFunctions.Dialogue(partner, 3, "Determined", "We are back for the treasure!")
    CommonFunctions.Dialogue(player, 3, "Determined", "You aren't going to get rid of us that easily!")
    GAME:FadeOut(true,1)
    SOUND:PlayBattleSE("EVT_Battle_Flash")
    GAME:WaitFrames(5)

    GAME:FadeIn(1)
    GAME:WaitFrames(60)

    CommonFunctions.Dialogue(growlithe, 3, "Determined", "You want more?[br]We have no problem in beating evildoers like you!")
    CommonFunctions.Dialogue(espur, 3, "Determined", "Bad guys like you will never win!")

    GAME:FadeOut(true,1)
    SOUND:PlayBattleSE("EVT_Battle_Flash")
    GAME:WaitFrames(5)

    GAME:FadeIn(1)
    GAME:WaitFrames(60)
  
    CommonFunctions.Dialogue(player, 3, "Determined", "We'll see about that!")
    COMMON.BossTransition()
    GAME:CutsceneMode(false)
    --Enter the map.
    GAME:EnterZone("gelid_woods", 1, 0, 0)
  
end
function gelid_overpass_ch2.youWin()
  
    local growlithe = CH('Explorer1')
    local espur = CH('Explorer2')
    local archaeologist = CH('yamask')
    local player = CH('PLAYER')
    local partner = CH('Teammate1')
    GAME:CutsceneMode(true)
    GROUND:TeleportTo(growlithe, 159, 190, Direction.Right)
    GROUND:TeleportTo(espur, 210, 190, Direction.Left)
    GROUND:TeleportTo(archaeologist, 184, 100, Direction.Left)
    GAME:MoveCamera(192, 192, 1, false)
    local mrkr_stPl = MRKR('mrkr_stop1')
    local mrkr_stPart = MRKR('mrkr_stop2')
    GROUND:CharSetAction(growlithe, RogueEssence.Ground.PoseGroundAction(growlithe.Position, growlithe.Direction, RogueEssence.Content.GraphicsManager.GetAnimIndex("Cringe")))
    GROUND:CharSetAction(espur, RogueEssence.Ground.PoseGroundAction(espur.Position, espur.Direction, RogueEssence.Content.GraphicsManager.GetAnimIndex("Pain")))
   
    
    GROUND:TeleportTo(player, mrkr_stPl.Position.X, mrkr_stPl.Position.Y, mrkr_stPl.Direction)
    GROUND:TeleportTo(partner, mrkr_stPart.Position.X, mrkr_stPart.Position.Y, mrkr_stPart.Direction)
    GAME:WaitFrames(50)
    GAME:FadeIn(20)
    GAME:WaitFrames(70)

    GROUND:CharSetDrawEffect(growlithe, DrawEffect.Trembling)
    GAME:WaitFrames(10)
    GROUND:CharSetDrawEffect(espur, DrawEffect.Trembling)
    GAME:WaitFrames(30)
    GROUND:CharEndDrawEffect(growlithe, DrawEffect.Trembling)
    GAME:WaitFrames(10)
    GROUND:CharEndDrawEffect(espur, DrawEffect.Trembling)

    GAME:WaitFrames(50)
    CommonFunctions.Dialogue(growlithe, 3, "Dizzy", "Ugh...")
    CommonFunctions.Dialogue(espur, 3, "Dizzy", "Bad guys...[pause=30]never win...")

    --[ Will this work?
    TASK:WaitTask(_DUNGEON:ProcessBattleFX(growlithe, growlithe, _DATA.SendHomeFX))
    GAME:WaitFrames(30)
    TASK:WaitTask(_DUNGEON:ProcessBattleFX(espur, espur, _DATA.SendHomeFX))
    --]

    GAME:WaitFrames(60)
    CommonFunctions.Dialogue(partner, 3, "Normal", "Make sure he doesn't try to escape from behind.[br]I'll handle the archaeologist.")
    CommonFunctions.Dialogue(player, 3, "Worried", "Aye aye, cap'n...")

    GROUND:MoveToPosition(partner, 184, 190, false, 2) 
    GAME:WaitFrames(60)
    CommonFunctions.Dialogue(partner, 3, "Determined", "Alright, buddy...")
    CommonFunctions.Dialogue(archaeologist, 3, "Teary-Eyed", "Just take it![br]Please, don't hurt me!")
    CommonFunctions.Monologue("The archaeologist handed " .. partner:GetDisplayName() .. " a mysterious and ancient looking chest.")
    GAME:WaitFrames(50)
    CommonFunctions.Dialogue(partner, 3, "Happy", "A pleasure doing business with you!")
    GROUND:MoveToPosition(partner, 184, 217, false, 2) 
    GROUND:CharTurnToCharAnimated(partner, player,4)
    GROUND:CharTurnToCharAnimated(player, partner,4)

    CommonFunctions.Dialogue(partner, 3, "Normal", "Let's get out of here!")
    CommonFunctions.Dialogue(player, 3, "Stunned", "But what about the archaeologist?")
    CommonFunctions.Dialogue(player, 3, "Stunned", "We can't just leave him here...[pause=30] right?")
    GAME:WaitFrames(60)
    CommonFunctions.Dialogue(partner, 3, "Worried", "I mean...")
    GROUND:CharTurnToCharAnimated(partner, archaeologist, 4)
    GAME:WaitFrames(30)
    GROUND:CharTurnToCharAnimated(player, archaeologist, 4)
    GAME:WaitFrames(60)
    CommonFunctions.Dialogue(partner, 3, "Worried", "We don't have any need of helping him...")
    CommonFunctions.Dialogue(partner, 3, "Worried", "In fact, [pause=30]it's better for us if we just leave him here.")
    CommonFunctions.Dialogue(partner, 3, "Worried", "Those two shouldn't take too long to come back if I'm not mistaken, so let's not take too long.")
    GAME:WaitFrames(60)
    GROUND:CharTurnToCharAnimated(player, partner, 4)

    CommonFunctions.Dialogue(player, 3, "Worried", "But...")
    GROUND:CharTurnToCharAnimated(partner, player, 4)

    CommonFunctions.Dialogue(partner, 3, "Worried", "I had that same doubt when I was new too.")
    CommonFunctions.Dialogue(partner, 3, "Pain", "At least until I tried to actually help someone and I almost got beaten down...")
    CommonFunctions.Dialogue(partner, 3, "Normal", "So yeah.[pause=0] Don't test your luck.")
    CommonFunctions.Dialogue(player, 3, "Worried", "...")

    GAME:WaitFrames(60)
    CommonFunctions.Dialogue(player, 3, "Normal", "Okay then.[br]You're better experienced at this than me anyway.")
    CommonFunctions.Dialogue(player, 2, "Pain", "(But it still feels wrong...)")
    CommonFunctions.Dialogue(player, 2, "Pain", "(Why couldn't this amnesia have freed me of this type of feelings?)")
    GAME:WaitFrames(60)

    CommonFunctions.Dialogue(partner, 3, "Normal", "Okay then.[br]Let's go back to the guild.")
    GROUND:CharTurnToCharAnimated(partner, archaeologist, 4)
    GROUND:CharTurnToCharAnimated(player, archaeologist, 4)
    GAME:WaitFrames(40)

    CommonFunctions.Dialogue(partner, 3, "Determined", "And don't you dare try anything funny while we're not looking!")

    GROUND:CharSetDrawEffect(archaeologist, DrawEffect.Trembling)
    GAME:WaitFrames(30)
    GROUND:CharEndDrawEffect(archaeologist, DrawEffect.Trembling)
    GAME:WaitFrames(60)
    CommonFunctions.Dialogue(archaeologist, 3, "Teary-Eyed", "N-[pause=30]No!")
    
    GROUND:CharTurnToCharAnimated(partner, player, 4)

    CommonFunctions.Dialogue(partner, 3, "Normal", "Let's go " .. player:GetDisplayName()..".")

    
    local coro1 = TASK:BranchCoroutine(function()  GROUND:MoveInDirection(player, Direction.Down, 100, false, 2) end)
    local coro2 = TASK:BranchCoroutine(function()  GROUND:MoveInDirection(partner, Direction.Down, 100, false, 2) end)
    TASK:JoinCoroutines({coro1,coro2})
    GAME:WaitFrames(60)
    GROUND:CharSetDrawEffect(archaeologist, DrawEffect.Trembling)
    GAME:WaitFrames(40)
    GROUND:CharEndDrawEffect(archaeologist, DrawEffect.Trembling)
    GAME:WaitFrames(70)

    CommonFunctions.Dialogue(archaeologist, 3, "Teary-Eyed", "Oh dear...[pause=50] What am I going to do?")


    GAME:CutsceneMode(false)
end