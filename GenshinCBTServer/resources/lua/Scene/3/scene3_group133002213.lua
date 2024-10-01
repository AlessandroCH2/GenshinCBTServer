--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 686, monster_id = 20011001, pos = { x = 2015.1, y = 257.8, z = -273.6 }, rot = { x = 0.0, y = 272.8, z = 0.0 }, level = 12, drop_id = 303043, disableWander = true },
	{ config_id = 687, monster_id = 20011001, pos = { x = 2013.5, y = 257.7, z = -273.5 }, rot = { x = 0.0, y = 107.8, z = 0.0 }, level = 12, drop_id = 303043, disableWander = true },
	{ config_id = 688, monster_id = 20011001, pos = { x = 2014.0, y = 257.4, z = -275.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 12, drop_id = 303043, disableWander = true },
	{ config_id = 689, monster_id = 20011101, pos = { x = 2020.5, y = 258.0, z = -293.0 }, rot = { x = 0.0, y = 41.2, z = 0.0 }, level = 12, drop_id = 303043, disableWander = true },
	{ config_id = 690, monster_id = 20011101, pos = { x = 2022.6, y = 258.2, z = -292.2 }, rot = { x = 0.0, y = 269.6, z = 0.0 }, level = 12, drop_id = 303043, disableWander = true }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 1732, gadget_id = 70710002, pos = { x = 1997.4, y = 259.9, z = -255.7 }, rot = { x = 0.0, y = 149.7, z = 0.0 }, level = 1, route_id = 3002157, save_route = true },
	{ config_id = 1733, gadget_id = 70900042, pos = { x = 2018.6, y = 259.4, z = -302.1 }, rot = { x = 0.0, y = 289.4, z = 346.5 }, level = 1 },
	{ config_id = 1734, gadget_id = 70210031, pos = { x = 2020.6, y = 260.0, z = -302.8 }, rot = { x = 352.9, y = 114.6, z = 357.1 }, level = 1, chest_drop_id = 403343 }
}

-- 区域
regions = {
	{ config_id = 228, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1998.7, y = 259.2, z = -256.2 } },
	{ config_id = 280, shape = RegionShape.SPHERE, radius = 3, pos = { x = 1998.9, y = 258.9, z = -255.7 } }
}

-- 触发器
triggers = {
	{ name = "PLATFORM_REACH_POINT_228", event = EventType.EVENT_PLATFORM_REACH_POINT, source = "1732", condition = "condition_EVENT_PLATFORM_REACH_POINT_228", action = "action_EVENT_PLATFORM_REACH_POINT_228", tlog_tag = "奔狼岭_213_移动精灵_开始" },
	{ name = "ENTER_REGION_280", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_280", action = "action_EVENT_ENTER_REGION_280" }
}

-- 变量
variables = {
	{ name = "num_1", value = 0, persistent = true }
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
		gadgets = { 1732, 1733 },
		regions = { 228, 280 },
		triggers = { "PLATFORM_REACH_POINT_228", "ENTER_REGION_280" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_PLATFORM_REACH_POINT_228(context, evt)
	-- 判断是gadgetid 为 1732的移动平台，是否到达了3002172 的路线中的 3 点
	
	if 1732 ~= evt.param1 then
	  return false
	end
	
	if 3002172 ~= evt.param2 then
	  return false
	end
	
	if 3 ~= evt.param3 then
	  return false
	end
	
	
	return true
end

-- 触发操作
function action_EVENT_PLATFORM_REACH_POINT_228(context, evt)
	-- 创建id为1734的gadget
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 1734 }) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_280(context, evt)
	if evt.param1 ~= 280 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_280(context, evt)
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 1732, 3002172) then
	  return -1
	end
	
	return 0
end
