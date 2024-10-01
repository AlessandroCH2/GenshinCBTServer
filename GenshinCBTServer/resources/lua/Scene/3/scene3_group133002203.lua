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
	{ config_id = 1523, gadget_id = 70710002, pos = { x = 1957.7, y = 225.5, z = -959.0 }, rot = { x = 0.0, y = 266.4, z = 0.0 }, level = 1, route_id = 3002138, save_route = true },
	{ config_id = 1524, gadget_id = 70710002, pos = { x = 1905.2, y = 233.7, z = -870.9 }, rot = { x = 0.0, y = 118.1, z = 0.0 }, level = 1, route_id = 3002142, save_route = true },
	{ config_id = 1525, gadget_id = 70210041, pos = { x = 1947.4, y = 212.5, z = -898.1 }, rot = { x = 0.0, y = 120.0, z = 2.7 }, level = 1, chest_drop_id = 403242, showcutscene = true, isOneoff = true, persistent = true }
}

-- 区域
regions = {
	{ config_id = 199, shape = RegionShape.SPHERE, radius = 2, pos = { x = 1955.3, y = 224.2, z = -957.2 } },
	{ config_id = 200, shape = RegionShape.SPHERE, radius = 2, pos = { x = 1960.2, y = 225.5, z = -940.2 } },
	{ config_id = 201, shape = RegionShape.SPHERE, radius = 1.5, pos = { x = 1973.9, y = 214.9, z = -906.7 } },
	{ config_id = 202, shape = RegionShape.SPHERE, radius = 1.5, pos = { x = 1952.0, y = 213.4, z = -906.1 } },
	{ config_id = 203, shape = RegionShape.SPHERE, radius = 3, pos = { x = 1907.2, y = 234.0, z = -871.3 } },
	{ config_id = 204, shape = RegionShape.SPHERE, radius = 1, pos = { x = 1923.6, y = 230.6, z = -882.8 } },
	{ config_id = 205, shape = RegionShape.SPHERE, radius = 1.5, pos = { x = 1943.2, y = 228.0, z = -907.7 } },
	{ config_id = 206, shape = RegionShape.SPHERE, radius = 1, pos = { x = 1955.4, y = 212.3, z = -896.6 } },
	{ config_id = 271, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1965.8, y = 211.2, z = -902.6 } }
}

