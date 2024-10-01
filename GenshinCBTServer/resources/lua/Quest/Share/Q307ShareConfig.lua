-- 任务配置

-- 父任务id

main_id = 307

sub_ids =
{
    30700,
    30701,
    30702,
    30703,
    30704,
    30707,
    30708,
    30709,
    30710,
    30711,
    30712,
    30713,
    30715
}

---存放断线重连生成内容，和questdata配的存档点对应
rewind_data = {}
rewind_data["30700"] = 
{
    npcs = {
        {
            id = 1006,
            alias = "Qin",
            script = "Actor/Quest/Q411/Qin",
            pos = "Q358Qin1",
            data_index = 0,
            scene_id  = 1004,
            room_id = 100402,
        },
        {
            id = 1004,
            alias = "Gaia",
            script = "Actor/Quest/Q301/Gaia301",
            pos = "Q358Gaia1",
            data_index = 0,
            scene_id  = 1004,
            room_id = 100402,
        }
    }
}

rewind_data["30701"] = 
{
    npcs = {
        {
            id = 1004,
            alias = "Gaia",
            script = "Actor/Quest/Q301/Gaia301",
            pos = "Q307DungeonGaia",
        }
    }
}

rewind_data["30702"] = 
{
    avatar = {
        offline_dungeon_id = 1,
        scene_id = 3,
        pos = "Q30701Player"
    },
    npcs = {
        {
            id = 1004,
            alias = "Gaia",
            script = "Actor/Quest/Q301/Gaia301",
            pos = "Q307DungeonDoor",
        }
    }
}

---校验用，和任务lua中生成NPC/monster/gadget/item等对应
quest_data = {}

quest_data["30700"] = 
{
    npcs = {
        {
            id = 1004,
            alias = "Gaia",
            script = "Actor/Quest/Q301/Gaia301",
            pos = "Q307DungeonGaia",
        }
    }
}

quest_data["30710"] = 
{
    npcs = {
        {
            id = 1004,
            alias = "Gaia",
            script = "Actor/Quest/Q301/Gaia301",
            pos = "Q307GaiaDungeon",
            scene_id  = 20008,
        }
    }
}