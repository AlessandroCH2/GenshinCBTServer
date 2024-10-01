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
	{ config_id = 1941, gadget_id = 70300055, pos = { x = 1821.5, y = 218.2, z = -411.7 }, rot = { x = 0.0, y = 281.7, z = 0.0 }, level = 9 },
	{ config_id = 1965, gadget_id = 70300055, pos = { x = 1818.8, y = 218.3, z = -417.9 }, rot = { x = 0.0, y = 311.0, z = 0.0 }, level = 9 },
	{ config_id = 1966, gadget_id = 70300055, pos = { x = 1815.3, y = 218.1, z = -391.4 }, rot = { x = 0.0, y = 279.9, z = 0.0 }, level = 9 },
	{ config_id = 1967, gadget_id = 70300063, pos = { x = 1815.4, y = 218.1, z = -391.5 }, rot = { x = 0.0, y = 278.9, z = 0.0 }, level = 1 },
	{ config_id = 1968, gadget_id = 70300063, pos = { x = 1821.7, y = 218.2, z = -411.6 }, rot = { x = 0.0, y = 278.9, z = 0.0 }, level = 1 },
	{ config_id = 1969, gadget_id = 70300063, pos = { x = 1818.8, y = 218.3, z = -418.0 }, rot = { x = 0.0, y = 313.7, z = 0.0 }, level = 1 }
}

-- 区域
regions = {
	{ config_id = 276, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1815.2, y = 218.7, z = -392.4 } }
}

-- 触发器
triggers = {
	{ name = "ANY_GADGET_DIE_276", event = EventType.EVENT_ANY_GADGET_DIE, source = "", condition = "condition_EVENT_ANY_GADGET_DIE_276", action = "action_EVENT_ANY_GADGET_DIE_276", trigger_count = 0 }
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
		gadgets = { 1967, 1968, 1969 },
		regions = { },
		triggers = { },
		rand_weight = 100
	},
	{
		-- suite_id = 1,
		-- description = suite_2,
		monsters = { },
		gadgets = { 1941, 1965, 1966 },
		regions = { 276 },
		triggers = { "ANY_GADGET_DIE_276" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ANY_GADGET_DIE_276(context, evt)
	if 1941 == evt.param1 then
		return true
	end
	
	if 1965== evt.param1 then
		return true
	end
	
	if 1966 == evt.param1 then
		return true
	end
	
	return false
end

-- 触发操作
function action_EVENT_ANY_GADGET_DIE_276(context, evt)
	-- 通知任务系统完成条件类型"LUA通知"，复杂参数为quest_param的进度+1
	if 0 ~= ScriptLib.AddQuestProgress(context, "133002227") then
	  return -1
	end
	
	return 0
end
