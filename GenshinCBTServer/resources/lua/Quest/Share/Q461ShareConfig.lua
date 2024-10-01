-- 任务配置

-- 父任务id

main_id = 461

sub_ids =
{
    46100,
    46101,
    46102,
    46103,
    46104,
    46107,
}

---存放断线重连生成内容，和questdata配的存档点对应
rewind_data = {}

--[[rewind_data["46101"] = 
{
    npcs = {
        {
            id = 1004,
            alias = "Gaia",
            script = "Actor/Quest/Q301/Gaia301",
            pos = "Q461KaeyaIn",
        }
    }
}]]

rewind_data["46102"] = 
{    
    npcs = {
        {
            id = 1004,
            alias = "Gaia",
            script = "Actor/Quest/Q301/Gaia301",
            pos = "Q461KaeyaOut",
        }
    }
}

rewind_data["46103"] = 
{    
    npcs = {
        
    }
}

---校验用，和任务lua中生成NPC/monster/gadget/item等对应
quest_data = {}

quest_data["46101"] = 
{
    
}

quest_data["46102"] = 
{
    
}