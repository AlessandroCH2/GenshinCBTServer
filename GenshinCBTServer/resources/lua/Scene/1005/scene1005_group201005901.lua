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
}

-- 装置
gadgets = {
}

-- 区域
regions = {
	{ config_id = 2, shape = RegionShape.SPHERE, radius = 7, pos = { x = -4.4, y = -4.4, z = -41.7 } },
	{ config_id = 3, shape = RegionShape.SPHERE, radius = 5, pos = { x = -4.5, y = 0.3, z = 48.5 } }
}

-- 触发器
triggers = {
	{ name = "ENTER_REGION_2", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_2", action = "", trigger_count = 0 },
	{ name = "ENTER_REGION_3", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_3", action = "", trigger_count = 0 }
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
	npcs = { }
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
		regions = { 2, 3 },
		triggers = { "ENTER_REGION_2", "ENTER_REGION_3" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ENTER_REGION_2(context, evt)
	if ScriptLib.GetEntityType(evt.target_eid) == EntityType.AVATAR and (ScriptLib.GetQuestState(context, evt.target_eid, 41503) == QuestState.UNFINISHED 
	or ScriptLib.GetQuestState(context, evt.target_eid, 37503) == QuestState.UNFINISHED ) 
	and evt.param1 == 2 then
		return true
	end
	return false
	
end

-- 触发操作

-- 触发条件
function condition_EVENT_ENTER_REGION_3(context, evt)
	if ScriptLib.GetEntityType(evt.target_eid) == EntityType.AVATAR and ScriptLib.GetQuestState(context, evt.target_eid, 37502) == QuestState.UNFINISHED and evt.param1 == 3 then
		return true
	end
	return false
end

-- 触发操作
