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
	{ config_id = 370, gadget_id = 70500000, pos = { x = 2277.6, y = 271.8, z = -239.1 }, rot = { x = 0.0, y = 151.3, z = 0.0 }, level = 1, point_type = 3007 },
	{ config_id = 371, gadget_id = 70500000, pos = { x = 2281.5, y = 271.9, z = -239.1 }, rot = { x = 0.0, y = 287.0, z = 0.0 }, level = 1, point_type = 3007 },
	{ config_id = 372, gadget_id = 70500000, pos = { x = 2279.4, y = 271.9, z = -240.9 }, rot = { x = 0.0, y = 87.6, z = 0.0 }, level = 1, point_type = 3007 },
	{ config_id = 373, gadget_id = 70500000, pos = { x = 2279.5, y = 272.0, z = -237.1 }, rot = { x = 0.0, y = 257.1, z = 0.0 }, level = 1, point_type = 3007 },
	{ config_id = 374, gadget_id = 70210031, pos = { x = 2279.5, y = 271.9, z = -239.1 }, rot = { x = 0.0, y = 181.1, z = 0.0 }, level = 1, chest_drop_id = 403343, isOneoff = true }
}

-- 区域
regions = {
	{ config_id = 123, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2276.5, y = 272.0, z = -239.0 } },
	{ config_id = 124, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2279.4, y = 272.2, z = -236.2 } },
	{ config_id = 125, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2282.5, y = 271.9, z = -239.3 } },
	{ config_id = 126, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2279.4, y = 271.9, z = -242.1 } }
}

-- 触发器
triggers = {
	{ name = "GATHER_123", event = EventType.EVENT_GATHER, source = "370", condition = "condition_EVENT_GATHER_123", action = "action_EVENT_GATHER_123" },
	{ name = "GATHER_124", event = EventType.EVENT_GATHER, source = "373", condition = "condition_EVENT_GATHER_124", action = "action_EVENT_GATHER_124" },
	{ name = "GATHER_125", event = EventType.EVENT_GATHER, source = "371", condition = "condition_EVENT_GATHER_125", action = "action_EVENT_GATHER_125" },
	{ name = "GATHER_126", event = EventType.EVENT_GATHER, source = "372", condition = "condition_EVENT_GATHER_126", action = "action_EVENT_GATHER_126" }
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
		gadgets = { 370, 371, 372, 373 },
		regions = { 123, 124, 125, 126 },
		triggers = { "GATHER_123", "GATHER_124", "GATHER_125", "GATHER_126" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_GATHER_123(context, evt)
	-- 判断指定group组剩余gadget数量是否是0 
	if ScriptLib.CheckRemainGadgetCountByGroupId(context, {group_id = 133004097}) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GATHER_123(context, evt)
	-- 创建id为374的gadget
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 374 }) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_GATHER_124(context, evt)
	-- 判断指定group组剩余gadget数量是否是0 
	if ScriptLib.CheckRemainGadgetCountByGroupId(context, {group_id = 133004097}) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GATHER_124(context, evt)
	-- 创建id为374的gadget
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 374 }) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_GATHER_125(context, evt)
	-- 判断指定group组剩余gadget数量是否是0 
	if ScriptLib.CheckRemainGadgetCountByGroupId(context, {group_id = 133004097}) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GATHER_125(context, evt)
	-- 创建id为374的gadget
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 374 }) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_GATHER_126(context, evt)
	-- 判断指定group组剩余gadget数量是否是0 
	if ScriptLib.CheckRemainGadgetCountByGroupId(context, {group_id = 133004097}) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GATHER_126(context, evt)
	-- 创建id为374的gadget
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 374 }) then
	  return -1
	end
	
	return 0
end
