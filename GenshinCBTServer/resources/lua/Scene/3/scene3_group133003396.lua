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
	{ config_id = 3884, gadget_id = 70900042, pos = { x = 2673.5, y = 234.1, z = -1112.4 }, rot = { x = 344.8, y = 206.2, z = 2.0 }, level = 1 },
	{ config_id = 3885, gadget_id = 70710002, pos = { x = 2659.3, y = 233.4, z = -1083.6 }, rot = { x = 0.0, y = 189.1, z = 0.0 }, level = 1, route_id = 3003217, save_route = true },
	{ config_id = 3886, gadget_id = 70210031, pos = { x = 2675.5, y = 234.6, z = -1112.5 }, rot = { x = 346.5, y = 349.4, z = 3.6 }, level = 1, chest_drop_id = 403343, isOneoff = true, type = GadgetType.GADGET_WORLD_CHECT }
}

-- 区域
regions = {
	{ config_id = 483, shape = RegionShape.SPHERE, radius = 3, pos = { x = 2660.3, y = 233.6, z = -1082.4 } },
	{ config_id = 484, shape = RegionShape.SPHERE, radius = 2, pos = { x = 2673.7, y = 235.6, z = -1112.0 } }
}

-- 触发器
triggers = {
	{ name = "ENTER_REGION_483", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_483", action = "action_EVENT_ENTER_REGION_483" },
	{ name = "PLATFORM_REACH_POINT_484", event = EventType.EVENT_PLATFORM_REACH_POINT, source = "3885", condition = "condition_EVENT_PLATFORM_REACH_POINT_484", action = "action_EVENT_PLATFORM_REACH_POINT_484" }
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
		gadgets = { 3884, 3885 },
		regions = { 483, 484 },
		triggers = { "ENTER_REGION_483", "PLATFORM_REACH_POINT_484" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ENTER_REGION_483(context, evt)
	if evt.param1 ~= 483 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_483(context, evt)
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 3885, 3003218) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_PLATFORM_REACH_POINT_484(context, evt)
	-- 判断是gadgetid 为 3885的移动平台，是否到达了3003218 的路线中的 3 点
	
	if 3885 ~= evt.param1 then
	  return false
	end
	
	if 3003218 ~= evt.param2 then
	  return false
	end
	
	if 3 ~= evt.param3 then
	  return false
	end
	
	
	return true
end

-- 触发操作
function action_EVENT_PLATFORM_REACH_POINT_484(context, evt)
	-- 创建id为3886的gadget
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 3886 }) then
	  return -1
	end
	
	return 0
end
