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
	{ config_id = 23, gadget_id = 70900018, pos = { x = 66.7, y = 0.8, z = -87.2 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 24, gadget_id = 70900018, pos = { x = 50.6, y = 0.7, z = -86.9 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 25, gadget_id = 70220013, pos = { x = 67.9, y = 0.5, z = -86.6 }, rot = { x = 0.0, y = 40.0, z = 0.0 }, level = 1 },
	{ config_id = 26, gadget_id = 70210031, pos = { x = 59.0, y = 0.5, z = -83.8 }, rot = { x = 0.0, y = 75.5, z = 0.0 }, level = 1, chest_drop_id = 1100302, showcutscene = true }
}

-- 区域
regions = {
	{ config_id = 25, shape = RegionShape.SPHERE, radius = 5, pos = { x = 68.2, y = 0.5, z = -82.6 } }
}

-- 触发器
triggers = {
	{ name = "ANY_GADGET_DIE_25", event = EventType.EVENT_ANY_GADGET_DIE, source = "", condition = "condition_EVENT_ANY_GADGET_DIE_25", action = "action_EVENT_ANY_GADGET_DIE_25" }
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
		gadgets = { 23, 24, 25 },
		regions = { 25 },
		triggers = { "ANY_GADGET_DIE_25" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ANY_GADGET_DIE_25(context, evt)
	ScriptLib.PrintLog("enter condition")
	if 25 ~= evt.param1 then
	ScriptLib.PrintLog("configid judge false")
		return false
	end
	
	ScriptLib.PrintLog("configid judge true")
	return true
end

-- 触发操作
function action_EVENT_ANY_GADGET_DIE_25(context, evt)
	ScriptLib.PrintLog("enter action")
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 26 }) then
	ScriptLib.PrintLog("create gadget fail")
		return -1
	end
	
	return 0
end