-- 触发器
triggers = {
	{ name = "ENTER_REGION_199", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_199", action = "action_EVENT_ENTER_REGION_199" },
	{ name = "ENTER_REGION_200", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_200", action = "action_EVENT_ENTER_REGION_200" },
	{ name = "ENTER_REGION_201", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_201", action = "action_EVENT_ENTER_REGION_201" },
	{ name = "PLATFORM_REACH_POINT_202", event = EventType.EVENT_PLATFORM_REACH_POINT, source = "", condition = "condition_EVENT_PLATFORM_REACH_POINT_202", action = "action_EVENT_PLATFORM_REACH_POINT_202" },
	{ name = "ENTER_REGION_203", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_203", action = "action_EVENT_ENTER_REGION_203" },
	{ name = "ENTER_REGION_204", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_204", action = "action_EVENT_ENTER_REGION_204" },
	{ name = "ENTER_REGION_205", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_205", action = "action_EVENT_ENTER_REGION_205" },
	{ name = "PLATFORM_REACH_POINT_206", event = EventType.EVENT_PLATFORM_REACH_POINT, source = "", condition = "condition_EVENT_PLATFORM_REACH_POINT_206", action = "action_EVENT_PLATFORM_REACH_POINT_206" },
	{ name = "CLIENT_EXECUTE_271", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_271", trigger_count = 0 }
}

-- 变量
variables = {
	{ name = "v1523", value = 0, persistent = true },
	{ name = "v1524", value = 0, persistent = true },
	{ name = "1523door1", value = 0, persistent = true },
	{ name = "1523door2", value = 0, persistent = true },
	{ name = "1524door1", value = 0, persistent = true },
	{ name = "1524door2", value = 0, persistent = true }
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
		gadgets = { 1523, 1524 },
		regions = { 199, 200, 201, 202, 203, 204, 205, 206, 271 },
		triggers = { "ENTER_REGION_199", "ENTER_REGION_200", "ENTER_REGION_201", "PLATFORM_REACH_POINT_202", "ENTER_REGION_203", "ENTER_REGION_204", "ENTER_REGION_205", "PLATFORM_REACH_POINT_206", "CLIENT_EXECUTE_271" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ENTER_REGION_199(context, evt)
	if evt.param1 ~= 199 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_199(context, evt)
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 1523, 3002139) then
	  return -1
	end
	
	-- 将本组内变量名为 "1523door1" 的变量设置为 1
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "1523door1", 1) then
	  return -1
	end
	
	
	
	-- 获取本组内变量名为 "1523door1" 的变量值
	if ScriptLib.GetGroupVariableValue(context, "1523door1") + ScriptLib.GetGroupVariableValue(context, "1524door1") == 1 then
	
	
	
	end
	
	
	-- 获取本组内变量名为 "1523door1" 的变量值
	if ScriptLib.GetGroupVariableValue(context, "1523door1") + ScriptLib.GetGroupVariableValue(context, "1524door1") == 2 then
	
	
	
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_200(context, evt)
	if evt.param1 ~= 200 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	-- 判断变量"1523door1"为1
	if ScriptLib.GetGroupVariableValue(context, "1523door1") ~= 1 then
			return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_200(context, evt)
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 1523, 3002140) then
	  return -1
	end
	
	-- 将本组内变量名为 "1523door2" 的变量设置为 1
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "1523door2", 1) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_201(context, evt)
	if evt.param1 ~= 201 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	-- 判断变量"1523door2"为1
	if ScriptLib.GetGroupVariableValue(context, "1523door2") ~= 1 then
			return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_201(context, evt)
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 1523, 3002141) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_PLATFORM_REACH_POINT_202(context, evt)
	-- 判断是gadgetid 为 1523的移动平台，是否到达了3002141 的路线中的 1 点
	
	if 1523 ~= evt.param1 then
	  return false
	end
	
	if 3002141 ~= evt.param2 then
	  return false
	end
	
	if 1 ~= evt.param3 then
	  return false
	end
	
	
	return true
end

-- 触发操作
function action_EVENT_PLATFORM_REACH_POINT_202(context, evt)
	-- 将本组内变量名为 "v1523" 的变量设置为 1
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "v1523", 1) then
	  return -1
	end
	
	-- 获取本组内变量名为 "v1524" 的变量值
	if ScriptLib.GetGroupVariableValue(context, "v1523") + ScriptLib.GetGroupVariableValue(context, "v1524") == 1 then
	  
	
	
	end
	
	-- 获取本组内变量名为 "v1524" 的变量值
	if ScriptLib.GetGroupVariableValue(context, "v1523") + ScriptLib.GetGroupVariableValue(context, "v1524") == 2 then
	  
	
	
	
	-- 创生gadget 1525
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 1525 }) then
		return -1
	end
	
	end
	
	
	
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_203(context, evt)
	if evt.param1 ~= 203 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_203(context, evt)
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 1524, 3002143) then
	  return -1
	end
	
	-- 将本组内变量名为 "1524door1" 的变量设置为 1
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "1524door1", 1) then
	  return -1
	end
	
	-- 获取本组内变量名为 "1523door1" 的变量值
	if ScriptLib.GetGroupVariableValue(context, "1523door1") + ScriptLib.GetGroupVariableValue(context, "1524door1") == 1 then
	
	
	
	end
	
	
	-- 获取本组内变量名为 "1523door1" 的变量值
	if ScriptLib.GetGroupVariableValue(context, "1523door1") + ScriptLib.GetGroupVariableValue(context, "1524door1") == 2 then
	
	
	
	end
	
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_204(context, evt)
	if evt.param1 ~= 204 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	-- 判断变量"1524door1"为1
	if ScriptLib.GetGroupVariableValue(context, "1524door1") ~= 1 then
			return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_204(context, evt)
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 1524, 3002144) then
	  return -1
	end
	
	-- 将本组内变量名为 "1524door2" 的变量设置为 1
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "1524door2", 1) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_205(context, evt)
	if evt.param1 ~= 205 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	-- 判断变量"1524door2"为1
	if ScriptLib.GetGroupVariableValue(context, "1524door2") ~= 1 then
			return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_205(context, evt)
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 1524, 3002145) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_PLATFORM_REACH_POINT_206(context, evt)
	-- 判断是gadgetid 为 1524的移动平台，是否到达了3002145 的路线中的 2 点
	
	if 1524 ~= evt.param1 then
	  return false
	end
	
	if 3002145 ~= evt.param2 then
	  return false
	end
	
	if 2 ~= evt.param3 then
	  return false
	end
	
	
	return true
end

-- 触发操作
function action_EVENT_PLATFORM_REACH_POINT_206(context, evt)
	-- 将本组内变量名为 "v1524" 的变量设置为 1
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "v1524", 1) then
	  return -1
	end
	
	-- 获取本组内变量名为 "v1524" 的变量值
	if ScriptLib.GetGroupVariableValue(context, "v1523") + ScriptLib.GetGroupVariableValue(context, "v1524") == 1 then
	  
	
	
	end
	
	-- 获取本组内变量名为 "v1524" 的变量值
	if ScriptLib.GetGroupVariableValue(context, "v1523") + ScriptLib.GetGroupVariableValue(context, "v1524") == 2 then
	  
	
	
	
	-- 创生gadget 1525
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 1525 }) then
		return -1
	end
	
	end
	
	
	
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_271(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end
