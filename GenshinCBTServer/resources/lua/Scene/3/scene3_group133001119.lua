--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 553, monster_id = 28030401, pos = { x = 1261.9, y = 262.2, z = -1718.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, pose_id = 2 },
	{ config_id = 559, monster_id = 28030301, pos = { x = 1260.2, y = 263.8, z = -1683.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 695, monster_id = 28030401, pos = { x = 1976.4, y = 222.2, z = -1504.1 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, pose_id = 2 },
	{ config_id = 696, monster_id = 28030401, pos = { x = 1974.5, y = 222.0, z = -1507.9 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, pose_id = 2 },
	{ config_id = 697, monster_id = 28030401, pos = { x = 1977.9, y = 222.1, z = -1507.5 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, pose_id = 2 },
	{ config_id = 698, monster_id = 28030401, pos = { x = 1975.0, y = 222.2, z = -1504.2 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, pose_id = 2 },
	{ config_id = 699, monster_id = 28030401, pos = { x = 1979.0, y = 222.1, z = -1506.1 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, pose_id = 2 },
	{ config_id = 700, monster_id = 28030401, pos = { x = 2011.9, y = 222.1, z = -1463.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, pose_id = 2 },
	{ config_id = 702, monster_id = 28030401, pos = { x = 2013.5, y = 222.5, z = -1465.5 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, pose_id = 2 },
	{ config_id = 707, monster_id = 28030401, pos = { x = 2017.4, y = 222.3, z = -1463.9 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, pose_id = 2 },
	{ config_id = 708, monster_id = 28030401, pos = { x = 2013.3, y = 222.5, z = -1467.9 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, pose_id = 2 },
	{ config_id = 709, monster_id = 28030401, pos = { x = 2012.4, y = 222.5, z = -1468.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, pose_id = 2 },
	{ config_id = 1158, monster_id = 28030402, pos = { x = 1268.3, y = 259.1, z = -1685.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 1160, monster_id = 28030402, pos = { x = 1267.2, y = 258.9, z = -1680.9 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 1965, gadget_id = 70210011, pos = { x = 2001.6, y = 219.5, z = -1485.0 }, rot = { x = 0.0, y = 326.6, z = 0.0 }, level = 1, chest_drop_id = 403301, isOneoff = true, persistent = true },
	{ config_id = 1974, gadget_id = 70210011, pos = { x = 1969.8, y = 220.8, z = -1577.8 }, rot = { x = 0.0, y = 190.4, z = 0.0 }, level = 1, chest_drop_id = 403301, isOneoff = true, persistent = true }
}

-- 区域
regions = {
	{ config_id = 299, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1256.6, y = 262.0, z = -1721.9 } }
}

-- 触发器
triggers = {
	{ name = "CLIENT_EXECUTE_299", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_299", trigger_count = 0 }
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
		monsters = { 559, 696, 698, 700, 707, 709, 1158, 1160 },
		gadgets = { 1965, 1974 },
		regions = { 299 },
		triggers = { "CLIENT_EXECUTE_299" },
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
function action_EVENT_CLIENT_EXECUTE_299(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end
