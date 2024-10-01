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
	{ config_id = 66, shape = RegionShape.SPHERE, radius = 60, pos = { x = 1765.6, y = 221.9, z = -405.6 } },
	{ config_id = 67, shape = RegionShape.SPHERE, radius = 60, pos = { x = 2137.0, y = 207.0, z = -1174.0 } },
	{ config_id = 68, shape = RegionShape.SPHERE, radius = 60, pos = { x = 2157.0, y = 235.4, z = -1644.1 } },
	{ config_id = 69, shape = RegionShape.SPHERE, radius = 45, pos = { x = 1644.8, y = 255.4, z = -1414.1 } },
	{ config_id = 107, shape = RegionShape.SPHERE, radius = 8, pos = { x = 2009.1, y = 204.2, z = -881.3 } },
	{ config_id = 185, shape = RegionShape.SPHERE, radius = 10, pos = { x = 1773.6, y = 221.9, z = -390.5 } },
	{ config_id = 225, shape = RegionShape.SPHERE, radius = 60, pos = { x = 1705.0, y = 255.8, z = -662.2 } },
	{ config_id = 226, shape = RegionShape.SPHERE, radius = 10, pos = { x = 1772.1, y = 221.9, z = -393.1 } },
	{ config_id = 227, shape = RegionShape.SPHERE, radius = 20, pos = { x = 1814.0, y = 218.7, z = -395.3 } }
}

-- 触发器
triggers = {
	{ name = "ENTER_REGION_66", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_66", action = "", trigger_count = 0 },
	{ name = "ENTER_REGION_67", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_67", action = "", trigger_count = 0 },
	{ name = "ENTER_REGION_68", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_68", action = "", trigger_count = 0 },
	{ name = "ENTER_REGION_69", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_69", action = "", trigger_count = 0 },
	{ name = "ENTER_REGION_107", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_107", action = "", trigger_count = 0 },
	{ name = "ENTER_REGION_185", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_185", action = "", trigger_count = 0 },
	{ name = "ENTER_REGION_225", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_225", action = "", trigger_count = 0 },
	{ name = "ENTER_REGION_226", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_226", action = "", trigger_count = 0 },
	{ name = "ENTER_REGION_227", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_227", action = "", trigger_count = 0 }
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
		regions = { 66, 67, 68, 69, 107, 185, 225, 226, 227 },
		triggers = { "ENTER_REGION_66", "ENTER_REGION_67", "ENTER_REGION_68", "ENTER_REGION_69", "ENTER_REGION_107", "ENTER_REGION_185", "ENTER_REGION_225", "ENTER_REGION_226", "ENTER_REGION_227" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ENTER_REGION_66(context, evt)
	if ScriptLib.GetEntityType(evt.target_eid) == EntityType.AVATAR and ScriptLib.GetQuestState(context, evt.target_eid, 38301) == QuestState.UNFINISHED and evt.param1 == 66 then
		return true
	end
	return false
end

-- 触发操作

-- 触发条件
function condition_EVENT_ENTER_REGION_67(context, evt)
	if ScriptLib.GetEntityType(evt.target_eid) == EntityType.AVATAR and ScriptLib.GetQuestState(context, evt.target_eid, 30600) == QuestState.UNFINISHED and evt.param1 == 67 then
		return true
	end
	return false
end

-- 触发操作

-- 触发条件
function condition_EVENT_ENTER_REGION_68(context, evt)
	if ScriptLib.GetEntityType(evt.target_eid) == EntityType.AVATAR and ScriptLib.GetQuestState(context, evt.target_eid, 30700) == QuestState.UNFINISHED and evt.param1 == 68 then
		return true
	end
	return false
end

-- 触发操作

-- 触发条件
function condition_EVENT_ENTER_REGION_69(context, evt)
	if ScriptLib.GetEntityType(evt.target_eid) == EntityType.AVATAR and ScriptLib.GetQuestState(context, evt.target_eid, 30800) == QuestState.UNFINISHED and evt.param1 == 69 then
		return true
	end
	return false
end

-- 触发操作

-- 触发条件
function condition_EVENT_ENTER_REGION_107(context, evt)
	if ScriptLib.GetEntityType(evt.target_eid) == EntityType.AVATAR and ScriptLib.GetQuestState(context, evt.target_eid, 45202) == QuestState.UNFINISHED and evt.param1 == 107 then
		return true
	end
	return false
end

-- 触发操作

-- 触发条件
function condition_EVENT_ENTER_REGION_185(context, evt)
	if ScriptLib.GetEntityType(evt.target_eid) == EntityType.AVATAR and ScriptLib.GetQuestState(context, evt.target_eid, 46504) == QuestState.UNFINISHED and evt.param1 == 185 then
		return true
	end
	return false
end

-- 触发操作

-- 触发条件
function condition_EVENT_ENTER_REGION_225(context, evt)
	if ScriptLib.GetEntityType(evt.target_eid) == EntityType.AVATAR and ScriptLib.GetQuestState(context, evt.target_eid, 46506) == QuestState.UNFINISHED and evt.param1 == 225 then
		return true
	end
	return false
end

-- 触发操作

-- 触发条件
function condition_EVENT_ENTER_REGION_226(context, evt)
	if ScriptLib.GetEntityType(evt.target_eid) == EntityType.AVATAR and ScriptLib.GetQuestState(context, evt.target_eid, 46601) == QuestState.UNFINISHED and evt.param1 == 226 then
		return true
	end
	return false
	
end

-- 触发操作

-- 触发条件
function condition_EVENT_ENTER_REGION_227(context, evt)
	if ScriptLib.GetEntityType(evt.target_eid) == EntityType.AVATAR and ScriptLib.GetQuestState(context, evt.target_eid, 46603) == QuestState.UNFINISHED and evt.param1 == 227 then
		return true
	end
	return false
	
end

-- 触发操作
