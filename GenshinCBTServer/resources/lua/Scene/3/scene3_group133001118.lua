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
	{ config_id = 1801, gadget_id = 70210032, pos = { x = 1325.5, y = 282.3, z = -1787.4 }, rot = { x = 0.0, y = 70.6, z = 0.0 }, level = 1, chest_drop_id = 403244, state = GadgetState.ChestLocked, isOneoff = true, persistent = true },
	{ config_id = 1802, gadget_id = 70710002, pos = { x = 1454.8, y = 263.4, z = -1713.9 }, rot = { x = 0.0, y = 235.9, z = 0.0 }, level = 1, route_id = 3001126, save_route = true },
	{ config_id = 1803, gadget_id = 70710002, pos = { x = 1322.4, y = 276.0, z = -1735.9 }, rot = { x = 0.0, y = 7.5, z = 0.0 }, level = 1, route_id = 3001124, save_route = true },
	{ config_id = 1810, gadget_id = 70900042, pos = { x = 1325.5, y = 282.2, z = -1784.3 }, rot = { x = 0.0, y = 257.3, z = 0.0 }, level = 1 },
	{ config_id = 1811, gadget_id = 70900042, pos = { x = 1325.1, y = 282.8, z = -1791.5 }, rot = { x = 0.0, y = 329.5, z = 0.0 }, level = 1 }
}

-- 区域
regions = {
	{ config_id = 104, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1322.8, y = 275.4, z = -1735.4 } },
	{ config_id = 105, shape = RegionShape.SPHERE, radius = 11.2, pos = { x = 1455.4, y = 264.7, z = -1714.7 } },
	{ config_id = 106, shape = RegionShape.SPHERE, radius = 13.2, pos = { x = 1327.1, y = 282.2, z = -1786.0 } },
	{ config_id = 131, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1437.5, y = 272.4, z = -1783.7 } },
	{ config_id = 132, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1408.4, y = 278.3, z = -1799.7 } },
	{ config_id = 133, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1358.8, y = 281.8, z = -1807.9 } },
	{ config_id = 298, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1326.4, y = 284.4, z = -1786.3 } },
	{ config_id = 368, shape = RegionShape.SPHERE, radius = 2.4, pos = { x = 1325.4, y = 283.8, z = -1791.2 } },
	{ config_id = 369, shape = RegionShape.SPHERE, radius = 3, pos = { x = 1325.6, y = 282.7, z = -1783.8 } }
}

