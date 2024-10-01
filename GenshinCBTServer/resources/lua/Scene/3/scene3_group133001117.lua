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
	{ config_id = 1797, gadget_id = 70710002, pos = { x = 1519.2, y = 353.6, z = -2067.5 }, rot = { x = 0.0, y = 252.5, z = 0.0 }, level = 1, route_id = 3001199, save_route = true },
	{ config_id = 1798, gadget_id = 70710002, pos = { x = 1631.9, y = 345.6, z = -2125.5 }, rot = { x = 0.0, y = 282.8, z = 0.0 }, level = 1, route_id = 3001168, save_route = true },
	{ config_id = 1799, gadget_id = 70710002, pos = { x = 1563.7, y = 334.9, z = -2047.1 }, rot = { x = 0.0, y = 196.7, z = 0.0 }, level = 1, route_id = 3001159, save_route = true },
	{ config_id = 2020, gadget_id = 70900042, pos = { x = 1537.7, y = 333.5, z = -2088.5 }, rot = { x = 0.0, y = 90.7, z = 8.5 }, level = 1 },
	{ config_id = 2021, gadget_id = 70900042, pos = { x = 1550.3, y = 334.6, z = -2085.9 }, rot = { x = 19.5, y = 279.8, z = 3.9 }, level = 1 },
	{ config_id = 2022, gadget_id = 70900042, pos = { x = 1545.7, y = 333.2, z = -2070.2 }, rot = { x = 10.6, y = 234.6, z = 348.6 }, level = 1 },
	{ config_id = 2467, gadget_id = 70290010, pos = { x = 1534.5, y = 334.0, z = -2088.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 2468, gadget_id = 70500000, pos = { x = 1534.5, y = 334.0, z = -2088.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3006, owner = 2467 },
	{ config_id = 2989, gadget_id = 70290001, pos = { x = 1478.0, y = 329.9, z = -2045.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 2990, gadget_id = 70500000, pos = { x = 1478.0, y = 330.5, z = -2044.9 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3002, owner = 2989 },
	{ config_id = 2991, gadget_id = 70500000, pos = { x = 1478.0, y = 330.8, z = -2045.7 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3002, owner = 2989 },
	{ config_id = 2992, gadget_id = 70500000, pos = { x = 1478.3, y = 331.2, z = -2045.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3002, owner = 2989 }
}

-- 区域
regions = {
	{ config_id = 149, shape = RegionShape.SPHERE, radius = 8, pos = { x = 1561.1, y = 334.0, z = -2048.8 } },
	{ config_id = 150, shape = RegionShape.CUBIC, size = { x = 5.0, y = 1.0, z = 5.0 }, pos = { x = 1587.2, y = 341.0, z = -2041.0 } },
	{ config_id = 151, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1381.7, y = 323.2, z = -1984.8 } },
	{ config_id = 152, shape = RegionShape.CUBIC, size = { x = 5.0, y = 1.0, z = 5.0 }, pos = { x = 1376.2, y = 328.4, z = -1983.7 } },
	{ config_id = 153, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1383.8, y = 331.2, z = -1965.2 } },
	{ config_id = 154, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1441.0, y = 328.2, z = -1987.1 } },
	{ config_id = 155, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1511.3, y = 331.1, z = -2009.5 } },
	{ config_id = 156, shape = RegionShape.SPHERE, radius = 8.3, pos = { x = 1633.2, y = 345.1, z = -2125.0 } },
	{ config_id = 157, shape = RegionShape.CUBIC, size = { x = 5.0, y = 1.0, z = 5.0 }, pos = { x = 1612.8, y = 348.1, z = -2093.9 } },
	{ config_id = 158, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1543.7, y = 333.6, z = -2080.9 } },
	{ config_id = 207, shape = RegionShape.SPHERE, radius = 60, pos = { x = 1467.1, y = 309.8, z = -2055.7 } },
	{ config_id = 358, shape = RegionShape.SPHERE, radius = 2.7, pos = { x = 1545.0, y = 335.0, z = -2069.7 } },
	{ config_id = 359, shape = RegionShape.SPHERE, radius = 3.7, pos = { x = 1537.3, y = 334.9, z = -2088.4 } },
	{ config_id = 360, shape = RegionShape.SPHERE, radius = 4.4, pos = { x = 1549.7, y = 335.1, z = -2085.8 } },
	{ config_id = 376, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1518.7, y = 352.9, z = -2067.9 } }
}

