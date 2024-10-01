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
	{ config_id = 879, gadget_id = 70500000, pos = { x = 1682.4, y = 203.3, z = -280.8 }, rot = { x = 0.0, y = 162.1, z = 0.0 }, level = 1, point_type = 4001001, isOneoff = true },
	{ config_id = 882, gadget_id = 70500000, pos = { x = 1296.7, y = 387.7, z = -655.7 }, rot = { x = 0.0, y = 163.3, z = 0.0 }, level = 1, point_type = 4001001, isOneoff = true },
	{ config_id = 884, gadget_id = 70500000, pos = { x = 1985.6, y = 256.1, z = -547.3 }, rot = { x = 0.0, y = 260.5, z = 0.0 }, level = 1, point_type = 4001001, isOneoff = true },
	{ config_id = 2040, gadget_id = 70500000, pos = { x = 2091.2, y = 253.0, z = -460.1 }, rot = { x = 0.0, y = 162.1, z = 0.0 }, level = 1, point_type = 4001001, isOneoff = true },
	{ config_id = 2077, gadget_id = 70500000, pos = { x = 2086.1, y = 205.8, z = -746.0 }, rot = { x = 0.0, y = 162.1, z = 0.0 }, level = 1, point_type = 4001001, isOneoff = true }
}

-- 区域
regions = {
	{ config_id = 13, shape = RegionShape.SPHERE, radius = 10, pos = { x = 1696.4, y = 201.0, z = -207.8 } },
	{ config_id = 14, shape = RegionShape.SPHERE, radius = 10, pos = { x = 1456.7, y = 202.1, z = -509.2 } },
	{ config_id = 15, shape = RegionShape.SPHERE, radius = 10, pos = { x = 1444.8, y = 265.3, z = -671.0 } },
	{ config_id = 16, shape = RegionShape.SPHERE, radius = 10, pos = { x = 1296.9, y = 388.1, z = -656.1 } },
	{ config_id = 17, shape = RegionShape.SPHERE, radius = 10, pos = { x = 1148.6, y = 359.3, z = -853.8 } },
	{ config_id = 19, shape = RegionShape.SPHERE, radius = 10, pos = { x = 1461.5, y = 283.5, z = -864.9 } }
}

-- 触发器
triggers = {
	{ name = "ENTER_REGION_13", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_13", action = "action_EVENT_ENTER_REGION_13" },
	{ name = "ENTER_REGION_14", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_14", action = "action_EVENT_ENTER_REGION_14" },
	{ name = "ENTER_REGION_15", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_15", action = "action_EVENT_ENTER_REGION_15" },
	{ name = "ENTER_REGION_16", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_16", action = "action_EVENT_ENTER_REGION_16" },
	{ name = "ENTER_REGION_17", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_17", action = "action_EVENT_ENTER_REGION_17" },
	{ name = "ENTER_REGION_19", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_19", action = "action_EVENT_ENTER_REGION_19" }
}

-- 变量
variables = {
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
		gadgets = { 879, 882, 884, 2040, 2077 },
		regions = { 13, 14, 15, 16, 17, 19 },
		triggers = { "ENTER_REGION_13", "ENTER_REGION_14", "ENTER_REGION_15", "ENTER_REGION_16", "ENTER_REGION_17", "ENTER_REGION_19" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ENTER_REGION_13(context, evt)
	if evt.param1 ~= 13 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_13(context, evt)
	-- 触发镜头注目，注目位置为坐标（1696，201，-4303），持续时间为2秒，并且为强制注目形式，不广播其他玩家
		local pos = {x=1696, y=201, z=-4303}
	    if 0 ~= ScriptLib.BeginCameraSceneLook(context, { look_pos = pos, duration = 2, is_force = true, is_broadcast = false }) then
					return -1
				end 
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_14(context, evt)
	if evt.param1 ~= 14 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_14(context, evt)
	-- 触发镜头注目，注目位置为坐标（1456，202，-4605），持续时间为2秒，并且为强制注目形式，不广播其他玩家
		local pos = {x=1456, y=202, z=-4605}
	    if 0 ~= ScriptLib.BeginCameraSceneLook(context, { look_pos = pos, duration = 2, is_force = true, is_broadcast = false }) then
					return -1
				end 
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_15(context, evt)
	if evt.param1 ~= 15 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_15(context, evt)
	-- 触发镜头注目，注目位置为坐标（1444，265，-4767），持续时间为2秒，并且为强制注目形式，不广播其他玩家
		local pos = {x=1444, y=265, z=-4767}
	    if 0 ~= ScriptLib.BeginCameraSceneLook(context, { look_pos = pos, duration = 2, is_force = true, is_broadcast = false }) then
					return -1
				end 
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_16(context, evt)
	if evt.param1 ~= 16 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_16(context, evt)
	-- 触发镜头注目，注目位置为坐标（1296，388，-4752），持续时间为2秒，并且为强制注目形式，不广播其他玩家
		local pos = {x=1296, y=388, z=-4752}
	    if 0 ~= ScriptLib.BeginCameraSceneLook(context, { look_pos = pos, duration = 2, is_force = true, is_broadcast = false }) then
					return -1
				end 
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_17(context, evt)
	if evt.param1 ~= 17 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_17(context, evt)
	-- 触发镜头注目，注目位置为坐标（1148，359，-4949），持续时间为2秒，并且为强制注目形式，不广播其他玩家
		local pos = {x=1148, y=359, z=-4949}
	    if 0 ~= ScriptLib.BeginCameraSceneLook(context, { look_pos = pos, duration = 2, is_force = true, is_broadcast = false }) then
					return -1
				end 
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_19(context, evt)
	if evt.param1 ~= 19 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_19(context, evt)
	-- 触发镜头注目，注目位置为坐标（1461，283，-4960），持续时间为2秒，并且为强制注目形式，不广播其他玩家
		local pos = {x=1461, y=283, z=-4960}
	    if 0 ~= ScriptLib.BeginCameraSceneLook(context, { look_pos = pos, duration = 2, is_force = true, is_broadcast = false }) then
					return -1
				end 
	
	return 0
end
