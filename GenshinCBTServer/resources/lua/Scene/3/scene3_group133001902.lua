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
	{ config_id = 1, npc_id = 1216, pos = { x = 1366.5, y = 236.0, z = -1545.1 }, rot = { x = 0.0, y = 176.8, z = 0.0 } }
}

-- 装置
gadgets = {
}

-- 区域
regions = {
	{ config_id = 186, shape = RegionShape.SPHERE, radius = 56.8, pos = { x = 1377.4, y = 234.4, z = -1562.4 } },
	{ config_id = 217, shape = RegionShape.SPHERE, radius = 4, pos = { x = 1372.8, y = 236.0, z = -1570.1 } },
	{ config_id = 438, shape = RegionShape.SPHERE, radius = 60, pos = { x = 1574.1, y = 249.1, z = -1622.3 } },
	{ config_id = 439, shape = RegionShape.SPHERE, radius = 60, pos = { x = 1277.4, y = 258.4, z = -1702.6 } },
	{ config_id = 440, shape = RegionShape.SPHERE, radius = 60, pos = { x = 1251.6, y = 254.6, z = -1481.0 } }
}

-- 触发器
triggers = {
	{ name = "ENTER_REGION_186", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_186", action = "action_EVENT_ENTER_REGION_186", trigger_count = 0 },
	{ name = "ENTER_REGION_217", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_217", action = "", trigger_count = 0 },
	{ name = "ENTER_REGION_438", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_438", action = "action_EVENT_ENTER_REGION_438" },
	{ name = "ENTER_REGION_439", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_439", action = "action_EVENT_ENTER_REGION_439" },
	{ name = "ENTER_REGION_440", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_440", action = "action_EVENT_ENTER_REGION_440" }
}

-- 变量
variables = {
	{ name = "JZ", value = 0, persistent = false }
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
		regions = { 186, 217, 438, 439, 440 },
		triggers = { "ENTER_REGION_186", "ENTER_REGION_217", "ENTER_REGION_438", "ENTER_REGION_439", "ENTER_REGION_440" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ENTER_REGION_186(context, evt)
	if ScriptLib.GetEntityType(evt.target_eid) == EntityType.AVATAR and ScriptLib.GetQuestState(context, evt.target_eid, 41801) == QuestState.UNFINISHED and evt.param1 == 186 then
		return true
	end
	return false
end

-- 触发操作
function action_EVENT_ENTER_REGION_186(context, evt)
	-- 触发镜头注目，注目位置为坐标（1373，254，-1570），持续时间为2秒，并且为强制注目形式，不广播其他玩家
		local pos = {x=1373, y=254, z=-1570}
	    if 0 ~= ScriptLib.BeginCameraSceneLook(context, { look_pos = pos, duration = 2, is_force = true, is_broadcast = false }) then
					return -1
				end 
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_217(context, evt)
	if ScriptLib.GetEntityType(evt.target_eid) == EntityType.AVATAR and ScriptLib.GetQuestState(context, evt.target_eid, 41803) == QuestState.UNFINISHED and evt.param1 == 217 then
		return true
	end
	return false
end

-- 触发操作

-- 触发条件
function condition_EVENT_ENTER_REGION_438(context, evt)
	if evt.param1 ~= 438 then return false end
	
	-- 判断变量"JZ"为0
	if ScriptLib.GetGroupVariableValue(context, "JZ") ~= 0 then
			return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_438(context, evt)
	-- 通知任务系统完成条件类型"LUA通知"，复杂参数为quest_param的进度+1
	if 0 ~= ScriptLib.AddQuestProgress(context, "JZquest") then
	  return -1
	end
	
	-- 针对当前group内变量名为 "JZ" 的变量，进行修改，变化值为 1
	if 0 ~= ScriptLib.ChangeGroupVariableValue(context, "JZ", 1) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_439(context, evt)
	if evt.param1 ~= 439 then return false end
	
	-- 判断变量"JZ"为0
	if ScriptLib.GetGroupVariableValue(context, "JZ") ~= 0 then
			return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_439(context, evt)
	-- 通知任务系统完成条件类型"LUA通知"，复杂参数为quest_param的进度+1
	if 0 ~= ScriptLib.AddQuestProgress(context, "JZquest") then
	  return -1
	end
	
	-- 针对当前group内变量名为 "JZ" 的变量，进行修改，变化值为 1
	if 0 ~= ScriptLib.ChangeGroupVariableValue(context, "JZ", 1) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_440(context, evt)
	if evt.param1 ~= 440 then return false end
	
	-- 判断变量"JZ"为0
	if ScriptLib.GetGroupVariableValue(context, "JZ") ~= 0 then
			return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_440(context, evt)
	-- 通知任务系统完成条件类型"LUA通知"，复杂参数为quest_param的进度+1
	if 0 ~= ScriptLib.AddQuestProgress(context, "JZquest") then
	  return -1
	end
	
	-- 针对当前group内变量名为 "JZ" 的变量，进行修改，变化值为 1
	if 0 ~= ScriptLib.ChangeGroupVariableValue(context, "JZ", 1) then
	  return -1
	end
	
	return 0
end
