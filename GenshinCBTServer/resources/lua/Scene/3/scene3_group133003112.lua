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
	{ config_id = 2542, gadget_id = 70710002, pos = { x = 2171.6, y = 268.0, z = -1759.9 }, rot = { x = 0.0, y = 147.0, z = 0.0 }, level = 1, route_id = 104, save_route = true },
	{ config_id = 2543, gadget_id = 70710002, pos = { x = 2195.4, y = 274.4, z = -1678.2 }, rot = { x = 0.0, y = 209.3, z = 0.0 }, level = 1, route_id = 103, save_route = true },
	{ config_id = 2544, gadget_id = 70210031, pos = { x = 2179.8, y = 265.9, z = -1684.2 }, rot = { x = 0.0, y = 69.6, z = 0.0 }, level = 1, chest_drop_id = 403224, showcutscene = true, isOneoff = true }
}

-- 区域
regions = {
	{ config_id = 87, shape = RegionShape.SPHERE, radius = 1.4, pos = { x = 2171.5, y = 268.1, z = -1760.0 } },
	{ config_id = 88, shape = RegionShape.SPHERE, radius = 1.7, pos = { x = 2197.5, y = 269.7, z = -1740.0 } },
	{ config_id = 89, shape = RegionShape.SPHERE, radius = 3.4, pos = { x = 2195.7, y = 272.9, z = -1677.9 } }
}

-- 触发器
triggers = {
	{ name = "ENTER_REGION_87", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_87", action = "action_EVENT_ENTER_REGION_87", tlog_tag = "神殿_精灵草_日晷_开始" },
	{ name = "ENTER_REGION_88", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_88", action = "action_EVENT_ENTER_REGION_88" },
	{ name = "ENTER_REGION_89", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_89", action = "action_EVENT_ENTER_REGION_89", tlog_tag = "神殿_精灵草_日晷_完成" }
}

-- 变量
variables = {
	{ name = "elv1", value = 0, persistent = true },
	{ name = "elv2", value = 0, persistent = true },
	{ name = "elv3", value = 0, persistent = true }
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
		gadgets = { 2542 },
		regions = { 87, 88 },
		triggers = { "ENTER_REGION_87", "ENTER_REGION_88" },
		rand_weight = 100
	},
	{
		-- suite_id = 1,
		-- description = suite_2,
		monsters = { },
		gadgets = { 2543 },
		regions = { 89 },
		triggers = { "ENTER_REGION_89" },
		rand_weight = 100
	},
	{
		-- suite_id = 2,
		-- description = suite_3,
		monsters = { },
		gadgets = { 2544 },
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
function condition_EVENT_ENTER_REGION_87(context, evt)
	if evt.param1 ~= 87 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	-- 判断变量"elv1"为0
	if ScriptLib.GetGroupVariableValue(context, "elv1") ~= 0 then
			return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_87(context, evt)
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 2542, 98) then
	  return -1
	end
	
	-- 将本组内变量名为 "elv1" 的变量设置为 1
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "elv1", 1) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_88(context, evt)
	if evt.param1 ~= 88 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	-- 判断变量"elv1"为1
	if ScriptLib.GetGroupVariableValue(context, "elv1") ~= 1 then
			return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_88(context, evt)
	-- 触发镜头注目，注目位置为坐标（2198，271，-1717），持续时间为2秒，并且为强制注目形式，不广播其他玩家
		local pos = {x=2198, y=271, z=-1717}
	    if 0 ~= ScriptLib.BeginCameraSceneLook(context, { look_pos = pos, duration = 2, is_force = true, is_broadcast = false }) then
					return -1
				end 
	
	-- 将本组内变量名为 "elv2" 的变量设置为 1
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "elv2", 1) then
	  return -1
	end
	
		-- 重新生成指定group，指定suite
		if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 133003112, suite = 2 }) then
			return -1
		end
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_89(context, evt)
	if evt.param1 ~= 89 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_89(context, evt)
		-- 重新生成指定group，指定suite
		if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 133003112, suite = 3 }) then
			return -1
		end
	
	return 0
end
