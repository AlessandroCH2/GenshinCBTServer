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
	{ config_id = 1139, gadget_id = 70900042, pos = { x = 2674.4, y = 248.8, z = -288.4 }, rot = { x = 15.2, y = 345.2, z = 0.0 }, level = 1 },
	{ config_id = 1140, gadget_id = 70210031, pos = { x = 2675.9, y = 249.6, z = -289.9 }, rot = { x = 7.6, y = 67.7, z = 14.3 }, level = 1, chest_drop_id = 403343, isOneoff = true, type = GadgetType.GADGET_WORLD_CHECT },
	{ config_id = 1142, gadget_id = 70690001, pos = { x = 2691.2, y = 264.4, z = -312.7 }, rot = { x = 0.0, y = 188.1, z = 0.0 }, level = 1 },
	{ config_id = 1143, gadget_id = 70710002, pos = { x = 2690.1, y = 265.5, z = -346.8 }, rot = { x = 0.0, y = 329.6, z = 0.0 }, level = 1, route_id = 3004548, save_route = true }
}

-- 区域
regions = {
	{ config_id = 220, shape = RegionShape.SPHERE, radius = 3, pos = { x = 2690.0, y = 265.5, z = -346.1 } },
	{ config_id = 221, shape = RegionShape.SPHERE, radius = 3, pos = { x = 2690.3, y = 262.3, z = -323.0 } },
	{ config_id = 222, shape = RegionShape.SPHERE, radius = 3, pos = { x = 2699.4, y = 260.7, z = -277.6 } },
	{ config_id = 223, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2674.3, y = 250.8, z = -288.2 } }
}

-- 触发器
triggers = {
	{ name = "ENTER_REGION_220", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_220", action = "action_EVENT_ENTER_REGION_220", tlog_tag = "奔狼岭_196_移动精灵_开始" },
	{ name = "AVATAR_NEAR_PLATFORM_221", event = EventType.EVENT_AVATAR_NEAR_PLATFORM, source = "1143", condition = "condition_EVENT_AVATAR_NEAR_PLATFORM_221", action = "action_EVENT_AVATAR_NEAR_PLATFORM_221" },
	{ name = "AVATAR_NEAR_PLATFORM_222", event = EventType.EVENT_AVATAR_NEAR_PLATFORM, source = "1143", condition = "condition_EVENT_AVATAR_NEAR_PLATFORM_222", action = "action_EVENT_AVATAR_NEAR_PLATFORM_222" },
	{ name = "PLATFORM_REACH_POINT_223", event = EventType.EVENT_PLATFORM_REACH_POINT, source = "1143", condition = "condition_EVENT_PLATFORM_REACH_POINT_223", action = "action_EVENT_PLATFORM_REACH_POINT_223", tlog_tag = "奔狼岭_196_移动精灵_结算" }
}

-- 变量
variables = {
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
		gadgets = { 1139, 1142, 1143 },
		regions = { 220, 221, 222, 223 },
		triggers = { "ENTER_REGION_220", "AVATAR_NEAR_PLATFORM_221", "AVATAR_NEAR_PLATFORM_222", "PLATFORM_REACH_POINT_223" },
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
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_220(context, evt)
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 1143, 3004551) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_AVATAR_NEAR_PLATFORM_221(context, evt)
	-- 判断是gadgetid 为 1143的移动平台，是否到达了3004551 的路线中的 1 点
	
	if 1143 ~= evt.param1 then
	  return false
	end
	
	if 3004551 ~= evt.param2 then
	  return false
	end
	
	if 1 ~= evt.param3 then
	  return false
	end
	
	
	return true
end

-- 触发操作
function action_EVENT_AVATAR_NEAR_PLATFORM_221(context, evt)
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 1143, 3004552) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_AVATAR_NEAR_PLATFORM_222(context, evt)
	-- 判断是gadgetid 为 1143的移动平台，是否到达了3004552 的路线中的 1 点
	
	if 1143 ~= evt.param1 then
	  return false
	end
	
	if 3004552 ~= evt.param2 then
	  return false
	end
	
	if 1 ~= evt.param3 then
	  return false
	end
	
	
	return true
end

-- 触发操作
function action_EVENT_AVATAR_NEAR_PLATFORM_222(context, evt)
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 1143, 3004553) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_PLATFORM_REACH_POINT_223(context, evt)
	-- 判断是gadgetid 为 1143的移动平台，是否到达了3004553 的路线中的 1 点
	
	if 1143 ~= evt.param1 then
	  return false
	end
	
	if 3004553 ~= evt.param2 then
	  return false
	end
	
	if 1 ~= evt.param3 then
	  return false
	end
	
	
	return true
end

-- 触发操作
function action_EVENT_PLATFORM_REACH_POINT_223(context, evt)
	-- 创建id为1140的gadget
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 1140 }) then
	  return -1
	end
	
	return 0
end
