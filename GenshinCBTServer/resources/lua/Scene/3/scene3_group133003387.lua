--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 1330, monster_id = 28020201, pos = { x = 2641.2, y = 248.9, z = -1227.1 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 1331, monster_id = 28020201, pos = { x = 2642.8, y = 248.8, z = -1226.5 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 3807, gadget_id = 70500000, pos = { x = 2706.3, y = 248.9, z = -1227.0 }, rot = { x = 0.0, y = 191.4, z = 0.0 }, level = 1, point_type = 3007 },
	{ config_id = 3808, gadget_id = 70500000, pos = { x = 2710.1, y = 249.2, z = -1227.2 }, rot = { x = 0.0, y = 45.5, z = 0.0 }, level = 1, point_type = 3007 },
	{ config_id = 3809, gadget_id = 70500000, pos = { x = 2708.5, y = 249.2, z = -1229.2 }, rot = { x = 0.0, y = 112.6, z = 0.0 }, level = 1, point_type = 3007 },
	{ config_id = 3810, gadget_id = 70500000, pos = { x = 2708.4, y = 249.0, z = -1225.2 }, rot = { x = 0.0, y = 56.0, z = 0.0 }, level = 1, point_type = 3007 },
	{ config_id = 3811, gadget_id = 70210031, pos = { x = 2708.4, y = 249.1, z = -1227.1 }, rot = { x = 0.0, y = 343.6, z = 0.0 }, level = 1, chest_drop_id = 403323, isOneoff = true, type = GadgetType.GADGET_WORLD_CHECT },
	{ config_id = 3893, gadget_id = 70500000, pos = { x = 2641.6, y = 248.7, z = -1225.1 }, rot = { x = 0.0, y = 294.9, z = 0.0 }, level = 1, point_type = 2007 },
	{ config_id = 3894, gadget_id = 70500000, pos = { x = 2641.8, y = 248.8, z = -1226.3 }, rot = { x = 0.0, y = 17.2, z = 0.0 }, level = 1, point_type = 2007 },
	{ config_id = 3897, gadget_id = 70500000, pos = { x = 2652.3, y = 248.2, z = -1224.4 }, rot = { x = 0.0, y = 168.3, z = 0.0 }, level = 1, point_type = 2007 }
}

-- 区域
regions = {
	{ config_id = 472, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2710.7, y = 249.2, z = -1227.2 } },
	{ config_id = 473, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2708.7, y = 249.2, z = -1229.1 } },
	{ config_id = 474, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2706.3, y = 248.9, z = -1226.9 } },
	{ config_id = 475, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2708.7, y = 249.0, z = -1224.7 } }
}

-- 触发器
triggers = {
	{ name = "GATHER_472", event = EventType.EVENT_GATHER, source = "", condition = "condition_EVENT_GATHER_472", action = "action_EVENT_GATHER_472" },
	{ name = "GATHER_473", event = EventType.EVENT_GATHER, source = "", condition = "condition_EVENT_GATHER_473", action = "action_EVENT_GATHER_473" },
	{ name = "GATHER_474", event = EventType.EVENT_GATHER, source = "", condition = "condition_EVENT_GATHER_474", action = "action_EVENT_GATHER_474" },
	{ name = "GATHER_475", event = EventType.EVENT_GATHER, source = "", condition = "condition_EVENT_GATHER_475", action = "action_EVENT_GATHER_475" }
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
		gadgets = { 3807, 3808, 3809, 3810 },
		regions = { 472, 473, 474, 475 },
		triggers = { "GATHER_472", "GATHER_473", "GATHER_474", "GATHER_475" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_GATHER_472(context, evt)
	-- 判断指定group组剩余gadget数量是否是0 
	if ScriptLib.CheckRemainGadgetCountByGroupId(context, {group_id = 133003387}) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GATHER_472(context, evt)
	-- 创建id为3811的gadget
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 3811 }) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_GATHER_473(context, evt)
	-- 判断指定group组剩余gadget数量是否是0 
	if ScriptLib.CheckRemainGadgetCountByGroupId(context, {group_id = 133003387}) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GATHER_473(context, evt)
	-- 创建id为3811的gadget
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 3811 }) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_GATHER_474(context, evt)
	-- 判断指定group组剩余gadget数量是否是0 
	if ScriptLib.CheckRemainGadgetCountByGroupId(context, {group_id = 133003387}) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GATHER_474(context, evt)
	-- 创建id为3811的gadget
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 3811 }) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_GATHER_475(context, evt)
	-- 判断指定group组剩余gadget数量是否是0 
	if ScriptLib.CheckRemainGadgetCountByGroupId(context, {group_id = 133003387}) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GATHER_475(context, evt)
	-- 创建id为3811的gadget
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 3811 }) then
	  return -1
	end
	
	return 0
end
