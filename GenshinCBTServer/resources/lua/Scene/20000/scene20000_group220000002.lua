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
	{ config_id = 3, gadget_id = 70350002, pos = { x = 59.1, y = 0.5, z = -57.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 4, gadget_id = 70350003, pos = { x = 23.6, y = 0.5, z = -57.7 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 5, gadget_id = 70360002, pos = { x = 54.9, y = 0.5, z = -54.9 }, rot = { x = 0.0, y = 358.3, z = 0.0 }, level = 1 },
	{ config_id = 6, gadget_id = 70360002, pos = { x = 20.0, y = 0.5, z = -55.2 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 }
}

-- 区域
regions = {
	{ config_id = 6, shape = RegionShape.SPHERE, radius = 5, pos = { x = 58.3, y = 0.5, z = -53.5 } },
	{ config_id = 7, shape = RegionShape.SPHERE, radius = 5, pos = { x = 58.3, y = 0.5, z = -53.5 } },
	{ config_id = 8, shape = RegionShape.SPHERE, radius = 5, pos = { x = 23.0, y = 0.5, z = -54.8 } },
	{ config_id = 9, shape = RegionShape.SPHERE, radius = 5, pos = { x = 23.1, y = 0.5, z = -54.8 } },
	{ config_id = 12, shape = RegionShape.SPHERE, radius = 5, pos = { x = 21.6, y = 0.4, z = 0.2 } }
}

-- 触发器
triggers = {
	{ name = "GADGET_CREATE_6", event = EventType.EVENT_GADGET_CREATE, source = "", condition = "condition_EVENT_GADGET_CREATE_6", action = "action_EVENT_GADGET_CREATE_6" },
	{ name = "SELECT_OPTION_7", event = EventType.EVENT_SELECT_OPTION, source = "", condition = "condition_EVENT_SELECT_OPTION_7", action = "action_EVENT_SELECT_OPTION_7", trigger_count = 0 },
	{ name = "GADGET_CREATE_8", event = EventType.EVENT_GADGET_CREATE, source = "", condition = "condition_EVENT_GADGET_CREATE_8", action = "action_EVENT_GADGET_CREATE_8" },
	{ name = "SELECT_OPTION_9", event = EventType.EVENT_SELECT_OPTION, source = "", condition = "condition_EVENT_SELECT_OPTION_9", action = "action_EVENT_SELECT_OPTION_9", trigger_count = 0 },
	{ name = "ENTER_REGION_12", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_12", action = "action_EVENT_ENTER_REGION_12" }
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
		gadgets = { 3, 4, 5, 6 },
		regions = { 6, 7, 8, 9, 12 },
		triggers = { "GADGET_CREATE_6", "SELECT_OPTION_7", "GADGET_CREATE_8", "SELECT_OPTION_9", "ENTER_REGION_12" },
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
	if 5 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_CREATE_6(context, evt)
	-- 设置操作台选项
	if 0 ~= ScriptLib.SetWorktopOptions(context, {1,4}) then
		return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_SELECT_OPTION_7(context, evt)
	-- 判断是gadgetid 5
	if 5 ~= evt.param1 then
			return false
		end
	
	return true
end

-- 触发操作
function action_EVENT_SELECT_OPTION_7(context, evt)
	-- 根据不同的选项做不同的操作
	if 1 == evt.param2 then
		if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 3, GadgetState.GearStart) then
			return -1
		end 
		return 0
	end
	
	-- 根据不同的选项做不同的操作
	if 4 == evt.param2 then
		if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 3, GadgetState.Default) then
			return -1
		end 
		return 0
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_GADGET_CREATE_8(context, evt)
	if 6 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_CREATE_8(context, evt)
	-- 设置操作台选项
	if 0 ~= ScriptLib.SetWorktopOptions(context, {1,4}) then
		return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_SELECT_OPTION_9(context, evt)
	-- 判断是gadgetid 6
	if 6 ~= evt.param1 then
			return false
		end
	
	return true
end

-- 触发操作
function action_EVENT_SELECT_OPTION_9(context, evt)
	-- 根据不同的选项做不同的操作
	if 1 == evt.param2 then
		if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 4, GadgetState.GearStart) then
			return -1
		end 
		return 0
	end
	
	-- 根据不同的选项做不同的操作
	if 4 == evt.param2 then
		if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 4, GadgetState.Default) then
			return -1
		end 
		return 0
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_12(context, evt)
	if evt.param1 ~= 12 then return false end
	
	-- 判断是gadgetid 5
	if 5 ~= evt.param1 then
			return false
		end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_12(context, evt)
	-- 根据不同的选项做不同的操作
	if 4 == evt.param2 then
		if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 3, GadgetState.Default) then
			return -1
		end 
		return -1
	end
	
	-- 杀死Group内所有monster
		if 0 ~= ScriptLib.KillGroupEntity(context, { group_id = 220000002, kill_policy = GroupKillPolicy.GROUP_KILL_MONSTER }) then
			return -1
		end
		
	
	return 0
end