-- 触发器
triggers = {
	{ name = "ENTER_REGION_104", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_104", action = "action_EVENT_ENTER_REGION_104" },
	{ name = "ENTER_REGION_105", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_105", action = "action_EVENT_ENTER_REGION_105" },
	{ name = "VARIABLE_CHANGE_106", event = EventType.EVENT_VARIABLE_CHANGE, source = "", condition = "condition_EVENT_VARIABLE_CHANGE_106", action = "action_EVENT_VARIABLE_CHANGE_106" },
	{ name = "ENTER_REGION_131", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_131", action = "action_EVENT_ENTER_REGION_131" },
	{ name = "ENTER_REGION_132", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_132", action = "action_EVENT_ENTER_REGION_132" },
	{ name = "ENTER_REGION_133", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_133", action = "action_EVENT_ENTER_REGION_133" },
	{ name = "CLIENT_EXECUTE_298", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_298", trigger_count = 0 },
	{ name = "PLATFORM_REACH_POINT_368", event = EventType.EVENT_PLATFORM_REACH_POINT, source = "", condition = "condition_EVENT_PLATFORM_REACH_POINT_368", action = "action_EVENT_PLATFORM_REACH_POINT_368", tlog_tag = "剑冢誓言岬中间区域精灵草1解开" },
	{ name = "PLATFORM_REACH_POINT_369", event = EventType.EVENT_PLATFORM_REACH_POINT, source = "", condition = "condition_EVENT_PLATFORM_REACH_POINT_369", action = "action_EVENT_PLATFORM_REACH_POINT_369", tlog_tag = "剑冢誓言岬中间区域精灵草2解开" }
}

-- 变量
variables = {
	{ name = "Chest1801", value = 0, persistent = false },
	{ name = "R1", value = 0, persistent = false },
	{ name = "R2", value = 0, persistent = false },
	{ name = "R3", value = 0, persistent = false },
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
		gadgets = { 1801, 1802, 1803, 1810, 1811 },
		regions = { 104, 105, 106, 131, 132, 133, 298, 368, 369 },
		triggers = { "ENTER_REGION_104", "ENTER_REGION_105", "VARIABLE_CHANGE_106", "ENTER_REGION_131", "ENTER_REGION_132", "ENTER_REGION_133", "CLIENT_EXECUTE_298", "PLATFORM_REACH_POINT_368", "PLATFORM_REACH_POINT_369" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ENTER_REGION_104(context, evt)
	if evt.param1 ~= 104 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_104(context, evt)
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 1803, 3001125) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_105(context, evt)
	if evt.param1 ~= 105 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_105(context, evt)
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 1802, 3001127) then
	  return -1
	end
	
	-- 针对当前group内变量名为 "R1" 的变量，进行修改，变化值为 1
	if 0 ~= ScriptLib.ChangeGroupVariableValue(context, "R1", 1) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_VARIABLE_CHANGE_106(context, evt)
	-- 判断变量"Key"为2
	if ScriptLib.GetGroupVariableValue(context, "Key") ~= 2 then
			return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_VARIABLE_CHANGE_106(context, evt)
	-- 将configid为 1801 的物件更改为状态 GadgetState.Default
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 1801, GadgetState.Default) then
			return -1
		end 
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_131(context, evt)
	if evt.param1 ~= 131 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	-- 判断变量"R1"为1
	if ScriptLib.GetGroupVariableValue(context, "R1") ~= 1 then
			return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_131(context, evt)
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 1802, 3001147) then
	  return -1
	end
	
	-- 针对当前group内变量名为 "R2" 的变量，进行修改，变化值为 1
	if 0 ~= ScriptLib.ChangeGroupVariableValue(context, "R2", 1) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_132(context, evt)
	if evt.param1 ~= 132 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	-- 判断变量"R2"为1
	if ScriptLib.GetGroupVariableValue(context, "R2") ~= 1 then
			return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_132(context, evt)
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 1802, 3001148) then
	  return -1
	end
	
	-- 针对当前group内变量名为 "R3" 的变量，进行修改，变化值为 1
	if 0 ~= ScriptLib.ChangeGroupVariableValue(context, "R3", 1) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_133(context, evt)
	if evt.param1 ~= 133 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	-- 判断变量"R3"为1
	if ScriptLib.GetGroupVariableValue(context, "R3") ~= 1 then
			return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_133(context, evt)
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 1802, 3001149) then
	  return -1
	end
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_298(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end

-- 触发条件
function condition_EVENT_PLATFORM_REACH_POINT_368(context, evt)
	-- 判断是gadgetid 为 1802的移动平台，是否到达了3001149 的路线中的 2 点
	
	if 1802 ~= evt.param1 then
	  return false
	end
	
	if 3001149 ~= evt.param2 then
	  return false
	end
	
	if 2 ~= evt.param3 then
	  return false
	end
	
	
	return true
end

-- 触发操作
function action_EVENT_PLATFORM_REACH_POINT_368(context, evt)
	-- 针对当前group内变量名为 "Key" 的变量，进行修改，变化值为 1
	if 0 ~= ScriptLib.ChangeGroupVariableValue(context, "Key", 1) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_PLATFORM_REACH_POINT_369(context, evt)
	-- 判断是gadgetid 为 1803的移动平台，是否到达了3001125 的路线中的 3 点
	
	if 1803 ~= evt.param1 then
	  return false
	end
	
	if 3001125 ~= evt.param2 then
	  return false
	end
	
	if 3 ~= evt.param3 then
	  return false
	end
	
	
	return true
end

-- 触发操作
function action_EVENT_PLATFORM_REACH_POINT_369(context, evt)
	-- 针对当前group内变量名为 "Key" 的变量，进行修改，变化值为 1
	if 0 ~= ScriptLib.ChangeGroupVariableValue(context, "Key", 1) then
	  return -1
	end
	
	return 0
end
