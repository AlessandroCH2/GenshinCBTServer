--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 1152, monster_id = 28030101, pos = { x = 1500.6, y = 361.6, z = -2070.4 }, rot = { x = 0.0, y = 74.1, z = 0.0 }, level = 0, pose_id = 901 },
	{ config_id = 1153, monster_id = 28020102, pos = { x = 1470.1, y = 328.2, z = -2017.5 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 1154, monster_id = 28030401, pos = { x = 1452.7, y = 328.0, z = -2034.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 1155, monster_id = 28030401, pos = { x = 1446.1, y = 327.8, z = -2036.9 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 1156, monster_id = 28030401, pos = { x = 1448.0, y = 327.7, z = -2034.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 1157, monster_id = 28030101, pos = { x = 1586.1, y = 357.4, z = -2066.4 }, rot = { x = 0.0, y = 232.7, z = 0.0 }, level = 0, pose_id = 901 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 2485, gadget_id = 70210021, pos = { x = 1573.8, y = 337.0, z = -2119.0 }, rot = { x = 353.1, y = 95.4, z = 0.0 }, level = 1, chest_drop_id = 403101, isOneoff = true, persistent = true },
	{ config_id = 2980, gadget_id = 70620001, pos = { x = 1603.9, y = 341.2, z = -2100.6 }, rot = { x = 0.0, y = 130.7, z = 0.0 }, level = 1 },
	{ config_id = 2981, gadget_id = 70210041, pos = { x = 1603.2, y = 341.1, z = -2100.2 }, rot = { x = 0.0, y = 296.4, z = 0.0 }, level = 1, chest_drop_id = 403264, isOneoff = true, persistent = true }
}

-- 区域
regions = {
	{ config_id = 310, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1610.0, y = 341.7, z = -2096.0 } }
}

-- 触发器
triggers = {
	{ name = "CLIENT_EXECUTE_310", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_310", trigger_count = 0 }
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
		monsters = { 1152, 1153, 1155, 1156, 1157 },
		gadgets = { 2485, 2980, 2981 },
		regions = { 310 },
		triggers = { "CLIENT_EXECUTE_310" },
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
function action_EVENT_CLIENT_EXECUTE_310(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end
