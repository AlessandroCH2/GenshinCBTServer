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
	{ config_id = 440, gadget_id = 70710002, pos = { x = 2749.0, y = 210.2, z = 47.4 }, rot = { x = 0.0, y = 41.2, z = 0.0 }, level = 1, route_id = 3007088, save_route = true },
	{ config_id = 601, gadget_id = 70900042, pos = { x = 2789.1, y = 206.4, z = 36.1 }, rot = { x = 0.0, y = 225.4, z = 292.3 }, level = 1 },
	{ config_id = 626, gadget_id = 70210031, pos = { x = 2790.1, y = 206.8, z = 37.2 }, rot = { x = 0.0, y = 152.8, z = 0.0 }, level = 1, chest_drop_id = 403225, showcutscene = true, isOneoff = true, persistent = true }
}

-- 区域
regions = {
	{ config_id = 64, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2748.8, y = 208.6, z = 48.0 } },
	{ config_id = 65, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2763.5, y = 208.3, z = 36.0 } },
	{ config_id = 159, shape = RegionShape.SPHERE, radius = 3, pos = { x = 2787.9, y = 208.1, z = 36.1 } }
}

-- 触发器
triggers = {
	{ name = "ENTER_REGION_64", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_64", action = "action_EVENT_ENTER_REGION_64", tlog_tag = "风龙_122_移动精灵1_开始" },
	{ name = "ENTER_REGION_65", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_65", action = "action_EVENT_ENTER_REGION_65" },
	{ name = "PLATFORM_REACH_POINT_159", event = EventType.EVENT_PLATFORM_REACH_POINT, source = "", condition = "condition_EVENT_PLATFORM_REACH_POINT_159", action = "action_EVENT_PLATFORM_REACH_POINT_159", tlog_tag = "风龙_174_移动精灵1_成功" }
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
		gadgets = { 440, 601 },
		regions = { 64, 65, 159 },
		triggers = { "ENTER_REGION_64", "ENTER_REGION_65", "PLATFORM_REACH_POINT_159" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ENTER_REGION_64(context, evt)
	if evt.param1 ~= 64 then return false end
	
	-- 判断变量"spirit"为0
	if ScriptLib.GetGroupVariableValue(context, "spirit") ~= 0 then
			return false
	end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_64(context, evt)
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 440, 3007094) then
	  return -1
	end
	
	-- 将本组内变量名为 "spirit" 的变量设置为 1
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "spirit", 1) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_65(context, evt)
	if evt.param1 ~= 65 then return false end
	
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
function action_EVENT_ENTER_REGION_65(context, evt)
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 440, 3007078) then
	  return -1
	end
	
	-- 将本组内变量名为 "spirit" 的变量设置为 2
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "spirit", 2) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_PLATFORM_REACH_POINT_159(context, evt)
	-- 判断是gadgetid 为 440的移动平台，是否到达了3007078 的路线中的 3 点
	
	if 440 ~= evt.param1 then
	  return false
	end
	
	if 3007078 ~= evt.param2 then
	  return false
	end
	
	if 3 ~= evt.param3 then
	  return false
	end
	
	
	-- 判断变量"spirit"为2
	if ScriptLib.GetGroupVariableValue(context, "spirit") ~= 2 then
			return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_PLATFORM_REACH_POINT_159(context, evt)
	-- 创建id为626的gadget
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 626 }) then
	  return -1
	end
	
	return 0
end
