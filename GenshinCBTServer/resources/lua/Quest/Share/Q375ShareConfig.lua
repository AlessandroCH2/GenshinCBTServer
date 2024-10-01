-- 任务配置

-- 父任务id

main_id = 375

sub_ids =
{
    37501,
    37502,
    37503,
    37504,
    37505,  
    37506,  
    37507,  
}

rewind_data = {}

rewind_data["37501"] = 
{
    npcs = {
        {
            id = 1001,
            alias = "Wendy",
            script = "Actor/Quest/Q301/Wendy301",
            pos = "Q374WendyTemp",
            data_index = 0,
            scene_id  = 1008,
            room_id = 1,

        },
        {
            id = 1164,
            alias = "Guard",
            script = "Actor/Quest/Q375/Guard",
            pos = "Q374Guard",
            data_index = 0,
            scene_id  = 1008,
            room_id = 1,

        },

    }
}

rewind_data["37502"] = 
{
    npcs = {
        {
            id = 1164,
            alias = "Guard",
            script = "Actor/Quest/Q375/Guard",
            pos = "Q374Guard",
            data_index = 0,
            scene_id  = 1008,
            room_id = 1,

        },

    }
}

rewind_data["37503"] = 
{
}

rewind_data["37504"] = 
{
}

rewind_data["37505"] = 
{
}

rewind_data["37506"] = 
{
}

rewind_data["37507"] = 
{
}
-- rewind_data["37502"] = 
-- {
--     npcs = {
--         {
--             id = 1001,
--             alias = "Wendy",
--             script = "Actor/Quest/Q301/Wendy301",
--             pos = "Q374WendyTemp",
--             data_index = 0,
--             scene_id  = 1008,
--         },

--     }
-- }

quest_data = {}

quest_data["37502"] = 
{
    trial_actors = {

    },
    actors = {
        
    },
    items = {
        -- {
        --     id = 100004,
        --     pos = "Q404Pos2",
        --     alias = "Ball",
        -- },
    },
    monsters = {
        -- {
        --     id = 20010801,
        --     pos = "Q404Pos2",
        -- },
        -- {
        --     id = 20010801,
        --     pos = "Q404Pos2",
        -- }
    },
    gadgets = {
        -- {
        --     id = 70300004,
        --     pos = "Q404Pos2",
        --     alias = "GoalMarker404",
        -- }
    }
}
