require 'common'
require 'CommonFunctions'

job_boards_ch2 = {}
function job_boards_ch2.firstMeeting()
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
    local marker = MRKR('mrkr_2_partner')
    AI:DisableCharacterAI(partner)
    GROUND:TeleportTo(partner, marker.Position.X, marker.Position.Y, marker.Direction)
    GAME:CutsceneMode(true)
    GAME:WaitFrames(90)
    GAME:FadeIn(20)
    GAME:WaitFrames(60)

    SOUND:PlaySE('Battle/EVT_Emote_Exclaim_2')
    GROUND:CharSetEmote(player, "exclaim", 1)
    CommonFunctions.Dialogue(player, 3, "Surprised", "Woah![br]Everyone is here!")

	GROUND:CharTurnToCharAnimated(partner, player, 5)
	GROUND:CharTurnToCharAnimated(player, partner, 5)
    GAME:WaitFrames(60)

    CommonFunctions.Dialogue(partner, 3, "Happy", "Well, of course![br]Everyone has to attend the morning meetings to know what to do in the day!")
    GAME:WaitFrames(40)
	GROUND:CharTurnToCharAnimated(lily, player, 5)
    GAME:WaitFrames(50)
    SOUND:PlaySE('Battle/EVT_Emote_Exclaim_2')
    GROUND:CharSetEmote(lily, "exclaim", 1)
    GAME:WaitFrames(90)
    CommonFunctions.Dialogue(lily, 3, "Special3", "My sweet " .. player:GetDisplayName() .. "![br]How have you slept tonight?")

    local coro1 = TASK:BranchCoroutine(function() GROUND:CharAnimateTurn(partner, Direction.Left, 4, false)
                                                  GROUND:CharAnimateTurn(player, Direction.Left, 4, false) end)
    local coro2 = TASK:BranchCoroutine(function() GROUND:CharTurnToCharAnimated(eve, player, 4) end)
    local coro3 = TASK:BranchCoroutine(function() GROUND:CharTurnToCharAnimated(celia, player, 4) end)
    local coro4 = TASK:BranchCoroutine(function() GROUND:CharTurnToCharAnimated(dex, player, 4) end)
    local coro5 = TASK:BranchCoroutine(function() GROUND:CharTurnToCharAnimated(kiran, player, 4) end)
    local coro6 = TASK:BranchCoroutine(function() GROUND:CharTurnToCharAnimated(lucio, player, 4) end)
    local coro7 = TASK:BranchCoroutine(function() GROUND:CharTurnToCharAnimated(kit, player, 4) end)
    local coro8 = TASK:BranchCoroutine(function() GROUND:CharTurnToCharAnimated(lilith, player, 4) end)
    local coro9 = TASK:BranchCoroutine(function() GROUND:CharTurnToCharAnimated(boss, player, 4) end)


    TASK:JoinCoroutines({coro1,coro2,coro3,coro4,coro5,coro6,coro7,coro8,coro9})
    GAME:WaitFrames(60)

    CommonFunctions.Dialogue(kit, 3, "Happy", "Finally decided to get out of bed?")
    CommonFunctions.Dialogue(dex, 3, "Happy", "Good morning!")
    CommonFunctions.Dialogue(lucio, 3, "Happy", "Hi, ".. player:GetDisplayName().. "!")
    GAME:WaitFrames(60)

    CommonFunctions.Dialogue(boss, 3, "Worried", "Do you all already know him?")
    GAME:WaitFrames(10)
    GROUND:CharTurnToCharAnimated(partner, boss, 4)
    GAME:WaitFrames(20)
    CommonFunctions.Dialogue(partner, 3, "Normal", "We went around and introduced him to everyone before sleeping.")
   
    CommonFunctions.Dialogue(boss, 3, "Normal", "Oh.[br]Then I suppose telling them who you are isn't too necessary.")
    CommonFunctions.Dialogue(boss, 3, "Normal", "Now come here with the rest.")
    local marker = MRKR('meeting_pl')
    local marker2 = MRKR('meeting_part')
   
    

    local coro1 = TASK:BranchCoroutine(function()  GROUND:MoveToPosition(player, marker.Position.X, marker.Position.Y, false, 2) end)
    local coro2 = TASK:BranchCoroutine(function()   GAME:WaitFrames(10)
                                                    GROUND:MoveToPosition(partner, marker2.Position.X, marker2.Position.Y, false, 2) end)
    TASK:JoinCoroutines({coro1,coro2})
    local coro1 = TASK:BranchCoroutine(function() GROUND:CharTurnToCharAnimated(lily, boss, 4) end)
    local coro2 = TASK:BranchCoroutine(function() GROUND:CharAnimateTurn(eve, Direction.Up, 4, true) end)
    local coro3 = TASK:BranchCoroutine(function() GROUND:CharTurnToCharAnimated(celia, boss, 4) end)
    local coro4 = TASK:BranchCoroutine(function() GROUND:CharTurnToCharAnimated(dex, boss, 4) end)
    local coro5 = TASK:BranchCoroutine(function() GROUND:CharTurnToCharAnimated(kiran, boss, 4) end)
    local coro6 = TASK:BranchCoroutine(function() GROUND:CharTurnToCharAnimated(lucio, boss, 4) end)
    local coro7 = TASK:BranchCoroutine(function() GROUND:CharTurnToCharAnimated(kit, boss, 4) end)
    local coro8 = TASK:BranchCoroutine(function() GROUND:CharTurnToCharAnimated(lilith, boss, 4) end)
    local coro9 = TASK:BranchCoroutine(function() GROUND:CharAnimateTurn(boss, Direction.Down, 4, false) end)
    TASK:JoinCoroutines({coro1,coro2,coro3,coro4,coro5,coro6,coro7,coro8,coro9})
    GROUND:EntTurn(player, marker.Direction)
    GROUND:EntTurn(partner, marker2.Direction)

    GAME:WaitFrames(60)

    CommonFunctions.Dialogue(boss, 3, "Normal", "Alright, so now that everyone is here, let's start with the briefing.")
    CommonFunctions.Dialogue(boss, 3, "Normal", "As you know, our last operation to gather more supplies was a success in more ways than one.")
    CommonFunctions.Dialogue(boss, 3, "Normal", "So as the first thing today...")
    CommonFunctions.Dialogue(boss, 3, "Happy", "Everyone give a warm welcome to " .. player:GetDisplayName()..",[pause=30] who, as you already know, has joined us yesterday as a new member!")
    GAME:WaitFrames(50)
    GROUND:CharAnimateTurn(partner, Direction.Down, 4, false)
    GROUND:CharAnimateTurn(player, Direction.Down, 4, false)
    GROUND:CharSetEmote(eve, "happy", 0)
    GROUND:CharSetEmote(lily, "happy", 0)
    GROUND:CharSetEmote(celia, "happy", 0)
    GROUND:CharSetEmote(dex, "happy", 0)
    GROUND:CharSetEmote(lucio, "happy", 0)
    GROUND:CharSetEmote(kiran, "happy", 0)
    GROUND:CharSetEmote(kit, "happy", 0)
    GROUND:CharSetEmote(lilith, "happy", 0)
    SOUND:LoopSE("Battle/EVT_Applause_Cheer")
    UI:SetSpeaker("Everyone", true, "", -1, "", RogueEssence.Data.Gender.Unknown)
    UI:WaitShowDialogue("Welcome, "..player:GetDisplayName().."!")

    CommonFunctions.Dialogue(player, 3, "Stunned", "Woah![br]Th-[pause=30]Thank you...")


    GROUND:CharSetEmote(eve, "happy", 1)
    GROUND:CharSetEmote(lily, "happy", 1)
    GROUND:CharSetEmote(celia, "happy", 1)
    GROUND:CharSetEmote(dex, "happy", 1)
    GROUND:CharSetEmote(lucio, "happy", 1)
    GROUND:CharSetEmote(kiran, "happy", 1)
    GROUND:CharSetEmote(kit, "happy", 1)
    GROUND:CharSetEmote(lilith, "happy", 1)
    SOUND:StopSE("Battle/EVT_Applause_Cheer")
    GAME:WaitFrames(80)
    CommonFunctions.Dialogue(boss, 3, "Normal", "Very good.[br]Now, let's get to today's assignments.")
    GROUND:CharAnimateTurn(partner, Direction.Up, 4, true)
    GROUND:CharAnimateTurn(player, Direction.Up, 4, true)

    CommonFunctions.Dialogue(boss, 3, "Normal", eve:GetDisplayName() ..",[pause=20] how is that antidote going?")
    CommonFunctions.Dialogue(eve, 3, "Happy", "Great progress, ".. boss:GetDisplayName() .. "!")
    CommonFunctions.Dialogue(eve, 3, "Worried", "But I'd like to request some of your poison again.")
    CommonFunctions.Dialogue(boss, 3, "Sigh", eve:GetDisplayName() ..", we've already talked about this...")
    CommonFunctions.Dialogue(eve, 3, "Surprised", "But the medicine would be done much faster!")
    CommonFunctions.Dialogue(boss, 3, "Normal", "...")
    GAME:WaitFrames(70)
    CommonFunctions.Dialogue(boss, 3, "Sigh", "Fine.[br]I'll think about it.")
    CommonFunctions.Dialogue(eve, 3, "Happy", "Thank you!")
    GAME:WaitFrames(70)
    CommonFunctions.Dialogue(boss, 3, "Normal", "Alright, let's continue.")
    GAME:WaitFrames(50)
    CommonFunctions.Dialogue(boss, 3, "Normal", "Team [color=#FFA5FF]Illusion[color],[pause=40] we have a tip of some of [color=#00ffff]Aggron[color]'s goons passing near the dungeon near the [color=#03f8fc]Shops Guild[color] hideout.")
    CommonFunctions.Dialogue(boss, 3, "Normal", "Go and show them what happens when they pry in places they shouldn't.")
    
    CommonFunctions.Dialogue(kit, 3, "Normal", "Aye aye, cap'n!")
    CommonFunctions.Dialogue(lilith, 3, "Happy", "We'll show them!")
    GAME:WaitFrames(70)
    CommonFunctions.Dialogue(boss, 3, "Normal", "Team [color=#FFA5FF]Overcharge[color],[pause=40] grab a request from the boards.")
    CommonFunctions.Dialogue(lucio, 3, "Happy", "Sure!")
    CommonFunctions.Dialogue(kiran, 3, "Joyous", "After yesterday, something a bit more moderate is appreciated.")
    CommonFunctions.Dialogue(player, 3, "Worried", "Hold it![pause=60] Requests?")
    GAME:WaitFrames(50)
    CommonFunctions.Dialogue(boss, 3, "Worried", "I forgot that you didn't know about this...")
    CommonFunctions.Dialogue(boss, 3, "Normal", "Indeed, "..player:GetDisplayName()..". The board that you have to your right is full of requests left by other thieves that need our help.")
    CommonFunctions.Dialogue(player, 3, "Stunned", "That's possible?")
    CommonFunctions.Dialogue(player, 3, "Worried", "But I thought this hideout was secret.[br]How do they come here to leave the requests?[br]And why help them if you have our own stuff to do?")
    GAME:WaitFrames(60)    
    CommonFunctions.Dialogue(boss, 3, "Normal", "Us thieves know each other very well.[br]The word is very easily spread around everyone until it reaches someone of our guild.[br]Then we post a paper in the board, and when we have some free time, we help our partners in crime,[pause=40] literally.")
    CommonFunctions.Dialogue(boss, 3, "Normal", "We help them to boost our relationship,[pause=40] and thus potentially gain new allies.")
    GAME:WaitFrames(50)
    CommonFunctions.Dialogue(boss, 3, "Normal", "Of course, help isn't free,[pause=30] much less in this profession.")
    CommonFunctions.Dialogue(boss, 3, "Happy", "The rewards are usually quite generous!")
    GAME:WaitFrames(60)    
    CommonFunctions.Dialogue(player, 3, "Worried", "I...[pause=60] think I get it.")
    CommonFunctions.Dialogue(player, 3, "Worried", "We help them so that we can gain stuff and help from them in the future?")
    GAME:WaitFrames(60)
    CommonFunctions.Dialogue(boss, 3, "Normal", "Basically put, yes.")
    GAME:WaitFrames(60)
    CommonFunctions.Dialogue(kit, 3, "Happy", "You're getting the hang of it, huh?")
    GAME:WaitFrames(80)
    CommonFunctions.Dialogue(boss, 3, "Normal", "Let's get back on topic.")
    CommonFunctions.Dialogue(boss, 3, "Normal", dex:GetDisplayName().. ", " .. lily:GetDisplayName() .. " and " .. celia:GetDisplayName() .. ",[pause=40] same as always.[br]You know what to do.")
    CommonFunctions.Dialogue(celia, 3, "Happy", "Cookin',[pause=30] sure 'nough!")
    CommonFunctions.Dialogue(lily, 3, "Special0", "Taking care of the shop!")
    CommonFunctions.Dialogue(dex, 3, "Happy", "Scouting!")
    CommonFunctions.Dialogue(dex, 3, "Sad", "Hopefully today will be different...")
    GAME:WaitFrames(60)
    CommonFunctions.Dialogue(boss, 3, "Normal", "Good.")
    CommonFunctions.Dialogue(boss, 3, "Normal", "And lastly...")
    GAME:WaitFrames(60)
    CommonFunctions.Dialogue(boss, 3, "Normal", "Team "..GAME:GetTeamName().. ".")
    CommonFunctions.Dialogue(partner, 3, "Sad", "Request board,[pause=30] I know...")
    GAME:WaitFrames(50)
    SOUND:PlaySE('Battle/EVT_Emote_Exclaim_2')
    GROUND:CharSetEmote(partner, "exclaim", 1)
    CommonFunctions.Dialogue(boss, 3, "Normal", "Actually...")
    CommonFunctions.Dialogue(boss, 3, "Normal", "Now that you and " .. player:GetDisplayName() .. " are a team together,[pause=30] you will get a new assignment.")
    
    GAME:WaitFrames(50)
    GROUND:CharAnimateTurn(partner, Direction.Down, 4, false)
    GROUND:CharAnimateTurn(player, Direction.Down, 4, false)

    GROUND:CharSetEmote(eve, "happy", 0)
    GROUND:CharSetEmote(lily, "happy", 0)
    GROUND:CharSetEmote(celia, "happy", 0)
    GROUND:CharSetEmote(dex, "happy", 0)
    GROUND:CharSetEmote(lucio, "happy", 0)
    GROUND:CharSetEmote(kiran, "happy", 0)
    GROUND:CharSetEmote(kit, "happy", 0)
    GROUND:CharSetEmote(lilith, "happy", 0)
    SOUND:LoopSE("Battle/EVT_Applause_Cheer")
    UI:SetSpeaker("Everyone", true, "", -1, "", RogueEssence.Data.Gender.Unknown)
    UI:WaitShowDialogue("Congratulations, [color=#fff30a]Sprigatito[color]!")

    CommonFunctions.Dialogue(boss, 3, "Surprised", "Hey![br]Order, please!")


    GROUND:CharSetEmote(eve, "happy", 1)
    GROUND:CharSetEmote(lily, "happy", 1)
    GROUND:CharSetEmote(celia, "happy", 1)
    GROUND:CharSetEmote(dex, "happy", 1)
    GROUND:CharSetEmote(lucio, "happy", 1)
    GROUND:CharSetEmote(kiran, "happy", 1)
    GROUND:CharSetEmote(kit, "happy", 1)
    GROUND:CharSetEmote(lilith, "happy", 1)
    SOUND:StopSE("Battle/EVT_Applause_Cheer")
    GAME:WaitFrames(80)
    CommonFunctions.Dialogue(partner, 3, "Happy", "Thank you guys!")
    CommonFunctions.Dialogue(partner, 3, "Worried", "But, umm...")
    GAME:WaitFrames(60)
    CommonFunctions.Dialogue(partner, 3, "Worried", "I picked a nickname already.")

    SOUND:PlaySE('Battle/EVT_Emote_Shock')
    GROUND:CharSetEmote(eve, "shock", 1)
    GROUND:CharSetEmote(lily, "shock", 1)
    GROUND:CharSetEmote(celia, "shock", 1)
    GROUND:CharSetEmote(dex, "shock", 1)
    GROUND:CharSetEmote(lucio, "shock", 1)
    GROUND:CharSetEmote(kiran, "shock", 1)
    GROUND:CharSetEmote(kit, "shock", 1)
    GROUND:CharSetEmote(lilith, "shock", 1)
    GROUND:CharSetEmote(boss, "shock", 1)

    GAME:WaitFrames(100)
    CommonFunctions.Dialogue(kiran, 3, "Surprised", "You did?!")
    CommonFunctions.Dialogue(kit, 3, "Happy", "Took you long enough!")
    CommonFunctions.Dialogue(lucio, 3, "Happy", "What is the name?")

    CommonFunctions.Dialogue(partner, 3, "Happy", "It's " .. partner:GetDisplayName() .. ".")
    GROUND:CharTurnToCharAnimated(partner, player, 5)
    CommonFunctions.Dialogue(partner, 3, "Happy", player:GetDisplayName().. " helped me pick it!")
    GAME:WaitFrames(80)
    CommonFunctions.Dialogue(lilith, 3, "Happy", "I like it!")
    CommonFunctions.Dialogue(dex, 3, "Happy", "Pretty good one!")
    CommonFunctions.Dialogue(lily, 3, "Happy", "I think it fits you!")
    GAME:WaitFrames(60)
    CommonFunctions.Dialogue(partner, 3, "Happy", "You should thank " .. player:GetDisplayName() .. " for the name.")
    CommonFunctions.Dialogue(player, 3, "Happy", "Oh, come on![br]It was nothing!")
    GAME:WaitFrames(60)
    CommonFunctions.Dialogue(boss, 3, "Happy", "It's all good news today, I see.")

    GROUND:CharAnimateTurn(partner, Direction.Up, 4, true)
    GROUND:CharAnimateTurn(player, Direction.Up, 4, true)

    GAME:WaitFrames(60)

    CommonFunctions.Dialogue(boss, 3, "Normal", "Back to your assignment.")
    CommonFunctions.Dialogue(boss, 3, "Normal", "We know that an archaeologist will be passing from Skyscraper Mountain with a very valuable treasure.")
    CommonFunctions.Dialogue(boss, 3, "Normal", "We also suspect that they will go through Gelid Woods just at the foot of the mountain to travel as hidden as possible.")

    CommonFunctions.Dialogue(boss, 3, "Normal", "Your mission is to get that treasure and bring it back here.")
    CommonFunctions.Dialogue(boss, 3, "Normal", "Be aware, however, that there may be a team from [color=#03f8fc]Aggron's Guild[color] escorting them.")

    CommonFunctions.Dialogue(partner, 3, "Determined", "We can do it!")
    CommonFunctions.Dialogue(player, 3, "Stunned", "So we just have to beat up someone because they are carrying something we want?")
    CommonFunctions.Dialogue(player, 3, "Stunned", "Can't we like...[br]Steal it without using violence?")
    GAME:WaitFrames(60)
    CommonFunctions.Dialogue(boss, 3, "Normal", player:GetDisplayName()..", are you sure you want to do that?")
    CommonFunctions.Dialogue(boss, 3, "Normal", "I can assure you that if those escorting the archaeologist saw you,[pause=40] they wouldn't hesitate to use violence on you.")
    CommonFunctions.Dialogue(player, 3, "Stunned", "I suppose, but...")
    CommonFunctions.Dialogue(player, 3, "Pain", "Ugh, I'm not used to this!")
    GAME:WaitFrames(60)
    CommonFunctions.Dialogue(partner, 3, "Worried", "Not everyone was, "..player:GetDisplayName().."...")
    CommonFunctions.Dialogue(boss, 3, "Normal", "Well, then you got your things to do.")
    CommonFunctions.Dialogue(boss, 3, "Normal", "Good luck on your missions.")

    GROUND:CharSetEmote(eve, "happy", 0)
    GROUND:CharSetEmote(lily, "happy", 0)
    GROUND:CharSetEmote(celia, "happy", 0)
    GROUND:CharSetEmote(dex, "happy", 0)
    GROUND:CharSetEmote(lucio, "happy", 0)
    GROUND:CharSetEmote(kiran, "happy", 0)
    GROUND:CharSetEmote(kit, "happy", 0)
    GROUND:CharSetEmote(lilith, "happy", 0)
    GROUND:CharSetEmote(partner, "happy", 0)


    UI:SetSpeaker("Everyone", true, "", -1, "", RogueEssence.Data.Gender.Unknown)
    SOUND:LoopSE("Battle/EVT_Applause")
    UI:WaitShowDialogue("Yeah!")
    GROUND:CharSetEmote(eve, "happy", 1)
    GROUND:CharSetEmote(lily, "happy", 1)
    GROUND:CharSetEmote(celia, "happy", 1)
    GROUND:CharSetEmote(dex, "happy", 1)
    GROUND:CharSetEmote(lucio, "happy", 1)
    GROUND:CharSetEmote(kiran, "happy", 1)
    GROUND:CharSetEmote(kit, "happy", 1)
    GROUND:CharSetEmote(lilith, "happy", 1)
    GROUND:CharSetEmote(partner, "happy", 1)
    GAME:WaitFrames(40)
    SOUND:StopSE("Battle/EVT_Applause")

    CommonFunctions.Dialogue(player, 3, "Stunned", "Y-[pause=30]Yeah!")
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
    CommonFunctions.Dialogue(partner, 3, "Worried", "Are you sure you want to go on with the mission?")
    CommonFunctions.Dialogue(partner, 3, "Sad", "I mean,[pause=30] if you don't feel ready for it, maybe we can just grab something from the request board and tell " .. boss:GetDisplayName() .. " about it.")
    GAME:WaitFrames(60)
    
    CommonFunctions.Dialogue(player, 3, "Worried", "The problem is that I'll never be ready for anything that happens...")
    CommonFunctions.Dialogue(player, 3, "Worried", "It can't be that hard, can it?")
    CommonFunctions.Dialogue(player, 3, "Pain", "Just gotta think as little as possible about it.")
    GAME:WaitFrames(60)
    CommonFunctions.Dialogue(partner, 3, "Worried", "If you're sure...")
    CommonFunctions.Dialogue(partner, 3, "Normal", "Then let's get ready and head for it!")


    SV.meeting_done = true
    SV.first_meeting_done = true
    
    GAME:CutsceneMode(false)
end
