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
	{ config_id = 445, gadget_id = 70710002, pos = { x = 2508.7, y = 206.4, z = 236.7 }, rot = { x = 0.0, y = 47.8, z = 0.0 }, level = 1, route_id = 3007093, save_route = true },
	{ config_id = 609, gadget_id = 70900042, pos = { x = 2471.5, y = 209.5, z = 312.4 }, rot = { x = 0.0, y = 85.1, z = 0.0 }, level = 1 },
	{ config_id = 627, gadget_id = 70210031, pos = { x = 2475.3, y = 211.4, z = 317.5 }, rot = { x = 0.0, y = 186.8, z = 0.0 }, level = 1, chest_drop_id = 403225, showcutscene = true, isOneoff = true, persistent = true }
}

-- 区域
regions = {
	{ config_id = 72, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2508.9, y = 206.5, z = 236.2 } },
	{ config_id = 121, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2501.9, y = 207.1, z = 295.2 } },
	{ config_id = 162, shape = RegionShape.SPHERE, radius = 3, pos = { x = 2471.7, y = 211.6, z = 312.3 } }
}

-- 触发器
triggers = {
	{ name = "ENTER_REGION_72", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_72", action = "action_EVENT_ENTER_REGION_72", tlog_tag = "风龙_131_移动精灵5_开始" },
	{ name = "ENTER_REGION_121", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_121", action = "action_EVENT_ENTER_REGION_121" },
	{ name = "PLATFORM_REACH_POINT_162", event = EventType.EVENT_PLATFORM_REACH_POINT, source = "", condition = "condition_EVENT_PLATFORM_REACH_POINT_162", action = "action_EVENT_PLATFORM_REACH_POINT_162", tlog_tag = "风龙_131_移动精灵5_成功" }
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
		gadgets = { 445, 609 },
		regions = { 72, 121, 162 },
		triggers = { "ENTER_REGION_72", "ENTER_REGION_121", "PLATFORM_REACH_POINT_162" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ENTER_REGION_72(context, evt)
	if evt.param1 ~= 72 then return false end
	
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
function action_EVENT_ENTER_REGION_72(context, evt)
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 445, 3007097) then
	  return -1
	end
	
	-- 将本组内变量名为 "spirit" 的变量设置为 1
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "spirit", 1) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_121(context, evt)
	if evt.param1 ~= 121 then return false end
	
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
function action_EVENT_ENTER_REGION_121(context, evt)
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 445, 3007086) then
	  return -1
	end
	
	-- 将本组内变量名为 "spirit" 的变量设置为 2
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "spirit", 2) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_PLATFORM_REACH_POINT_162(context, evt)
	-- 判断是gadgetid 为 445的移动平台，是否到达了3007086 的路线中的 2 点
	
	if 445 ~= evt.param1 then
	  return false
	end
	
	if 3007086 ~= evt.param2 then
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
function action_EVENT_PLATFORM_REACH_POINT_162(context, evt)
	-- 创建id为627的gadget
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 627 }) then
	  return -1
	end
	
	return 0
end
