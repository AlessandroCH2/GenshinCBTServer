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
	{ config_id = 1439, gadget_id = 70710002, pos = { x = 1735.4, y = 235.5, z = -534.0 }, rot = { x = 0.0, y = 93.3, z = 0.0 }, level = 1, route_id = 128, save_route = true }
}

-- 区域
regions = {
	{ config_id = 161, shape = RegionShape.SPHERE, radius = 2.4, pos = { x = 1735.1, y = 234.3, z = -534.0 } },
	{ config_id = 162, shape = RegionShape.SPHERE, radius = 4, pos = { x = 1717.2, y = 217.9, z = -500.8 } },
	{ config_id = 163, shape = RegionShape.SPHERE, radius = 1.5, pos = { x = 1690.9, y = 205.6, z = -472.7 } }
}

-- 触发器
triggers = {
	{ name = "ENTER_REGION_161", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_161", action = "action_EVENT_ENTER_REGION_161", tlog_tag = "酒庄_161_酒庄精灵灯柱_触发" },
	{ name = "ENTER_REGION_162", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_162", action = "action_EVENT_ENTER_REGION_162" },
	{ name = "PLATFORM_REACH_POINT_163", event = EventType.EVENT_PLATFORM_REACH_POINT, source = "", condition = "condition_EVENT_PLATFORM_REACH_POINT_163", action = "action_EVENT_PLATFORM_REACH_POINT_163", tlog_tag = "酒庄_161_酒庄精灵灯柱_挑战成功" }
}

-- 变量
variables = {
	{ name = "door1", value = 0, persistent = false },
	{ name = "door2", value = 0, persistent = false },
	{ name = "door3", value = 0, persistent = false }
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
		gadgets = { 1439 },
		regions = { 161, 162, 163 },
		triggers = { "ENTER_REGION_161", "ENTER_REGION_162", "PLATFORM_REACH_POINT_163" },
		rand_weight = 100
	},
	{
		-- suite_id = 1,
		-- description = suite_2,
		monsters = { },
		gadgets = { },
		regions = { },
		triggers = { },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ENTER_REGION_161(context, evt)
	if evt.param1 ~= 161 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_161(context, evt)
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 1439, 129) then
	  return -1
	end
	
	-- 将本组内变量名为 "door1" 的变量设置为 1
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "door1", 1) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_162(context, evt)
	if evt.param1 ~= 162 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	-- 判断变量"door1"为1
	if ScriptLib.GetGroupVariableValue(context, "door1") ~= 1 then
			return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_162(context, evt)
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 1439, 130) then
	  return -1
	end
	
	-- 将本组内变量名为 "door2" 的变量设置为 1
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "door2", 1) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_PLATFORM_REACH_POINT_163(context, evt)
	-- 判断是gadgetid 为 1439的移动平台，是否到达了130 的路线中的 1 点
	
	if 1439 ~= evt.param1 then
	  return false
	end
	
	if 130 ~= evt.param2 then
	  return false
	end
	
	if 1 ~= evt.param3 then
	  return false
	end
	
	
	return true
end

-- 触发操作
function action_EVENT_PLATFORM_REACH_POINT_163(context, evt)
		-- 重新生成指定group，指定suite
		if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 133002162, suite = 2 }) then
			return -1
		end
	
	return 0
end
