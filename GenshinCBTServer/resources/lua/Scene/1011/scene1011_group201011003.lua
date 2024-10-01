--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 37, monster_id = 23040101, pos = { x = 22.2, y = 0.5, z = -92.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 38, monster_id = 21010401, pos = { x = 16.7, y = 0.5, z = -94.7 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 39, monster_id = 21010401, pos = { x = 27.5, y = 0.5, z = -95.1 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 40, monster_id = 23040101, pos = { x = 24.8, y = 0.5, z = -92.5 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 41, monster_id = 23040101, pos = { x = 11.3, y = 0.5, z = -93.1 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 42, monster_id = 20020101, pos = { x = 22.4, y = 0.5, z = -85.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 43, monster_id = 20010301, pos = { x = 31.1, y = 0.5, z = -88.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 44, monster_id = 20010301, pos = { x = 25.5, y = 0.5, z = -89.5 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 45, monster_id = 20010301, pos = { x = 19.3, y = 0.5, z = -91.2 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 46, monster_id = 22010301, pos = { x = 20.0, y = 0.5, z = -87.5 }, rot = { x = 0.0, y = 0.3, z = 0.0 }, level = 0 },
	{ config_id = 47, monster_id = 21010201, pos = { x = 26.1, y = 0.5, z = -82.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 48, monster_id = 21010201, pos = { x = 16.4, y = 0.5, z = -83.2 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 49, monster_id = 21010901, pos = { x = 27.2, y = 0.5, z = -87.1 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 50, monster_id = 22010201, pos = { x = 14.4, y = 0.5, z = -88.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 51, monster_id = 21010201, pos = { x = 11.2, y = 0.5, z = -85.2 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 52, monster_id = 21010201, pos = { x = 15.9, y = 0.5, z = -85.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 53, monster_id = 20011001, pos = { x = 13.6, y = 0.5, z = -83.7 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 54, monster_id = 22010101, pos = { x = 33.2, y = 0.5, z = -86.9 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 55, monster_id = 21010301, pos = { x = 35.2, y = 0.5, z = -83.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 56, monster_id = 21010301, pos = { x = 30.5, y = 0.5, z = -83.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 57, monster_id = 21011001, pos = { x = 34.6, y = 0.5, z = -90.7 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 3, gadget_id = 70360002, pos = { x = 16.6, y = 0.5, z = -61.9 }, rot = { x = 0.0, y = 70.7, z = 0.0 }, level = 1 }
}

-- 区域
regions = {
	{ config_id = 12, shape = RegionShape.SPHERE, radius = 5, pos = { x = 15.5, y = 0.5, z = -62.2 } },
	{ config_id = 13, shape = RegionShape.SPHERE, radius = 5, pos = { x = 12.6, y = 0.5, z = -64.6 } },
	{ config_id = 14, shape = RegionShape.SPHERE, radius = 5, pos = { x = 16.9, y = 0.5, z = -64.1 } },
	{ config_id = 15, shape = RegionShape.SPHERE, radius = 5, pos = { x = 11.2, y = 0.5, z = -63.3 } },
	{ config_id = 16, shape = RegionShape.SPHERE, radius = 5, pos = { x = 12.7, y = 0.5, z = -64.8 } },
	{ config_id = 17, shape = RegionShape.SPHERE, radius = 5, pos = { x = 14.4, y = 0.5, z = -64.2 } },
	{ config_id = 18, shape = RegionShape.SPHERE, radius = 5, pos = { x = 14.3, y = 0.5, z = -64.8 } }
}

-- 触发器
triggers = {
	{ name = "GADGET_CREATE_12", event = EventType.EVENT_GADGET_CREATE, source = "", condition = "condition_EVENT_GADGET_CREATE_12", action = "action_EVENT_GADGET_CREATE_12" },
	{ name = "SELECT_OPTION_13", event = EventType.EVENT_SELECT_OPTION, source = "", condition = "condition_EVENT_SELECT_OPTION_13", action = "action_EVENT_SELECT_OPTION_13", trigger_count = 0 },
	{ name = "SELECT_OPTION_14", event = EventType.EVENT_SELECT_OPTION, source = "", condition = "condition_EVENT_SELECT_OPTION_14", action = "action_EVENT_SELECT_OPTION_14", trigger_count = 0 },
	{ name = "SELECT_OPTION_15", event = EventType.EVENT_SELECT_OPTION, source = "", condition = "condition_EVENT_SELECT_OPTION_15", action = "action_EVENT_SELECT_OPTION_15", trigger_count = 0 },
	{ name = "SELECT_OPTION_16", event = EventType.EVENT_SELECT_OPTION, source = "", condition = "condition_EVENT_SELECT_OPTION_16", action = "action_EVENT_SELECT_OPTION_16", trigger_count = 0 },
	{ name = "SELECT_OPTION_17", event = EventType.EVENT_SELECT_OPTION, source = "", condition = "condition_EVENT_SELECT_OPTION_17", action = "action_EVENT_SELECT_OPTION_17", trigger_count = 0 },
	{ name = "SELECT_OPTION_18", event = EventType.EVENT_SELECT_OPTION, source = "", condition = "condition_EVENT_SELECT_OPTION_18", action = "action_EVENT_SELECT_OPTION_18", trigger_count = 0 }
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
		monsters = { 37, 38, 39 },
		gadgets = { 3 },
		regions = { 12, 13, 14, 15, 16, 17, 18 },
		triggers = { "GADGET_CREATE_12", "SELECT_OPTION_13", "SELECT_OPTION_14", "SELECT_OPTION_15", "SELECT_OPTION_16", "SELECT_OPTION_17", "SELECT_OPTION_18" },
		rand_weight = 100
	},
	{
		-- suite_id = 1,
		-- description = suite_2,
		monsters = { 40, 41 },
		gadgets = { 3 },
		regions = { 12, 13, 14, 15, 16, 17, 18 },
		triggers = { "GADGET_CREATE_12", "SELECT_OPTION_13", "SELECT_OPTION_14", "SELECT_OPTION_15", "SELECT_OPTION_16", "SELECT_OPTION_17", "SELECT_OPTION_18" },
		rand_weight = 0
	},
	{
		-- suite_id = 2,
		-- description = suite_3,
		monsters = { 42, 43, 44, 45 },
		gadgets = { 3 },
		regions = { 12, 13, 14, 15, 16, 17, 18 },
		triggers = { "GADGET_CREATE_12", "SELECT_OPTION_13", "SELECT_OPTION_14", "SELECT_OPTION_15", "SELECT_OPTION_16", "SELECT_OPTION_17", "SELECT_OPTION_18" },
		rand_weight = 0
	},
	{
		-- suite_id = 3,
		-- description = suite_4,
		monsters = { 46, 47, 48, 49 },
		gadgets = { 3 },
		regions = { 12, 13, 14, 15, 16, 17, 18 },
		triggers = { "GADGET_CREATE_12", "SELECT_OPTION_13", "SELECT_OPTION_14", "SELECT_OPTION_15", "SELECT_OPTION_16", "SELECT_OPTION_17", "SELECT_OPTION_18" },
		rand_weight = 0
	},
	{
		-- suite_id = 4,
		-- description = suite_5,
		monsters = { 50, 51, 52, 53 },
		gadgets = { 3 },
		regions = { 12, 13, 14, 15, 16, 17, 18 },
		triggers = { "GADGET_CREATE_12", "SELECT_OPTION_13", "SELECT_OPTION_14", "SELECT_OPTION_15", "SELECT_OPTION_16", "SELECT_OPTION_17", "SELECT_OPTION_18" },
		rand_weight = 0
	},
	{
		-- suite_id = 5,
		-- description = suite_6,
		monsters = { 54, 55, 56, 57 },
		gadgets = { 3 },
		regions = { 12, 13, 14, 15, 16, 17, 18 },
		triggers = { "GADGET_CREATE_12", "SELECT_OPTION_13", "SELECT_OPTION_14", "SELECT_OPTION_15", "SELECT_OPTION_16", "SELECT_OPTION_17", "SELECT_OPTION_18" },
		rand_weight = 0
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_GADGET_CREATE_12(context, evt)
	if 3 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_CREATE_12(context, evt)
	-- 设置操作台选项
	if 0 ~= ScriptLib.SetWorktopOptions(context, {139,140,141,142,143,144}) then
		return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_SELECT_OPTION_13(context, evt)
	-- 判断是gadgetid 3
	if 3 ~= evt.param1 then
			return false
		end
	
	return true
end

-- 触发操作
function action_EVENT_SELECT_OPTION_13(context, evt)
	
	-- 根据不同的选项做不同的操作
	if 139 == evt.param2 then
	
		-- 重新生成指定group，指定suite
		if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 201011003, suite = 1 }) then
			return -1
		end
	
		if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 3, GadgetState.GearStart) then
			return -1
		end 
		return 0
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_SELECT_OPTION_14(context, evt)
	-- 判断是gadgetid 3
	if 3 ~= evt.param1 then
			return false
		end
	
	return true
end

-- 触发操作
function action_EVENT_SELECT_OPTION_14(context, evt)
	
	-- 根据不同的选项做不同的操作
	if 140 == evt.param2 then
	
		-- 重新生成指定group，指定suite
		if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 201011003, suite = 2 }) then
			return -1
		end
	
		if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 3, GadgetState.GearStart) then
			return -1
		end 
		return 0
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_SELECT_OPTION_15(context, evt)
	-- 判断是gadgetid 3
	if 3 ~= evt.param1 then
			return false
		end
	
	return true
end

-- 触发操作
function action_EVENT_SELECT_OPTION_15(context, evt)
	
	-- 根据不同的选项做不同的操作
	if 141 == evt.param2 then
	
		-- 重新生成指定group，指定suite
		if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 201011003, suite = 3 }) then
			return -1
		end
	
		if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 3, GadgetState.GearStart) then
			return -1
		end 
		return 0
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_SELECT_OPTION_16(context, evt)
	-- 判断是gadgetid 3
	if 3 ~= evt.param1 then
			return false
		end
	
	return true
end

-- 触发操作
function action_EVENT_SELECT_OPTION_16(context, evt)
	
	-- 根据不同的选项做不同的操作
	if 142 == evt.param2 then
	
		-- 重新生成指定group，指定suite
		if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 201011003, suite = 4 }) then
			return -1
		end
	
		if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 3, GadgetState.GearStart) then
			return -1
		end 
		return 0
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_SELECT_OPTION_17(context, evt)
	-- 判断是gadgetid 3
	if 3 ~= evt.param1 then
			return false
		end
	
	return true
end

-- 触发操作
function action_EVENT_SELECT_OPTION_17(context, evt)
	
	-- 根据不同的选项做不同的操作
	if 143 == evt.param2 then
	
		-- 重新生成指定group，指定suite
		if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 201011003, suite = 5 }) then
			return -1
		end
	
		if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 3, GadgetState.GearStart) then
			return -1
		end 
		return 0
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_SELECT_OPTION_18(context, evt)
	-- 判断是gadgetid 3
	if 3 ~= evt.param1 then
			return false
		end
	
	return true
end

-- 触发操作
function action_EVENT_SELECT_OPTION_18(context, evt)
	
	-- 根据不同的选项做不同的操作
	if 144 == evt.param2 then
	
		-- 重新生成指定group，指定suite
		if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 201011003, suite = 6 }) then
			return -1
		end
	
		if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 3, GadgetState.GearStart) then
			return -1
		end 
		return 0
	end
	
	return 0
end
