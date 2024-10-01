-- 任务配置

-- 父任务id

main_id = 464

sub_ids =
{
    46400,
    46401,
    46402,
    46403,
    46404,
    46407,
}

---存放断线重连生成内容，和questdata配的存档点对应
rewind_data = {}

rewind_data["46405"] = 
{
    
}

rewind_data["46407"] = 
{
    npcs = {
        {
            id = 1009,
            alias = "Diluc",
            script = "Actor/Quest/Q376/Diluc",
            pos = "Q464Diluc1",
        },
        {
            id = 1218,
            alias = "Hoffman",
            script = "Actor/Quest/Q376/Soldier",
            pos = "Q464Hoffman1",
            data_index = 0,
        },
    }
}

---校验用，和任务lua中生成NPC/monster/gadget/item等对应
quest_data = {}

quest_data["46406"] = 
{
    npcs = {
        {
            id = 1009,
            alias = "Diluc",
            script = "Actor/Quest/Q376/Diluc",
            pos = "Q464Diluc1",
        },
        {
            id = 1218,
            alias = "Hoffman",
            script = "Actor/Quest/Q376/Soldier",
            pos = "Q464Hoffman1",
            data_index = 0,
        },
    }
}

quest_data["46407"] = 
{
    npcs = {
        {
            id = 1009,
            alias = "Diluc",
            script = "Actor/Quest/Q376/Diluc",
            pos = "Q301Hidden",
        },
        {
            id = 1218,
            alias = "Hoffman",
            script = "Actor/Quest/Q376/Soldier",
            pos = "Q301Hidden",
            data_index = 0,
        },
    }
}