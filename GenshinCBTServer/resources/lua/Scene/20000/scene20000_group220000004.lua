--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 9, monster_id = 21020101, pos = { x = -67.1, y = 0.5, z = -37.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 10, monster_id = 20011001, pos = { x = -70.0, y = 0.5, z = -41.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 11, monster_id = 20011001, pos = { x = -69.5, y = 0.5, z = -33.9 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 12, monster_id = 21020201, pos = { x = -74.5, y = 0.5, z = -38.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 9, gadget_id = 70350002, pos = { x = -42.4, y = 0.5, z = -37.5 }, rot = { x = 0.0, y = 90.0, z = 0.0 }, level = 1 },
	{ config_id = 10, gadget_id = 70360002, pos = { x = -39.9, y = 0.4, z = -33.8 }, rot = { x = 0.0, y = 108.3, z = 0.0 }, level = 1 }
}

-- 区域
regions = {
	{ config_id = 13, shape = RegionShape.SPHERE, radius = 5, pos = { x = -39.4, y = 0.4, z = -37.4 } },
	{ config_id = 14, shape = RegionShape.SPHERE, radius = 5, pos = { x = -42.0, y = 0.4, z = -37.4 } },
	{ config_id = 15, shape = RegionShape.SPHERE, radius = 5, pos = { x = -38.7, y = 0.4, z = -33.9 } }
}

-- 触发器
triggers = {
	{ name = "GADGET_CREATE_13", event = EventType.EVENT_GADGET_CREATE, source = "", condition = "condition_EVENT_GADGET_CREATE_13", action = "action_EVENT_GADGET_CREATE_13" },
	{ name = "SELECT_OPTION_14", event = EventType.EVENT_SELECT_OPTION, source = "", condition = "condition_EVENT_SELECT_OPTION_14", action = "action_EVENT_SELECT_OPTION_14" },
	{ name = "SELECT_OPTION_15", event = EventType.EVENT_SELECT_OPTION, source = "", condition = "condition_EVENT_SELECT_OPTION_15", action = "action_EVENT_SELECT_OPTION_15" }
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
		gadgets = { 9, 10 },
		regions = { 13, 14, 15 },
		triggers = { "GADGET_CREATE_13", "SELECT_OPTION_14", "SELECT_OPTION_15" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_GADGET_CREATE_13(context, evt)
	if 10 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_CREATE_13(context, evt)
	-- 设置操作台选项
	if 0 ~= ScriptLib.SetWorktopOptions(context, {120,121}) then
		return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_SELECT_OPTION_14(context, evt)
	-- 判断是gadgetid 10
	if 10 ~= evt.param1 then
			return false
		end
	
	return true
end

-- 触发操作
function action_EVENT_SELECT_OPTION_14(context, evt)
	-- 根据不同的选项做不同的操作
	if 120 == evt.param2 then
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 13, delay_time = 0 }) then
	  return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 14, delay_time = 0 }) then
	  return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 15, delay_time = 0 }) then
	  return -1
	end
		if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 9, GadgetState.GearStart) then
			return -1
		end 
		return 0
	end
	
	
	return 0
end

-- 触发条件
function condition_EVENT_SELECT_OPTION_15(context, evt)
	-- 判断是gadgetid 10
	if 10 ~= evt.param1 then
			return false
		end
	
	return true
end

-- 触发操作
function action_EVENT_SELECT_OPTION_15(context, evt)
	-- 根据不同的选项做不同的操作
	if 121 == evt.param2 then
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 16, delay_time = 0 }) then
	  return -1
	end
		if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 9, GadgetState.Default) then
			return -1
		end 
		return 0
	end
	
	
	return 0
end
