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
	{ config_id = 307, gadget_id = 70310003, pos = { x = 2143.3, y = 233.0, z = -456.2 }, rot = { x = 0.0, y = 287.8, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 308, gadget_id = 70220013, pos = { x = 2146.3, y = 232.5, z = -460.6 }, rot = { x = 3.4, y = 118.3, z = 354.7 }, level = 1 },
	{ config_id = 309, gadget_id = 70220014, pos = { x = 2146.7, y = 233.0, z = -458.1 }, rot = { x = 0.1, y = 202.5, z = 0.2 }, level = 1 },
	{ config_id = 310, gadget_id = 70210011, pos = { x = 2147.9, y = 232.9, z = -459.0 }, rot = { x = 0.0, y = 9.3, z = 355.3 }, level = 1, chest_drop_id = 403301, isOneoff = true },
	{ config_id = 474, gadget_id = 70220005, pos = { x = 2144.0, y = 232.7, z = -459.9 }, rot = { x = 0.0, y = 145.3, z = 0.0 }, level = 1 }
}

-- 区域
regions = {
	{ config_id = 112, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2147.9, y = 232.8, z = -459.2 } },
	{ config_id = 113, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2147.9, y = 232.8, z = -459.2 } }
}

-- 触发器
triggers = {
	{ name = "CLIENT_EXECUTE_112", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_112", trigger_count = 0 },
	{ name = "CLIENT_EXECUTE_113", event = EventType.EVENT_CLIENT_EXECUTE, source = "FireSourceChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_113", trigger_count = 0 }
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
		gadgets = { 307, 308, 309, 310, 474 },
		regions = { 112, 113 },
		triggers = { "CLIENT_EXECUTE_112", "CLIENT_EXECUTE_113" },
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
function action_EVENT_CLIENT_EXECUTE_112(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_113(context, evt)
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
