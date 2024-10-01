--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 1, monster_id = 21010201, pos = { x = 58.1, y = 0.5, z = 3.0 }, rot = { x = 0.0, y = 184.0, z = 0.0 }, level = 0 },
	{ config_id = 2, monster_id = 21010201, pos = { x = 55.7, y = 0.5, z = 3.9 }, rot = { x = 0.0, y = 179.7, z = 0.0 }, level = 0 },
	{ config_id = 3, monster_id = 21010201, pos = { x = 59.8, y = 0.5, z = 4.4 }, rot = { x = 0.0, y = 188.1, z = 0.0 }, level = 0 },
	{ config_id = 4, monster_id = 21010401, pos = { x = 58.1, y = 0.5, z = 10.7 }, rot = { x = 0.0, y = 184.8, z = 0.0 }, level = 0 },
	{ config_id = 5, monster_id = 20011301, pos = { x = 67.1, y = 0.5, z = 7.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 6, monster_id = 20011201, pos = { x = 66.8, y = 0.5, z = 8.9 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 7, monster_id = 20011201, pos = { x = 68.3, y = 0.5, z = 8.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 8, monster_id = 20011201, pos = { x = 69.1, y = 0.5, z = 7.9 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 9, monster_id = 20011101, pos = { x = 46.9, y = 0.5, z = 8.1 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 10, monster_id = 20011001, pos = { x = 44.7, y = 0.5, z = 9.2 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 11, monster_id = 20011001, pos = { x = 46.3, y = 0.5, z = 9.9 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 12, monster_id = 20011001, pos = { x = 48.0, y = 0.5, z = 10.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 13, monster_id = 20010301, pos = { x = 54.9, y = 0.5, z = 11.1 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 14, monster_id = 20010301, pos = { x = 56.4, y = 0.5, z = 12.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 15, monster_id = 20010301, pos = { x = 62.9, y = 0.5, z = 11.5 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 16, monster_id = 20010401, pos = { x = 58.7, y = 0.5, z = 9.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 17, monster_id = 20010701, pos = { x = 57.8, y = 0.5, z = 7.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 18, monster_id = 20010501, pos = { x = 55.7, y = 0.5, z = 8.1 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 19, monster_id = 20010501, pos = { x = 58.3, y = 0.5, z = 8.7 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 20, monster_id = 20010501, pos = { x = 61.1, y = 0.5, z = 8.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 1, gadget_id = 70360002, pos = { x = 62.9, y = 0.5, z = -16.4 }, rot = { x = 0.0, y = 179.9, z = 0.0 }, level = 1 },
	{ config_id = 5, gadget_id = 70360002, pos = { x = 72.8, y = 0.5, z = -47.0 }, rot = { x = 0.0, y = 102.3, z = 0.0 }, level = 1 }
}

-- 区域
regions = {
	{ config_id = 1, shape = RegionShape.SPHERE, radius = 5, pos = { x = 62.9, y = 0.5, z = -16.6 } },
	{ config_id = 2, shape = RegionShape.SPHERE, radius = 5, pos = { x = 66.2, y = 0.5, z = -12.6 } },
	{ config_id = 3, shape = RegionShape.SPHERE, radius = 5, pos = { x = 67.5, y = 0.5, z = -15.8 } },
	{ config_id = 4, shape = RegionShape.SPHERE, radius = 5, pos = { x = 68.2, y = 0.5, z = -12.6 } },
	{ config_id = 5, shape = RegionShape.SPHERE, radius = 5, pos = { x = 62.8, y = 0.5, z = -12.4 } },
	{ config_id = 6, shape = RegionShape.SPHERE, radius = 5, pos = { x = 66.9, y = 0.5, z = -8.0 } },
	{ config_id = 27, shape = RegionShape.SPHERE, radius = 5, pos = { x = 72.3, y = 0.5, z = -46.3 } },
	{ config_id = 28, shape = RegionShape.SPHERE, radius = 5, pos = { x = 72.3, y = 0.5, z = -45.7 } },
	{ config_id = 29, shape = RegionShape.SPHERE, radius = 5, pos = { x = 73.9, y = 0.5, z = -45.4 } },
	{ config_id = 30, shape = RegionShape.SPHERE, radius = 5, pos = { x = 73.3, y = 0.5, z = -43.1 } },
	{ config_id = 31, shape = RegionShape.SPHERE, radius = 5, pos = { x = 70.5, y = 0.5, z = -44.1 } },
	{ config_id = 32, shape = RegionShape.SPHERE, radius = 5, pos = { x = 74.6, y = 0.5, z = -45.8 } }
}

-- 触发器
triggers = {
	{ name = "GADGET_CREATE_1", event = EventType.EVENT_GADGET_CREATE, source = "", condition = "condition_EVENT_GADGET_CREATE_1", action = "action_EVENT_GADGET_CREATE_1" },
	{ name = "SELECT_OPTION_2", event = EventType.EVENT_SELECT_OPTION, source = "", condition = "condition_EVENT_SELECT_OPTION_2", action = "action_EVENT_SELECT_OPTION_2", trigger_count = 0 },
	{ name = "SELECT_OPTION_3", event = EventType.EVENT_SELECT_OPTION, source = "", condition = "condition_EVENT_SELECT_OPTION_3", action = "action_EVENT_SELECT_OPTION_3", trigger_count = 0 },
	{ name = "SELECT_OPTION_4", event = EventType.EVENT_SELECT_OPTION, source = "", condition = "condition_EVENT_SELECT_OPTION_4", action = "action_EVENT_SELECT_OPTION_4", trigger_count = 0 },
	{ name = "SELECT_OPTION_5", event = EventType.EVENT_SELECT_OPTION, source = "", condition = "condition_EVENT_SELECT_OPTION_5", action = "action_EVENT_SELECT_OPTION_5", trigger_count = 0 },
	{ name = "SELECT_OPTION_6", event = EventType.EVENT_SELECT_OPTION, source = "", condition = "condition_EVENT_SELECT_OPTION_6", action = "action_EVENT_SELECT_OPTION_6", trigger_count = 0 },
	{ name = "GADGET_CREATE_27", event = EventType.EVENT_GADGET_CREATE, source = "", condition = "condition_EVENT_GADGET_CREATE_27", action = "action_EVENT_GADGET_CREATE_27" },
	{ name = "SELECT_OPTION_28", event = EventType.EVENT_SELECT_OPTION, source = "", condition = "condition_EVENT_SELECT_OPTION_28", action = "action_EVENT_SELECT_OPTION_28", trigger_count = 0 },
	{ name = "SELECT_OPTION_29", event = EventType.EVENT_SELECT_OPTION, source = "", condition = "condition_EVENT_SELECT_OPTION_29", action = "action_EVENT_SELECT_OPTION_29", trigger_count = 0 },
	{ name = "SELECT_OPTION_30", event = EventType.EVENT_SELECT_OPTION, source = "", condition = "condition_EVENT_SELECT_OPTION_30", action = "action_EVENT_SELECT_OPTION_30", trigger_count = 0 },
	{ name = "SELECT_OPTION_31", event = EventType.EVENT_SELECT_OPTION, source = "", condition = "condition_EVENT_SELECT_OPTION_31", action = "action_EVENT_SELECT_OPTION_31", trigger_count = 0 },
	{ name = "SELECT_OPTION_32", event = EventType.EVENT_SELECT_OPTION, source = "", condition = "condition_EVENT_SELECT_OPTION_32", action = "action_EVENT_SELECT_OPTION_32", trigger_count = 0 }
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
		monsters = { 1, 2, 3, 4 },
		gadgets = { 1, 5 },
		regions = { 1, 2, 3, 4, 5, 6, 27, 28, 29, 30, 31, 32 },
		triggers = { "GADGET_CREATE_1", "SELECT_OPTION_2", "SELECT_OPTION_3", "SELECT_OPTION_4", "SELECT_OPTION_5", "SELECT_OPTION_6", "GADGET_CREATE_27", "SELECT_OPTION_28", "SELECT_OPTION_29", "SELECT_OPTION_30", "SELECT_OPTION_31", "SELECT_OPTION_32" },
		rand_weight = 100
	},
	{
		-- suite_id = 1,
		-- description = suite_2,
		monsters = { 5, 6, 7, 8 },
		gadgets = { 1, 5 },
		regions = { 1, 2, 3, 4, 5, 6, 27, 28, 29, 30, 31, 32 },
		triggers = { "GADGET_CREATE_1", "SELECT_OPTION_2", "SELECT_OPTION_3", "SELECT_OPTION_4", "SELECT_OPTION_5", "SELECT_OPTION_6", "GADGET_CREATE_27", "SELECT_OPTION_28", "SELECT_OPTION_29", "SELECT_OPTION_30", "SELECT_OPTION_31", "SELECT_OPTION_32" },
		rand_weight = 0
	},
	{
		-- suite_id = 2,
		-- description = suite_3,
		monsters = { 9, 10, 11, 12 },
		gadgets = { 1, 5 },
		regions = { 1, 2, 3, 4, 5, 6, 27, 28, 29, 30, 31, 32 },
		triggers = { "GADGET_CREATE_1", "SELECT_OPTION_2", "SELECT_OPTION_3", "SELECT_OPTION_4", "SELECT_OPTION_5", "SELECT_OPTION_6", "GADGET_CREATE_27", "SELECT_OPTION_28", "SELECT_OPTION_29", "SELECT_OPTION_30", "SELECT_OPTION_31", "SELECT_OPTION_32" },
		rand_weight = 0
	},
	{
		-- suite_id = 3,
		-- description = suite_4,
		monsters = { 13, 14, 15, 16 },
		gadgets = { 1, 5 },
		regions = { 1, 2, 3, 4, 5, 6, 27, 28, 29, 30, 31, 32 },
		triggers = { "GADGET_CREATE_1", "SELECT_OPTION_2", "SELECT_OPTION_3", "SELECT_OPTION_4", "SELECT_OPTION_5", "SELECT_OPTION_6", "GADGET_CREATE_27", "SELECT_OPTION_28", "SELECT_OPTION_29", "SELECT_OPTION_30", "SELECT_OPTION_31", "SELECT_OPTION_32" },
		rand_weight = 0
	},
	{
		-- suite_id = 4,
		-- description = suite_5,
		monsters = { 17, 18, 19, 20 },
		gadgets = { 1, 5 },
		regions = { 1, 2, 3, 4, 5, 6, 27, 28, 29, 30, 31, 32 },
		triggers = { "GADGET_CREATE_1", "SELECT_OPTION_2", "SELECT_OPTION_3", "SELECT_OPTION_4", "SELECT_OPTION_5", "SELECT_OPTION_6", "GADGET_CREATE_27", "SELECT_OPTION_28", "SELECT_OPTION_29", "SELECT_OPTION_30", "SELECT_OPTION_31", "SELECT_OPTION_32" },
		rand_weight = 0
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
	if 0 ~= ScriptLib.SetWorktopOptions(context, {130,131,132,133,134}) then
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
		if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 201011001, suite = 2 }) then
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
		if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 201011001, suite = 3 }) then
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
	-- 判断是gadgetid 1
	if 1 ~= evt.param1 then
			return false
		end
	
	return true
end

-- 触发操作
function action_EVENT_SELECT_OPTION_4(context, evt)
	
	-- 根据不同的选项做不同的操作
	if 133 == evt.param2 then
	
		-- 重新生成指定group，指定suite
		if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 201011001, suite = 4 }) then
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
		if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 201011001, suite = 5 }) then
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
	if 130 == evt.param2 then
	
		-- 重新生成指定group，指定suite
		if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 201011001, suite = 1 }) then
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
function condition_EVENT_GADGET_CREATE_27(context, evt)
	if 5 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_CREATE_27(context, evt)
	-- 设置操作台选项
	if 0 ~= ScriptLib.SetWorktopOptions(context, {151,152,153,154,155}) then
		return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_SELECT_OPTION_28(context, evt)
	-- 判断是gadgetid 5
	if 5 ~= evt.param1 then
			return false
		end
	
	return true
end

-- 触发操作
function action_EVENT_SELECT_OPTION_28(context, evt)
	-- 根据不同的选项做不同的操作
	if 151 == evt.param2 then
	
	if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 201011001, refresh_level_revise = 1}) then
	  return -1
	end
	
	if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 201011002, refresh_level_revise = 1}) then
	  return -1
	end
	
	if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 201011003, refresh_level_revise = 1}) then
	  return -1
	end
	
	if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 201011004, refresh_level_revise = 1}) then
	  return -1
	end
		if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 5, GadgetState.GearStart) then
			return -1
		end 
		return 0
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_SELECT_OPTION_29(context, evt)
	-- 判断是gadgetid 5
	if 5 ~= evt.param1 then
			return false
		end
	
	return true
