--[[
    scriptvars.lua
      This file contains all the default values for the script variables. AKA on a new game this file is loaded!
      Script variables are stored in a table  that gets saved when the game is saved.
      Its meant to be used for scripters to add data to be saved and loaded during a playthrough.
      
      You can simply refer to the "SV" global table like any other table in any scripts!
      You don't need to write a default value in this lua script to add a new value.
      However its good practice to set a default value when you can!
      
      It is important to stress that this file initializes the SV table ONCE when the player begins a new save file, and NEVER EVER again.
      This means that edits on this file will NOT be added on the script variables of an already existing file!
      To upgrade existing script variables, use the OnUpgrade in script services.  Example found in Data/Script/services/debug_tools/init.lua
      
    --Examples:
    SV.SomeVariable = "Smiles go for miles!"
    SV.AnotherVariable = 2526
    SV.AnotherVariable = { something={somethingelse={} } }
    SV.AnotherVariable = function() PrintInfo('lmao') end
]]--

-----------------------------------------------
-- Services Defaults
-----------------------------------------------
SV.Services =
{
  --Anything that applies to services should be put in here, or assigned to this or a subtable of this in the service's definition script
}

-----------------------------------------------
-- General Defaults
-----------------------------------------------
SV.General =
{
  Rescue = nil,
  Starter = MonsterID("missingno", 0, "normal", Gender.Genderless)
  --Anything that applies to more than a single level, and that is too small to make a sub-table for, should be put in here ideally, or a sub-table of this
 
}

SV.checkpoint = 
{
  Zone    = 'guildmaster_island', Segment  = -1,
  Map  = 1, Entry  = 0
}



SV.MissionsEnabled = false

