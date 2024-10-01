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
	{ config_id = 1496, gadget_id = 70620002, pos = { x = 1661.8, y = 232.6, z = -1172.7 }, rot = { x = 0.0, y = 117.6, z = 0.0 }, level = 1 },
	{ config_id = 1529, gadget_id = 70210021, pos = { x = 1661.7, y = 232.4, z = -1172.7 }, rot = { x = 0.0, y = 107.0, z = 0.0 }, level = 1, chest_drop_id = 403323, isOneoff = true, persistent = true }
}

-- 区域
regions = {
	{ config_id = 269, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1661.3, y = 232.5, z = -1172.9 } }
}

-- 触发器
triggers = {
	{ name = "CLIENT_EXECUTE_269", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_269", trigger_count = 0 }
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
		gadgets = { 1496, 1529 },
		regions = { 269 },
		triggers = { "CLIENT_EXECUTE_269" },
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
function action_EVENT_CLIENT_EXECUTE_269(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end
