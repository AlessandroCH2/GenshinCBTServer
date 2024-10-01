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
	{ config_id = 1398, gadget_id = 70500000, pos = { x = 2656.4, y = 247.0, z = -441.2 }, rot = { x = 0.0, y = 134.6, z = 0.0 }, level = 1, point_type = 3007 },
	{ config_id = 1399, gadget_id = 70500000, pos = { x = 2656.5, y = 246.7, z = -442.9 }, rot = { x = 0.0, y = 101.0, z = 0.0 }, level = 1, point_type = 3007 },
	{ config_id = 1400, gadget_id = 70500000, pos = { x = 2659.7, y = 246.4, z = -442.6 }, rot = { x = 0.0, y = 154.9, z = 0.0 }, level = 1, point_type = 3007 },
	{ config_id = 1401, gadget_id = 70710003, pos = { x = 2658.0, y = 248.1, z = -441.8 }, rot = { x = 0.0, y = 121.3, z = 0.0 }, level = 1, route_id = 3004572, save_route = true },
	{ config_id = 1403, gadget_id = 70900042, pos = { x = 2717.5, y = 245.5, z = -421.8 }, rot = { x = 0.0, y = 56.4, z = 9.5 }, level = 1 },
	{ config_id = 1404, gadget_id = 70210003, pos = { x = 2720.4, y = 245.6, z = -420.4 }, rot = { x = 0.0, y = 241.6, z = 0.0 }, level = 1, chest_drop_id = 403343, isOneoff = true, type = GadgetType.GADGET_WORLD_CHECT },
	{ config_id = 1405, gadget_id = 70220008, pos = { x = 2717.4, y = 245.7, z = -421.6 }, rot = { x = 0.0, y = 202.9, z = 0.0 }, level = 1 }
}

-- 区域
regions = {
	{ config_id = 269, shape = RegionShape.SPHERE, radius = 3, pos = { x = 2658.0, y = 246.3, z = -441.7 } },
	{ config_id = 270, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2716.2, y = 243.7, z = -448.6 } },
	{ config_id = 271, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2717.5, y = 246.4, z = -422.1 } },
	{ config_id = 272, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2716.5, y = 245.5, z = -421.7 } }
}

-- 触发器
triggers = {
	{ name = "ENTER_REGION_269", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_269", action = "action_EVENT_ENTER_REGION_269", tlog_tag = "奔狼岭_245_移动精灵_开始" },
	{ name = "AVATAR_NEAR_PLATFORM_270", event = EventType.EVENT_AVATAR_NEAR_PLATFORM, source = "", condition = "condition_EVENT_AVATAR_NEAR_PLATFORM_270", action = "action_EVENT_AVATAR_NEAR_PLATFORM_270" },
	{ name = "ANY_GADGET_DIE_271", event = EventType.EVENT_ANY_GADGET_DIE, source = "", condition = "condition_EVENT_ANY_GADGET_DIE_271", action = "action_EVENT_ANY_GADGET_DIE_271" },
	{ name = "PLATFORM_REACH_POINT_272", event = EventType.EVENT_PLATFORM_REACH_POINT, source = "1401", condition = "condition_EVENT_PLATFORM_REACH_POINT_272", action = "action_EVENT_PLATFORM_REACH_POINT_272", tlog_tag = "奔狼岭_245_移动精灵_结算" }
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
		gadgets = { 1398, 1399, 1400, 1401, 1403 },
		regions = { 269, 270, 271, 272 },
		triggers = { "ENTER_REGION_269", "AVATAR_NEAR_PLATFORM_270", "ANY_GADGET_DIE_271", "PLATFORM_REACH_POINT_272" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ENTER_REGION_269(context, evt)
	if evt.param1 ~= 269 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_269(context, evt)
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 1401, 3004569) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_AVATAR_NEAR_PLATFORM_270(context, evt)
	-- 判断是gadgetid 为 1401的移动平台，是否到达了3004569 的路线中的 1 点
	
	if 1401 ~= evt.param1 then
	  return false
	end
	
	if 3004569 ~= evt.param2 then
	  return false
	end
	
	if 1 ~= evt.param3 then
	  return false
	end
	
	
	return true
end

-- 触发操作
function action_EVENT_AVATAR_NEAR_PLATFORM_270(context, evt)
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 1401, 3004570) then
	  return -1
	end
	
	-- 创建id为1405的gadget
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 1405 }) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_GADGET_DIE_271(context, evt)
	if 1405 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_GADGET_DIE_271(context, evt)
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 1401, 3004571) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_PLATFORM_REACH_POINT_272(context, evt)
	-- 判断是gadgetid 为 1401的移动平台，是否到达了3004571 的路线中的 1 点
	
	if 1401 ~= evt.param1 then
	  return false
	end
	
	if 3004571 ~= evt.param2 then
	  return false
	end
	
	if 1 ~= evt.param3 then
	  return false
	end
	
	
	return true
end

-- 触发操作
function action_EVENT_PLATFORM_REACH_POINT_272(context, evt)
	-- 创建id为1404的gadget
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 1404 }) then
	  return -1
	end
	
	return 0
end
