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
	{ config_id = 1492, gadget_id = 70900007, pos = { x = 1960.1, y = 240.2, z = -460.1 }, rot = { x = 1.0, y = 161.9, z = 356.1 }, level = 1, persistent = true }
}

-- 区域
regions = {
	{ config_id = 179, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1960.3, y = 240.2, z = -460.1 } }
}

-- 触发器
triggers = {
	{ name = "GADGET_STATE_CHANGE_179", event = EventType.EVENT_GADGET_STATE_CHANGE, source = "", condition = "condition_EVENT_GADGET_STATE_CHANGE_179", action = "action_EVENT_GADGET_STATE_CHANGE_179", trigger_count = 0 }
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
		gadgets = { 1492 },
		regions = { 179 },
		triggers = { "GADGET_STATE_CHANGE_179" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_GADGET_STATE_CHANGE_179(context, evt)
	if 1492 ~= evt.param2 or GadgetState.GearStart ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_STATE_CHANGE_179(context, evt)
		-- 重新生成指定group，指定suite
		if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 133002171, suite = 2 }) then
			return -1
		end
	
	return 0
end
