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
	{ config_id = 1017, gadget_id = 70500000, pos = { x = 1627.6, y = 266.4, z = -440.2 }, rot = { x = 0.0, y = 123.5, z = 0.0 }, level = 1, point_type = 4001001, isOneoff = true },
	{ config_id = 1568, gadget_id = 70500000, pos = { x = 1932.8, y = 236.8, z = -950.2 }, rot = { x = 0.0, y = 123.5, z = 0.0 }, level = 1, point_type = 4001001, isOneoff = true }
}

-- 区域
regions = {
	{ config_id = 64, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1613.9, y = 233.0, z = -463.6 } }
}

-- 触发器
triggers = {
	{ name = "GATHER_64", event = EventType.EVENT_GATHER, source = "1017", condition = "", action = "action_EVENT_GATHER_64" }
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
		gadgets = { 1017, 1568 },
		regions = { 64 },
		triggers = { "GATHER_64" },
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
function action_EVENT_GATHER_64(context, evt)
		-- 重新生成指定group，指定suite
		if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 133002074, suite = 1 }) then
			return -1
		end
	
	return 0
end
