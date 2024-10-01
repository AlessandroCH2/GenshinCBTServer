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
	{ config_id = 443, gadget_id = 70710002, pos = { x = 2831.1, y = 223.2, z = 290.1 }, rot = { x = 0.0, y = 108.6, z = 0.0 }, level = 1, route_id = 3007091, save_route = true },
	{ config_id = 604, gadget_id = 70900042, pos = { x = 2829.1, y = 207.5, z = 324.1 }, rot = { x = 0.0, y = 259.3, z = 0.0 }, level = 1 },
	{ config_id = 625, gadget_id = 70210031, pos = { x = 2828.9, y = 207.9, z = 326.3 }, rot = { x = 0.0, y = 115.8, z = 0.0 }, level = 1, chest_drop_id = 403225, showcutscene = true, isOneoff = true, persistent = true }
}

-- 区域
regions = {
	{ config_id = 70, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2830.9, y = 223.7, z = 290.0 } },
	{ config_id = 111, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2825.1, y = 209.6, z = 305.6 } },
	{ config_id = 160, shape = RegionShape.SPHERE, radius = 3, pos = { x = 2828.6, y = 208.3, z = 324.4 } }
}

-- 触发器
triggers = {
	{ name = "ENTER_REGION_70", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_70", action = "action_EVENT_ENTER_REGION_70", tlog_tag = "风龙_129_移动精灵3_开始" },
	{ name = "ENTER_REGION_111", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_111", action = "action_EVENT_ENTER_REGION_111" },
	{ name = "PLATFORM_REACH_POINT_160", event = EventType.EVENT_PLATFORM_REACH_POINT, source = "", condition = "condition_EVENT_PLATFORM_REACH_POINT_160", action = "action_EVENT_PLATFORM_REACH_POINT_160", tlog_tag = "风龙_129_移动精灵3_成功" }
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
		gadgets = { 443, 604 },
		regions = { 70, 111, 160 },
		triggers = { "ENTER_REGION_70", "ENTER_REGION_111", "PLATFORM_REACH_POINT_160" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ENTER_REGION_70(context, evt)
	if evt.param1 ~= 70 then return false end
	
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
function action_EVENT_ENTER_REGION_70(context, evt)
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 443, 3007095) then
	  return -1
	end
	
	-- 将本组内变量名为 "spirit" 的变量设置为 1
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "spirit", 1) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_111(context, evt)
	if evt.param1 ~= 111 then return false end
	
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
function action_EVENT_ENTER_REGION_111(context, evt)
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 443, 3007084) then
	  return -1
	end
	
	-- 将本组内变量名为 "spirit" 的变量设置为 2
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "spirit", 2) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_PLATFORM_REACH_POINT_160(context, evt)
	-- 判断是gadgetid 为 443的移动平台，是否到达了3007084 的路线中的 3 点
	
	if 443 ~= evt.param1 then
	  return false
	end
	
	if 3007084 ~= evt.param2 then
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
function action_EVENT_PLATFORM_REACH_POINT_160(context, evt)
	-- 创建id为625的gadget
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 625 }) then
	  return -1
	end
	
	return 0
end
