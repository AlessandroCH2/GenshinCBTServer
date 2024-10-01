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
	{ config_id = 19, shape = RegionShape.SPHERE, radius = 8, pos = { x = 2560.5, y = 225.8, z = 100.0 } },
	{ config_id = 20, shape = RegionShape.SPHERE, radius = 6, pos = { x = 2649.1, y = 262.1, z = 175.9 } },
	{ config_id = 21, shape = RegionShape.SPHERE, radius = 7, pos = { x = 2410.9, y = 225.4, z = 47.7 } },
	{ config_id = 33, shape = RegionShape.SPHERE, radius = 20, pos = { x = 2366.5, y = 221.3, z = -60.3 } },
	{ config_id = 97, shape = RegionShape.SPHERE, radius = 60, pos = { x = 2742.3, y = 212.3, z = -95.6 } },
	{ config_id = 98, shape = RegionShape.SPHERE, radius = 60, pos = { x = 2860.6, y = 213.6, z = 290.5 } },
	{ config_id = 99, shape = RegionShape.SPHERE, radius = 60, pos = { x = 2566.6, y = 208.2, z = 313.2 } },
	{ config_id = 118, shape = RegionShape.SPHERE, radius = 8, pos = { x = 2742.7, y = 212.3, z = -94.3 } },
	{ config_id = 119, shape = RegionShape.SPHERE, radius = 6, pos = { x = 2858.8, y = 213.6, z = 290.7 } },
	{ config_id = 120, shape = RegionShape.SPHERE, radius = 6, pos = { x = 2565.4, y = 208.2, z = 311.9 } },
	{ config_id = 178, shape = RegionShape.SPHERE, radius = 18, pos = { x = 2652.1, y = 303.5, z = 132.6 } },
	{ config_id = 257, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2727.0, y = 252.5, z = 179.2 } },
	{ config_id = 258, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2661.8, y = 282.4, z = 110.9 } },
	{ config_id = 259, shape = RegionShape.SPHERE, radius = 10, pos = { x = 2698.1, y = 240.7, z = 43.9 } }
}

