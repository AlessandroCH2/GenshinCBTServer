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
	{ config_id = 1790, gadget_id = 70210022, pos = { x = 1458.1, y = 242.2, z = -1533.4 }, rot = { x = 0.0, y = 283.4, z = 0.0 }, level = 1, chest_drop_id = 403323, state = GadgetState.ChestLocked, isOneoff = true, persistent = true },
	{ config_id = 1818, gadget_id = 70220021, pos = { x = 1461.5, y = 242.1, z = -1538.2 }, rot = { x = 0.0, y = 282.4, z = 0.0 }, level = 1 },
	{ config_id = 1819, gadget_id = 70220021, pos = { x = 1461.9, y = 242.3, z = -1529.4 }, rot = { x = 0.0, y = 63.3, z = 0.0 }, level = 1 },
	{ config_id = 2591, gadget_id = 70220021, pos = { x = 1460.3, y = 242.3, z = -1533.5 }, rot = { x = 0.0, y = 282.4, z = 0.0 }, level = 1 }
}

-- 区域
regions = {
	{ config_id = 241, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1455.6, y = 242.2, z = -1533.1 } },
	{ config_id = 297, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1446.8, y = 254.5, z = -1530.7 } }
}

-- 触发器
triggers = {
	{ name = "ANY_GADGET_DIE_241", event = EventType.EVENT_ANY_GADGET_DIE, source = "", condition = "condition_EVENT_ANY_GADGET_DIE_241", action = "action_EVENT_ANY_GADGET_DIE_241" },
	{ name = "CLIENT_EXECUTE_297", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_297", trigger_count = 0 }
}

-- 变量
variables = {
	{ name = "Key1", value = 0, persistent = false },
	{ name = "Key2", value = 0, persistent = false },
	{ name = "Key3", value = 0, persistent = false }
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
		gadgets = { 1790, 1818, 1819, 2591 },
		regions = { 241, 297 },
		triggers = { "ANY_GADGET_DIE_241", "CLIENT_EXECUTE_297" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ANY_GADGET_DIE_241(context, evt)
	if 2591 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_GADGET_DIE_241(context, evt)
	-- 将configid为 1790 的物件更改为状态 GadgetState.Default
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 1790, GadgetState.Default) then
			return -1
		end 
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_297(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end
