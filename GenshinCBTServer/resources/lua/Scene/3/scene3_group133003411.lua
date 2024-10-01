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
	{ config_id = 3389, gadget_id = 70710002, pos = { x = 2701.9, y = 246.3, z = -1318.8 }, rot = { x = 0.0, y = 44.3, z = 0.0 }, level = 1, route_id = 3003198, save_route = true },
	{ config_id = 4002, gadget_id = 70900042, pos = { x = 2745.4, y = 257.4, z = -1308.7 }, rot = { x = 0.0, y = 254.1, z = 0.0 }, level = 1 },
	{ config_id = 4003, gadget_id = 70210031, pos = { x = 2747.6, y = 257.5, z = -1307.0 }, rot = { x = 0.0, y = 279.3, z = 0.0 }, level = 1, chest_drop_id = 403343, isOneoff = true, type = GadgetType.GADGET_WORLD_CHECT }
}

-- 区域
regions = {
	{ config_id = 184, shape = RegionShape.SPHERE, radius = 3, pos = { x = 2702.1, y = 245.6, z = -1318.7 } },
	{ config_id = 276, shape = RegionShape.SPHERE, radius = 3, pos = { x = 2721.9, y = 257.3, z = -1315.9 } },
	{ config_id = 498, shape = RegionShape.SPHERE, radius = 1, pos = { x = 2745.2, y = 259.0, z = -1308.6 } }
}

-- 触发器
triggers = {
	{ name = "ENTER_REGION_184", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_184", action = "action_EVENT_ENTER_REGION_184" },
	{ name = "ENTER_REGION_276", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_276", action = "action_EVENT_ENTER_REGION_276" },
	{ name = "PLATFORM_REACH_POINT_498", event = EventType.EVENT_PLATFORM_REACH_POINT, source = "3389", condition = "condition_EVENT_PLATFORM_REACH_POINT_498", action = "action_EVENT_PLATFORM_REACH_POINT_498" }
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
		gadgets = { 3389, 4002 },
		regions = { 184, 276, 498 },
		triggers = { "ENTER_REGION_184", "ENTER_REGION_276", "PLATFORM_REACH_POINT_498" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ENTER_REGION_184(context, evt)
	if evt.param1 ~= 184 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_184(context, evt)
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 3389, 3003174) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_276(context, evt)
	if evt.param1 ~= 276 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_276(context, evt)
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 3389, 3003204) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_PLATFORM_REACH_POINT_498(context, evt)
	-- 判断是gadgetid 为 3389的移动平台，是否到达了3003204 的路线中的 3 点
	
	if 3389 ~= evt.param1 then
	  return false
	end
	
	if 3003204 ~= evt.param2 then
	  return false
	end
	
	if 3 ~= evt.param3 then
	  return false
	end
	
	
	return true
end

-- 触发操作
function action_EVENT_PLATFORM_REACH_POINT_498(context, evt)
	-- 创建id为4003的gadget
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 4003 }) then
	  return -1
	end
	
	return 0
end