-- 触发器
triggers = {
	{ name = "ENTER_REGION_149", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_149", action = "action_EVENT_ENTER_REGION_149" },
	{ name = "ENTER_REGION_150", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_150", action = "action_EVENT_ENTER_REGION_150" },
	{ name = "ENTER_REGION_151", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_151", action = "action_EVENT_ENTER_REGION_151" },
	{ name = "ENTER_REGION_152", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_152", action = "action_EVENT_ENTER_REGION_152" },
	{ name = "ENTER_REGION_153", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_153", action = "action_EVENT_ENTER_REGION_153" },
	{ name = "ENTER_REGION_154", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_154", action = "action_EVENT_ENTER_REGION_154" },
	{ name = "ENTER_REGION_155", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_155", action = "action_EVENT_ENTER_REGION_155" },
	{ name = "ENTER_REGION_156", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_156", action = "action_EVENT_ENTER_REGION_156" },
	{ name = "ENTER_REGION_157", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_157", action = "action_EVENT_ENTER_REGION_157" },
	{ name = "VARIABLE_CHANGE_158", event = EventType.EVENT_VARIABLE_CHANGE, source = "", condition = "condition_EVENT_VARIABLE_CHANGE_158", action = "action_EVENT_VARIABLE_CHANGE_158" },
	{ name = "ENTER_REGION_207", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_207", action = "action_EVENT_ENTER_REGION_207" },
	{ name = "PLATFORM_REACH_POINT_358", event = EventType.EVENT_PLATFORM_REACH_POINT, source = "", condition = "condition_EVENT_PLATFORM_REACH_POINT_358", action = "action_EVENT_PLATFORM_REACH_POINT_358", tlog_tag = "誓言岬顶端解谜-1799精灵草解开" },
	{ name = "PLATFORM_REACH_POINT_359", event = EventType.EVENT_PLATFORM_REACH_POINT, source = "", condition = "condition_EVENT_PLATFORM_REACH_POINT_359", action = "action_EVENT_PLATFORM_REACH_POINT_359", tlog_tag = "誓言岬顶端解谜-1797精灵草解开" },
	{ name = "PLATFORM_REACH_POINT_360", event = EventType.EVENT_PLATFORM_REACH_POINT, source = "", condition = "condition_EVENT_PLATFORM_REACH_POINT_360", action = "action_EVENT_PLATFORM_REACH_POINT_360", tlog_tag = "誓言岬顶端解谜-1798精灵草解开" },
	{ name = "ENTER_REGION_376", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_376", action = "action_EVENT_ENTER_REGION_376" }
}

-- 变量
variables = {
	{ name = "R1_1", value = 0, persistent = false },
	{ name = "Key", value = 0, persistent = false },
	{ name = "R2_1", value = 0, persistent = false },
	{ name = "R2_2", value = 0, persistent = false },
	{ name = "R2_3", value = 0, persistent = false },
	{ name = "R2_4", value = 0, persistent = false },
	{ name = "R3_1", value = 0, persistent = false }
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
		gadgets = { 1797, 1798, 1799, 2020, 2021, 2022, 2467, 2468, 2989, 2990, 2991, 2992 },
		regions = { 149, 150, 156, 157, 158, 207, 358, 359, 360, 376 },
		triggers = { "ENTER_REGION_149", "ENTER_REGION_150", "ENTER_REGION_156", "ENTER_REGION_157", "VARIABLE_CHANGE_158", "ENTER_REGION_207", "PLATFORM_REACH_POINT_358", "PLATFORM_REACH_POINT_359", "PLATFORM_REACH_POINT_360", "ENTER_REGION_376" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ENTER_REGION_149(context, evt)
	if evt.param1 ~= 149 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_149(context, evt)
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 1799, 3001160) then
	  return -1
	end
	
	-- 针对当前group内变量名为 "R1_1" 的变量，进行修改，变化值为 1
	if 0 ~= ScriptLib.ChangeGroupVariableValue(context, "R1_1", 1) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_150(context, evt)
	if evt.param1 ~= 150 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	-- 判断变量"R1_1"为1
	if ScriptLib.GetGroupVariableValue(context, "R1_1") ~= 1 then
			return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_150(context, evt)
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 1799, 3001161) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_151(context, evt)
	if evt.param1 ~= 151 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_151(context, evt)
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 1797, 3001162) then
	  return -1
	end
	
	-- 针对当前group内变量名为 "R2_1" 的变量，进行修改，变化值为 1
	if 0 ~= ScriptLib.ChangeGroupVariableValue(context, "R2_1", 1) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_152(context, evt)
	if evt.param1 ~= 152 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	-- 判断变量"R2_1"为1
	if ScriptLib.GetGroupVariableValue(context, "R2_1") ~= 1 then
			return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_152(context, evt)
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 1797, 3001163) then
	  return -1
	end
	
	-- 针对当前group内变量名为 "R2_2" 的变量，进行修改，变化值为 1
	if 0 ~= ScriptLib.ChangeGroupVariableValue(context, "R2_2", 1) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_153(context, evt)
	if evt.param1 ~= 153 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	-- 判断变量"R2_2"为1
	if ScriptLib.GetGroupVariableValue(context, "R2_2") ~= 1 then
			return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_153(context, evt)
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 1797, 3001164) then
	  return -1
	end
	
	-- 针对当前group内变量名为 "R2_3" 的变量，进行修改，变化值为 1
	if 0 ~= ScriptLib.ChangeGroupVariableValue(context, "R2_3", 1) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_154(context, evt)
	if evt.param1 ~= 154 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	-- 判断变量"R2_3"为1
	if ScriptLib.GetGroupVariableValue(context, "R2_3") ~= 1 then
			return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_154(context, evt)
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 1797, 3001166) then
	  return -1
	end
	
	-- 针对当前group内变量名为 "R2_4" 的变量，进行修改，变化值为 1
	if 0 ~= ScriptLib.ChangeGroupVariableValue(context, "R2_4", 1) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_155(context, evt)
	if evt.param1 ~= 155 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	-- 判断变量"R2_4"为1
	if ScriptLib.GetGroupVariableValue(context, "R2_4") ~= 1 then
			return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_155(context, evt)
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 1797, 3001167) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_156(context, evt)
	if evt.param1 ~= 156 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_156(context, evt)
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 1798, 3001169) then
	  return -1
	end
	
	-- 针对当前group内变量名为 "R3_1" 的变量，进行修改，变化值为 1
	if 0 ~= ScriptLib.ChangeGroupVariableValue(context, "R3_1", 1) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_157(context, evt)
	if evt.param1 ~= 157 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	-- 判断变量"R3_1"为1
	if ScriptLib.GetGroupVariableValue(context, "R3_1") ~= 1 then
			return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_157(context, evt)
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 1798, 3001170) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_VARIABLE_CHANGE_158(context, evt)
	-- 判断变量"Key"为3
	if ScriptLib.GetGroupVariableValue(context, "Key") ~= 3 then
			return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_VARIABLE_CHANGE_158(context, evt)
	-- 解锁目标37
	if 0 ~= ScriptLib.UnlockForce(context, 37) then
		return -1
	end
	
	-- 触发镜头注目，注目位置为坐标（1542，333，-2080），持续时间为2秒，并且为强制注目形式，不广播其他玩家
		local pos = {x=1542, y=333, z=-2080}
	    if 0 ~= ScriptLib.BeginCameraSceneLook(context, { look_pos = pos, duration = 2, is_force = true, is_broadcast = false }) then
					return -1
				end 
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_207(context, evt)
	if evt.param1 ~= 207 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_207(context, evt)
	-- 触发镜头注目，注目位置为坐标（1558，376，-2085），持续时间为2秒，并且为强制注目形式，不广播其他玩家
		local pos = {x=1558, y=376, z=-2085}
	    if 0 ~= ScriptLib.BeginCameraSceneLook(context, { look_pos = pos, duration = 2, is_force = true, is_broadcast = false }) then
					return -1
				end 
	
	return 0
end

-- 触发条件
function condition_EVENT_PLATFORM_REACH_POINT_358(context, evt)
	-- 判断是gadgetid 为 1799的移动平台，是否到达了3001161 的路线中的 2 点
	
	if 1799 ~= evt.param1 then
	  return false
	end
	
	if 3001161 ~= evt.param2 then
	  return false
	end
	
	if 2 ~= evt.param3 then
	  return false
	end
	
	
	return true
end

-- 触发操作
function action_EVENT_PLATFORM_REACH_POINT_358(context, evt)
	-- 针对当前group内变量名为 "Key" 的变量，进行修改，变化值为 1
	if 0 ~= ScriptLib.ChangeGroupVariableValue(context, "Key", 1) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_PLATFORM_REACH_POINT_359(context, evt)
	-- 判断是gadgetid 为 1797的移动平台，是否到达了3001200 的路线中的 2 点
	
	if 1797 ~= evt.param1 then
	  return false
	end
	
	if 3001200 ~= evt.param2 then
	  return false
	end
	
	if 2 ~= evt.param3 then
	  return false
	end
	
	
	return true
end

-- 触发操作
function action_EVENT_PLATFORM_REACH_POINT_359(context, evt)
	-- 针对当前group内变量名为 "Key" 的变量，进行修改，变化值为 1
	if 0 ~= ScriptLib.ChangeGroupVariableValue(context, "Key", 1) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_PLATFORM_REACH_POINT_360(context, evt)
	-- 判断是gadgetid 为 1798的移动平台，是否到达了3001170 的路线中的 3 点
	
	if 1798 ~= evt.param1 then
	  return false
	end
	
	if 3001170 ~= evt.param2 then
	  return false
	end
	
	if 3 ~= evt.param3 then
	  return false
	end
	
	
	return true
end

-- 触发操作
function action_EVENT_PLATFORM_REACH_POINT_360(context, evt)
	-- 针对当前group内变量名为 "Key" 的变量，进行修改，变化值为 1
	if 0 ~= ScriptLib.ChangeGroupVariableValue(context, "Key", 1) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_376(context, evt)
	if evt.param1 ~= 376 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_376(context, evt)
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 1797, 3001200) then
	  return -1
	end
	
	return 0
end
