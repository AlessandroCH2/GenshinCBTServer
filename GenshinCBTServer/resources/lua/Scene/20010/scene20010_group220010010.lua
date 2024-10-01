--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 71, monster_id = 21020201, pos = { x = 533.3, y = -1.9, z = 248.6 }, rot = { x = 0.0, y = 180.0, z = 0.0 }, level = 0, disableWander = true, affix = { 1001, 1004 }, isElite = true },
	{ config_id = 72, monster_id = 21030201, pos = { x = 537.2, y = -1.9, z = 256.6 }, rot = { x = 0.0, y = 185.0, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 85, monster_id = 21011001, pos = { x = 530.1, y = -2.2, z = 255.7 }, rot = { x = 0.0, y = 172.3, z = 0.0 }, level = 0, disableWander = true }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 104, gadget_id = 70350002, pos = { x = 532.8, y = -2.1, z = 220.7 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 105, gadget_id = 70360002, pos = { x = 529.8, y = -2.2, z = 217.8 }, rot = { x = 0.0, y = 180.0, z = 0.0 }, level = 1 },
	{ config_id = 136, gadget_id = 70310001, pos = { x = 525.9, y = -2.0, z = 247.9 }, rot = { x = 0.0, y = 11.9, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 137, gadget_id = 70310001, pos = { x = 540.4, y = -2.0, z = 247.8 }, rot = { x = 0.0, y = 359.9, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 158, gadget_id = 70220005, pos = { x = 547.4, y = -2.1, z = 240.2 }, rot = { x = 0.0, y = 291.1, z = 0.0 }, level = 1 },
	{ config_id = 159, gadget_id = 70220005, pos = { x = 547.3, y = -2.1, z = 232.7 }, rot = { x = 0.0, y = 174.7, z = 0.0 }, level = 1 },
	{ config_id = 160, gadget_id = 70220005, pos = { x = 519.3, y = -2.1, z = 239.7 }, rot = { x = 0.0, y = 27.1, z = 0.0 }, level = 1 },
	{ config_id = 161, gadget_id = 70220005, pos = { x = 518.9, y = -2.1, z = 232.5 }, rot = { x = 0.0, y = 186.5, z = 0.0 }, level = 1 }
}

-- 区域
regions = {
	{ config_id = 48, shape = RegionShape.SPHERE, radius = 5, pos = { x = 533.4, y = -2.2, z = 218.9 } },
	{ config_id = 49, shape = RegionShape.SPHERE, radius = 5, pos = { x = 534.9, y = -2.2, z = 218.6 } },
	{ config_id = 50, shape = RegionShape.SPHERE, radius = 5, pos = { x = 533.6, y = -2.2, z = 218.8 } },
	{ config_id = 73, shape = RegionShape.SPHERE, radius = 5, pos = { x = 533.9, y = -2.0, z = 252.8 } }
}

-- 触发器
triggers = {
	{ name = "GADGET_CREATE_48", event = EventType.EVENT_GADGET_CREATE, source = "", condition = "condition_EVENT_GADGET_CREATE_48", action = "action_EVENT_GADGET_CREATE_48" },
	{ name = "SELECT_OPTION_49", event = EventType.EVENT_SELECT_OPTION, source = "", condition = "condition_EVENT_SELECT_OPTION_49", action = "action_EVENT_SELECT_OPTION_49" },
	{ name = "SELECT_OPTION_50", event = EventType.EVENT_SELECT_OPTION, source = "", condition = "condition_EVENT_SELECT_OPTION_50", action = "action_EVENT_SELECT_OPTION_50" },
	{ name = "DUNGEON_SETTLE_73", event = EventType.EVENT_DUNGEON_SETTLE, source = "", condition = "condition_EVENT_DUNGEON_SETTLE_73", action = "action_EVENT_DUNGEON_SETTLE_73" }
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
		monsters = { 71, 72, 85 },
		gadgets = { 104, 105, 136, 137, 158, 159, 160, 161 },
		regions = { 48, 49, 50, 73 },
		triggers = { "GADGET_CREATE_48", "SELECT_OPTION_49", "SELECT_OPTION_50", "DUNGEON_SETTLE_73" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_GADGET_CREATE_48(context, evt)
	if 105 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_CREATE_48(context, evt)
	-- 设置操作台选项
	if 0 ~= ScriptLib.SetWorktopOptions(context, {1}) then
		return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_SELECT_OPTION_49(context, evt)
	-- 判断是gadgetid 105
	if 105 ~= evt.param1 then
			return false
		end
	
	return true
end

-- 触发操作
function action_EVENT_SELECT_OPTION_49(context, evt)
	-- 根据不同的选项做不同的操作
	if 1 == evt.param2 then
		if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 104, GadgetState.GearStart) then
			return -1
		end 
		return 0
	end
	
	-- 根据不同的选项做不同的操作
	if 1 == evt.param2 then
		if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 105, GadgetState.GearStart) then
			return -1
		end 
		return 0
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_SELECT_OPTION_50(context, evt)
	-- 判断是gadgetid 105
	if 105 ~= evt.param1 then
			return false
		end
	
	return true
end

-- 触发操作
function action_EVENT_SELECT_OPTION_50(context, evt)
	-- 根据不同的选项做不同的操作
	if 1 == evt.param2 then
		if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 105, GadgetState.GearStart) then
			return -1
		end 
		return 0
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_DUNGEON_SETTLE_73(context, evt)
	-- 判断副本成功
	if 1 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_DUNGEON_SETTLE_73(context, evt)
	-- 创生gadget 164
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 164 }) then
		return -1
	end
	
	return 0
end
