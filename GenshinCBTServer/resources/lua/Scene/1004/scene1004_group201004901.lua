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
	{ config_id = 1, shape = RegionShape.SPHERE, radius = 5, pos = { x = -0.1, y = 0.0, z = 14.0 } },
	{ config_id = 2, shape = RegionShape.CUBIC, size = { x = 4.0, y = 4.0, z = 8.0 }, pos = { x = 12.7, y = 0.0, z = 7.1 } },
	{ config_id = 3, shape = RegionShape.CUBIC, size = { x = 4.0, y = 4.0, z = 8.0 }, pos = { x = -13.0, y = 1.5, z = 7.7 } }
}

-- 触发器
triggers = {
	{ name = "ENTER_REGION_1", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_1", action = "", trigger_count = 0 },
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
		regions = { 1, 2, 3 },
		triggers = { "ENTER_REGION_1", "ENTER_REGION_2", "ENTER_REGION_3" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ENTER_REGION_1(context, evt)
	if ScriptLib.GetEntityType(evt.target_eid) == EntityType.AVATAR and ScriptLib.GetQuestState(context, evt.target_eid, 37001) == QuestState.UNFINISHED and evt.param1 == 1 then
		return true
	end
	return false
end

-- 触发操作

-- 触发条件
function condition_EVENT_ENTER_REGION_2(context, evt)
	if ScriptLib.GetEntityType(evt.target_eid) == EntityType.AVATAR and ScriptLib.GetQuestState(context, evt.target_eid, 37003) == QuestState.UNFINISHED and evt.param1 == 2 then
		return true
	end
	return false
end

-- 触发操作

-- 触发条件
function condition_EVENT_ENTER_REGION_3(context, evt)
	if ScriptLib.GetEntityType(evt.target_eid) == EntityType.AVATAR and ScriptLib.GetQuestState(context, evt.target_eid, 1010001) == QuestState.UNFINISHED and evt.param1 == 3 then
		return true
	end
	return false
end

-- 触发操作
