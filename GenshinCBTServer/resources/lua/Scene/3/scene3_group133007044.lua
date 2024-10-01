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
	{ config_id = 370, gadget_id = 70900039, pos = { x = 2761.6, y = 239.1, z = 399.6 }, rot = { x = 0.0, y = 277.8, z = 0.0 }, level = 1, persistent = true }
}

-- 区域
regions = {
	{ config_id = 260, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2762.8, y = 239.0, z = 400.1 } }
}

-- 触发器
triggers = {
	{ name = "GADGET_STATE_CHANGE_260", event = EventType.EVENT_GADGET_STATE_CHANGE, source = "", condition = "condition_EVENT_GADGET_STATE_CHANGE_260", action = "action_EVENT_GADGET_STATE_CHANGE_260", trigger_count = 0 }
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
	rand_suite = false,
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
		gadgets = { 370 },
		regions = { 260 },
		triggers = { "GADGET_STATE_CHANGE_260" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_GADGET_STATE_CHANGE_260(context, evt)
	if 370 ~= evt.param2 or GadgetState.GearStart ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_STATE_CHANGE_260(context, evt)
		-- 重新生成指定group，指定suite
		if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 133007221, suite = 2 }) then
			return -1
		end
	
	return 0
end
