-- 任务配置

-- 父任务id

main_id = 361

sub_ids =
{
    36100,
    36101,
}

---存放断线重连生成内容，和questdata配的存档点对应
rewind_data = {}

---校验用，和任务lua中生成NPC/monster/gadget/item等对应
quest_data = {}

quest_data["36100"] = 
{
    gadgets = {
        {
            id = 70900002,
            pos = "Q361DragonTriggerCenter",
        }
    }
}
