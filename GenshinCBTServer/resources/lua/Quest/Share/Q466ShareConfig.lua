-- 任务配置

-- 父任务id

main_id = 466

sub_ids =
{
    46601,
    46602,
    46603,
    46604,
    46605,
    46606,
    46607,
    46608,
    46609,
    46610,
    46611,
    46612,
    46613,
    46614,
    46615,
    46616,
    46617,
    46618,
    46619,
    46620,
    46621,
    46622,
}

---存放断线重连生成内容，和questdata配的存档点对应
rewind_data = {}

rewind_data["46602"] = 
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

rewind_data["46604"] = 
{
    npcs = {
        {
            id = 1009,
            alias = "Diluc",
            script = "Actor/Quest/Q376/Diluc",
            pos = "Q466Diluc1",
        }
    },
    items = {
        {
            id = 100177,
            pos = "Q466Lure1",
            alias = "Lure",
        },
    },
}

rewind_data["46605"] = 
{
    npcs = {
        {
            id = 1009,
            alias = "Diluc",
            script = "Actor/Quest/Q376/Diluc",
            pos = "Q466Diluc1",
        }
    },
}

rewind_data["46607"] = 
{
    npcs = {
        {
            id = 1009,
            alias = "Diluc",
            script = "Actor/Quest/Q376/Diluc",
            pos = "Q466Diluc1",
        }
    },
}

rewind_data["46608"] = 
{

}

rewind_data["46619"] = 
{

}

rewind_data["46610"] = 
{
    npcs = {
        {
            id = 1009,
            alias = "Diluc",
            script = "Actor/Quest/Q376/Diluc",
            pos = "Q466Diluc2",
            scene_id  = 1009,
        },
        {
            id = 1218,
            alias = "Hoffman",
            script = "Actor/Quest/Q376/Soldier",
            pos = "Q466Hoffman1",
            scene_id  = 1009,
        }
    },
}

--[[ rewind_data["46611"] = 
{
    npcs = {
        {
            id = 1009,
            alias = "Diluc",
            script = "Actor/Quest/Q376/Diluc",
            pos = "Q466Diluc2",
            scene_id  = 1009,
        },
        {
            id = 1218,
            alias = "Hoffman",
            script = "Actor/Quest/Q376/Soldier",
            pos = "Q466Hoffman1",
            scene_id  = 1009,
        }
    },
    items = {
        {
            id = 100177,
            pos = "Q466Lure2",
            alias = "Lure",
        },
    },
} ]]

--[[ rewind_data["46612"] = 
{

} ]]

rewind_data["46613"] = 
{
    npcs = {
        {
            id = 1009,
            alias = "Diluc",
            script = "Actor/Quest/Q376/Diluc",
            pos = "Q466Diluc2",
            scene_id  = 1009,
        },
        {
            id = 1218,
            alias = "Hoffman",
            script = "Actor/Quest/Q376/Soldier",
            pos = "Q466Hoffman1",
            scene_id  = 1009,
        },
        {
            id = 1217,
            alias = "Guard",
            script = "Actor/Quest/Q376/Soldier",
            pos = "Q466Guard1",
            scene_id  = 1009,
        },
    },
}

--[[ rewind_data["46614"] = 
{

} ]]

rewind_data["46616"] = 
{
    npcs = {
        {
            id = 1009,
            alias = "Diluc",
            script = "Actor/Quest/Q376/Diluc",
            pos = "Q466FrontDoor",
        }
    },
}

rewind_data["46613"] = 
{
    npcs = {
        {
            id = 1009,
            alias = "Diluc",
            script = "Actor/Quest/Q376/Diluc",
            pos = "Q466Diluc2",
            scene_id  = 1009,
        },
        {
            id = 1218,
            alias = "Hoffman",
            script = "Actor/Quest/Q376/Soldier",
            pos = "Q466Hoffman1",
            scene_id  = 1009,
        },
    },
}
---校验用，和任务lua中生成NPC/monster/gadget/item等对应
quest_data = {}

quest_data["46601"] = 
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

quest_data["46602"] = 
{
    npcs = {
        {
            id = 1009,
            alias = "Diluc",
            script = "Actor/Quest/Q376/Diluc",
            pos = "Q301Hidden",
        }
    }
}

quest_data["46603"] = 
{
    npcs = {
        {
            id = 1009,
            alias = "Diluc",
            script = "Actor/Quest/Q376/Diluc",
            pos = "Q466Diluc1",
        }
    },
    items = {
        {
            id = 100177,
            pos = "Q466Lure1",
            alias = "Lure",
        },
    },
}

-- Temp
quest_data["46605"] = 
{
    monsters = {
        {
            id = 20010101,
            pos = "Q466Monster1",
        },
        {
            id = 20010101,
            pos = "Q466Monster1",
        },
        {
            id = 20010201,
            pos = "Q466Monster2",
        },
        {
            id = 20010901,
            pos = "Q466Monster3",
        },
    },
}

-- Temp
quest_data["46608"] = 
{
    npcs = {
        {
            id = 1009,
            alias = "Diluc",
            script = "Actor/Quest/Q376/Diluc",
            pos = "Q466Diluc2",
            scene_id  = 1009,
        },
        {
            id = 1218,
            alias = "Hoffman",
            script = "Actor/Quest/Q376/Soldier",
            pos = "Q466Hoffman1",
            scene_id  = 1009,
        }
    },
}

quest_data["46610"] = 
{
    items = {
        {
            id = 100177,
            pos = "Q466Lure2",
            alias = "Lure",
        },
    },
}

quest_data["46611"] = 
{
    npcs = {
        {
            id = 1009,
            alias = "Diluc",
            script = "Actor/Quest/Q376/Diluc",
            pos = "Q466Diluc2",
            scene_id  = 1009,
        },
        {
            id = 1218,
            alias = "Hoffman",
            script = "Actor/Quest/Q376/Soldier",
            pos = "Q466Hoffman1",
            scene_id  = 1009,
        },
        {
            id = 1217,
            alias = "Guard",
            script = "Actor/Quest/Q376/Soldier",
            pos = "Q466Guard1",
            scene_id  = 1009,
        },
    },
}

quest_data["46613"] = 
{
    monsters = {
        {
            id = 22010201,
            pos = "Q466Monster4",
        },
    },
}

quest_data["46615"] = 
{
    npcs = {
        {
            id = 1009,
            alias = "Diluc",
            script = "Actor/Quest/Q376/Diluc",
            pos = "Q466FrontDoor",
        }
    }
}

quest_data["46617"] = 
{
    npcs = {
        {
            id = 1009,
            alias = "Diluc",
            script = "Actor/Quest/Q376/Diluc",
            pos = "Q466Diluc2",
            scene_id  = 1009,
        },
        {
            id = 1218,
            alias = "Hoffman",
            script = "Actor/Quest/Q376/Soldier",
            pos = "Q466Hoffman1",
            scene_id  = 1009,
        },
    },
}

quest_data["46618"] = 
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
        },
    },
}