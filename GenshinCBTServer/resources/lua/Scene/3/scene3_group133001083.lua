--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 576, monster_id = 20011201, pos = { x = 2012.1, y = 221.1, z = -1558.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 5, drop_id = 303041 },
	{ config_id = 577, monster_id = 20011201, pos = { x = 2009.8, y = 221.4, z = -1558.9 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 5, drop_id = 303041 },
	{ config_id = 578, monster_id = 20011301, pos = { x = 2011.7, y = 221.4, z = -1560.5 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 5, drop_id = 303041 },
	{ config_id = 579, monster_id = 20011001, pos = { x = 2033.5, y = 222.6, z = -1564.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 5, drop_id = 303041 },
	{ config_id = 580, monster_id = 20011001, pos = { x = 2029.1, y = 221.5, z = -1563.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 5, drop_id = 303041 },
	{ config_id = 581, monster_id = 20011101, pos = { x = 2026.3, y = 221.3, z = -1559.9 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 5, drop_id = 303041 },
	{ config_id = 582, monster_id = 20011001, pos = { x = 2008.4, y = 220.7, z = -1547.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 5, drop_id = 303041 },
	{ config_id = 583, monster_id = 20011001, pos = { x = 2015.4, y = 221.3, z = -1538.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 5, drop_id = 303041 },
	{ config_id = 584, monster_id = 20010901, pos = { x = 2009.3, y = 220.8, z = -1543.2 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 5, drop_id = 303041 },
	{ config_id = 862, monster_id = 20011301, pos = { x = 1987.4, y = 221.1, z = -1581.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 5, drop_id = 303041 },
	{ config_id = 863, monster_id = 20010501, pos = { x = 1990.7, y = 220.8, z = -1583.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 5, drop_id = 303041 },
	{ config_id = 864, monster_id = 20010601, pos = { x = 1983.7, y = 220.8, z = -1582.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 5, drop_id = 303041 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 1642, gadget_id = 70710002, pos = { x = 1980.3, y = 222.5, z = -1553.8 }, rot = { x = 0.0, y = 244.8, z = 0.0 }, level = 1, route_id = 105, save_route = true },
	{ config_id = 1643, gadget_id = 70210031, pos = { x = 1986.8, y = 220.6, z = -1586.1 }, rot = { x = 0.0, y = 8.6, z = 0.0 }, level = 1, chest_drop_id = 403241, isOneoff = true, persistent = true },
	{ config_id = 2091, gadget_id = 70210011, pos = { x = 2027.7, y = 229.0, z = -1579.9 }, rot = { x = 0.0, y = 276.2, z = 0.0 }, level = 1, chest_drop_id = 403301, isOneoff = true, persistent = true },
	{ config_id = 2500, gadget_id = 70220021, pos = { x = 1986.3, y = 220.3, z = -1586.5 }, rot = { x = 0.0, y = 49.3, z = 0.0 }, level = 1 }
}

-- 区域
regions = {
	{ config_id = 59, shape = RegionShape.SPHERE, radius = 3.4, pos = { x = 1971.6, y = 221.9, z = -1561.9 } },
	{ config_id = 107, shape = RegionShape.SPHERE, radius = 4.1, pos = { x = 2000.8, y = 220.9, z = -1557.8 } },
	{ config_id = 110, shape = RegionShape.SPHERE, radius = 4.4, pos = { x = 2020.1, y = 221.4, z = -1560.6 } },
	{ config_id = 111, shape = RegionShape.SPHERE, radius = 4.7, pos = { x = 2029.7, y = 224.1, z = -1547.0 } },
	{ config_id = 112, shape = RegionShape.SPHERE, radius = 3.1, pos = { x = 2002.8, y = 221.8, z = -1531.9 } },
	{ config_id = 113, shape = RegionShape.SPHERE, radius = 7.1, pos = { x = 1986.4, y = 222.0, z = -1585.5 } },
	{ config_id = 278, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2007.6, y = 221.7, z = -1507.2 } },
	{ config_id = 382, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1997.6, y = 221.4, z = -1516.0 } },
	{ config_id = 384, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1986.1, y = 220.5, z = -1590.3 } },
	{ config_id = 421, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1988.5, y = 222.2, z = -1583.9 } }
}

-- 触发器
triggers = {
	{ name = "ENTER_REGION_59", event = EventType.EVENT_ENTER_REGION, source = "1", condition = "condition_EVENT_ENTER_REGION_59", action = "action_EVENT_ENTER_REGION_59" },
	{ name = "ENTER_REGION_107", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_107", action = "action_EVENT_ENTER_REGION_107", tlog_tag = "小平原_精灵草_遗迹_开始" },
	{ name = "ENTER_REGION_110", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_110", action = "action_EVENT_ENTER_REGION_110" },
	{ name = "ENTER_REGION_111", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_111", action = "action_EVENT_ENTER_REGION_111" },
	{ name = "ENTER_REGION_112", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_112", action = "action_EVENT_ENTER_REGION_112" },
	{ name = "ENTER_REGION_113", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_113", action = "action_EVENT_ENTER_REGION_113" },
	{ name = "CLIENT_EXECUTE_278", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_278", trigger_count = 0 },
	{ name = "ANY_GADGET_DIE_382", event = EventType.EVENT_ANY_GADGET_DIE, source = "", condition = "condition_EVENT_ANY_GADGET_DIE_382", action = "action_EVENT_ANY_GADGET_DIE_382" },
	{ name = "GADGET_STATE_CHANGE_384", event = EventType.EVENT_GADGET_STATE_CHANGE, source = "", condition = "condition_EVENT_GADGET_STATE_CHANGE_384", action = "", tlog_tag = "小平原_精灵草_遗迹_结束" },
	{ name = "ANY_GADGET_DIE_421", event = EventType.EVENT_ANY_GADGET_DIE, source = "", condition = "condition_EVENT_ANY_GADGET_DIE_421", action = "action_EVENT_ANY_GADGET_DIE_421" }
}

-- 变量
variables = {
	{ name = "route", value = 0, persistent = true }
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
		gadgets = { 1642 },
		regions = { 59, 107, 110, 111, 112, 113, 278, 384, 421 },
		triggers = { "ENTER_REGION_59", "ENTER_REGION_107", "ENTER_REGION_110", "ENTER_REGION_111", "ENTER_REGION_112", "ENTER_REGION_113", "CLIENT_EXECUTE_278", "GADGET_STATE_CHANGE_384", "ANY_GADGET_DIE_421" },
		rand_weight = 100
	},
	{
		-- suite_id = 1,
		-- description = suite_2,
		monsters = { },
		gadgets = { },
		regions = { 384, 421 },
		triggers = { "GADGET_STATE_CHANGE_384", "ANY_GADGET_DIE_421" },
		rand_weight = 0
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ENTER_REGION_59(context, evt)
	if evt.param1 ~= 59 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	-- 判断变量"route"为0
	if ScriptLib.GetGroupVariableValue(context, "route") ~= 0 then
			return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_59(context, evt)
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 1642, 110) then
	  return -1
	end
	
	-- 将本组内变量名为 "route" 的变量设置为 1
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "route", 1) then
	  return -1
	end
	
	-- 创建id为2500的gadget
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 2500 }) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_107(context, evt)
	if evt.param1 ~= 107 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	-- 判断变量"route"为1
	if ScriptLib.GetGroupVariableValue(context, "route") ~= 1 then
			return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_107(context, evt)
	-- 将本组内变量名为 "route" 的变量设置为 2
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "route", 2) then
	  return -1
	end
	
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 1642, 3001130) then
	  return -1
	end
	
	-- 延迟1.5秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 577, delay_time = 1.5 }) then
	  return -1
	end
	
	-- 延迟1.8秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 578, delay_time = 1.8 }) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_110(context, evt)
	if evt.param1 ~= 110 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	-- 判断变量"route"为2
	if ScriptLib.GetGroupVariableValue(context, "route") ~= 2 then
			return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_110(context, evt)
	-- 将本组内变量名为 "route" 的变量设置为 3
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "route", 3) then
	  return -1
	end
	
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 1642, 3001131) then
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
	
	-- 判断变量"route"为3
	if ScriptLib.GetGroupVariableValue(context, "route") ~= 3 then
			return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_111(context, evt)
	-- 将本组内变量名为 "route" 的变量设置为 4
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "route", 4) then
	  return -1
	end
	
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 1642, 3001132) then
	  return -1
	end
	
	-- 延迟3秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 584, delay_time = 3 }) then
	  return -1
	end
	
	-- 延迟2.5秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 583, delay_time = 2.5 }) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_112(context, evt)
	if evt.param1 ~= 112 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	-- 判断变量"route"为4
	if ScriptLib.GetGroupVariableValue(context, "route") ~= 4 then
			return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_112(context, evt)
	-- 将本组内变量名为 "route" 的变量设置为 5
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "route", 5) then
	  return -1
	end
	
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 1642, 3001133) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_113(context, evt)
	if evt.param1 ~= 113 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	-- 判断变量"route"为5
	if ScriptLib.GetGroupVariableValue(context, "route") ~= 5 then
			return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_113(context, evt)
	-- 延迟0.5秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 864, delay_time = 0.5 }) then
	  return -1
	end
	
	-- 延迟0.5秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 862, delay_time = 0.5 }) then
	  return -1
	end
	
	-- 将本组内变量名为 "route" 的变量设置为 -1
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "route", -1) then
	  return -1
	end
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_278(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end

-- 触发条件
function condition_EVENT_ANY_GADGET_DIE_382(context, evt)
	if 2500 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_GADGET_DIE_382(context, evt)
		-- 重新生成指定group，指定suite
		if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 133001083, suite = 2 }) then
			return -1
		end
	
	return 0
end

-- 触发条件
function condition_EVENT_GADGET_STATE_CHANGE_384(context, evt)
	if 1643 ~= evt.param1 then
		return false
	end
	
	if 1643 ~= evt.param2 or GadgetState.ChestOpened ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作

-- 触发条件
function condition_EVENT_ANY_GADGET_DIE_421(context, evt)
	if 2500 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_GADGET_DIE_421(context, evt)
	-- 创建id为1643的gadget
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 1643 }) then
	  return -1
	end
	
	return 0
end
