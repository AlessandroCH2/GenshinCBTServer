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
	{ config_id = 1814, gadget_id = 70710002, pos = { x = 1388.4, y = 234.4, z = -1562.2 }, rot = { x = 0.0, y = 6.5, z = 0.0 }, level = 1, route_id = 3001138, save_route = true },
	{ config_id = 1815, gadget_id = 70710002, pos = { x = 1363.1, y = 236.2, z = -1555.0 }, rot = { x = 0.0, y = 342.2, z = 0.0 }, level = 1, route_id = 3001134, save_route = true },
	{ config_id = 1816, gadget_id = 70710002, pos = { x = 1365.3, y = 234.8, z = -1591.6 }, rot = { x = 0.0, y = 8.1, z = 0.0 }, level = 1, route_id = 3001141, save_route = true }
}

-- 区域
regions = {
	{ config_id = 119, shape = RegionShape.SPHERE, radius = 6.3, pos = { x = 1361.5, y = 235.5, z = -1553.8 } },
	{ config_id = 120, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1332.7, y = 241.8, z = -1541.6 } },
	{ config_id = 121, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1296.9, y = 249.8, z = -1540.5 } },
	{ config_id = 122, shape = RegionShape.SPHERE, radius = 9.6, pos = { x = 1393.9, y = 234.4, z = -1573.3 } },
	{ config_id = 123, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1487.0, y = 240.1, z = -1597.9 } },
	{ config_id = 124, shape = RegionShape.SPHERE, radius = 10.2, pos = { x = 1364.8, y = 234.4, z = -1590.7 } },
	{ config_id = 125, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1358.6, y = 239.5, z = -1624.9 } },
	{ config_id = 126, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1334.5, y = 250.7, z = -1660.2 } }
}

-- 触发器
triggers = {
	{ name = "ENTER_REGION_119", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_119", action = "action_EVENT_ENTER_REGION_119" },
	{ name = "ENTER_REGION_120", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_120", action = "action_EVENT_ENTER_REGION_120" },
	{ name = "ENTER_REGION_121", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_121", action = "action_EVENT_ENTER_REGION_121" },
	{ name = "ENTER_REGION_122", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_122", action = "action_EVENT_ENTER_REGION_122" },
	{ name = "ENTER_REGION_123", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_123", action = "action_EVENT_ENTER_REGION_123" },
	{ name = "ENTER_REGION_124", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_124", action = "action_EVENT_ENTER_REGION_124" },
	{ name = "ENTER_REGION_125", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_125", action = "action_EVENT_ENTER_REGION_125" },
	{ name = "ENTER_REGION_126", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_126", action = "action_EVENT_ENTER_REGION_126" }
}

-- 变量
variables = {
	{ name = "Meat_1", value = 0, persistent = false },
	{ name = "Meat_2", value = 0, persistent = false },
	{ name = "Sleep_1", value = 0, persistent = false },
	{ name = "Sun_1", value = 0, persistent = false },
	{ name = "Sun_2", value = 0, persistent = false }
}

--================================================================
-- 
-- 初始化配置
-- 
--================================================================

-- 初始化时创建
init_config = {
	suite = 2,
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
		gadgets = { 1814, 1815, 1816 },
		regions = { 119, 120, 121, 122, 123, 124, 125, 126 },
		triggers = { "ENTER_REGION_119", "ENTER_REGION_120", "ENTER_REGION_121", "ENTER_REGION_122", "ENTER_REGION_123", "ENTER_REGION_124", "ENTER_REGION_125", "ENTER_REGION_126" },
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
function condition_EVENT_ENTER_REGION_119(context, evt)
	if evt.param1 ~= 119 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_119(context, evt)
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 1815, 3001135) then
	  return -1
	end
	
	-- 针对当前group内变量名为 "Meat_1" 的变量，进行修改，变化值为 1
	if 0 ~= ScriptLib.ChangeGroupVariableValue(context, "Meat_1", 1) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_120(context, evt)
	if evt.param1 ~= 120 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	-- 判断变量"Meat_1"为1
	if ScriptLib.GetGroupVariableValue(context, "Meat_1") ~= 1 then
			return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_120(context, evt)
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 1815, 3001136) then
	  return -1
	end
	
	-- 针对当前group内变量名为 "Meat_2" 的变量，进行修改，变化值为 1
	if 0 ~= ScriptLib.ChangeGroupVariableValue(context, "Meat_2", 1) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_121(context, evt)
	if evt.param1 ~= 121 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	-- 判断变量"Meat_2"为1
	if ScriptLib.GetGroupVariableValue(context, "Meat_2") ~= 1 then
			return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_121(context, evt)
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 1815, 3001137) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_122(context, evt)
	if evt.param1 ~= 122 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_122(context, evt)
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 1814, 3001139) then
	  return -1
	end
	
	-- 针对当前group内变量名为 "Sleep_1" 的变量，进行修改，变化值为 1
	if 0 ~= ScriptLib.ChangeGroupVariableValue(context, "Sleep_1", 1) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_123(context, evt)
	if evt.param1 ~= 123 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	-- 判断变量"Sleep_1"为1
	if ScriptLib.GetGroupVariableValue(context, "Sleep_1") ~= 1 then
			return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_123(context, evt)
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 1814, 3001140) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_124(context, evt)
	if evt.param1 ~= 124 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_124(context, evt)
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 1816, 3001142) then
	  return -1
	end
	
	-- 针对当前group内变量名为 "Sun_1" 的变量，进行修改，变化值为 1
	if 0 ~= ScriptLib.ChangeGroupVariableValue(context, "Sun_1", 1) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_125(context, evt)
	if evt.param1 ~= 125 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	-- 判断变量"Sun_1"为1
	if ScriptLib.GetGroupVariableValue(context, "Sun_1") ~= 1 then
			return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_125(context, evt)
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 1816, 3001143) then
	  return -1
	end
	
	-- 针对当前group内变量名为 "Sun_2" 的变量，进行修改，变化值为 1
	if 0 ~= ScriptLib.ChangeGroupVariableValue(context, "Sun_2", 1) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_126(context, evt)
	if evt.param1 ~= 126 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	-- 判断变量"Sun_2"为1
	if ScriptLib.GetGroupVariableValue(context, "Sun_2") ~= 1 then
			return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_126(context, evt)
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 1816, 3001144) then
	  return -1
	end
	
	return 0
end
