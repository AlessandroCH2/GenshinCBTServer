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
	{ config_id = 49, shape = RegionShape.SPHERE, radius = 5, pos = { x = 460.4, y = -24.4, z = 69.2 } },
	{ config_id = 50, shape = RegionShape.SPHERE, radius = 5, pos = { x = 406.5, y = -22.6, z = 107.9 } },
	{ config_id = 51, shape = RegionShape.CUBIC, size = { x = 30.0, y = 2.0, z = 30.0 }, pos = { x = 487.5, y = -17.5, z = 121.6 } },
	{ config_id = 55, shape = RegionShape.SPHERE, radius = 7.3, pos = { x = 411.7, y = -22.1, z = 64.0 } }
}

-- 触发器
triggers = {
	{ name = "ENTER_REGION_49", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_49", action = "", trigger_count = 0 },
	{ name = "ENTER_REGION_50", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_50", action = "", trigger_count = 0 },
	{ name = "ENTER_REGION_51", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_51", action = "", trigger_count = 0 },
	{ name = "ENTER_REGION_55", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_55", action = "", trigger_count = 0 }
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
		regions = { 49, 50, 51, 55 },
		triggers = { "ENTER_REGION_49", "ENTER_REGION_50", "ENTER_REGION_51", "ENTER_REGION_55" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ENTER_REGION_49(context, evt)
	if ScriptLib.GetEntityType(evt.target_eid) == EntityType.AVATAR and ScriptLib.GetQuestState(context, evt.target_eid, 30807) == QuestState.UNFINISHED and evt.param1 == 49 then
	  return true
	 end
	 return false
end

-- 触发操作

-- 触发条件
function condition_EVENT_ENTER_REGION_50(context, evt)
	if ScriptLib.GetEntityType(evt.target_eid) == EntityType.AVATAR and ScriptLib.GetQuestState(context, evt.target_eid, 30808) == QuestState.UNFINISHED and evt.param1 == 50 then
	  return true
	 end
	 return false
end

-- 触发操作

-- 触发条件
function condition_EVENT_ENTER_REGION_51(context, evt)
	if ScriptLib.GetEntityType(evt.target_eid) == EntityType.AVATAR and ScriptLib.GetQuestState(context, evt.target_eid, 30809) == QuestState.UNFINISHED and evt.param1 == 51 then
	  return true
	 end
	 return false
end

-- 触发操作

-- 触发条件
function condition_EVENT_ENTER_REGION_55(context, evt)
	if ScriptLib.GetEntityType(evt.target_eid) == EntityType.AVATAR and ScriptLib.GetQuestState(context, evt.target_eid, 30812) == QuestState.UNFINISHED and evt.param1 == 55 then
	  return true
	 end
	 return false
end

-- 触发操作