end

-- 触发操作
function action_EVENT_SELECT_OPTION_29(context, evt)
	-- 根据不同的选项做不同的操作
	if 152 == evt.param2 then
	
	if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 201011001, refresh_level_revise = 5}) then
	  return -1
	end
	
	if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 201011002, refresh_level_revise = 5}) then
	  return -1
	end
	
	if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 201011003, refresh_level_revise = 5}) then
	  return -1
	end
	
	if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 201011004, refresh_level_revise = 5}) then
	  return -1
	end
		if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 5, GadgetState.GearStart) then
			return -1
		end 
		return 0
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_SELECT_OPTION_30(context, evt)
	-- 判断是gadgetid 5
	if 5 ~= evt.param1 then
			return false
		end
	
	return true
end

-- 触发操作
function action_EVENT_SELECT_OPTION_30(context, evt)
	-- 根据不同的选项做不同的操作
	if 153 == evt.param2 then
	
	if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 201011001, refresh_level_revise = 10}) then
	  return -1
	end
	
	if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 201011002, refresh_level_revise = 10}) then
	  return -1
	end
	
	if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 201011003, refresh_level_revise = 10}) then
	  return -1
	end
	
	if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 201011004, refresh_level_revise = 10}) then
	  return -1
	end
		if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 5, GadgetState.GearStart) then
			return -1
		end 
		return 0
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_SELECT_OPTION_31(context, evt)
	-- 判断是gadgetid 5
	if 5 ~= evt.param1 then
			return false
		end
	
	return true
