--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 47, monster_id = 21010701, pos = { x = 410.1, y = -34.4, z = 27.1 }, rot = { x = 0.0, y = 265.9, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 48, monster_id = 21010701, pos = { x = 390.0, y = -34.4, z = 12.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 49, monster_id = 21010701, pos = { x = 385.2, y = -34.4, z = 53.6 }, rot = { x = 0.0, y = 194.3, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 50, monster_id = 21010701, pos = { x = 386.5, y = -34.4, z = 12.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 51, monster_id = 21010701, pos = { x = 383.5, y = -34.4, z = 53.6 }, rot = { x = 0.0, y = 169.9, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 52, monster_id = 21010701, pos = { x = 411.4, y = -34.4, z = 28.0 }, rot = { x = 0.0, y = 269.0, z = 0.0 }, level = 0, disableWander = true }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 13, gadget_id = 70360002, pos = { x = 386.6, y = -34.6, z = 53.4 }, rot = { x = 0.0, y = 186.1, z = 0.0 }, level = 1 },
	{ config_id = 14, gadget_id = 70360002, pos = { x = 411.0, y = -34.6, z = 27.1 }, rot = { x = 0.0, y = 271.0, z = 0.0 }, level = 1 },
	{ config_id = 15, gadget_id = 70360002, pos = { x = 388.2, y = -34.6, z = 10.8 }, rot = { x = 0.0, y = 358.4, z = 0.0 }, level = 1 },
	{ config_id = 53, gadget_id = 70220003, pos = { x = 377.3, y = -34.6, z = 24.8 }, rot = { x = 0.0, y = 348.2, z = 0.0 }, level = 1 },
	{ config_id = 54, gadget_id = 70220003, pos = { x = 384.5, y = -34.6, z = 24.5 }, rot = { x = 0.0, y = 25.9, z = 0.0 }, level = 1 },
	{ config_id = 55, gadget_id = 70220003, pos = { x = 386.3, y = -34.6, z = 20.7 }, rot = { x = 0.0, y = 80.2, z = 0.0 }, level = 1 },
	{ config_id = 56, gadget_id = 70220003, pos = { x = 381.2, y = -34.6, z = 25.3 }, rot = { x = 0.0, y = 2.8, z = 0.0 }, level = 1 },
	{ config_id = 57, gadget_id = 70210011, pos = { x = 380.0, y = -34.6, z = 20.7 }, rot = { x = 0.0, y = 219.7, z = 0.0 }, level = 1, chest_drop_id = 1400301, type = GadgetType.GADGET_DUNGEON_SECRET_CHEST },
	{ config_id = 68, gadget_id = 70350003, pos = { x = 404.3, y = -34.6, z = 53.1 }, rot = { x = 0.0, y = 90.0, z = 0.0 }, level = 1 },
	{ config_id = 138, gadget_id = 70310002, pos = { x = 389.4, y = -22.3, z = 61.6 }, rot = { x = 0.0, y = 180.0, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 139, gadget_id = 70310002, pos = { x = 417.3, y = -27.0, z = 25.2 }, rot = { x = 0.0, y = 270.0, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 140, gadget_id = 70310002, pos = { x = 390.5, y = -28.8, z = 4.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, state = GadgetState.GearStart }
}

-- 区域
regions = {
	{ config_id = 24, shape = RegionShape.SPHERE, radius = 5, pos = { x = 386.0, y = -34.4, z = 57.0 } },
	{ config_id = 25, shape = RegionShape.SPHERE, radius = 5, pos = { x = 386.0, y = -34.4, z = 59.0 } },
	{ config_id = 26, shape = RegionShape.SPHERE, radius = 5, pos = { x = 386.0, y = -34.4, z = 56.0 } },
	{ config_id = 27, shape = RegionShape.SPHERE, radius = 5, pos = { x = 411.0, y = -34.4, z = 36.0 } },
	{ config_id = 28, shape = RegionShape.SPHERE, radius = 5, pos = { x = 411.0, y = -34.4, z = 33.0 } },
	{ config_id = 29, shape = RegionShape.SPHERE, radius = 5, pos = { x = 411.0, y = -34.4, z = 33.0 } },
	{ config_id = 30, shape = RegionShape.SPHERE, radius = 5, pos = { x = 389.0, y = -34.4, z = 10.0 } },
	{ config_id = 31, shape = RegionShape.SPHERE, radius = 5, pos = { x = 389.0, y = -34.4, z = 10.0 } },
	{ config_id = 32, shape = RegionShape.SPHERE, radius = 5, pos = { x = 388.0, y = -34.4, z = 10.0 } }
}

-- 触发器
triggers = {
	{ name = "GADGET_CREATE_24", event = EventType.EVENT_GADGET_CREATE, source = "", condition = "condition_EVENT_GADGET_CREATE_24", action = "action_EVENT_GADGET_CREATE_24" },
	{ name = "SELECT_OPTION_25", event = EventType.EVENT_SELECT_OPTION, source = "", condition = "condition_EVENT_SELECT_OPTION_25", action = "action_EVENT_SELECT_OPTION_25" },
	{ name = "SELECT_OPTION_26", event = EventType.EVENT_SELECT_OPTION, source = "", condition = "condition_EVENT_SELECT_OPTION_26", action = "action_EVENT_SELECT_OPTION_26" },
	{ name = "GADGET_CREATE_27", event = EventType.EVENT_GADGET_CREATE, source = "", condition = "condition_EVENT_GADGET_CREATE_27", action = "action_EVENT_GADGET_CREATE_27" },
	{ name = "SELECT_OPTION_28", event = EventType.EVENT_SELECT_OPTION, source = "", condition = "condition_EVENT_SELECT_OPTION_28", action = "action_EVENT_SELECT_OPTION_28" },
	{ name = "SELECT_OPTION_29", event = EventType.EVENT_SELECT_OPTION, source = "", condition = "condition_EVENT_SELECT_OPTION_29", action = "action_EVENT_SELECT_OPTION_29" },
	{ name = "GADGET_CREATE_30", event = EventType.EVENT_GADGET_CREATE, source = "", condition = "condition_EVENT_GADGET_CREATE_30", action = "action_EVENT_GADGET_CREATE_30" },
	{ name = "SELECT_OPTION_31", event = EventType.EVENT_SELECT_OPTION, source = "", condition = "condition_EVENT_SELECT_OPTION_31", action = "action_EVENT_SELECT_OPTION_31" },
	{ name = "SELECT_OPTION_32", event = EventType.EVENT_SELECT_OPTION, source = "", condition = "condition_EVENT_SELECT_OPTION_32", action = "action_EVENT_SELECT_OPTION_32" }
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
		-- description = 宝箱-怪物-怪物,
		monsters = { 47, 48 },
		gadgets = { 13, 53, 54, 55, 56, 57, 68, 138 },
		regions = { 24, 25, 26 },
		triggers = { "GADGET_CREATE_24", "SELECT_OPTION_25", "SELECT_OPTION_26" },
		rand_weight = 30
	},
	{
		-- suite_id = 1,
		-- description = 怪物-宝箱-怪物,
		monsters = { 49, 50 },
		gadgets = { 14, 53, 54, 55, 56, 57, 68, 139 },
		regions = { 27, 28, 29 },
		triggers = { "GADGET_CREATE_27", "SELECT_OPTION_28", "SELECT_OPTION_29" },
		rand_weight = 40
	},
	{
		-- suite_id = 2,
		-- description = 怪物-怪物-宝箱,
		monsters = { 51, 52 },
		gadgets = { 15, 53, 54, 55, 56, 57, 68, 140 },
		regions = { 30, 31, 32 },
		triggers = { "GADGET_CREATE_30", "SELECT_OPTION_31", "SELECT_OPTION_32" },
		rand_weight = 30
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_GADGET_CREATE_24(context, evt)
	if 13 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_CREATE_24(context, evt)
	-- 设置操作台选项
	if 0 ~= ScriptLib.SetWorktopOptions(context, {1}) then
		return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_SELECT_OPTION_25(context, evt)
	-- 判断是gadgetid 13
	if 13 ~= evt.param1 then
			return false
		end
	
	return true
end

-- 触发操作
function action_EVENT_SELECT_OPTION_25(context, evt)
	-- 调用提示id为 1042091 的提示UI，会显示在屏幕中央偏下位置，id索引自 ReminderData表格
	if 0 ~= ScriptLib.ShowReminder(context, 1042091) then
		return -1
	end
	
	-- 根据不同的选项做不同的操作
	if 1 == evt.param2 then
		if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 68, GadgetState.GearStart) then
			return -1
		end 
		return 0
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_SELECT_OPTION_26(context, evt)
	-- 判断是gadgetid 13
	if 13 ~= evt.param1 then
			return false
		end
	
	return true
end

-- 触发操作
function action_EVENT_SELECT_OPTION_26(context, evt)
	-- 根据不同的选项做不同的操作
	if 1 == evt.param2 then
		if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 68, GadgetState.GearStart) then
			return -1
		end 
		return 0
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_GADGET_CREATE_27(context, evt)
	if 14 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_CREATE_27(context, evt)
	-- 设置操作台选项
	if 0 ~= ScriptLib.SetWorktopOptions(context, {1}) then
		return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_SELECT_OPTION_28(context, evt)
	-- 判断是gadgetid 14
	if 14 ~= evt.param1 then
			return false
		end
	
	return true
end

-- 触发操作
function action_EVENT_SELECT_OPTION_28(context, evt)
	-- 调用提示id为 1042091 的提示UI，会显示在屏幕中央偏下位置，id索引自 ReminderData表格
	if 0 ~= ScriptLib.ShowReminder(context, 1042091) then
		return -1
	end
	
	-- 根据不同的选项做不同的操作
	if 1 == evt.param2 then
		if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 68, GadgetState.GearStart) then
			return -1
		end 
		return 0
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_SELECT_OPTION_29(context, evt)
	-- 判断是gadgetid 14
	if 14 ~= evt.param1 then
			return false
		end
	
	return true
end

-- 触发操作
function action_EVENT_SELECT_OPTION_29(context, evt)
	-- 根据不同的选项做不同的操作
	if 1 == evt.param2 then
		if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 14, GadgetState.GearStart) then
			return -1
		end 
		return 0
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_GADGET_CREATE_30(context, evt)
	if 15 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_CREATE_30(context, evt)
	-- 设置操作台选项
	if 0 ~= ScriptLib.SetWorktopOptions(context, {1}) then
		return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_SELECT_OPTION_31(context, evt)
	-- 判断是gadgetid 15
	if 15 ~= evt.param1 then
			return false
		end
	
	return true
end

-- 触发操作
function action_EVENT_SELECT_OPTION_31(context, evt)
	if 0 ~= ScriptLib.ShowReminder(context, 1042091) then
		return -1
	end
	
	-- 根据不同的选项做不同的操作
	if 1 == evt.param2 then
		if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 68, GadgetState.GearStart) then
			return -1
		end 
		return 0
	end
	
	
	return 0
end

-- 触发条件
function condition_EVENT_SELECT_OPTION_32(context, evt)
	-- 判断是gadgetid 15
	if 15 ~= evt.param1 then
			return false
		end
	
	return true
end

-- 触发操作
function action_EVENT_SELECT_OPTION_32(context, evt)
	-- 根据不同的选项做不同的操作
	if 1 == evt.param2 then
		if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 15, GadgetState.GearStart) then
			return -1
		end 
		return 0
	end
	
	return 0
end
