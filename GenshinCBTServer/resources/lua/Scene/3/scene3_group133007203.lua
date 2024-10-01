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
	{ config_id = 880, gadget_id = 70210031, pos = { x = 2520.0, y = 210.5, z = 328.4 }, rot = { x = 346.4, y = 12.3, z = 0.0 }, level = 1, chest_drop_id = 403225, showcutscene = true, isOneoff = true, persistent = true },
	{ config_id = 881, gadget_id = 70710002, pos = { x = 2548.9, y = 219.0, z = 370.2 }, rot = { x = 0.0, y = 264.1, z = 0.0 }, level = 1, route_id = 3007105, save_route = true },
	{ config_id = 882, gadget_id = 70900042, pos = { x = 2517.3, y = 210.9, z = 331.2 }, rot = { x = 0.0, y = 82.0, z = 300.5 }, level = 1 }
}

-- 区域
regions = {
	{ config_id = 232, shape = RegionShape.SPHERE, radius = 2, pos = { x = 2548.7, y = 219.0, z = 370.2 } },
	{ config_id = 233, shape = RegionShape.SPHERE, radius = 2, pos = { x = 2517.6, y = 211.8, z = 329.8 } },
	{ config_id = 234, shape = RegionShape.SPHERE, radius = 2, pos = { x = 2550.4, y = 211.9, z = 345.0 } },
	{ config_id = 235, shape = RegionShape.SPHERE, radius = 2, pos = { x = 2508.2, y = 210.0, z = 344.8 } }
}

-- 触发器
triggers = {
	{ name = "ENTER_REGION_232", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_232", action = "action_EVENT_ENTER_REGION_232", tlog_tag = "风龙_203_移动精灵8_开始" },
	{ name = "PLATFORM_REACH_POINT_233", event = EventType.EVENT_PLATFORM_REACH_POINT, source = "", condition = "condition_EVENT_PLATFORM_REACH_POINT_233", action = "action_EVENT_PLATFORM_REACH_POINT_233", tlog_tag = "风龙_203_移动精灵8_成功" },
	{ name = "ENTER_REGION_234", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_234", action = "action_EVENT_ENTER_REGION_234" },
	{ name = "ENTER_REGION_235", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_235", action = "action_EVENT_ENTER_REGION_235" }
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
		gadgets = { 881, 882 },
		regions = { 232, 233, 234, 235 },
		triggers = { "ENTER_REGION_232", "PLATFORM_REACH_POINT_233", "ENTER_REGION_234", "ENTER_REGION_235" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ENTER_REGION_232(context, evt)
	if evt.param1 ~= 232 then return false end
	
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
function action_EVENT_ENTER_REGION_232(context, evt)
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 881, 3007106) then
	  return -1
	end
	
	-- 将本组内变量名为 "spirit" 的变量设置为 1
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "spirit", 1) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_PLATFORM_REACH_POINT_233(context, evt)
	-- 判断是gadgetid 为 881的移动平台，是否到达了3007108 的路线中的 2 点
	
	if 881 ~= evt.param1 then
	  return false
	end
	
	if 3007108 ~= evt.param2 then
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
function action_EVENT_PLATFORM_REACH_POINT_233(context, evt)
	-- 创建id为880的gadget
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 880 }) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_234(context, evt)
	if evt.param1 ~= 234 then return false end
	
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
function action_EVENT_ENTER_REGION_234(context, evt)
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 881, 3007107) then
	  return -1
	end
	
	-- 将本组内变量名为 "spirit" 的变量设置为 2
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "spirit", 2) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_235(context, evt)
	if evt.param1 ~= 235 then return false end
	
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
function action_EVENT_ENTER_REGION_235(context, evt)
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 881, 3007108) then
	  return -1
	end
	
	-- 将本组内变量名为 "spirit" 的变量设置为 3
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "spirit", 3) then
	  return -1
	end
	
	return 0
end
