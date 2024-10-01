--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 873, monster_id = 20010401, pos = { x = 1846.4, y = 201.0, z = -91.7 }, rot = { x = 0.0, y = 105.0, z = 0.0 }, level = 7, drop_id = 303142, disableWander = true },
	{ config_id = 874, monster_id = 20010301, pos = { x = 1848.9, y = 201.1, z = -94.3 }, rot = { x = 0.0, y = 186.5, z = 0.0 }, level = 7, drop_id = 303042 },
	{ config_id = 875, monster_id = 20010301, pos = { x = 1850.8, y = 201.5, z = -85.6 }, rot = { x = 0.0, y = 186.5, z = 0.0 }, level = 7, drop_id = 303042 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 1553, gadget_id = 70900042, pos = { x = 1871.1, y = 204.0, z = -114.0 }, rot = { x = 346.2, y = 259.8, z = 352.3 }, level = 1 },
	{ config_id = 1554, gadget_id = 70900042, pos = { x = 1875.2, y = 203.5, z = -123.3 }, rot = { x = 0.0, y = 106.8, z = 0.0 }, level = 1 },
	{ config_id = 1555, gadget_id = 70900042, pos = { x = 1881.8, y = 204.5, z = -118.1 }, rot = { x = 28.2, y = 349.2, z = 21.2 }, level = 1 },
	{ config_id = 1556, gadget_id = 70210042, pos = { x = 1877.6, y = 204.9, z = -116.4 }, rot = { x = 0.0, y = 198.2, z = 0.0 }, level = 1, chest_drop_id = 403263, state = GadgetState.ChestLocked, isOneoff = true, persistent = true },
	{ config_id = 1557, gadget_id = 70710002, pos = { x = 1889.5, y = 214.0, z = -121.5 }, rot = { x = 0.0, y = 137.8, z = 0.0 }, level = 1, route_id = 3002148, save_route = true },
	{ config_id = 1558, gadget_id = 70710002, pos = { x = 1828.9, y = 204.0, z = -96.7 }, rot = { x = 0.0, y = 252.4, z = 0.0 }, level = 1, route_id = 3002150, save_route = true },
	{ config_id = 1559, gadget_id = 70710002, pos = { x = 1938.5, y = 230.9, z = -158.5 }, rot = { x = 0.0, y = 81.9, z = 0.0 }, level = 1, route_id = 3002153, save_route = true },
	{ config_id = 2148, gadget_id = 70220019, pos = { x = 1844.3, y = 196.6, z = -100.4 }, rot = { x = 0.0, y = 11.4, z = 0.0 }, level = 1 },
	{ config_id = 2149, gadget_id = 70220019, pos = { x = 1839.5, y = 196.7, z = -99.4 }, rot = { x = 0.0, y = 11.4, z = 0.0 }, level = 1 },
	{ config_id = 2150, gadget_id = 70220019, pos = { x = 1834.5, y = 196.7, z = -98.4 }, rot = { x = 0.0, y = 11.4, z = 0.0 }, level = 1 },
	{ config_id = 2151, gadget_id = 70220019, pos = { x = 1829.1, y = 196.8, z = -97.4 }, rot = { x = 0.0, y = 11.4, z = 0.0 }, level = 1 },
	{ config_id = 2152, gadget_id = 70220019, pos = { x = 1829.4, y = 190.3, z = -97.3 }, rot = { x = 0.0, y = 11.4, z = 0.0 }, level = 1 },
	{ config_id = 2153, gadget_id = 70220019, pos = { x = 1846.0, y = 196.1, z = -100.6 }, rot = { x = 0.0, y = 11.4, z = 337.0 }, level = 1 },
	{ config_id = 2154, gadget_id = 70220005, pos = { x = 1835.2, y = 203.2, z = -99.1 }, rot = { x = 0.0, y = 66.3, z = 0.0 }, level = 1 },
	{ config_id = 2155, gadget_id = 70220005, pos = { x = 1835.4, y = 203.2, z = -98.1 }, rot = { x = 0.0, y = 66.3, z = 0.0 }, level = 1 },
	{ config_id = 2158, gadget_id = 70220005, pos = { x = 1835.4, y = 204.0, z = -98.6 }, rot = { x = 0.0, y = 66.3, z = 0.0 }, level = 1 }
}

