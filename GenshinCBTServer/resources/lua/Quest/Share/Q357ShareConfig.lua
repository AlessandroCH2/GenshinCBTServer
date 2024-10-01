-- 任务配置

-- 父任务id

main_id = 357

sub_ids =
{
    -- 35701,
    -- 35702,
    -- 35703,
    -- 35704,
    -- 35705,
    -- 35706,
    -- 35707,
    -- 35708,
    -- 35709,
    -- 35710,
    -- 35711,
    35721,
    35722,
    35723,
    35724,
    35725,
}

---存放断线重连生成内容，和questdata配的存档点对应
rewind_data = {}

rewind_data["35701"] = 
{
    avatar = {
        scene_id = 3,
        pos = "Q35701RewindAvatar"
    },
    npcs = {
        {
            id = 1002,
            alias = "Ambor",
            script = "Actor/Quest/Q301/Ambor301",
            pos = "Q356Ambor3",
            data_index = 0,
            scene_id  = 3,
        }
    },
    gadgets = {
--[[         {
            id = 70300013,
            pos = "Q356Stone1",
        }, ]]
--[[         {
            id = 40200020,
            pos = "Q357Wind1",
        },
        {
            id = 40200020,
            pos = "Q357Wind2",
        },
        {
            id = 40200020,
            pos = "Q357Wind3",
        },
        {
            id = 40200020,
            pos = "Q357Wind4",
        },
        {
            id = 40200020,
            pos = "Q357Wind5",
        },
        {
            id = 40200020,
            pos = "Q357Wind6",
        },
        {
            id = 40200020,
            pos = "Q357Wind7",
        }, ]]
    }
}

rewind_data["35703"] = 
{
--[[     avatar = {
        scene_id = 3,
        pos = "Q35703Player"
    }, ]]
    npcs = {
        {
            id = 1002,
            alias = "Ambor",
            script = "Actor/Quest/Q301/Ambor301",
            pos = "Q357Ambor1",
            data_index = 0,
            scene_id  = 3,
        }
    }
}

rewind_data["35708"] = 
{
--[[     avatar = {
        scene_id = 3,
        pos = "Q35708Player"
    }, ]]
    npcs = {
        {
            id = 1002,
            alias = "Ambor",
            script = "Actor/Quest/Q301/Ambor301",
            pos = "Q357Ambor3",
            data_index = 0,
            scene_id  = 3,
        },
        {
            id = 1004,
            alias = "Gaia",
            script = "Actor/Quest/Q301/Gaia301",
            pos = "Q357Gaia2",
            data_index = 0,
            scene_id  = 3,
        }
    }
}

rewind_data["35721"] = 
{
    avatar = {
        scene_id = 3,
        pos = "Q35701RewindAvatar"
    },
}

---校验用，和任务lua中生成NPC/monster/gadget/item等对应
quest_data = {}

quest_data["35701"] = 
{
    npcs = {
        {
            id = 1002,
            alias = "Ambor",
            script = "Actor/Quest/Q301/Ambor301",
            pos = "Q356Ambor3",
            data_index = 0,
            scene_id  = 3,
        }
    },
    gadgets = {
        {
            id = 70300013,
            pos = "Q356Stone1",
        },
        {
            id = 40200020,
            pos = "Q357Wind1",
        },
        {
            id = 40200020,
            pos = "Q357Wind2",
        },
        {
            id = 40200020,
            pos = "Q357Wind3",
        },
        {
            id = 40200020,
            pos = "Q357Wind4",
        },
        {
            id = 40200020,
            pos = "Q357Wind5",
        },
        {
            id = 40200020,
            pos = "Q357Wind6",
        },
        {
            id = 40200020,
            pos = "Q357Wind7",
        },
        {
            id = 70900201,
            pos = "Q356Target1",
        },
    }
}

quest_data["35703"] = 
{
    npcs = {
        {
            id = 1002,
            alias = "Ambor",
            script = "Actor/Quest/Q301/Ambor301",
            pos = "Q357Ambor2",
            data_index = 0,
            scene_id  = 3,
        }
    },
    gadgets = {
        {
            id = 70900201,
            pos = "Q357Ambor2",
        },
    }
}

quest_data["35705"] = 
{
    npcs = {
        {
            id = 1002,
            alias = "Ambor",
            script = "Actor/Quest/Q301/Ambor301",
            pos = "Q301Hidden",
            data_index = 0,
            scene_id  = 3,
        }
    },
    gadgets = {
        {
            id = 70300013,
            pos = "Q357Stone1",
        },
        {
            id = 70300046,
            pos = "Q357Stone2",
        },
        {
            id = 70900201,
            pos = "Q357Target1",
        },
        {
            id = 70900201,
            pos = "Q357Target2",
        },
    }
}

--[[ quest_data["35705"] = 
{
    gadgets = {
        {
            id = 70900201,
            pos = "Q357Target1",
        },
    }
} ]]

quest_data["35706"] = 
{
    gadgets = {
--[[         {
            id = 70300013,
            pos = "Q357Stone1",
        }, ]]
--[[         {
            id = 70300013,
            pos = "Q357Stone2",
        }, ]]
--[[         {
            id = 70900201,
            pos = "Q357Target2",
        }, ]]
    }
}

--[[ quest_data["35705"] = 
{
    npcs = {
        {
            id = 1002,
            alias = "Ambor",
            script = "Actor/Quest/Q301/Ambor301",
            pos = "Q301Hidden",
            data_index = 0,
            scene_id  = 3,
        }
    }
} ]]

--[[ quest_data["35707"] = 
{
    gadgets = {
        {
            id = 70300039,
            pos = "Q357Stone3",
        },
        {
            id = 70900201,
            pos = "Q357Target3",
        },
    }
} ]]

quest_data["35711"] = 
{
    npcs = {
        {
            id = 1002,
            alias = "Ambor",
            script = "Actor/Quest/Q301/Ambor301",
            pos = "Q357Ambor3",
            data_index = 0,
            scene_id  = 3,
        },
        {
            id = 1004,
            alias = "Gaia",
            script = "Actor/Quest/Q301/Gaia301",
            pos = "Q357Gaia1",
            data_index = 0,
            scene_id  = 3,
        }
    },
    gadgets = {
        {
            id = 70300039,
            pos = "Q357Stone3",
        },
        {
            id = 70300047,
            pos = "Q357Stone3",
        },
        {
            id = 70900201,
            pos = "Q357Target3",
        },
    }
}

quest_data["35708"] = 
{
    npcs = {
        {
            id = 1002,
            alias = "Ambor",
            script = "Actor/Quest/Q301/Ambor301",
            pos = "Q301Hidden",
            data_index = 0,
            scene_id  = 3,
        },
        {
            id = 1004,
            alias = "Gaia",
            script = "Actor/Quest/Q301/Gaia301",
            pos = "Q301Hidden",
            data_index = 0,
            scene_id  = 3,
        }
    }
}

quest_data["35709"] = 
{
    npcs = {
        {
            id = 1005,
            alias = "Paimon",
            script = "Actor/Quest/Q352/Paimon",
            pos = "Q358Paimon1",
            data_index = 0,
            scene_id  = 3,
        }
    }
}