end

-- 触发操作
function action_EVENT_SELECT_OPTION_31(context, evt)
	-- 根据不同的选项做不同的操作
	if 154 == evt.param2 then
	
	if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 201011001, refresh_level_revise = 15}) then
	  return -1
	end
	
	if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 201011002, refresh_level_revise = 15}) then
	  return -1
	end
	
	if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 201011003, refresh_level_revise = 15}) then
	  return -1
	end
	
	if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 201011004, refresh_level_revise = 15}) then
	  return -1
	end
		if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 5, GadgetState.GearStart) then
			return -1
		end 
		return 0
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_SELECT_OPTION_32(context, evt)
	-- 判断是gadgetid 5
	if 5 ~= evt.param1 then
			return false
		end
	
	return true
end

-- 触发操作
function action_EVENT_SELECT_OPTION_32(context, evt)
	-- 根据不同的选项做不同的操作
	if 155 == evt.param2 then
	
	if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 201011001, refresh_level_revise = 20}) then
	  return -1
	end
	
	if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 201011002, refresh_level_revise = 20}) then
	  return -1
	end
	
	if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 201011003, refresh_level_revise = 20}) then
	  return -1
	end
	
	if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 201011004, refresh_level_revise = 20}) then
	  return -1
	end
		if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 5, GadgetState.GearStart) then
			return -1
		end 
		return 0
	end
	
	return 0
end
