require 'common'
require 'CommonFunctions'
hideout_entrance_ch2 = {}


function hideout_entrance_ch2.completedMission()
    local player = CH("PLAYER")
    local partner = CH("Teammate1")
    AI:DisableCharacterAI(partner)
    SOUND:FadeOutBGM(1)
    GAME:CutsceneMode(true)
    local coro1 = TASK:BranchCoroutine(function()  GROUND:MoveInDirection(player, Direction.Right, 40, false, 1.5) end)
    local coro2 = TASK:BranchCoroutine(function()  GROUND:MoveInDirection(partner, Direction.Right, 40, false, 1.5) end)
    TASK:JoinCoroutines({coro1,coro2})

    GAME:WaitFrames(30)
    CommonFunctions.Dialogue(player, 3, "Sigh", "Phew...[pause=0] That was hard...")
    CommonFunctions.Dialogue(partner, 3, "Happy", "It wasn't that bad for being our first one!")

    local coro1 = TASK:BranchCoroutine(function()  GROUND:CharTurnToCharAnimated(player, partner, 4) end)
    local coro2 = TASK:BranchCoroutine(function()  GROUND:CharTurnToCharAnimated(partner, player, 4) end)
    TASK:JoinCoroutines({coro1,coro2})
    GAME:WaitFrames(60)

    CommonFunctions.Dialogue(partner, 3, "Normal", "So what did you think?")
    GAME:WaitFrames(60)

    CommonFunctions.Dialogue(player, 3, "Worried", "Well...")
    GAME:WaitFrames(60)
    CommonFunctions.Dialogue(player, 3, "Worried", "Apart from the obvious fact we just did something illegal...")
    CommonFunctions.Dialogue(player, 3, "Happy", "It was pretty fun!")
    CommonFunctions.Dialogue(player, 3, "Normal", "And seeing the faces of those two when we beat them after they were so sure they were going to win...")
    CommonFunctions.Dialogue(player, 3, "Joyous", "Priceless!")
    GAME:WaitFrames(60)
    CommonFunctions.Dialogue(partner, 3, "Happy", "Yeah, I admit that was funny.")
    CommonFunctions.Dialogue(player, 3, "Worried", "Speaking of, [pause=40]what even is the thing we stole?")
    CommonFunctions.Dialogue(partner, 3, "Worried", "I don't know...")
    CommonFunctions.Dialogue(partner, 3, "Worried", "It looks like some sort of ancient chest...")
    CommonFunctions.Dialogue(player, 3, "Worried", "A chest?[br]What do you think that could be inside?")
    CommonFunctions.Dialogue(partner, 3, "Worried", "Something valuable, that's for sure...")
    CommonFunctions.Dialogue(player, 3, "Worried", "Let's see what's inside.")
    CommonFunctions.Monologue(partner:GetDisplayName() .. " tried opening the chest.")
    GAME:WaitFrames(40)
    
    CommonFunctions.Dialogue(partner, 3, "Worried", "Huh...[br]I can't open it...")
    CommonFunctions.Dialogue(player, 3, "Worried", "What?")
    CommonFunctions.Dialogue(player, 3, "Normal", "Let me try.")
    CommonFunctions.Monologue(player:GetDisplayName() .. " tried opening the chest.")
    GAME:WaitFrames(40)
    GROUND:CharSetEmote(player, "sweating", 1)
    SOUND:PlaySE('Battle/EVT_Emote_Sweating')
    GAME:WaitFrames(100)
    CommonFunctions.Dialogue(player, 3, "Pain", "Ugh![br]I can't make it move even a little!")
    CommonFunctions.Dialogue(partner, 3, "Worried", "Weird...[br]The lock must be stronger than a regular one...")
    CommonFunctions.Dialogue(player, 3, "Worried", "How do you think we could open it?")

    CommonFunctions.Dialogue(partner, 3, "Worried", "I don't know what else could work other than brute force...")
    CommonFunctions.Dialogue(partner, 3, "Normal", "But let's not worry about that.")
    CommonFunctions.Dialogue(partner, 3, "Normal", "For now, we should go and tell [color=#00ffff]Ma'am[color] about this. ")
    GAME:FadeOut(false, 20)
    GAME:EnterZone('thieves_hideout', -1, 5, 1)

    GAME:CutsceneMode(true)

end