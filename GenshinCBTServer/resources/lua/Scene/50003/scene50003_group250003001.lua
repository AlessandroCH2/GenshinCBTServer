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
	{ config_id = 1, gadget_id = 70360002, pos = { x = 1975.4, y = 196.4, z = -1306.2 }, rot = { x = 0.0, y = 91.4, z = 0.0 }, level = 1 },
	{ config_id = 2, gadget_id = 70360002, pos = { x = 1976.0, y = 196.6, z = -1303.5 }, rot = { x = 0.0, y = 103.2, z = 0.0 }, level = 1 }
}

-- 区域
regions = {
	{ config_id = 1, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1972.0, y = 196.6, z = -1304.1 } },
	{ config_id = 2, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1968.4, y = 196.9, z = -1307.2 } },
	{ config_id = 3, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1968.7, y = 197.0, z = -1311.6 } },
	{ config_id = 4, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1969.5, y = 197.0, z = -1311.0 } },
	{ config_id = 5, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1968.2, y = 196.9, z = -1308.3 } },
	{ config_id = 6, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1966.6, y = 196.9, z = -1307.0 } },
	{ config_id = 7, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1968.0, y = 196.9, z = -1309.2 } },
	{ config_id = 8, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1962.6, y = 196.0, z = -1290.1 } },
	{ config_id = 9, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1971.1, y = 196.4, z = -1301.5 } },
	{ config_id = 10, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1972.2, y = 196.0, z = -1296.9 } },
	{ config_id = 11, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1971.1, y = 196.1, z = -1298.5 } },
	{ config_id = 12, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1973.5, y = 195.9, z = -1297.1 } },
	{ config_id = 13, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1974.3, y = 196.1, z = -1299.7 } },
	{ config_id = 14, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1971.2, y = 196.5, z = -1302.4 } },
	{ config_id = 15, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1971.4, y = 196.7, z = -1305.4 } },
	{ config_id = 16, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1971.4, y = 196.8, z = -1307.1 } },
	{ config_id = 17, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1970.1, y = 196.1, z = -1297.9 } }
}

