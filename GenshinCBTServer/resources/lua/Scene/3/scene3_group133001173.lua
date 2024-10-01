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
	{ config_id = 2381, gadget_id = 70210023, pos = { x = 2098.9, y = 207.5, z = -1221.0 }, rot = { x = 11.1, y = 223.1, z = 0.0 }, level = 1, chest_drop_id = 403321, state = GadgetState.ChestBramble, isOneoff = true, persistent = true }
}

-- 区域
regions = {
	{ config_id = 215, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2097.4, y = 207.7, z = -1219.0 } },
	{ config_id = 305, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2097.5, y = 207.7, z = -1218.8 } }
}

-- 触发器
triggers = {
	{ name = "CLIENT_EXECUTE_215", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_215", trigger_count = 0 },
	{ name = "CLIENT_EXECUTE_305", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_305", trigger_count = 0 }
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
		gadgets = { 2381 },
		regions = { 215, 305 },
		triggers = { "CLIENT_EXECUTE_215", "CLIENT_EXECUTE_305" },
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
function action_EVENT_CLIENT_EXECUTE_215(context, evt)
	 if evt.param1 == 0 then
	  local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
	  ScriptLib.SetGroupGadgetStateByConfigId(context, 0, this_chest, GadgetState.Default)
	  return 0
	 end
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_305(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end
