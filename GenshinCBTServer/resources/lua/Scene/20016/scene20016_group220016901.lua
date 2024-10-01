--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
}

-- NPC
npcs = {
	{ config_id = 1, npc_id = 1234, pos = { x = 358.9, y = -16.9, z = 340.7 }, rot = { x = 0.0, y = 0.0, z = 0.0 } }
}

-- 装置
gadgets = {
}

-- 区域
regions = {
	{ config_id = 4, shape = RegionShape.SPHERE, radius = 7.9, pos = { x = 343.5, y = -19.3, z = 345.2 } }
}

-- 触发器
triggers = {
	{ name = "ENTER_REGION_4", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_4", action = "", trigger_count = 0 }
}

-- 变量
variables = {
}

--================================================================
-- 
-- 初始化配置
-- 
--================================================================

-- 初始化时创建
init_config = {
	suite = 1,
	rand_suite = true,
	npcs = { 1 }
}

--================================================================
-- 
-- 小组配置
-- 
--================================================================

suites = {
	{
		-- suite_id = 0,
		-- description = ,
		monsters = { },
		gadgets = { },
		regions = { 4 },
		triggers = { "ENTER_REGION_4" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ENTER_REGION_4(context, evt)
	if ScriptLib.GetEntityType(evt.target_eid) == EntityType.AVATAR and ScriptLib.GetQuestState(context, evt.target_eid, 46302) == QuestState.UNFINISHED and evt.param1 == 4 then
	 return true
	end
	return false
end

-- 触发操作
