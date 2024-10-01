--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 911, monster_id = 21010701, pos = { x = 2764.5, y = 259.9, z = -1231.2 }, rot = { x = 0.0, y = 184.2, z = 0.0 }, level = 10, drop_id = 303042, disableWander = true },
	{ config_id = 912, monster_id = 21010101, pos = { x = 2764.6, y = 259.4, z = -1234.5 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 10, drop_id = 303042, disableWander = true },
	{ config_id = 913, monster_id = 21010101, pos = { x = 2766.8, y = 259.8, z = -1232.3 }, rot = { x = 0.0, y = 270.6, z = 0.0 }, level = 10, drop_id = 303042, disableWander = true },
	{ config_id = 914, monster_id = 21010501, pos = { x = 2789.6, y = 265.8, z = -1219.3 }, rot = { x = 0.0, y = 250.5, z = 0.0 }, level = 10, drop_id = 303042, disableWander = true }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 3008, gadget_id = 70310004, pos = { x = 2764.4, y = 259.7, z = -1232.6 }, rot = { x = 0.0, y = 118.4, z = 0.0 }, level = 1 }
}

-- 区域
regions = {
	{ config_id = 358, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2764.7, y = 259.7, z = -1232.5 } },
	{ config_id = 434, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2764.7, y = 259.7, z = -1232.5 } }
}

-- 触发器
triggers = {
	{ name = "CLIENT_EXECUTE_358", event = EventType.EVENT_CLIENT_EXECUTE, source = "FireSourceChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_358", trigger_count = 0 },
	{ name = "CLIENT_EXECUTE_434", event = EventType.EVENT_CLIENT_EXECUTE, source = "FireSourceChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_434", trigger_count = 0 }
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
		monsters = { 911, 912, 913, 914 },
		gadgets = { 3008 },
		regions = { 358, 434 },
		triggers = { "CLIENT_EXECUTE_358", "CLIENT_EXECUTE_434" },
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
function action_EVENT_CLIENT_EXECUTE_358(context, evt)
	local this_gadget = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
	local this_group = ScriptLib.GetContextGroupId(context)
	if evt.param1 == 1 then
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_gadget, GadgetState.GearStart )
		return 0
	end
	if evt.param1 == 0 then
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_gadget, GadgetState.Defautl )
		return 0
	end
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_434(context, evt)
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