-- 触发器
triggers = {
	{ name = "GADGET_CREATE_1", event = EventType.EVENT_GADGET_CREATE, source = "", condition = "condition_EVENT_GADGET_CREATE_1", action = "action_EVENT_GADGET_CREATE_1" },
	{ name = "SELECT_OPTION_2", event = EventType.EVENT_SELECT_OPTION, source = "", condition = "condition_EVENT_SELECT_OPTION_2", action = "action_EVENT_SELECT_OPTION_2", trigger_count = 0 },
	{ name = "SELECT_OPTION_3", event = EventType.EVENT_SELECT_OPTION, source = "", condition = "condition_EVENT_SELECT_OPTION_3", action = "action_EVENT_SELECT_OPTION_3", trigger_count = 0 },
	{ name = "SELECT_OPTION_4", event = EventType.EVENT_SELECT_OPTION, source = "", condition = "condition_EVENT_SELECT_OPTION_4", action = "action_EVENT_SELECT_OPTION_4", trigger_count = 0 },
	{ name = "SELECT_OPTION_5", event = EventType.EVENT_SELECT_OPTION, source = "", condition = "condition_EVENT_SELECT_OPTION_5", action = "action_EVENT_SELECT_OPTION_5", trigger_count = 0 },
	{ name = "SELECT_OPTION_6", event = EventType.EVENT_SELECT_OPTION, source = "", condition = "condition_EVENT_SELECT_OPTION_6", action = "action_EVENT_SELECT_OPTION_6", trigger_count = 0 },
	{ name = "SELECT_OPTION_7", event = EventType.EVENT_SELECT_OPTION, source = "", condition = "condition_EVENT_SELECT_OPTION_7", action = "action_EVENT_SELECT_OPTION_7", trigger_count = 0 },
	{ name = "GADGET_CREATE_8", event = EventType.EVENT_GADGET_CREATE, source = "", condition = "condition_EVENT_GADGET_CREATE_8", action = "action_EVENT_GADGET_CREATE_8", trigger_count = 0 },
	{ name = "SELECT_OPTION_9", event = EventType.EVENT_SELECT_OPTION, source = "", condition = "condition_EVENT_SELECT_OPTION_9", action = "action_EVENT_SELECT_OPTION_9", trigger_count = 0 },
	{ name = "SELECT_OPTION_10", event = EventType.EVENT_SELECT_OPTION, source = "", condition = "condition_EVENT_SELECT_OPTION_10", action = "action_EVENT_SELECT_OPTION_10", trigger_count = 0 },
	{ name = "SELECT_OPTION_11", event = EventType.EVENT_SELECT_OPTION, source = "", condition = "condition_EVENT_SELECT_OPTION_11", action = "action_EVENT_SELECT_OPTION_11", trigger_count = 0 },
	{ name = "SELECT_OPTION_12", event = EventType.EVENT_SELECT_OPTION, source = "", condition = "condition_EVENT_SELECT_OPTION_12", action = "action_EVENT_SELECT_OPTION_12", trigger_count = 0 },
	{ name = "SELECT_OPTION_13", event = EventType.EVENT_SELECT_OPTION, source = "", condition = "condition_EVENT_SELECT_OPTION_13", action = "action_EVENT_SELECT_OPTION_13", trigger_count = 0 },
	{ name = "SELECT_OPTION_14", event = EventType.EVENT_SELECT_OPTION, source = "", condition = "condition_EVENT_SELECT_OPTION_14", action = "action_EVENT_SELECT_OPTION_14", trigger_count = 0 },
	{ name = "SELECT_OPTION_15", event = EventType.EVENT_SELECT_OPTION, source = "", condition = "condition_EVENT_SELECT_OPTION_15", action = "action_EVENT_SELECT_OPTION_15", trigger_count = 0 },
	{ name = "SELECT_OPTION_16", event = EventType.EVENT_SELECT_OPTION, source = "", condition = "condition_EVENT_SELECT_OPTION_16", action = "action_EVENT_SELECT_OPTION_16", trigger_count = 0 },
	{ name = "SELECT_OPTION_17", event = EventType.EVENT_SELECT_OPTION, source = "", condition = "condition_EVENT_SELECT_OPTION_17", action = "action_EVENT_SELECT_OPTION_17", trigger_count = 0 }
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
		gadgets = { 1, 2 },
		regions = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17 },
		triggers = { "GADGET_CREATE_1", "SELECT_OPTION_2", "SELECT_OPTION_3", "SELECT_OPTION_4", "SELECT_OPTION_5", "SELECT_OPTION_6", "SELECT_OPTION_7", "GADGET_CREATE_8", "SELECT_OPTION_9", "SELECT_OPTION_10", "SELECT_OPTION_11", "SELECT_OPTION_12", "SELECT_OPTION_13", "SELECT_OPTION_14", "SELECT_OPTION_15", "SELECT_OPTION_16", "SELECT_OPTION_17" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_GADGET_CREATE_1(context, evt)
	if 1 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_CREATE_1(context, evt)
	-- 设置操作台选项
	if 0 ~= ScriptLib.SetWorktopOptionsByGroupId(context, 250003001, 1, {131,132,133,134,148,150}) then
		return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_SELECT_OPTION_2(context, evt)
	-- 判断是gadgetid 1
	if 1 ~= evt.param1 then
			return false
		end
	
	return true
end

-- 触发操作
function action_EVENT_SELECT_OPTION_2(context, evt)
	
	-- 根据不同的选项做不同的操作
	if 131 == evt.param2 then
	
		-- 重新生成指定group，指定suite
		if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 250003002, suite = 6 }) then
			return -1
		end
	
		if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 1, GadgetState.GearStart) then
			return -1
		end 
		return 0
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_SELECT_OPTION_3(context, evt)
	-- 判断是gadgetid 1
	if 1 ~= evt.param1 then
			return false
		end
	
	return true
