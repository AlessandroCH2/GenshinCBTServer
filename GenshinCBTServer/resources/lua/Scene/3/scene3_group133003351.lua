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
	{ config_id = 3481, gadget_id = 70900009, pos = { x = 2328.0, y = 308.6, z = -1756.5 }, rot = { x = 0.0, y = 245.9, z = 0.0 }, level = 1, persistent = true }
}

-- 区域
regions = {
	{ config_id = 415, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2336.4, y = 285.7, z = -1754.3 } }
}

-- 触发器
triggers = {
	{ name = "GADGET_STATE_CHANGE_415", event = EventType.EVENT_GADGET_STATE_CHANGE, source = "", condition = "", action = "action_EVENT_GADGET_STATE_CHANGE_415" }
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
		gadgets = { },
		regions = { },
		triggers = { },
		rand_weight = 100
	},
	{
		-- suite_id = 1,
		-- description = suite_2,
		monsters = { },
		gadgets = { 3481 },
		regions = { 415 },
		triggers = { "GADGET_STATE_CHANGE_415" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件

-- 触发操作
function action_EVENT_GADGET_STATE_CHANGE_415(context, evt)
		-- 重新生成指定group，指定suite
		if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 133003352, suite = 2 }) then
			return -1
		end
	
	return 0
end
