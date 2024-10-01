-- 任务配置

-- 父任务id

main_id = 452

sub_ids =
{
    45201,
    45202,
    45203,
    45204,
    45205,
}

rewind_data = {}
rewind_data["45202"] = 
{
    npcs = 
    {
        {
            id = 1002,
            alias = "Ambor",
            script = "Actor/Quest/Q301/Ambor301",
            pos = "Q452AmborFight",
            data_index = 0,
            scene_id  = 3,
        },
    }
}
rewind_data["45205"] = 
{
    npcs = 
    {
        {
            id = 1151,
            alias = "Farmer",
            script = "Actor/Npc/RazorFarmer",
            pos = "Q452FightFarmer",
            data_index = 0,
            scene_id  = 3,
        },
    }

}

quest_data = {}

