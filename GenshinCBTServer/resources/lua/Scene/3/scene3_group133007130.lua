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
	{ config_id = 444, gadget_id = 70710002, pos = { x = 2626.3, y = 206.8, z = 346.1 }, rot = { x = 0.0, y = 166.1, z = 0.0 }, level = 1, route_id = 3007092, save_route = true },
	{ config_id = 605, gadget_id = 70900042, pos = { x = 2674.9, y = 206.8, z = 318.2 }, rot = { x = 0.0, y = 14.5, z = 0.0 }, level = 1 },
	{ config_id = 628, gadget_id = 70210031, pos = { x = 2677.2, y = 206.8, z = 318.8 }, rot = { x = 0.0, y = 319.5, z = 0.0 }, level = 1, chest_drop_id = 403225, showcutscene = true, isOneoff = true, persistent = true }
}

-- 区域
regions = {
	{ config_id = 71, shape = RegionShape.SPHERE, radius = 3, pos = { x = 2625.4, y = 207.3, z = 349.1 } },
	{ config_id = 122, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2658.1, y = 211.2, z = 342.2 } },
	{ config_id = 161, shape = RegionShape.SPHERE, radius = 3, pos = { x = 2676.0, y = 206.8, z = 318.6 } }
}

-- 触发器
triggers = {
	{ name = "ENTER_REGION_71", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_71", action = "action_EVENT_ENTER_REGION_71", tlog_tag = "风龙_130_移动精灵4_开始" },
	{ name = "ENTER_REGION_122", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_122", action = "action_EVENT_ENTER_REGION_122" },
	{ name = "PLATFORM_REACH_POINT_161", event = EventType.EVENT_PLATFORM_REACH_POINT, source = "", condition = "condition_EVENT_PLATFORM_REACH_POINT_161", action = "action_EVENT_PLATFORM_REACH_POINT_161", tlog_tag = "风龙_130_移动精灵4_成功" }
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
		gadgets = { 444, 605 },
		regions = { 71, 122, 161 },
		triggers = { "ENTER_REGION_71", "ENTER_REGION_122", "PLATFORM_REACH_POINT_161" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ENTER_REGION_71(context, evt)
	if evt.param1 ~= 71 then return false end
	
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
function action_EVENT_ENTER_REGION_71(context, evt)
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 444, 3007096) then
	  return -1
	end
	
	-- 将本组内变量名为 "spirit" 的变量设置为 1
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "spirit", 1) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_122(context, evt)
	if evt.param1 ~= 122 then return false end
	
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
function action_EVENT_ENTER_REGION_122(context, evt)
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 444, 3007085) then
	  return -1
	end
	
	-- 将本组内变量名为 "spirit" 的变量设置为 2
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "spirit", 2) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_PLATFORM_REACH_POINT_161(context, evt)
	-- 判断是gadgetid 为 444的移动平台，是否到达了3007085 的路线中的 2 点
	
	if 444 ~= evt.param1 then
	  return false
	end
	
	if 3007085 ~= evt.param2 then
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
function action_EVENT_PLATFORM_REACH_POINT_161(context, evt)
	-- 创建id为628的gadget
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 628 }) then
	  return -1
	end
	
	return 0
end
