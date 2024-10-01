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
}

-- 区域
regions = {
	{ config_id = 43, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1597.2, y = 262.9, z = -549.3 } }
}

-- 触发器
triggers = {
	{ name = "GATHER_43", event = EventType.EVENT_GATHER, source = "954", condition = "", action = "action_EVENT_GATHER_43" }
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
		gadgets = { },
		regions = { 43 },
		triggers = { "GATHER_43" },
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
function action_EVENT_GATHER_43(context, evt)
	-- 创生gadget 955
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 955 }) then
		return -1
	end
	
	return 0
end
