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
	{ config_id = 3767, gadget_id = 70710002, pos = { x = 2606.1, y = 213.7, z = -1401.8 }, rot = { x = 0.0, y = 227.5, z = 0.0 }, level = 1, route_id = 3003210, save_route = true }
}

-- 区域
regions = {
	{ config_id = 465, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2604.3, y = 212.6, z = -1401.6 } },
	{ config_id = 466, shape = RegionShape.SPHERE, radius = 2.7, pos = { x = 2586.7, y = 211.2, z = -1439.6 } },
	{ config_id = 467, shape = RegionShape.SPHERE, radius = 1.7, pos = { x = 2588.5, y = 216.2, z = -1444.0 } },
	{ config_id = 468, shape = RegionShape.SPHERE, radius = 1.7, pos = { x = 2602.1, y = 217.5, z = -1474.2 } },
	{ config_id = 469, shape = RegionShape.SPHERE, radius = 1, pos = { x = 2599.1, y = 222.1, z = -1499.6 } }
}

-- 触发器
triggers = {
	{ name = "ENTER_REGION_465", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_465", action = "action_EVENT_ENTER_REGION_465" },
	{ name = "ENTER_REGION_466", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_466", action = "action_EVENT_ENTER_REGION_466" },
	{ name = "ENTER_REGION_467", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_467", action = "action_EVENT_ENTER_REGION_467" },
	{ name = "ENTER_REGION_468", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_468", action = "action_EVENT_ENTER_REGION_468" },
	{ name = "PLATFORM_REACH_POINT_469", event = EventType.EVENT_PLATFORM_REACH_POINT, source = "", condition = "condition_EVENT_PLATFORM_REACH_POINT_469", action = "action_EVENT_PLATFORM_REACH_POINT_469" }
}

-- 变量
variables = {
	{ name = "door1", value = 0, no_refresh = true },
	{ name = "door2", value = 0, no_refresh = true },
	{ name = "door3", value = 0, no_refresh = true },
	{ name = "door4", value = 0, no_refresh = true },
	{ name = "isoff", value = 0, no_refresh = true }
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
		gadgets = { 3767 },
		regions = { 465, 466, 467, 468, 469 },
		triggers = { "ENTER_REGION_465", "ENTER_REGION_466", "ENTER_REGION_467", "ENTER_REGION_468", "PLATFORM_REACH_POINT_469" },
		rand_weight = 100
	},
	{
		-- suite_id = 1,
		-- description = suite_2,
		monsters = { },
		gadgets = { },
		regions = { },
		triggers = { },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ENTER_REGION_465(context, evt)
	if evt.param1 ~= 465 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_465(context, evt)
	-- 将本组内变量名为 "door1" 的变量设置为 1
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "door1", 1) then
	  return -1
	end
	
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 3767, 3003211) then
	  return -1
	end
	
	-- 将本组内变量名为 "isoff" 的变量设置为 1
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "isoff", 1) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_466(context, evt)
	if evt.param1 ~= 466 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	-- 判断变量"door1"为1
	if ScriptLib.GetGroupVariableValue(context, "door1") ~= 1 then
			return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_466(context, evt)
	-- 将本组内变量名为 "door2" 的变量设置为 1
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "door2", 1) then
	  return -1
	end
	
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 3767, 3003212) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_467(context, evt)
	if evt.param1 ~= 467 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	-- 判断变量"door2"为1
	if ScriptLib.GetGroupVariableValue(context, "door2") ~= 1 then
			return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_467(context, evt)
	-- 将本组内变量名为 "door3" 的变量设置为 1
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "door3", 1) then
	  return -1
	end
	
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 3767, 3003213) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_468(context, evt)
	if evt.param1 ~= 468 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	-- 判断变量"door3"为1
	if ScriptLib.GetGroupVariableValue(context, "door3") ~= 1 then
			return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_468(context, evt)
	-- 将本组内变量名为 "door4" 的变量设置为 1
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "door4", 1) then
	  return -1
	end
	
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 3767, 3003214) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_PLATFORM_REACH_POINT_469(context, evt)
	-- 判断是gadgetid 为 3767的移动平台，是否到达了3003214 的路线中的 1 点
	
	if 3767 ~= evt.param1 then
	  return false
	end
	
	if 3003214 ~= evt.param2 then
	  return false
	end
	
	if 1 ~= evt.param3 then
	  return false
	end
	
	
	return true
end

-- 触发操作
function action_EVENT_PLATFORM_REACH_POINT_469(context, evt)
		-- 重新生成指定group，指定suite
		if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 133003383, suite = 2 }) then
			return -1
		end
	
	return 0
end
