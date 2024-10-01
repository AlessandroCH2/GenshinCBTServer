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
	{ config_id = 9, gadget_id = 70360002, pos = { x = 1393.3, y = 242.7, z = -5659.9 }, rot = { x = 0.0, y = 142.1, z = 0.0 }, level = 1 },
	{ config_id = 10, gadget_id = 70360002, pos = { x = 1361.3, y = 242.1, z = -5646.3 }, rot = { x = 0.0, y = 289.6, z = 0.0 }, level = 1 },
	{ config_id = 11, gadget_id = 70360002, pos = { x = 1378.4, y = 242.7, z = -5689.4 }, rot = { x = 0.0, y = 10.5, z = 0.0 }, level = 1 },
	{ config_id = 12, gadget_id = 70350003, pos = { x = 1377.6, y = 233.5, z = -5661.1 }, rot = { x = 0.0, y = 42.2, z = 0.0 }, level = 1 },
	{ config_id = 13, gadget_id = 70350003, pos = { x = 1377.3, y = 233.5, z = -5663.3 }, rot = { x = 0.0, y = 341.2, z = 0.0 }, level = 1 },
	{ config_id = 14, gadget_id = 70350003, pos = { x = 1375.9, y = 233.5, z = -5662.1 }, rot = { x = 355.7, y = 97.9, z = 359.7 }, level = 1 },
	{ config_id = 15, gadget_id = 70900202, pos = { x = 1373.3, y = 235.5, z = -5667.8 }, rot = { x = 0.0, y = 19.7, z = 0.0 }, level = 1 }
}

-- 区域
regions = {
	{ config_id = 6, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1394.1, y = 236.4, z = -5658.9 } },
	{ config_id = 7, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1361.9, y = 235.5, z = -5645.7 } },
	{ config_id = 8, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1378.3, y = 236.0, z = -5687.5 } },
	{ config_id = 9, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1392.2, y = 235.5, z = -5657.0 } },
	{ config_id = 10, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1377.2, y = 235.5, z = -5684.3 } },
	{ config_id = 11, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1366.6, y = 235.5, z = -5644.4 } }
}

-- 触发器
triggers = {
	{ name = "GADGET_CREATE_6", event = EventType.EVENT_GADGET_CREATE, source = "", condition = "condition_EVENT_GADGET_CREATE_6", action = "action_EVENT_GADGET_CREATE_6" },
	{ name = "GADGET_CREATE_7", event = EventType.EVENT_GADGET_CREATE, source = "", condition = "condition_EVENT_GADGET_CREATE_7", action = "action_EVENT_GADGET_CREATE_7" },
	{ name = "GADGET_CREATE_8", event = EventType.EVENT_GADGET_CREATE, source = "", condition = "condition_EVENT_GADGET_CREATE_8", action = "action_EVENT_GADGET_CREATE_8" },
	{ name = "SELECT_OPTION_9", event = EventType.EVENT_SELECT_OPTION, source = "", condition = "condition_EVENT_SELECT_OPTION_9", action = "action_EVENT_SELECT_OPTION_9" },
	{ name = "SELECT_OPTION_10", event = EventType.EVENT_SELECT_OPTION, source = "", condition = "condition_EVENT_SELECT_OPTION_10", action = "action_EVENT_SELECT_OPTION_10" },
	{ name = "SELECT_OPTION_11", event = EventType.EVENT_SELECT_OPTION, source = "", condition = "condition_EVENT_SELECT_OPTION_11", action = "action_EVENT_SELECT_OPTION_11" }
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
		gadgets = { 9, 10, 11, 12, 13, 14, 15 },
		regions = { 6, 7, 8, 9, 10, 11 },
		triggers = { "GADGET_CREATE_6", "GADGET_CREATE_7", "GADGET_CREATE_8", "SELECT_OPTION_9", "SELECT_OPTION_10", "SELECT_OPTION_11" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_GADGET_CREATE_6(context, evt)
	if 9 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_CREATE_6(context, evt)
	-- 设置操作台选项
	if 0 ~= ScriptLib.SetWorktopOptions(context, {24}) then
		return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_GADGET_CREATE_7(context, evt)
	if 10 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_CREATE_7(context, evt)
	-- 设置操作台选项
	if 0 ~= ScriptLib.SetWorktopOptions(context, {24}) then
		return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_GADGET_CREATE_8(context, evt)
	if 11 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_CREATE_8(context, evt)
	-- 设置操作台选项
	if 0 ~= ScriptLib.SetWorktopOptions(context, {24}) then
		return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_SELECT_OPTION_9(context, evt)
	-- 判断是gadgetid 9
	if 9 ~= evt.param1 then
			return false
		end
	
	return true
end

-- 触发操作
function action_EVENT_SELECT_OPTION_9(context, evt)
	-- 根据不同的选项做不同的操作
	if 24 == evt.param2 then
		if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 12, GadgetState.GearStart) then
			return -1
		end 
		return 0
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_SELECT_OPTION_10(context, evt)
	-- 判断是gadgetid 10
	if 10 ~= evt.param1 then
			return false
		end
	
	return true
end

-- 触发操作
function action_EVENT_SELECT_OPTION_10(context, evt)
	-- 根据不同的选项做不同的操作
	if 24 == evt.param2 then
		if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 13, GadgetState.GearStart) then
			return -1
		end 
		return 0
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_SELECT_OPTION_11(context, evt)
	-- 判断是gadgetid 11
	if 11 ~= evt.param1 then
			return false
		end
	
	return true
end

-- 触发操作
function action_EVENT_SELECT_OPTION_11(context, evt)
	-- 根据不同的选项做不同的操作
	if 24 == evt.param2 then
		if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 14, GadgetState.GearStart) then
			return -1
		end 
		return 0
	end
	
	return 0
end
