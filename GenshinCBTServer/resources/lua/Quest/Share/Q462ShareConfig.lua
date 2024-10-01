-- 任务配置

-- 父任务id

main_id = 462

sub_ids =
{
    46200,
    46201,
    46202,
    46203,
    46204,
    46207,
}

---存放断线重连生成内容，和questdata配的存档点对应
rewind_data = {}

rewind_data["46203"] = 
{
    npcs = {
        {
            id = 1213,
            alias = "KaeyaNpc",
            script = "Actor/Npc/TempNPC",
            pos = "Q462NPCTo",
        }
    }
}


rewind_data["46205"] = 
{
    npcs = {
        {
            id = 1004,
            alias = "Gaia",
            script = "Actor/Quest/Q301/Gaia301",
            pos = "Q461KaeyaIn",
        }
    }
}

rewind_data["46206"] = 
{
    npcs = {
        {
            id = 1004,
            alias = "Gaia",
            script = "Actor/Quest/Q301/Gaia301",
            pos = "Q461KaeyaIn",
        }
    }
}

rewind_data["46207"] = 
{
    npcs = {
        {
            id = 1004,
            alias = "Gaia",
            script = "Actor/Quest/Q301/Gaia301",
            pos = "Q461KaeyaIn",
        }
    }
}


rewind_data["46208"] = 
{
    npcs = {
        {
            id = 1004,
            alias = "Gaia",
            script = "Actor/Quest/Q301/Gaia301",
            pos = "Q461KaeyaIn",
        }
    }
}


rewind_data["46209"] = 
{
    npcs = {
        {
            id = 1004,
            alias = "Gaia",
            script = "Actor/Quest/Q301/Gaia301",
            pos = "Q461KaeyaIn",
        }
    }
}


---校验用，和任务lua中生成NPC/monster/gadget/item等对应
quest_data = {}

quest_data["46200"] = 
{
    
}