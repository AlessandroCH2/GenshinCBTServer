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
	{ config_id = 3445, gadget_id = 70310004, pos = { x = 2515.6, y = 267.3, z = -1435.3 }, rot = { x = 0.0, y = 55.6, z = 353.4 }, level = 1 },
	{ config_id = 3446, gadget_id = 70210021, pos = { x = 2514.9, y = 267.7, z = -1430.4 }, rot = { x = 0.0, y = 168.2, z = 0.0 }, level = 1, chest_drop_id = 403322, isOneoff = true }
}

-- 区域
regions = {
	{ config_id = 426, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2516.7, y = 267.0, z = -1441.1 } },
	{ config_id = 501, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2517.7, y = 267.3, z = -1433.5 } }
}

-- 触发器
triggers = {
	{ name = "CLIENT_EXECUTE_426", event = EventType.EVENT_CLIENT_EXECUTE, source = "FireSourceChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_426", trigger_count = 0 },
	{ name = "GADGET_STATE_CHANGE_501", event = EventType.EVENT_GADGET_STATE_CHANGE, source = "", condition = "", action = "action_EVENT_GADGET_STATE_CHANGE_501" }
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
		gadgets = { 3445 },
		regions = { 426, 501 },
		triggers = { "CLIENT_EXECUTE_426", "GADGET_STATE_CHANGE_501" },
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
function action_EVENT_CLIENT_EXECUTE_426(context, evt)
	local this_gadget = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
	local this_group = ScriptLib.GetContextGroupId(context)
	if evt.param1 == 1 then
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_gadget, GadgetState.GearStart )
		return 0
	end
	if evt.param1 == 0 then
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_gadget, GadgetState.Default )
		return 0
	end
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_GADGET_STATE_CHANGE_501(context, evt)
	-- 创建id为3446的gadget
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 3446 }) then
	  return -1
	end
	
	return 0
end
