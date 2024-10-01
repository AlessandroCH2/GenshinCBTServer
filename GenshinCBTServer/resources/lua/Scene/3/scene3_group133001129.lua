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
	{ config_id = 1913, gadget_id = 70710002, pos = { x = 1402.6, y = 243.2, z = -1480.5 }, rot = { x = 0.0, y = 171.5, z = 0.0 }, level = 1, route_id = 3001157, save_route = true },
	{ config_id = 1914, gadget_id = 70710002, pos = { x = 1416.4, y = 241.3, z = -1539.8 }, rot = { x = 0.0, y = 40.0, z = 0.0 }, level = 1, route_id = 3001153, save_route = true },
	{ config_id = 1915, gadget_id = 70710002, pos = { x = 1363.4, y = 241.4, z = -1519.7 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, route_id = 3001155, save_route = true },
	{ config_id = 1916, gadget_id = 70210031, pos = { x = 1386.8, y = 233.7, z = -1515.1 }, rot = { x = 0.0, y = 2.4, z = 0.0 }, level = 1, chest_drop_id = 403223, isOneoff = true, persistent = true },
	{ config_id = 2099, gadget_id = 70900042, pos = { x = 1389.8, y = 233.2, z = -1516.6 }, rot = { x = 13.2, y = 228.8, z = 348.0 }, level = 1 },
	{ config_id = 2100, gadget_id = 70900042, pos = { x = 1384.3, y = 233.3, z = -1515.8 }, rot = { x = 350.2, y = 263.6, z = 0.0 }, level = 1 },
	{ config_id = 2101, gadget_id = 70900042, pos = { x = 1386.3, y = 233.2, z = -1512.5 }, rot = { x = 27.2, y = 95.8, z = 0.0 }, level = 1 }
}

-- 区域
regions = {
	{ config_id = 142, shape = RegionShape.CUBIC, size = { x = 5.0, y = 2.0, z = 5.0 }, pos = { x = 1416.7, y = 241.0, z = -1539.7 } },
	{ config_id = 143, shape = RegionShape.CUBIC, size = { x = 5.0, y = 2.0, z = 5.0 }, pos = { x = 1402.5, y = 242.5, z = -1480.4 } },
	{ config_id = 144, shape = RegionShape.CUBIC, size = { x = 5.0, y = 2.0, z = 5.0 }, pos = { x = 1362.6, y = 240.5, z = -1520.4 } },
	{ config_id = 145, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1389.3, y = 234.4, z = -1518.7 } },
	{ config_id = 211, shape = RegionShape.SPHERE, radius = 4, pos = { x = 1386.9, y = 234.4, z = -1512.6 } },
	{ config_id = 212, shape = RegionShape.SPHERE, radius = 4, pos = { x = 1389.5, y = 235.1, z = -1516.4 } },
	{ config_id = 213, shape = RegionShape.SPHERE, radius = 4, pos = { x = 1384.3, y = 235.4, z = -1515.6 } },
	{ config_id = 302, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1369.8, y = 234.4, z = -1510.9 } }
}

