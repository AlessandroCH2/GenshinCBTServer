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
	{ config_id = 591, gadget_id = 70210031, pos = { x = 2680.5, y = 238.2, z = 48.4 }, rot = { x = 350.9, y = 84.1, z = 0.0 }, level = 1, chest_drop_id = 403225, showcutscene = true, isOneoff = true, persistent = true },
	{ config_id = 661, gadget_id = 70710002, pos = { x = 2700.5, y = 240.7, z = 20.3 }, rot = { x = 0.0, y = 264.1, z = 0.0 }, level = 1, route_id = 3007098, save_route = true },
	{ config_id = 662, gadget_id = 70900042, pos = { x = 2680.4, y = 238.2, z = 46.2 }, rot = { x = 0.0, y = 82.0, z = 0.0 }, level = 1 }
}

-- 区域
regions = {
	{ config_id = 212, shape = RegionShape.SPHERE, radius = 2, pos = { x = 2700.4, y = 240.7, z = 20.3 } },
	{ config_id = 213, shape = RegionShape.SPHERE, radius = 3, pos = { x = 2680.7, y = 238.2, z = 47.3 } }
}

-- 触发器
triggers = {
	{ name = "ENTER_REGION_212", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_212", action = "action_EVENT_ENTER_REGION_212", tlog_tag = "风龙_187_移动精灵6_开始" },
	{ name = "PLATFORM_REACH_POINT_213", event = EventType.EVENT_PLATFORM_REACH_POINT, source = "", condition = "condition_EVENT_PLATFORM_REACH_POINT_213", action = "action_EVENT_PLATFORM_REACH_POINT_213", tlog_tag = "风龙_187_移动精灵6_成功" }
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
		gadgets = { 661, 662 },
		regions = { 212, 213 },
		triggers = { "ENTER_REGION_212", "PLATFORM_REACH_POINT_213" },
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
	
	-- 判断变量"spirit"为0
	if ScriptLib.GetGroupVariableValue(context, "spirit") ~= 0 then
			return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_212(context, evt)
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 661, 3007100) then
	  return -1
	end
	
	-- 将本组内变量名为 "spirit" 的变量设置为 1
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "spirit", 1) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_PLATFORM_REACH_POINT_213(context, evt)
	-- 判断是gadgetid 为 661的移动平台，是否到达了3007100 的路线中的 3 点
	
	if 661 ~= evt.param1 then
	  return false
	end
	
	if 3007100 ~= evt.param2 then
	  return false
	end
	
	if 3 ~= evt.param3 then
	  return false
	end
	
	
	-- 判断变量"spirit"为1
	if ScriptLib.GetGroupVariableValue(context, "spirit") ~= 1 then
			return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_PLATFORM_REACH_POINT_213(context, evt)
	-- 创建id为591的gadget
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 591 }) then
	  return -1
	end
	
	return 0
end
