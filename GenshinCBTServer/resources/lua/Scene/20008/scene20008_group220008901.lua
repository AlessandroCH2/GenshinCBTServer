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
	{ config_id = 41, shape = RegionShape.CUBIC, size = { x = 18.2, y = 3.0, z = 47.1 }, pos = { x = 565.4, y = -62.7, z = 206.7 } },
	{ config_id = 42, shape = RegionShape.SPHERE, radius = 5, pos = { x = 517.3, y = -65.6, z = 221.5 } },
	{ config_id = 43, shape = RegionShape.CUBIC, size = { x = 3.9, y = 3.4, z = 50.3 }, pos = { x = 471.3, y = -28.5, z = 266.1 } }
}

-- 触发器
triggers = {
	{ name = "ENTER_REGION_41", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_41", action = "", trigger_count = 0 },
	{ name = "ENTER_REGION_42", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_42", action = "", trigger_count = 0 },
	{ name = "ENTER_REGION_43", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_43", action = "", trigger_count = 0 }
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
		regions = { 41, 42, 43 },
		triggers = { "ENTER_REGION_41", "ENTER_REGION_42", "ENTER_REGION_43" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ENTER_REGION_41(context, evt)
	if ScriptLib.GetEntityType(evt.target_eid) == EntityType.AVATAR and ScriptLib.GetQuestState(context, evt.target_eid, 30707) == QuestState.UNFINISHED and evt.param1 == 41 then
	  return true
	 end
	 return false
end

-- 触发操作

-- 触发条件
function condition_EVENT_ENTER_REGION_42(context, evt)
	if ScriptLib.GetEntityType(evt.target_eid) == EntityType.AVATAR and ScriptLib.GetQuestState(context, evt.target_eid, 30708) == QuestState.UNFINISHED and evt.param1 == 42 then
	  return true
	 end
	 return false
end

-- 触发操作

-- 触发条件
function condition_EVENT_ENTER_REGION_43(context, evt)
	if ScriptLib.GetEntityType(evt.target_eid) == EntityType.AVATAR and ScriptLib.GetQuestState(context, evt.target_eid, 30709) == QuestState.UNFINISHED and evt.param1 == 43 then
	  return true
	 end
	 return false
end

-- 触发操作
