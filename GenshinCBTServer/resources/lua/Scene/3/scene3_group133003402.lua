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
	{ config_id = 3924, gadget_id = 70900042, pos = { x = 2934.4, y = 223.7, z = -1736.0 }, rot = { x = 0.0, y = 267.1, z = 0.0 }, level = 1 },
	{ config_id = 3925, gadget_id = 70710002, pos = { x = 2898.7, y = 236.4, z = -1735.1 }, rot = { x = 0.0, y = 276.7, z = 0.0 }, level = 1, route_id = 3003219, save_route = true },
	{ config_id = 3926, gadget_id = 70210031, pos = { x = 2935.9, y = 223.9, z = -1738.7 }, rot = { x = 0.0, y = 285.3, z = 356.1 }, level = 1, chest_drop_id = 403223, isOneoff = true, type = GadgetType.GADGET_WORLD_CHECT }
}

-- 区域
regions = {
	{ config_id = 485, shape = RegionShape.SPHERE, radius = 1, pos = { x = 2934.4, y = 225.8, z = -1735.9 } },
	{ config_id = 486, shape = RegionShape.SPHERE, radius = 2, pos = { x = 2918.0, y = 226.8, z = -1716.0 } },
	{ config_id = 488, shape = RegionShape.SPHERE, radius = 2, pos = { x = 2899.1, y = 235.9, z = -1735.3 } }
}

-- 触发器
triggers = {
	{ name = "PLATFORM_REACH_POINT_485", event = EventType.EVENT_PLATFORM_REACH_POINT, source = "3925", condition = "condition_EVENT_PLATFORM_REACH_POINT_485", action = "action_EVENT_PLATFORM_REACH_POINT_485" },
	{ name = "ENTER_REGION_486", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_486", action = "action_EVENT_ENTER_REGION_486" },
	{ name = "ENTER_REGION_488", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_488", action = "action_EVENT_ENTER_REGION_488" }
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
		gadgets = { 3924, 3925 },
		regions = { 485, 486, 488 },
		triggers = { "PLATFORM_REACH_POINT_485", "ENTER_REGION_486", "ENTER_REGION_488" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_PLATFORM_REACH_POINT_485(context, evt)
	-- 判断是gadgetid 为 3925的移动平台，是否到达了3003222 的路线中的 2 点
	
	if 3925 ~= evt.param1 then
	  return false
	end
	
	if 3003222 ~= evt.param2 then
	  return false
	end
	
	if 2 ~= evt.param3 then
	  return false
	end
	
	
	return true
end

-- 触发操作
function action_EVENT_PLATFORM_REACH_POINT_485(context, evt)
	-- 创建id为3926的gadget
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 3926 }) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_486(context, evt)
	if evt.param1 ~= 486 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_486(context, evt)
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 3925, 3003222) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_488(context, evt)
	if evt.param1 ~= 488 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_488(context, evt)
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 3925, 3003221) then
	  return -1
	end
	
	return 0
end
