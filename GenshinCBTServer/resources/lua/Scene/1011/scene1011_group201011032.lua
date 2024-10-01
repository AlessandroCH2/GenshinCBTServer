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
	{ config_id = 254, gadget_id = 70360002, pos = { x = 572.0, y = 0.6, z = -44.7 }, rot = { x = 0.0, y = 270.5, z = 0.0 }, level = 1 }
}

-- 区域
regions = {
	{ config_id = 89, shape = RegionShape.SPHERE, radius = 5, pos = { x = 568.1, y = 4.8, z = -45.2 } },
	{ config_id = 90, shape = RegionShape.SPHERE, radius = 5, pos = { x = 574.7, y = 0.6, z = -44.9 } }
}

-- 触发器
triggers = {
	{ name = "GADGET_CREATE_89", event = EventType.EVENT_GADGET_CREATE, source = "", condition = "condition_EVENT_GADGET_CREATE_89", action = "action_EVENT_GADGET_CREATE_89" },
	{ name = "SELECT_OPTION_90", event = EventType.EVENT_SELECT_OPTION, source = "", condition = "condition_EVENT_SELECT_OPTION_90", action = "action_EVENT_SELECT_OPTION_90", trigger_count = 0 }
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
		gadgets = { 254 },
		regions = { 89, 90 },
		triggers = { "GADGET_CREATE_89", "SELECT_OPTION_90" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_GADGET_CREATE_89(context, evt)
	if 254 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_CREATE_89(context, evt)
	-- 设置操作台选项
	if 0 ~= ScriptLib.SetWorktopOptions(context, {151,166,167}) then
		return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_SELECT_OPTION_90(context, evt)
	if 254 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_SELECT_OPTION_90(context, evt)
	-- 根据不同的选项做不同的操作
	if 151 == evt.param2 then
		 if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 201011010, refresh_level_revise = 1}) then
			return -1
		end
		return 0
	end
	
	if 166 == evt.param2 then
		 if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 201011010, refresh_level_revise = 7}) then
			return -1
		end
		return 0
	end
	
	if 167 == evt.param2 then
		 if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 201011010, refresh_level_revise = 16}) then
			return -1
		end
		return 0
	end
	
	
	return 0
end
