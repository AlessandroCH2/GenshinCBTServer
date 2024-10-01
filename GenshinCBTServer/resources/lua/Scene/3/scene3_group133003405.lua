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
	{ config_id = 3949, gadget_id = 70210031, pos = { x = 2879.4, y = 272.6, z = -1547.6 }, rot = { x = 0.0, y = 264.9, z = 6.5 }, level = 1, chest_drop_id = 403223, isOneoff = true, type = GadgetType.GADGET_WORLD_CHECT },
	{ config_id = 3950, gadget_id = 70620001, pos = { x = 2879.4, y = 272.6, z = -1547.6 }, rot = { x = 0.0, y = 359.2, z = 0.0 }, level = 1 }
}

-- 区域
regions = {
	{ config_id = 492, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2879.2, y = 272.6, z = -1547.8 } }
}

-- 触发器
triggers = {
	{ name = "GADGET_STATE_CHANGE_492", event = EventType.EVENT_GADGET_STATE_CHANGE, source = "", condition = "condition_EVENT_GADGET_STATE_CHANGE_492", action = "action_EVENT_GADGET_STATE_CHANGE_492" }
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
		gadgets = { 3949, 3950 },
		regions = { 492 },
		triggers = { "GADGET_STATE_CHANGE_492" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_GADGET_STATE_CHANGE_492(context, evt)
	if 3949 ~= evt.param2 or GadgetState.ChestOpened ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_STATE_CHANGE_492(context, evt)
		-- 永久关闭CongfigId的Gadget，需要和Groups的RefreshWithBlock标签搭配
		if 0 ~= ScriptLib.KillEntityByConfigId(context, { config_id = 3950 }) then
		    return -1
		end
		
	
	return 0
end
