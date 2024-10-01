-- 任务配置

-- 父任务id

main_id = 373

sub_ids =
{
    37301,
    37302,
    37303,
}

rewind_data = {}

rewind_data["37301"] = 
{
    npcs = {
        {
            id = 1001,
            alias = "Wendy",
            script = "Actor/Quest/Q301/Wendy301",
            pos = "Q373WendyTemp",
            data_index = 0,
            scene_id  = 1008,
            room_id = 1,
        },
        {
            id = 1161,
            alias = "Maid",
            script = "Actor/Quest/Q413/Pastor",
            pos = "Q374Maid1Temp",
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

rewind_data["37302"] = 
{
    npcs = {
        {
            id = 1001,
            alias = "Wendy",
            script = "Actor/Quest/Q301/Wendy301",
            pos = "Q373WendyTemp",
            data_index = 0,
            scene_id  = 1008,
            room_id = 1,
        },
        {
            id = 1161,
            alias = "Maid",
            script = "Actor/Quest/Q413/Pastor",
            pos = "Q374Maid1Temp",
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

rewind_data["37303"] = 
{
    npcs = {
        {
            id = 1001,
            alias = "Wendy",
            script = "Actor/Quest/Q301/Wendy301",
            pos = "Q373WendyTemp",
            data_index = 0,
            scene_id  = 1008,
            room_id = 1,
        },

        -- {
        --     id = 1005,
        --     alias = "Paimon",
        --     script = "Actor/Quest/Q352/Paimon",
        --     pos = "Q373PaimonTemp",
        --     data_index = 0,
        --     scene_id  = 1008,
        --     room_id = 1,
        -- },
        {
            id = 1161,
            alias = "Maid",
            script = "Actor/Quest/Q413/Pastor",
            pos = "Q374Maid1Temp",
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



quest_data = {}

quest_data["37302"] = 
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
