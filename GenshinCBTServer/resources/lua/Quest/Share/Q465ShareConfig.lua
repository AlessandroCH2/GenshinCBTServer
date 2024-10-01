-- 任务配置

-- 父任务id

main_id = 465

sub_ids =
{
    46501,
    46502,
    46503,
    46504,
    46505,
    46506,
    46507,
    46508,
    46509,
    46510,
    46511,
    46512,
    46513,
    46514,
    46515,
    46516,
    46517,
    46518,
    46519,
}

---存放断线重连生成内容，和questdata配的存档点对应
rewind_data = {}
rewind_data["46503"] = 
{
    npcs = {
        {
            id = 1218,
            alias = "Hoffman",
            script = "Actor/Quest/Q376/Soldier",
            pos = "Q465Hoffman1",
            scene_id  = 1004,
        }
    }
}

rewind_data["46505"] = 
{
    npcs = {
        {
            id = 1009,
            alias = "Diluc",
            script = "Actor/Quest/Q376/Diluc",
            pos = "Q465DilucTemp1",
        }
    }
}

rewind_data["46507"] = 
{
    npcs = {
        {
            id = 1009,
            alias = "Diluc",
            script = "Actor/Quest/Q376/Diluc",
            pos = "Q465Diluc2",
        }
    }
}

rewind_data["46508"] = 
{
--[[     avatar = {
        offline_dungeon_id = 1,
        scene_id = 3,
        pos = "Q465DilucDungeon"
    }, ]]
    npcs = {
        {
            id = 1009,
            alias = "Diluc",
            script = "Actor/Quest/Q376/Diluc",
            pos = "Q465Diluc2",
        }
    }
}

rewind_data["46511"] = 
{

}

rewind_data["46513"] = 
{
    npcs = {
        {
            id = 1218,
            alias = "Hoffman",
            script = "Actor/Quest/Q376/Soldier",
            pos = "Q465Hoffman1",
            scene_id  = 1004,
        }
    }
}
---校验用，和任务lua中生成NPC/monster/gadget/item等对应
quest_data = {}

quest_data["46502"] = 
{
    npcs = {
        {
            id = 1218,
            alias = "Hoffman",
            script = "Actor/Quest/Q376/Soldier",
            pos = "Q465Hoffman1",
            scene_id  = 1004,
        }
    }
}

quest_data["46503"] = 
{
    npcs = {
        {
            id = 1009,
            alias = "Diluc",
            script = "Actor/Quest/Q376/Diluc",
            pos = "Q465Diluc1",
        }
    }
}

quest_data["46505"] = 
{
    npcs = {
        {
            id = 1009,
            alias = "Diluc",
            script = "Actor/Quest/Q376/Diluc",
            pos = "Q465Diluc2",
        }
    }
}

-- Temp
quest_data["46507"] = 
{
    items = {
        {
            id = 100174,
            pos = "Q465DilucDungeon",
            alias = "TempDungeon",
        },
    },
}

-- Temp
quest_data["46508"] = 
{
    monsters = {
        {
            id = 22010201,
            pos = "Q465DilucDungeon",
        },
    },
}

quest_data["46510"] = 
{
    npcs = {
        {
            id = 1009,
            alias = "Diluc",
            script = "Actor/Quest/Q376/Diluc",
            pos = "Q301Hidden",
        }
    },
    --Temp
    items = {
        {
            id = 100174,
            pos = "Q465DilucDungeon",
            alias = "TempDungeon",
        },
    },
}

quest_data["46512"] = 
{
    npcs = {
        {
            id = 1218,
            alias = "Hoffman",
            script = "Actor/Quest/Q376/Soldier",
            pos = "Q465Hoffman1",
            scene_id  = 1004,
        }
    }
}

quest_data["46513"] = 
{
    npcs = {
        {
            id = 1218,
            alias = "Hoffman",
            script = "Actor/Quest/Q376/Soldier",
            pos = "Q301Hidden",
        }
    }
}