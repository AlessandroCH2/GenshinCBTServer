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
	{ config_id = 13, gadget_id = 70360002, pos = { x = 343.3, y = -19.3, z = 349.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 }
}

-- 区域
regions = {
	{ config_id = 41, shape = RegionShape.SPHERE, radius = 5, pos = { x = 337.8, y = -19.3, z = 353.7 } },
	{ config_id = 40, shape = RegionShape.SPHERE, radius = 5, pos = { x = 344.6, y = -19.3, z = 351.8 } }
}

-- 触发器
triggers = {
	{ name = "SELECT_OPTION_41", event = EventType.EVENT_SELECT_OPTION, source = "", condition = "condition_EVENT_SELECT_OPTION_41", action = "action_EVENT_SELECT_OPTION_41", trigger_count = 0 },
	{ name = "GADGET_CREATE_40", event = EventType.EVENT_GADGET_CREATE, source = "", condition = "condition_EVENT_GADGET_CREATE_40", action = "action_EVENT_GADGET_CREATE_40" }
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
		gadgets = { 13 },
		regions = { 41, 40 },
		triggers = { "SELECT_OPTION_41", "GADGET_CREATE_40" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_SELECT_OPTION_41(context, evt)
	if 13 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_SELECT_OPTION_41(context, evt)
	-- 根据不同的选项做不同的操作
	if 12 == evt.param2 then
		-- 将configid为 13 的物件更改为状态 GadgetState.GearStart
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 13, GadgetState.GearStart) then
			return -1
		end 
	
		-- 重新生成指定group，指定suite
		if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 240004007, suite = 1 }) then
			return -1
		end
	
	-- 删除指定group： 240004004 ；指定config：13；物件身上指定option：12；
	if 0 ~= ScriptLib.DelWorktopOptionByGroupId(context, 240004004, 13, 12) then
		return -1
	end
	
		return 0
	end
	
	
	return 0
end

-- 触发条件
function condition_EVENT_GADGET_CREATE_40(context, evt)
	if 13 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_CREATE_40(context, evt)
	-- 设置操作台选项
	if 0 ~= ScriptLib.SetWorktopOptions(context, {12}) then
		return -1
	end
	
	return 0
end
