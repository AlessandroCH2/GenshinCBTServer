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
	{ config_id = 442, gadget_id = 70710002, pos = { x = 2854.2, y = 216.3, z = 153.1 }, rot = { x = 0.0, y = 276.1, z = 0.0 }, level = 1, route_id = 3007090, save_route = true },
	{ config_id = 603, gadget_id = 70900042, pos = { x = 2850.6, y = 208.9, z = 208.4 }, rot = { x = 0.0, y = 16.9, z = 0.0 }, level = 1 },
	{ config_id = 624, gadget_id = 70210031, pos = { x = 2848.3, y = 209.5, z = 206.6 }, rot = { x = 0.0, y = 132.5, z = 0.0 }, level = 1, chest_drop_id = 403225, showcutscene = true, isOneoff = true, persistent = true }
}

-- 区域
regions = {
	{ config_id = 68, shape = RegionShape.SPHERE, radius = 3, pos = { x = 2854.0, y = 218.2, z = 154.9 } },
	{ config_id = 69, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2857.8, y = 208.2, z = 174.7 } },
	{ config_id = 110, shape = RegionShape.SPHERE, radius = 3, pos = { x = 2850.8, y = 209.3, z = 207.9 } }
}

-- 触发器
triggers = {
	{ name = "ENTER_REGION_68", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_68", action = "action_EVENT_ENTER_REGION_68", tlog_tag = "风龙_128_移动精灵2_开始" },
	{ name = "ENTER_REGION_69", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_69", action = "action_EVENT_ENTER_REGION_69" },
	{ name = "PLATFORM_REACH_POINT_110", event = EventType.EVENT_PLATFORM_REACH_POINT, source = "", condition = "condition_EVENT_PLATFORM_REACH_POINT_110", action = "action_EVENT_PLATFORM_REACH_POINT_110", tlog_tag = "风龙_128_移动精灵2_成功" }
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
		gadgets = { 442, 603 },
		regions = { 68, 69, 110 },
		triggers = { "ENTER_REGION_68", "ENTER_REGION_69", "PLATFORM_REACH_POINT_110" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ENTER_REGION_68(context, evt)
	if evt.param1 ~= 68 then return false end
	
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
function action_EVENT_ENTER_REGION_68(context, evt)
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 442, 3007082) then
	  return -1
	end
	
	-- 将本组内变量名为 "spirit" 的变量设置为 1
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "spirit", 1) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_69(context, evt)
	if evt.param1 ~= 69 then return false end
	
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
function action_EVENT_ENTER_REGION_69(context, evt)
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 442, 3007083) then
	  return -1
	end
	
	-- 将本组内变量名为 "spirit" 的变量设置为 2
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "spirit", 2) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_PLATFORM_REACH_POINT_110(context, evt)
	-- 判断是gadgetid 为 442的移动平台，是否到达了3007083 的路线中的 2 点
	
	if 442 ~= evt.param1 then
	  return false
	end
	
	if 3007083 ~= evt.param2 then
	  return false
	end
	
	if 2 ~= evt.param3 then
	  return false
	end
	
	
	-- 判断变量"spirit"为2
	if ScriptLib.GetGroupVariableValue(context, "spirit") ~= 2 then
			return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_PLATFORM_REACH_POINT_110(context, evt)
	-- 创建id为624的gadget
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 624 }) then
	  return -1
	end
	
	return 0
end
