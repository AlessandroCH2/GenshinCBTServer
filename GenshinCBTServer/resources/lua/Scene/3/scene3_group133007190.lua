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
	{ config_id = 683, gadget_id = 70210031, pos = { x = 2649.8, y = 207.3, z = -95.5 }, rot = { x = 9.1, y = 263.4, z = 359.9 }, level = 1, chest_drop_id = 403225, showcutscene = true, isOneoff = true, persistent = true },
	{ config_id = 684, gadget_id = 70710002, pos = { x = 2619.9, y = 214.6, z = -64.0 }, rot = { x = 0.0, y = 264.1, z = 0.0 }, level = 1, route_id = 3007101, save_route = true },
	{ config_id = 685, gadget_id = 70900042, pos = { x = 2647.8, y = 207.3, z = -97.3 }, rot = { x = 0.0, y = 82.0, z = 0.0 }, level = 1 }
}

-- 区域
regions = {
	{ config_id = 220, shape = RegionShape.SPHERE, radius = 2, pos = { x = 2619.9, y = 214.6, z = -64.5 } },
	{ config_id = 221, shape = RegionShape.SPHERE, radius = 2, pos = { x = 2647.7, y = 208.8, z = -97.3 } },
	{ config_id = 222, shape = RegionShape.SPHERE, radius = 2, pos = { x = 2643.1, y = 221.1, z = -57.3 } },
	{ config_id = 223, shape = RegionShape.SPHERE, radius = 2, pos = { x = 2645.2, y = 229.3, z = -88.4 } }
}

-- 触发器
triggers = {
	{ name = "ENTER_REGION_220", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_220", action = "action_EVENT_ENTER_REGION_220", tlog_tag = "风龙_190_移动精灵7_开始" },
	{ name = "PLATFORM_REACH_POINT_221", event = EventType.EVENT_PLATFORM_REACH_POINT, source = "", condition = "condition_EVENT_PLATFORM_REACH_POINT_221", action = "action_EVENT_PLATFORM_REACH_POINT_221", tlog_tag = "风龙_190_移动精灵7_成功" },
	{ name = "ENTER_REGION_222", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_222", action = "action_EVENT_ENTER_REGION_222" },
	{ name = "ENTER_REGION_223", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_223", action = "action_EVENT_ENTER_REGION_223" }
}

-- 变量
variables = {
	{ name = "spirit", value = 0, persistent = false }
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
		gadgets = { 684, 685 },
		regions = { 220, 221, 222, 223 },
		triggers = { "ENTER_REGION_220", "PLATFORM_REACH_POINT_221", "ENTER_REGION_222", "ENTER_REGION_223" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ENTER_REGION_220(context, evt)
	if evt.param1 ~= 220 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	-- 判断变量"spirit"为0
	if ScriptLib.GetGroupVariableValue(context, "spirit") ~= 0 then
			return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_220(context, evt)
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 684, 3007102) then
	  return -1
	end
	
	-- 将本组内变量名为 "spirit" 的变量设置为 1
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "spirit", 1) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_PLATFORM_REACH_POINT_221(context, evt)
	-- 判断是gadgetid 为 684的移动平台，是否到达了3007104 的路线中的 2 点
	
	if 684 ~= evt.param1 then
	  return false
	end
	
	if 3007104 ~= evt.param2 then
	  return false
	end
	
	if 2 ~= evt.param3 then
	  return false
	end
	
	
	-- 判断变量"spirit"为3
	if ScriptLib.GetGroupVariableValue(context, "spirit") ~= 3 then
			return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_PLATFORM_REACH_POINT_221(context, evt)
	-- 创建id为683的gadget
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 683 }) then
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
	
	-- 判断变量"spirit"为1
	if ScriptLib.GetGroupVariableValue(context, "spirit") ~= 1 then
			return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_222(context, evt)
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 684, 3007103) then
	  return -1
	end
	
	-- 将本组内变量名为 "spirit" 的变量设置为 2
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "spirit", 2) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_223(context, evt)
	if evt.param1 ~= 223 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	-- 判断变量"spirit"为2
	if ScriptLib.GetGroupVariableValue(context, "spirit") ~= 2 then
			return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_223(context, evt)
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 684, 3007104) then
	  return -1
	end
	
	-- 将本组内变量名为 "spirit" 的变量设置为 3
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "spirit", 3) then
	  return -1
	end
	
	return 0
end