end

-- 触发操作
function action_EVENT_SELECT_OPTION_3(context, evt)
	
	-- 根据不同的选项做不同的操作
	if 132 == evt.param2 then
	
		-- 重新生成指定group，指定suite
		if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 250003002, suite = 5 }) then
			return -1
		end
	
		if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 1, GadgetState.GearStart) then
			return -1
		end 
		return 0
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_SELECT_OPTION_4(context, evt)
	-- 判断是gadgetid 1 option_id 133
	if 1 ~= evt.param1 then
		if 133 == evt.param2 then
			return false
		end
	end
	
	return true
end

-- 触发操作
function action_EVENT_SELECT_OPTION_4(context, evt)
	
	-- 根据不同的选项做不同的操作
	if 133 == evt.param2 then
	
		-- 重新生成指定group，指定suite
		if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 250003002, suite = 2 }) then
			return -1
		end
	
		if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 1, GadgetState.GearStart) then
			return -1
		end 
		return 0
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_SELECT_OPTION_5(context, evt)
	-- 判断是gadgetid 1
	if 1 ~= evt.param1 then
			return false
		end
	
	return true
end

-- 触发操作
function action_EVENT_SELECT_OPTION_5(context, evt)
	
	-- 根据不同的选项做不同的操作
	if 134 == evt.param2 then
	
		-- 重新生成指定group，指定suite
		if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 250003002, suite = 3 }) then
			return -1
		end
	
		if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 1, GadgetState.GearStart) then
			return -1
		end 
		return 0
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_SELECT_OPTION_6(context, evt)
	-- 判断是gadgetid 1
	if 1 ~= evt.param1 then
			return false
		end
	
	return true
end

-- 触发操作
function action_EVENT_SELECT_OPTION_6(context, evt)
	
	-- 根据不同的选项做不同的操作
	if 148 == evt.param2 then
	
		-- 重新生成指定group，指定suite
		if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 250003002, suite = 7 }) then
			return -1
		end
	
		if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 1, GadgetState.GearStart) then
			return -1
		end 
		return 0
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_SELECT_OPTION_7(context, evt)
	-- 判断是gadgetid 1
	if 1 ~= evt.param1 then
			return false
		end
	
	return true
end

-- 触发操作
function action_EVENT_SELECT_OPTION_7(context, evt)
	
	-- 根据不同的选项做不同的操作
	if 150 == evt.param2 then
	
		-- 重新生成指定group，指定suite
		if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 250003002, suite = 4 }) then
			return -1
		end
	
		if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 1, GadgetState.GearStart) then
			return -1
		end 
		return 0
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_GADGET_CREATE_8(context, evt)
	if 2 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_CREATE_8(context, evt)
	-- 设置操作台选项
	if 0 ~= ScriptLib.SetWorktopOptions(context, {120,121,135,136,137,141,142,143,144}) then
		return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_SELECT_OPTION_9(context, evt)
	-- 判断是gadgetid 2
	if 2 ~= evt.param1 then
			return false
		end
	
	return true
end

-- 触发操作
function action_EVENT_SELECT_OPTION_9(context, evt)
	
	-- 根据不同的选项做不同的操作
	if 120 == evt.param2 then
	
		-- 重新生成指定group，指定suite
		if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 250003003, suite = 2 }) then
			return -1
		end
	
		if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 2, GadgetState.GearStart) then
			return -1
		end 
		return 0
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_SELECT_OPTION_10(context, evt)
	-- 判断是gadgetid 2
	if 2 ~= evt.param1 then
			return false
		end
	
	return true
end

