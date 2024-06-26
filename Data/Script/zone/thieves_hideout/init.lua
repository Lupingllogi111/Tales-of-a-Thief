--[[
    init.lua
    Created: 12/31/2023 20:50:45
    Description: Autogenerated script file for the map thieves_hideout.
]]--
-- Commonly included lua functions and data
require 'common'

-- Package name
local thieves_hideout = {}

-------------------------------
-- Zone Callbacks
-------------------------------
---thieves_hideout.Init(zone)
--Engine callback function
function thieves_hideout.Init(zone)


end

---thieves_hideout.EnterSegment(zone, rescuing, segmentID, mapID)
--Engine callback function
function thieves_hideout.EnterSegment(zone, rescuing, segmentID, mapID)


end

---thieves_hideout.ExitSegment(zone, result, rescue, segmentID, mapID)
--Engine callback function
function thieves_hideout.ExitSegment(zone, result, rescue, segmentID, mapID) 
    if result ~= RogueEssence.Data.GameProgress.ResultType.Cleared then -- If you fainted...
        if not SV.guild_maze_clearing.test_done then -- If it's the first time...
            GAME:EndDungeonRun(result, "thieves_hideout", -1, 2, 2, false, false)
            GAME:EnterZone("thieves_hideout", -1, 2, 2)
        else --If it's not the first day  
            --Go to the guild and end the day
            GAME:EndDungeonRun(result, "thieves_hideout", 0, 0, 0, false, false)
          
        end
    else -- If you won...
        if segmentID == 1 then
            SV.guild_maze_clearing.beat_boss = true
        elseif segmentID == 0 then
            --GAME:EndDungeonRun(result, "thieves_hideout", -1, 3, 0, false, false)
        end
        GAME:EnterZone("thieves_hideout", -1, 3, 0)
    end

    
    --[[
    if result ~= RogueEssence.Data.GameProgress.ResultType.Cleared then 
        if not SV.guild_maze_clearing.test_done then -- If it's the first time...
            GAME:EndDungeonRun(result, "thieves_hideout", -1, 2, 2, false, false)
            GAME:EnterZone("thieves_hideout", -1, 2, 2)
        elseif SV.guild_maze_clearing.test_done then     --If it's not the first day  
            --Go to the guild
        
        
        
                
        end   
    elseif result == RogueEssence.Data.GameProgress.ResultType.Cleared then
        if segmentID == 1 then
            SV.guild_maze_clearing.beat_boss = true
                
        elseif segmentID == 0 then
            --GAME:EndDungeonRun(result, "thieves_hideout", -1, 3, 0, false, false)
        end
        GAME:EnterZone("thieves_hideout", -1, 3, 0)

    end


    if not SV.guild_maze_clearing.test_done then -- If it's the first time...
        
    elseif SV.guild_maze_clearing.test_done == true then     --If it's not the first day  
                --Code for later
    
    
    
            
    end
            ]]--        
    
end

---thieves_hideout.Rescued(zone, name, mail)
--Engine callback function
function thieves_hideout.Rescued(zone, name, mail)


end

return thieves_hideout