-- 触发器
triggers = {
	{ name = "ENTER_REGION_19", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_19", action = "", trigger_count = 0, tlog_tag = "风龙_901_主线_城门" },
	{ name = "ENTER_REGION_20", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_20", action = "", trigger_count = 0, tlog_tag = "风龙_901_主线_塔前" },
	{ name = "ENTER_REGION_21", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_21", action = "", trigger_count = 0, tlog_tag = "风龙_901_主线_桥头" },
	{ name = "ENTER_REGION_33", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_33", action = "", trigger_count = 0, tlog_tag = "风龙_901_主线_巢穴入口" },
	{ name = "ENTER_REGION_97", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_97", action = "", trigger_count = 0 },
	{ name = "ENTER_REGION_98", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_98", action = "", trigger_count = 0 },
	{ name = "ENTER_REGION_99", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_99", action = "", trigger_count = 0 },
	{ name = "ENTER_REGION_118", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_118", action = "", trigger_count = 0 },
	{ name = "ENTER_REGION_119", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_119", action = "", trigger_count = 0 },
	{ name = "ENTER_REGION_120", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_120", action = "", trigger_count = 0 },
	{ name = "ENTER_REGION_178", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_178", action = "", trigger_count = 0 },
	{ name = "ENTER_REGION_257", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_257", action = "", trigger_count = 0 },
	{ name = "ENTER_REGION_258", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_258", action = "", trigger_count = 0 },
	{ name = "ENTER_REGION_259", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_259", action = "", trigger_count = 0 }
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
	rand_suite = false,
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
		regions = { 19, 20, 21, 33, 97, 98, 99, 118, 119, 120, 178, 257, 258, 259 },
		triggers = { "ENTER_REGION_19", "ENTER_REGION_20", "ENTER_REGION_21", "ENTER_REGION_33", "ENTER_REGION_97", "ENTER_REGION_98", "ENTER_REGION_99", "ENTER_REGION_118", "ENTER_REGION_119", "ENTER_REGION_120", "ENTER_REGION_178", "ENTER_REGION_257", "ENTER_REGION_258", "ENTER_REGION_259" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ENTER_REGION_19(context, evt)
	-- 判断角色数量不少于1
	if ScriptLib.GetEntityType(evt.target_eid) == EntityType.AVATAR and ScriptLib.GetQuestState(context, evt.target_eid, 38902) == QuestState.UNFINISHED and evt.param1 == 19 then
		return true
	end
	return false
end

-- 触发操作

-- 触发条件
function condition_EVENT_ENTER_REGION_20(context, evt)
	-- 判断角色数量不少于1
	if ScriptLib.GetEntityType(evt.target_eid) == EntityType.AVATAR and ScriptLib.GetQuestState(context, evt.target_eid, 38904) == QuestState.UNFINISHED and evt.param1 == 20 then
		return true
	end
	return false
end

-- 触发操作

-- 触发条件
function condition_EVENT_ENTER_REGION_21(context, evt)
	-- 判断角色数量不少于1
	if ScriptLib.GetEntityType(evt.target_eid) == EntityType.AVATAR and ScriptLib.GetQuestState(context, evt.target_eid, 38901) == QuestState.UNFINISHED and evt.param1 == 21 then
		return true
	end
	return false
end

-- 触发操作

-- 触发条件
function condition_EVENT_ENTER_REGION_33(context, evt)
	if ScriptLib.GetEntityType(evt.target_eid) == EntityType.AVATAR and ScriptLib.GetQuestState(context, evt.target_eid, 38806) == QuestState.UNFINISHED and evt.param1 == 33 then
		return true
	end
	return false
end

-- 触发操作

-- 触发条件
function condition_EVENT_ENTER_REGION_97(context, evt)
	if ScriptLib.GetEntityType(evt.target_eid) == EntityType.AVATAR and ScriptLib.GetQuestState(context, evt.target_eid, 39001) == QuestState.UNFINISHED and evt.param1 == 97 then
		return true
	end
	return false
end

-- 触发操作

-- 触发条件
function condition_EVENT_ENTER_REGION_98(context, evt)
	if ScriptLib.GetEntityType(evt.target_eid) == EntityType.AVATAR and ScriptLib.GetQuestState(context, evt.target_eid, 39101) == QuestState.UNFINISHED and evt.param1 == 98 then
		return true
	end
	return false
end

-- 触发操作

-- 触发条件
function condition_EVENT_ENTER_REGION_99(context, evt)
	if ScriptLib.GetEntityType(evt.target_eid) == EntityType.AVATAR and ScriptLib.GetQuestState(context, evt.target_eid, 39201) == QuestState.UNFINISHED and evt.param1 == 99 then
		return true
	end
	return false
end

-- 触发操作

-- 触发条件
function condition_EVENT_ENTER_REGION_118(context, evt)
	if ScriptLib.GetEntityType(evt.target_eid) == EntityType.AVATAR and ScriptLib.GetQuestState(context, evt.target_eid, 39002) == QuestState.UNFINISHED and evt.param1 == 118 then
		return true
	end
	return false
end

-- 触发操作

-- 触发条件
function condition_EVENT_ENTER_REGION_119(context, evt)
	if ScriptLib.GetEntityType(evt.target_eid) == EntityType.AVATAR and ScriptLib.GetQuestState(context, evt.target_eid, 39102) == QuestState.UNFINISHED and evt.param1 == 119 then
		return true
	end
	return false
end

-- 触发操作

-- 触发条件
function condition_EVENT_ENTER_REGION_120(context, evt)
	if ScriptLib.GetEntityType(evt.target_eid) == EntityType.AVATAR and ScriptLib.GetQuestState(context, evt.target_eid, 39202) == QuestState.UNFINISHED and evt.param1 == 120 then
		return true
	end
	return false
end

-- 触发操作

-- 触发条件
function condition_EVENT_ENTER_REGION_178(context, evt)
	-- 判断角色数量不少于1
	if ScriptLib.GetEntityType(evt.target_eid) == EntityType.AVATAR and (ScriptLib.GetQuestState(context, evt.target_eid, 38905) == QuestState.UNFINISHED or ScriptLib.GetQuestState(context, evt.target_eid, 39302) == QuestState.UNFINISHED) 
	and evt.param1 == 178 then
		return true
	end
	return false
end

-- 触发操作

-- 触发条件
function condition_EVENT_ENTER_REGION_257(context, evt)
	if ScriptLib.GetEntityType(evt.target_eid) == EntityType.AVATAR and ScriptLib.GetQuestState(context, evt.target_eid, 38907) == QuestState.UNFINISHED and evt.param1 == 257 then
		return true
	end
	return false
end

-- 触发操作

-- 触发条件
function condition_EVENT_ENTER_REGION_258(context, evt)
	if ScriptLib.GetEntityType(evt.target_eid) == EntityType.AVATAR and ScriptLib.GetQuestState(context, evt.target_eid, 38908) == QuestState.UNFINISHED and evt.param1 == 258 then
		return true
	end
	return false
end

-- 触发操作

-- 触发条件
function condition_EVENT_ENTER_REGION_259(context, evt)
	if ScriptLib.GetEntityType(evt.target_eid) == EntityType.AVATAR and ScriptLib.GetQuestState(context, evt.target_eid, 38909) == QuestState.UNFINISHED and evt.param1 == 259 then
		return true
	end
	return false
end

-- 触发操作