-- 触发器
triggers = {
	{ name = "ENTER_REGION_142", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_142", action = "action_EVENT_ENTER_REGION_142" },
	{ name = "ENTER_REGION_143", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_143", action = "action_EVENT_ENTER_REGION_143" },
	{ name = "ENTER_REGION_144", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_144", action = "action_EVENT_ENTER_REGION_144" },
	{ name = "VARIABLE_CHANGE_145", event = EventType.EVENT_VARIABLE_CHANGE, source = "", condition = "condition_EVENT_VARIABLE_CHANGE_145", action = "action_EVENT_VARIABLE_CHANGE_145" },
	{ name = "PLATFORM_REACH_POINT_211", event = EventType.EVENT_PLATFORM_REACH_POINT, source = "", condition = "condition_EVENT_PLATFORM_REACH_POINT_211", action = "action_EVENT_PLATFORM_REACH_POINT_211" },
	{ name = "PLATFORM_REACH_POINT_212", event = EventType.EVENT_PLATFORM_REACH_POINT, source = "", condition = "condition_EVENT_PLATFORM_REACH_POINT_212", action = "action_EVENT_PLATFORM_REACH_POINT_212" },
	{ name = "PLATFORM_REACH_POINT_213", event = EventType.EVENT_PLATFORM_REACH_POINT, source = "", condition = "condition_EVENT_PLATFORM_REACH_POINT_213", action = "action_EVENT_PLATFORM_REACH_POINT_213" },
	{ name = "CLIENT_EXECUTE_302", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_302", trigger_count = 0 }
}

-- 变量
variables = {
	{ name = "Key", value = 0, persistent = false }
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
		gadgets = { 1913, 1914, 1915, 2099, 2100, 2101 },
		regions = { 142, 143, 144, 145, 211, 212, 213, 302 },
		triggers = { "ENTER_REGION_142", "ENTER_REGION_143", "ENTER_REGION_144", "VARIABLE_CHANGE_145", "PLATFORM_REACH_POINT_211", "PLATFORM_REACH_POINT_212", "PLATFORM_REACH_POINT_213", "CLIENT_EXECUTE_302" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ENTER_REGION_142(context, evt)
	if evt.param1 ~= 142 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_142(context, evt)
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 1914, 3001154) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_143(context, evt)
	if evt.param1 ~= 143 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_143(context, evt)
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 1913, 3001158) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_144(context, evt)
	if evt.param1 ~= 144 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_144(context, evt)
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 1915, 3001156) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_VARIABLE_CHANGE_145(context, evt)
	-- 判断变量"Key"为3
	if ScriptLib.GetGroupVariableValue(context, "Key") ~= 3 then
			return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_VARIABLE_CHANGE_145(context, evt)
	-- 创生gadget 1916
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 1916 }) then
		return -1
	end
	
	-- 触发镜头注目，注目位置为坐标（1386，233，-1515），持续时间为2秒，并且为强制注目形式，不广播其他玩家
		local pos = {x=1386, y=233, z=-1515}
	    if 0 ~= ScriptLib.BeginCameraSceneLook(context, { look_pos = pos, duration = 2, is_force = true, is_broadcast = false }) then
					return -1
				end 
	
	return 0
end

-- 触发条件
function condition_EVENT_PLATFORM_REACH_POINT_211(context, evt)
	-- 判断是gadgetid 为 1913的移动平台，是否到达了3001158 的路线中的 1 点
	
	if 1913 ~= evt.param1 then
	  return false
	end
	
	if 3001158 ~= evt.param2 then
	  return false
	end
	
	if 1 ~= evt.param3 then
	  return false
	end
	
	
	return true
end

-- 触发操作
function action_EVENT_PLATFORM_REACH_POINT_211(context, evt)
	-- 针对当前group内变量名为 "Key" 的变量，进行修改，变化值为 1
	if 0 ~= ScriptLib.ChangeGroupVariableValue(context, "Key", 1) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_PLATFORM_REACH_POINT_212(context, evt)
	-- 判断是gadgetid 为 1914的移动平台，是否到达了3001154 的路线中的 1 点
	
	if 1914 ~= evt.param1 then
	  return false
	end
	
	if 3001154 ~= evt.param2 then
	  return false
	end
	
	if 1 ~= evt.param3 then
	  return false
	end
	
	
	return true
end

-- 触发操作
function action_EVENT_PLATFORM_REACH_POINT_212(context, evt)
	-- 针对当前group内变量名为 "Key" 的变量，进行修改，变化值为 1
	if 0 ~= ScriptLib.ChangeGroupVariableValue(context, "Key", 1) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_PLATFORM_REACH_POINT_213(context, evt)
	-- 判断是gadgetid 为 1915的移动平台，是否到达了3001156 的路线中的 1 点
	
	if 1915 ~= evt.param1 then
	  return false
	end
	
	if 3001156 ~= evt.param2 then
	  return false
	end
	
	if 1 ~= evt.param3 then
	  return false
	end
	
	
	return true
end

-- 触发操作
function action_EVENT_PLATFORM_REACH_POINT_213(context, evt)
	-- 针对当前group内变量名为 "Key" 的变量，进行修改，变化值为 1
	if 0 ~= ScriptLib.ChangeGroupVariableValue(context, "Key", 1) then
	  return -1
	end
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_302(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end
