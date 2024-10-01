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
	{ config_id = 1187, gadget_id = 70620001, pos = { x = 2630.9, y = 260.8, z = -385.5 }, rot = { x = 0.0, y = 26.5, z = 0.0 }, level = 1 },
	{ config_id = 1188, gadget_id = 70500000, pos = { x = 2630.9, y = 261.9, z = -385.5 }, rot = { x = 0.0, y = 234.1, z = 0.0 }, level = 1, point_type = 4001001, isOneoff = true }
}

-- 区域
regions = {
	{ config_id = 229, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2630.7, y = 260.3, z = -386.3 } }
}

-- 触发器
triggers = {
	{ name = "GATHER_229", event = EventType.EVENT_GATHER, source = "1188", condition = "", action = "action_EVENT_GATHER_229" }
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
		gadgets = { 1187, 1188 },
		regions = { 229 },
		triggers = { "GATHER_229" },
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
function action_EVENT_GATHER_229(context, evt)
		-- 永久关闭CongfigId的Gadget，需要和Groups的RefreshWithBlock标签搭配
		if 0 ~= ScriptLib.KillEntityByConfigId(context, { config_id = 1187 }) then
		    return -1
		end
		
	
	return 0
end