-- 触发操作
function action_EVENT_SELECT_OPTION_10(context, evt)
	
	-- 根据不同的选项做不同的操作
	if 121 == evt.param2 then
	
		-- 重新生成指定group，指定suite
		if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 250003003, suite = 3 }) then
			return -1
		end
	
		if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 2, GadgetState.GearStart) then
			return -1
		end 
		return 0
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_SELECT_OPTION_11(context, evt)
	-- 判断是gadgetid 2
	if 2 ~= evt.param1 then
			return false
		end
	
	return true
end

-- 触发操作
function action_EVENT_SELECT_OPTION_11(context, evt)
	
	-- 根据不同的选项做不同的操作
	if 135 == evt.param2 then
	
		-- 重新生成指定group，指定suite
		if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 250003003, suite = 4 }) then
			return -1
		end
	
		if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 2, GadgetState.GearStart) then
			return -1
		end 
		return 0
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_SELECT_OPTION_12(context, evt)
	-- 判断是gadgetid 2
	if 2 ~= evt.param1 then
			return false
		end
	
	return true
end

-- 触发操作
function action_EVENT_SELECT_OPTION_12(context, evt)
	
	-- 根据不同的选项做不同的操作
	if 136 == evt.param2 then
	
		-- 重新生成指定group，指定suite
		if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 250003003, suite = 5 }) then
			return -1
		end
	
		if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 2, GadgetState.GearStart) then
			return -1
		end 
		return 0
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_SELECT_OPTION_13(context, evt)
	-- 判断是gadgetid 2
	if 2 ~= evt.param1 then
			return false
		end
	
	return true
end

-- 触发操作
function action_EVENT_SELECT_OPTION_13(context, evt)
	
	-- 根据不同的选项做不同的操作
	if 137 == evt.param2 then
	
		-- 重新生成指定group，指定suite
		if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 250003003, suite = 6 }) then
			return -1
		end
	
		if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 2, GadgetState.GearStart) then
			return -1
		end 
		return 0
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_SELECT_OPTION_14(context, evt)
	-- 判断是gadgetid 2
	if 2 ~= evt.param1 then
			return false
		end
	
	return true
end

-- 触发操作
function action_EVENT_SELECT_OPTION_14(context, evt)
	
	-- 根据不同的选项做不同的操作
	if 141 == evt.param2 then
	
		-- 重新生成指定group，指定suite
		if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 250003003, suite = 7 }) then
			return -1
		end
	
		if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 2, GadgetState.GearStart) then
			return -1
		end 
		return 0
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_SELECT_OPTION_15(context, evt)
	-- 判断是gadgetid 2
	if 2 ~= evt.param1 then
			return false
		end
	
	return true
end

-- 触发操作
function action_EVENT_SELECT_OPTION_15(context, evt)
	
	-- 根据不同的选项做不同的操作
	if 142 == evt.param2 then
	
		-- 重新生成指定group，指定suite
		if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 250003003, suite = 8 }) then
			return -1
		end
	
		if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 2, GadgetState.GearStart) then
			return -1
		end 
		return 0
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_SELECT_OPTION_16(context, evt)
	-- 判断是gadgetid 2
	if 2 ~= evt.param1 then
			return false
		end
	
	return true
end

-- 触发操作
function action_EVENT_SELECT_OPTION_16(context, evt)
	
	-- 根据不同的选项做不同的操作
	if 143 == evt.param2 then
	
		-- 重新生成指定group，指定suite
		if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 250003003, suite = 9 }) then
			return -1
		end
	
		if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 2, GadgetState.GearStart) then
			return -1
		end 
		return 0
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_SELECT_OPTION_17(context, evt)
	-- 判断是gadgetid 2
	if 2 ~= evt.param1 then
			return false
		end
	
	return true
end

-- 触发操作
function action_EVENT_SELECT_OPTION_17(context, evt)
	
	-- 根据不同的选项做不同的操作
	if 144 == evt.param2 then
	
		-- 重新生成指定group，指定suite
		if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 250003003, suite = 10 }) then
			return -1
		end
	
		if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 2, GadgetState.GearStart) then
			return -1
		end 
		return 0
	end
	
	return 0
end
