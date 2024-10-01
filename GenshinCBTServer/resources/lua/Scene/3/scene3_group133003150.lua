--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 609, monster_id = 28030301, pos = { x = 2370.9, y = 300.3, z = -1688.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, pose_id = 901 },
	{ config_id = 610, monster_id = 28030301, pos = { x = 2370.6, y = 301.0, z = -1687.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, pose_id = 901 },
	{ config_id = 611, monster_id = 28030301, pos = { x = 2370.6, y = 300.9, z = -1686.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, pose_id = 901 },
	{ config_id = 612, monster_id = 28030301, pos = { x = 2374.1, y = 300.0, z = -1682.7 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, pose_id = 901 },
	{ config_id = 613, monster_id = 28030301, pos = { x = 2404.3, y = 301.2, z = -1715.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, pose_id = 901 },
	{ config_id = 614, monster_id = 28030301, pos = { x = 2403.2, y = 302.5, z = -1714.7 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, pose_id = 901 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 2628, gadget_id = 70210031, pos = { x = 2415.4, y = 297.8, z = -1710.3 }, rot = { x = 0.0, y = 249.3, z = 0.0 }, level = 1, chest_drop_id = 403223, showcutscene = true, isOneoff = true }
}

-- 区域
regions = {
	{ config_id = 325, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2389.7, y = 291.9, z = -1703.4 } }
}

-- 触发器
triggers = {
	{ name = "CLIENT_EXECUTE_325", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_325", trigger_count = 0 }
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
		monsters = { 609, 610, 611, 612, 613, 614 },
		gadgets = { },
		regions = { 325 },
		triggers = { "CLIENT_EXECUTE_325" },
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
function action_EVENT_CLIENT_EXECUTE_325(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end
