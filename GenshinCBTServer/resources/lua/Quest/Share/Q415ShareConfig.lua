-- 任务配置

-- 父任务id

main_id = 415

sub_ids =
{
    41501,
    41502,
    41503,
    41504,
    41505,
    41506,
}

rewind_data = {}

rewind_data["41502"] = 
{
    avatar = {
        scene_id = 1005,
        pos = "PlayerPos"
    },
    npcs = {
        {
            id = 1130,
            alias = "SneakJudge",
            script = "Actor/Npc/SneakJudge",
            scene_id = 1005,
            pos = "JudgePos",
            data_index = 0,
        }
    }
}

rewind_data["41505"] = 
{
    -- avatar = {
    --     scene_id = 1005,
    --     pos = "PlayerPos"
    -- },
    npcs = {
        {
            id = 1130,
            alias = "SneakJudge",
            script = "Actor/Npc/SneakJudge",
            scene_id = 1005,
            pos = "JudgePos",
            data_index = 0,
        }
    }
}

quest_data = {}

-- quest_data["41502"] = 
-- {
--     trial_actors = {

--     },
--     actors = {
        
--     },
--     items = {
--         -- {
--         --     id = 100004,
--         --     pos = "Q415Pos2",
--         --     alias = "Ball",
--         -- },
--     },
--     monsters = {
--         -- {
--         --     id = 20010801,
--         --     pos = "Q415Pos2",
--         -- },
--         -- {
--         --     id = 20010801,
--         --     pos = "Q415Pos2",
--         -- }
--     },
--     gadgets = {
--         -- {
--         --     id = 70300004,
--         --     pos = "Q415Pos2",
--         --     alias = "GoalMarker415",
--         -- }
--     }
-- }
