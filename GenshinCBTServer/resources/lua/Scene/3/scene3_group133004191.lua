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
	{ config_id = 1125, gadget_id = 70900042, pos = { x = 2264.9, y = 202.2, z = -499.6 }, rot = { x = 343.2, y = 348.2, z = 15.7 }, level = 1 },
	{ config_id = 1135, gadget_id = 70710002, pos = { x = 2500.2, y = 212.6, z = -434.1 }, rot = { x = 0.0, y = 177.4, z = 0.0 }, level = 1, route_id = 3004544, save_route = true },
	{ config_id = 1136, gadget_id = 70210031, pos = { x = 2261.3, y = 202.6, z = -502.5 }, rot = { x = 0.0, y = 124.0, z = 0.0 }, level = 1, chest_drop_id = 403343, isOneoff = true, type = GadgetType.GADGET_WORLD_CHECT }
}

-- 区域
regions = {
	{ config_id = 212, shape = RegionShape.SPHERE, radius = 4, pos = { x = 2503.1, y = 211.6, z = -433.3 } },
	{ config_id = 213, shape = RegionShape.SPHERE, radius = 3, pos = { x = 2340.7, y = 216.2, z = -498.7 } },
	{ config_id = 214, shape = RegionShape.SPHERE, radius = 2, pos = { x = 2273.2, y = 206.5, z = -503.1 } },
	{ config_id = 215, shape = RegionShape.SPHERE, radius = 1, pos = { x = 2264.6, y = 203.7, z = -500.2 } },
	{ config_id = 263, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2461.3, y = 210.9, z = -428.3 } }
}

-- 触发器
triggers = {
	{ name = "ENTER_REGION_212", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_212", action = "action_EVENT_ENTER_REGION_212", tlog_tag = "奔狼岭_191_移动精灵_开始" },
	{ name = "AVATAR_NEAR_PLATFORM_213", event = EventType.EVENT_AVATAR_NEAR_PLATFORM, source = "", condition = "condition_EVENT_AVATAR_NEAR_PLATFORM_213", action = "action_EVENT_AVATAR_NEAR_PLATFORM_213" },
	{ name = "AVATAR_NEAR_PLATFORM_214", event = EventType.EVENT_AVATAR_NEAR_PLATFORM, source = "", condition = "condition_EVENT_AVATAR_NEAR_PLATFORM_214", action = "action_EVENT_AVATAR_NEAR_PLATFORM_214" },
	{ name = "PLATFORM_REACH_POINT_215", event = EventType.EVENT_PLATFORM_REACH_POINT, source = "1135", condition = "condition_EVENT_PLATFORM_REACH_POINT_215", action = "action_EVENT_PLATFORM_REACH_POINT_215", tlog_tag = "奔狼岭_191_移动精灵_结算" },
	{ name = "AVATAR_NEAR_PLATFORM_263", event = EventType.EVENT_AVATAR_NEAR_PLATFORM, source = "", condition = "condition_EVENT_AVATAR_NEAR_PLATFORM_263", action = "action_EVENT_AVATAR_NEAR_PLATFORM_263" }
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
		gadgets = { 1125, 1135 },
		regions = { 212, 213, 214, 215, 263 },
		triggers = { "ENTER_REGION_212", "AVATAR_NEAR_PLATFORM_213", "AVATAR_NEAR_PLATFORM_214", "PLATFORM_REACH_POINT_215", "AVATAR_NEAR_PLATFORM_263" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ENTER_REGION_212(context, evt)
	if evt.param1 ~= 212 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_212(context, evt)
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 1135, 3004563) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_AVATAR_NEAR_PLATFORM_213(context, evt)
	-- 判断是gadgetid 为 1135的移动平台，是否到达了3004545 的路线中的 4 点
	
	if 1135 ~= evt.param1 then
	  return false
	end
	
	if 3004545 ~= evt.param2 then
	  return false
	end
	
	if 4 ~= evt.param3 then
	  return false
	end
	
	
	return true
end

-- 触发操作
function action_EVENT_AVATAR_NEAR_PLATFORM_213(context, evt)
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 1135, 3004546) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_AVATAR_NEAR_PLATFORM_214(context, evt)
	-- 判断是gadgetid 为 1135的移动平台，是否到达了3004546 的路线中的 3 点
	
	if 1135 ~= evt.param1 then
	  return false
	end
	
	if 3004546 ~= evt.param2 then
	  return false
	end
	
	if 3 ~= evt.param3 then
	  return false
	end
	
	
	return true
end

-- 触发操作
function action_EVENT_AVATAR_NEAR_PLATFORM_214(context, evt)
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 1135, 3004547) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_PLATFORM_REACH_POINT_215(context, evt)
	-- 判断是gadgetid 为 1135的移动平台，是否到达了3004547 的路线中的 1 点
	
	if 1135 ~= evt.param1 then
	  return false
	end
	
	if 3004547 ~= evt.param2 then
	  return false
	end
	
	if 1 ~= evt.param3 then
	  return false
	end
	
	
	return true
end

-- 触发操作
function action_EVENT_PLATFORM_REACH_POINT_215(context, evt)
	-- 创建id为1136的gadget
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 1136 }) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_AVATAR_NEAR_PLATFORM_263(context, evt)
	-- 判断是gadgetid 为 1135的移动平台，是否到达了3004563 的路线中的 2 点
	
	if 1135 ~= evt.param1 then
	  return false
	end
	
	if 3004563 ~= evt.param2 then
	  return false
	end
	
	if 2 ~= evt.param3 then
	  return false
	end
	
	
	return true
end

-- 触发操作
function action_EVENT_AVATAR_NEAR_PLATFORM_263(context, evt)
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 1135, 3004545) then
	  return -1
	end
	
	return 0
end
