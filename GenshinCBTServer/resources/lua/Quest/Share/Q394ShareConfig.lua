-- 任务配置

-- 父任务id

main_id = 394

sub_ids =
{
    39401,
    39402,
    39403,
}

rewind_data = {}

rewind_data["39401"] = 
{
    npcs = {
        {
            id = 1009,
            alias = "Diluc",
            script = "Actor/Quest/Q376/Diluc",
            pos = "Q393DilucPos",
            data_index = 0,
        },
        {
            id = 1001,
            alias = "Wendy",
            script = "Actor/Quest/Q301/Wendy301",
            pos = "Q393WendyPos",
            data_index = 0,
        },
        {
            id = 1006,
            alias = "Qin",
            script = "Actor/Quest/Q411/Qin",
            pos = "Q393QinPos",
            data_index = 0,
        },

    }
}

rewind_data["39402"] = 
{
}


quest_data = {}

quest_data["39401"] = 
{
    trial_actors = {},
    actors = {},
    items = {},
    monsters = {},
    gadgets = {}
}