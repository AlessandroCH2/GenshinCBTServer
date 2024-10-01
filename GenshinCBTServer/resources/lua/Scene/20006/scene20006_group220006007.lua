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
	{ config_id = 84, gadget_id = 70360002, pos = { x = 214.0, y = 46.1, z = 177.7 }, rot = { x = 0.0, y = 225.0, z = 0.0 }, level = 1 },
	{ config_id = 141, gadget_id = 70210041, pos = { x = 199.5, y = 58.3, z = 285.6 }, rot = { x = 0.0, y = 180.9, z = 0.0 }, level = 1, chest_drop_id = 1000701 }
}

-- 区域
regions = {
	{ config_id = 24, shape = RegionShape.SPHERE, radius = 5, pos = { x = 190.6, y = 47.1, z = 183.3 } },
	{ config_id = 25, shape = RegionShape.SPHERE, radius = 5, pos = { x = 190.4, y = 48.2, z = 185.3 } },
	{ config_id = 27, shape = RegionShape.SPHERE, radius = 5, pos = { x = 192.1, y = 46.3, z = 182.0 } },
	{ config_id = 33, shape = RegionShape.SPHERE, radius = 5, pos = { x = 191.9, y = 49.2, z = 186.9 } }
}

-- 触发器
triggers = {
	{ name = "GADGET_CREATE_24", event = EventType.EVENT_GADGET_CREATE, source = "", condition = "condition_EVENT_GADGET_CREATE_24", action = "action_EVENT_GADGET_CREATE_24" },
	{ name = "SELECT_OPTION_25", event = EventType.EVENT_SELECT_OPTION, source = "", condition = "condition_EVENT_SELECT_OPTION_25", action = "action_EVENT_SELECT_OPTION_25" },
	{ name = "SELECT_OPTION_27", event = EventType.EVENT_SELECT_OPTION, source = "", condition = "condition_EVENT_SELECT_OPTION_27", action = "action_EVENT_SELECT_OPTION_27" },
	{ name = "SELECT_OPTION_33", event = EventType.EVENT_SELECT_OPTION, source = "", condition = "condition_EVENT_SELECT_OPTION_33", action = "action_EVENT_SELECT_OPTION_33", trigger_count = 0 }
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
		-- description = suite_1,
		monsters = { },
		gadgets = { 84, 141 },
		regions = { 24, 25, 27, 33 },
		triggers = { "GADGET_CREATE_24", "SELECT_OPTION_25", "SELECT_OPTION_27", "SELECT_OPTION_33" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_GADGET_CREATE_24(context, evt)
	-- 判断是gadgetid 84
	if 84 ~= evt.param1 then
			return false
		end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_CREATE_24(context, evt)
	-- 设置操作台选项
	if 0 ~= ScriptLib.SetWorktopOptions(context, {2}) then
		return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_SELECT_OPTION_25(context, evt)
	-- 判断是gadgetid 84
	if 84 ~= evt.param1 then
			return false
		end
	
	return true
end

-- 触发操作
function action_EVENT_SELECT_OPTION_25(context, evt)
	-- 根据不同的选项解锁风场
	if 2 == evt.param2 then
		if 0 ~= ScriptLib.UnlockForce(context, 1) then
		   return -1
	    end
	if 0 ~= ScriptLib.ShowReminder(context, 1030001) then
		return -1
	end
	
	
		return 0
	end
	
	
	
end

-- 触发条件
function condition_EVENT_SELECT_OPTION_27(context, evt)
	-- 判断是gadgetid 84
	if 84 ~= evt.param1 then
			return false
		end
	
	return true
end

-- 触发操作
function action_EVENT_SELECT_OPTION_27(context, evt)
	-- 根据不同的选项做不同的操作
	if 2 == evt.param2 then
		if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 84, GadgetState.GearStart) then
			return -1
		end 
		return 0
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_SELECT_OPTION_33(context, evt)
	-- 判断是gadgetid 84
	if 84 ~= evt.param1 then
			return false
		end
	
	return true
end

-- 触发操作
function action_EVENT_SELECT_OPTION_33(context, evt)
	pos = {x=236, y=52.8, z=181.6}
	if 0 ~= ScriptLib.BeginCameraSceneLook(context, { look_pos = pos, duration = 3.5, is_force = true, is_broadcast = false }) then
		return -1
	end
	
	return 0
end