-- 区域
regions = {
	{ config_id = 215, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1891.9, y = 215.5, z = -124.1 } },
	{ config_id = 216, shape = RegionShape.SPHERE, radius = 1, pos = { x = 1881.3, y = 205.6, z = -117.3 } },
	{ config_id = 217, shape = RegionShape.SPHERE, radius = 2, pos = { x = 1829.1, y = 205.2, z = -97.5 } },
	{ config_id = 218, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1828.8, y = 201.0, z = -122.7 } },
	{ config_id = 219, shape = RegionShape.SPHERE, radius = 1.5, pos = { x = 1871.6, y = 205.4, z = -113.6 } },
	{ config_id = 220, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1891.5, y = 212.1, z = -219.2 } },
	{ config_id = 221, shape = RegionShape.SPHERE, radius = 3.3, pos = { x = 1861.5, y = 202.4, z = -172.5 } },
	{ config_id = 222, shape = RegionShape.SPHERE, radius = 3, pos = { x = 1876.8, y = 202.3, z = -158.5 } },
	{ config_id = 223, shape = RegionShape.SPHERE, radius = 1.5, pos = { x = 1875.3, y = 204.9, z = -123.0 } },
	{ config_id = 272, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1875.1, y = 204.5, z = -119.8 } }
}

-- 触发器
triggers = {
	{ name = "ENTER_REGION_215", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_215", action = "action_EVENT_ENTER_REGION_215", tlog_tag = "酒庄_210_风龙峡谷移动精灵近处_触发" },
	{ name = "PLATFORM_REACH_POINT_216", event = EventType.EVENT_PLATFORM_REACH_POINT, source = "", condition = "condition_EVENT_PLATFORM_REACH_POINT_216", action = "action_EVENT_PLATFORM_REACH_POINT_216" },
	{ name = "ENTER_REGION_217", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_217", action = "action_EVENT_ENTER_REGION_217", tlog_tag = "酒庄_210_风龙峡谷移动精灵水_触发" },
	{ name = "ENTER_REGION_218", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_218", action = "action_EVENT_ENTER_REGION_218" },
	{ name = "PLATFORM_REACH_POINT_219", event = EventType.EVENT_PLATFORM_REACH_POINT, source = "", condition = "condition_EVENT_PLATFORM_REACH_POINT_219", action = "action_EVENT_PLATFORM_REACH_POINT_219" },
	{ name = "ENTER_REGION_220", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_220", action = "action_EVENT_ENTER_REGION_220", tlog_tag = "酒庄_210_风龙峡谷移动精灵高_触发" },
	{ name = "ENTER_REGION_221", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_221", action = "action_EVENT_ENTER_REGION_221" },
	{ name = "ENTER_REGION_222", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_222", action = "action_EVENT_ENTER_REGION_222" },
	{ name = "PLATFORM_REACH_POINT_223", event = EventType.EVENT_PLATFORM_REACH_POINT, source = "", condition = "condition_EVENT_PLATFORM_REACH_POINT_223", action = "action_EVENT_PLATFORM_REACH_POINT_223" },
	{ name = "CLIENT_EXECUTE_272", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_272", trigger_count = 0 }
}

-- 变量
variables = {
	{ name = "v1557", value = 0, persistent = true },
	{ name = "v1558", value = 0, persistent = true },
	{ name = "v1559", value = 0, persistent = true },
	{ name = "1558door1", value = 0, persistent = true },
	{ name = "1559door1", value = 0, persistent = true },
	{ name = "1559door2", value = 0, persistent = true }
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
		monsters = { 873, 874, 875 },
		gadgets = { 1553, 1554, 1555, 1556, 1557, 1558, 1559, 2148, 2149, 2150, 2151, 2152, 2153, 2154, 2155, 2158 },
		regions = { 215, 216, 217, 218, 219, 220, 221, 222, 223, 272 },
		triggers = { "ENTER_REGION_215", "PLATFORM_REACH_POINT_216", "ENTER_REGION_217", "ENTER_REGION_218", "PLATFORM_REACH_POINT_219", "ENTER_REGION_220", "ENTER_REGION_221", "ENTER_REGION_222", "PLATFORM_REACH_POINT_223", "CLIENT_EXECUTE_272" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ENTER_REGION_215(context, evt)
	if evt.param1 ~= 215 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_215(context, evt)
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 1557, 3002149) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_PLATFORM_REACH_POINT_216(context, evt)
	-- 判断是gadgetid 为 1557的移动平台，是否到达了3002149 的路线中的 1 点
	
	if 1557 ~= evt.param1 then
	  return false
	end
	
	if 3002149 ~= evt.param2 then
	  return false
	end
	
	if 1 ~= evt.param3 then
	  return false
	end
	
	
	return true
end

-- 触发操作
function action_EVENT_PLATFORM_REACH_POINT_216(context, evt)
	-- 将本组内变量名为 "v1557" 的变量设置为 1
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "v1557", 1) then
	  return -1
	end
	
	
	-- 获取本组内变量名为 "v1557" 的变量值
	if ScriptLib.GetGroupVariableValue(context, "v1557") +  ScriptLib.GetGroupVariableValue(context, "v1558") + ScriptLib.GetGroupVariableValue(context, "v1559") == 3 then
	 
	-- 解锁目标1556
	if 0 ~= ScriptLib.ChangeGroupGadget(context, { config_id = 1556, state = GadgetState.Default }) then
		return -1
	end
	
	-- 触发镜头注目，注目位置为坐标（1878，208，-114），持续时间为4秒，并且为强制注目形式，不广播其他玩家
		local pos = {x=1878, y=208, z=-114}
	    if 0 ~= ScriptLib.BeginCameraSceneLook(context, { look_pos = pos, duration = 4, is_force = true, is_broadcast = false }) then
					return -1
				end 
	
	end
	
	
	
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_217(context, evt)
	if evt.param1 ~= 217 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_217(context, evt)
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 1558, 3002151) then
	  return -1
	end
	
	-- 将本组内变量名为 "1558door1" 的变量设置为 1
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "1558door1", 1) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_218(context, evt)
	if evt.param1 ~= 218 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	-- 判断变量"1558door1"为1
	if ScriptLib.GetGroupVariableValue(context, "1558door1") ~= 1 then
			return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_218(context, evt)
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 1558, 3002152) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_PLATFORM_REACH_POINT_219(context, evt)
	-- 判断是gadgetid 为 1558的移动平台，是否到达了3002152 的路线中的 2 点
	
	if 1558 ~= evt.param1 then
	  return false
	end
	
	if 3002152 ~= evt.param2 then
	  return false
	end
	
	if 2 ~= evt.param3 then
	  return false
	end
	
	
	return true
end

-- 触发操作
function action_EVENT_PLATFORM_REACH_POINT_219(context, evt)
	-- 将本组内变量名为 "v1558" 的变量设置为 1
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "v1558", 1) then
	  return -1
	end
	
	
	-- 获取本组内变量名为 "v1557" 的变量值
	if ScriptLib.GetGroupVariableValue(context, "v1557") +  ScriptLib.GetGroupVariableValue(context, "v1558") + ScriptLib.GetGroupVariableValue(context, "v1559") == 3 then
	 
	-- 解锁目标1556
	if 0 ~= ScriptLib.ChangeGroupGadget(context, { config_id = 1556, state = GadgetState.Default }) then
		return -1
	end
	
	-- 触发镜头注目，注目位置为坐标（1878，208，-114），持续时间为4秒，并且为强制注目形式，不广播其他玩家
		local pos = {x=1878, y=208, z=-114}
	    if 0 ~= ScriptLib.BeginCameraSceneLook(context, { look_pos = pos, duration = 4, is_force = true, is_broadcast = false }) then
					return -1
				end 
	
	end
	
	
	
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_220(context, evt)
	if evt.param1 ~= 220 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_220(context, evt)
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 1559, 3002154) then
	  return -1
	end
	
	-- 将本组内变量名为 "1559door1" 的变量设置为 1
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "1559door1", 1) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_221(context, evt)
	if evt.param1 ~= 221 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	-- 判断变量"1559door1"为1
	if ScriptLib.GetGroupVariableValue(context, "1559door1") ~= 1 then
			return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_221(context, evt)
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 1559, 3002155) then
	  return -1
	end
	
	-- 将本组内变量名为 "1559door2" 的变量设置为 1
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "1559door2", 1) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_222(context, evt)
	if evt.param1 ~= 222 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	-- 判断变量"1559door2"为1
	if ScriptLib.GetGroupVariableValue(context, "1559door2") ~= 1 then
			return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_222(context, evt)
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 1559, 3002156) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_PLATFORM_REACH_POINT_223(context, evt)
	-- 判断是gadgetid 为 1559的移动平台，是否到达了3002156 的路线中的 1 点
	
	if 1559 ~= evt.param1 then
	  return false
	end
	
	if 3002156 ~= evt.param2 then
	  return false
	end
	
	if 1 ~= evt.param3 then
	  return false
	end
	
	
	return true
end

-- 触发操作
function action_EVENT_PLATFORM_REACH_POINT_223(context, evt)
	-- 将本组内变量名为 "v1559" 的变量设置为 1
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "v1559", 1) then
	  return -1
	end
	
	
	-- 获取本组内变量名为 "v1557" 的变量值
	if ScriptLib.GetGroupVariableValue(context, "v1557") +  ScriptLib.GetGroupVariableValue(context, "v1558") + ScriptLib.GetGroupVariableValue(context, "v1559") == 3 then
	 
	-- 解锁目标1556
	if 0 ~= ScriptLib.ChangeGroupGadget(context, { config_id = 1556, state = GadgetState.Default }) then
		return -1
	end
	
	-- 触发镜头注目，注目位置为坐标（1878，208，-114），持续时间为4秒，并且为强制注目形式，不广播其他玩家
		local pos = {x=1878, y=208, z=-114}
	    if 0 ~= ScriptLib.BeginCameraSceneLook(context, { look_pos = pos, duration = 4, is_force = true, is_broadcast = false }) then
					return -1
				end 
	
	end
	
	
	
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_272(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end