SV.MissionPrereq =
{
  DungeonsCompleted = {}, --Uses a bitmap to determine which sections are complete (
  NumDungeonsCompleted = 0
}

SV.adventure = 
{
  Thief    = false,
  Tutors = { }
}

SV.base_shop = {
	{ Index = "food_apple", Amount = 0, Price = 50},
	{ Index = "food_apple_big", Amount = 0, Price = 150},
	{ Index = "food_banana", Amount = 0, Price = 500},
	{ Index = "food_chestnut", Amount = 0, Price = 80},
	{ Index = "berry_leppa", Amount = 0, Price = 80}
}
SV.base_trades = {
	{ Item="xcl_family_bulbasaur_02", ReqItem={"",""}},
	{ Item="xcl_family_charmander_02", ReqItem={"",""}},
	{ Item="xcl_family_squirtle_02", ReqItem={"",""}}
}

SV.unlocked_trades = {
}

SV.DestinationFloorNotified = false
SV.MonsterHouseMessageNotified = false
SV.OutlawDefeated = false
SV.OutlawGoonsDefeated = false
SV.MapTurnCounter = -1

SV.TemporaryFlags =
{
  MissionCompleted = false,--used to mark if there are any pending missions to hand in.
  PriorMapSetting = nil,--Used to mark what the player had their minimap setting whenever the game needs to temporarily change it to something else.
}

--empty string or a -1 indicates that there's nothing there currently.
--board of jobs you've actually taken.
SV.TakenBoard =
{
  {
    Client = "",
    Target = "",
    Flavor = "",
    Title = "",
    Zone = "",
    Segment = -1,
    Floor = -1,
    Reward = "",
    Type = -1,
    Completion = -1,
    Taken = false,
    Difficulty = "",
    Item = "",
    Special = "",
    ClientGender = -1,
    TargetGender = -1,
    BonusReward = "",
    BackReference = -1
  },
  {
    Client = "",
    Target = "",
    Flavor = "",
    Title = "",
    Zone = "",
    Segment = -1,
    Floor = -1,
    Reward = "",
    Type = -1,
    Completion = -1,
    Taken = false,
    Difficulty = "",
    Item = "",
    Special = "",
    ClientGender = -1,
    TargetGender = -1,
    BonusReward = "",
    BackReference = -1
  },
  {
    Client = "",
    Target = "",
    Flavor = "",
    Title = "",
    Zone = "",
    Segment = -1,
    Floor = -1,
    Reward = "",
    Type = -1,
    Completion = -1,
    Taken = false,
    Difficulty = "",
    Item = "",
    Special = "",
    ClientGender = -1,
    TargetGender = -1,
    BonusReward = "",
    BackReference = -1
  },
  {
    Client = "",
    Target = "",
    Flavor = "",
    Title = "",
    Zone = "",
    Segment = -1,
    Floor = -1,
    Reward = "",
    Type = -1,
    Completion = -1,
    Taken = false,
    Difficulty = "",
    Item = "",
    Special = "",
    ClientGender = -1,
    TargetGender = -1,
    BonusReward = "",
    BackReference = -1
  },
  {
    Client = "",
    Target = "",
    Flavor = "",
    Title = "",
    Zone = "",
    Segment = -1,
    Floor = -1,
    Reward = "",
    Type = -1,
    Completion = -1,
    Taken = false,
    Difficulty = "",
    Item = "",
    Special = "",
    ClientGender = -1,
    TargetGender = -1,
    BonusReward = "",
    BackReference = -1
  },
  {
    Client = "",
    Target = "",
    Flavor = "",
    Title = "",
    Zone = "",
    Segment = -1,
    Floor = -1,
    Reward = "",
    Type = -1,
    Completion = -1,
    Taken = false,
    Difficulty = "",
    Item = "",
    Special = "",
    ClientGender = -1,
    TargetGender = -1,
    BonusReward = "",
    BackReference = -1
  },
  {
    Client = "",
    Target = "",
    Flavor = "",
    Title = "",
    Zone = "",
    Segment = -1,
    Floor = -1,
    Reward = "",
    Type = -1,
    Completion = -1,
    Taken = false,
    Difficulty = "",
    Item = "",
    Special = "",
    ClientGender = -1,
    TargetGender = -1,
    BonusReward = "",
    BackReference = -1
  },
  {
    Client = "",
    Target = "",
    Flavor = "",
    Title = "",
    Zone = "",
    Segment = -1,
    Floor = -1,
    Reward = "",
    Type = -1,
    Completion = -1,
    Taken = false,
    Difficulty = "",
    Item = "",
    Special = "",
    ClientGender = -1,
    TargetGender = -1,
    BonusReward = "",
    BackReference = -1
  }

}

--Needed to save data about dungeons
SV.ExpectedLevel = {}
SV.DungeonOrder = {}
SV.StairType = {}

--jobs on the mission board.
SV.MissionBoard =
{
  {
    Client = "",
    Target = "",
    Flavor = "",
    Title = "",
    Zone = "",
    Segment = -1,
    Floor = -1,
    Reward = "",
    Type = -1,
    Completion = -1,
    Taken = false,
    Difficulty = "",
    Item = "",
    Special = "",
    ClientGender = -1,
    TargetGender = -1,
    BonusReward = ""
  },
  {
    Client = "",
    Target = "",
    Flavor = "",
    Title = "",
    Zone = "",
    Segment = -1,
    Floor = -1,
    Reward = "",
    Type = -1,
    Completion = -1,
    Taken = false,
    Difficulty = "",
    Item = "",
    Special = "",
    ClientGender = -1,
    TargetGender = -1,
    BonusReward = ""
  },
  {
    Client = "",
    Target = "",
    Flavor = "",
    Title = "",
    Zone = "",
    Segment = -1,
    Floor = -1,
    Reward = "",
    Type = -1,
    Completion = -1,
    Taken = false,
    Difficulty = "",
    Item = "",
    Special = "",
    ClientGender = -1,
    TargetGender = -1,
    BonusReward = ""
  },
  {
    Client = "",
    Target = "",
    Flavor = "",
    Title = "",
    Zone = "",
    Segment = -1,
    Floor = -1,
    Reward = "",
    Type = -1,
    Completion = -1,
    Taken = false,
    Difficulty = "",
    Item = "",
    Special = "",
    ClientGender = -1,
    TargetGender = -1,
    BonusReward = ""
  },
  {
    Client = "",
    Target = "",
    Flavor = "",
    Title = "",
    Zone = "",
    Segment = -1,
    Floor = -1,
    Reward = "",
    Type = -1,
    Completion = -1,
    Taken = false,
    Difficulty = "",
    Item = "",
    Special = "",
    ClientGender = -1,
    TargetGender = -1,
    BonusReward = ""
  },
  {
    Client = "",
    Target = "",
    Flavor = "",
    Title = "",
    Zone = "",
    Segment = -1,
    Floor = -1,
    Reward = "",
    Type = -1,
    Completion = -1,
    Taken = false,
    Difficulty = "",
    Item = "",
    Special = "",
    ClientGender = -1,
    TargetGender = -1,
    BonusReward = ""
  },
  {
    Client = "",
    Target = "",
    Flavor = "",
    Title = "",
    Zone = "",
    Segment = -1,
    Floor = -1,
    Reward = "",
    Type = -1,
    Completion = -1,
    Taken = false,
    Difficulty = "",
    Item = "",
    Special = "",
    ClientGender = -1,
    TargetGender = -1,
    BonusReward = ""
  },
  {
    Client = "",
    Target = "",
    Flavor = "",
    Title = "",
    Zone = "",
    Segment = -1,
    Floor = -1,
    Reward = "",
    Type = -1,
    Completion = -1,
    Taken = false,
    Difficulty = "",
    Item = "",
    Special = "",
    ClientGender = -1,
    TargetGender = -1,
    BonusReward = ""
  }

}

--Jobs on the outlaw board.
SV.OutlawBoard =
{
  {
    Client = "",
    Target = "",
    Flavor = "",
    Title = "",
    Zone = "",
    Segment = -1,
    Floor = -1,
    Reward = "",
    Type = -1,
    Completion = -1,
    Taken = false,
    Difficulty = "",
    Item = "",
    Special = "",
    ClientGender = -1,
    TargetGender = -1,
    BonusReward = ""
  },
  {
    Client = "",
    Target = "",
    Flavor = "",
    Title = "",
    Zone = "",
    Segment = -1,
    Floor = -1,
    Reward = "",
    Type = 1,
    Completion = -1,
    Taken = false,
    Difficulty = "",
    Item = "",
    Special = "",
    ClientGender = -1,
    TargetGender = -1,
    BonusReward = ""
  },
  {
    Client = "",
    Target = "",
    Flavor = "",
    Title = "",
    Zone = "",
    Segment = -1,
    Floor = -1,
    Reward = "",
    Type = -1,
    Completion = -1,
    Taken = false,
    Difficulty = "",
    Item = "",
    Special = "",
    ClientGender = -1,
    TargetGender = -1,
    BonusReward = ""
  },
  {
    Client = "",
    Target = "",
    Flavor = "",
    Title = "",
    Zone = "",
    Segment = -1,
    Floor = -1,
    Reward = "",
    Type = -1,
    Completion = -1,
    Taken = false,
    Difficulty = "",
    Item = "",
    Special = "",
    ClientGender = -1,
    TargetGender = -1,
    BonusReward = ""
  },
  {
    Client = "",
    Target = "",
    Flavor = "",
    Title = "",
    Zone = "",
    Segment = -1,
    Floor = -1,
    Reward = "",
    Type = -1,
    Completion = -1,
    Taken = false,
    Difficulty = "",
    Item = "",
    Special = "",
    ClientGender = -1,
    TargetGender = -1,
    BonusReward = ""
  },
  {
    Client = "",
    Target = "",
    Flavor = "",
    Title = "",
    Zone = "",
    Segment = -1,
    Floor = -1,
    Reward = "",
    Type = -1,
    Completion = -1,
    Taken = false,
    Difficulty = "",
    Item = "",
    Special = "",
    ClientGender = -1,
    TargetGender = -1,
    BonusReward = ""
  },
  {
    Client = "",
    Target = "",
    Flavor = "",
    Title = "",
    Zone = "",
    Segment = -1,
    Floor = -1,
    Reward = "",
    Type = -1,
    Completion = -1,
    Taken = false,
    Difficulty = "",
    Item = "",
    Special = "",
    ClientGender = -1,
    TargetGender = -1,
    BonusReward = ""
  },
  {
    Client = "",
    Target = "",
    Flavor = "",
    Title = "",
    Zone = "",
    Segment = -1,
    Floor = -1,
    Reward = "",
    Type = -1,
    Completion = -1,
    Taken = false,
    Difficulty = "",
    Item = "",
    Special = "",
    ClientGender = -1,
    TargetGender = -1,
    BonusReward = ""
  }
}

SV.missions =
{
  Missions = { },
  FinishedMissions = { },
}

SV.magnagate =
{
  Cards = 0
}

-----------------------------------------------
-- Level Specific Defaults
-----------------------------------------------
SV.conceal_forest_entrance =
{
  first_cutscene = false,
  found_player = false
}
SV.guild_maze_entrance =
{
  intro = false,
  first_entry_done = false,
  admit_cutscene_done = false
}
SV.guild_maze_clearing =
{
  test_done = false,
  first_boss_intro = false,
  beat_boss = false
}
SV.cave_storage_room =
{
  presented_to_elm = false
}
SV.guildmasters_office =
{
  officially_joined = false,
  action = -1,
  on_cutscene = false
  
}
SV.guild = 
{
  is_presenting = false,
  randomized_seed = -1, --this is used to change the mons that are on display in the entrance of the hideout each day.
  lets_explore_cut = false,
  presented_to_dex = false,
  presented_to_celia = false,
  presented_to_kathy = false,
  presented_to_lupin = false,
  presented_to_lily = false,
  presented_to_illusion = false,
  storagekeeper_annoyed_times = 0,
  storagekeeper_is_annoyed = false,
  presented_to_eve = false,
  presented_to_overcharge = false,
  having_dinner = false
}
SV.sleeping = false
SV.first_meeting_done = false
SV.meeting_done = false
SV.refreshed_shop_stock = true
SV.shop_stock = {}
SV.progression =
{
  chapter = 1,
  first_day_done = false



}
SV.special_dialogue =
{
  c2_lily_diag = false

}
SV.gelid_woods =
{
  intro = false,
  boss_intro = false,
  beat_boss = false
}
-----------------------------------------------
-- Partner stuff                              |
-----------------------------------------------
SV.partner =
{
  positionX = -1,
  positionY = -1,
  direction = -1,
  entrance = -1
  
}