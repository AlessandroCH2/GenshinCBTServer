--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 1015, monster_id = 20011501, pos = { x = 2946.8, y = 222.6, z = -1741.0 }, rot = { x = 0.0, y = 253.6, z = 0.0 }, level = 16, drop_id = 303044, disableWander = true },
	{ config_id = 1017, monster_id = 20011401, pos = { x = 2953.3, y = 223.0, z = -1757.7 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 16, drop_id = 303044, disableWander = true },
	{ config_id = 1018, monster_id = 20011401, pos = { x = 2950.0, y = 222.6, z = -1749.5 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 16, drop_id = 303044 },
	{ config_id = 1019, monster_id = 20011401, pos = { x = 2949.6, y = 220.2, z = -1724.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 16, drop_id = 303044 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 3260, gadget_id = 70210031, pos = { x = 2957.6, y = 223.8, z = -1768.0 }, rot = { x = 0.0, y = 16.1, z = 0.0 }, level = 1, chest_drop_id = 403343, isOneoff = true },
	{ config_id = 3261, gadget_id = 70220020, pos = { x = 2955.7, y = 223.6, z = -1766.5 }, rot = { x = 0.0, y = 154.0, z = 0.0 }, level = 1 },
	{ config_id = 3262, gadget_id = 70220020, pos = { x = 2954.6, y = 223.4, z = -1765.4 }, rot = { x = 0.0, y = 163.6, z = 0.0 }, level = 1 },
	{ config_id = 3368, gadget_id = 70500000, pos = { x = 2930.2, y = 223.0, z = -1747.0 }, rot = { x = 0.0, y = 136.1, z = 0.0 }, level = 1, point_type = 2002 },
	{ config_id = 3369, gadget_id = 70500000, pos = { x = 2949.9, y = 220.8, z = -1731.2 }, rot = { x = 0.0, y = 170.3, z = 0.0 }, level = 1, point_type = 2002 },
	{ config_id = 3927, gadget_id = 70290001, pos = { x = 2938.7, y = 224.2, z = -1740.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 3928, gadget_id = 70500000, pos = { x = 2938.8, y = 224.8, z = -1740.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3002, owner = 3927 },
	{ config_id = 3929, gadget_id = 70500000, pos = { x = 2938.7, y = 225.1, z = -1740.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3002, owner = 3927 },
	{ config_id = 3930, gadget_id = 70500000, pos = { x = 2939.0, y = 225.5, z = -1740.5 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3002, owner = 3927 }
}

-- 区域
regions = {
	{ config_id = 384, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2953.0, y = 223.0, z = -1757.2 } }
}

-- 触发器
triggers = {
	{ name = "CLIENT_EXECUTE_384", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_384", trigger_count = 0 }
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
		monsters = { 1015, 1017, 1018, 1019 },
		gadgets = { 3260, 3261, 3262, 3368, 3369, 3927, 3928, 3929, 3930 },
		regions = { 384 },
		triggers = { "CLIENT_EXECUTE_384" },
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
function action_EVENT_CLIENT_EXECUTE_384(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end
