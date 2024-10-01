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
	{ config_id = 2636, gadget_id = 70210031, pos = { x = 2693.2, y = 196.1, z = -1789.2 }, rot = { x = 0.0, y = 285.5, z = 0.0 }, level = 1, chest_drop_id = 403220, isOneoff = true },
	{ config_id = 2637, gadget_id = 70210011, pos = { x = 2564.6, y = 235.5, z = -1523.9 }, rot = { x = 0.0, y = 54.6, z = 0.0 }, level = 1, chest_drop_id = 403300, isOneoff = true },
	{ config_id = 2915, gadget_id = 70210011, pos = { x = 2386.1, y = 211.9, z = -1192.6 }, rot = { x = 347.0, y = 192.5, z = 0.0 }, level = 1, chest_drop_id = 403300, isOneoff = true },
	{ config_id = 2916, gadget_id = 70210011, pos = { x = 2509.0, y = 224.5, z = -1440.1 }, rot = { x = 0.0, y = 38.3, z = 12.2 }, level = 1, chest_drop_id = 403300, isOneoff = true },
	{ config_id = 2917, gadget_id = 70210011, pos = { x = 2566.5, y = 214.3, z = -1403.7 }, rot = { x = 356.4, y = 325.7, z = 359.9 }, level = 1, chest_drop_id = 403300, isOneoff = true },
	{ config_id = 2919, gadget_id = 70210011, pos = { x = 2495.1, y = 202.9, z = -1094.0 }, rot = { x = 0.0, y = 214.8, z = 0.0 }, level = 1, chest_drop_id = 403300, isOneoff = true },
	{ config_id = 4013, gadget_id = 70210011, pos = { x = 2411.9, y = 206.8, z = -1289.8 }, rot = { x = 0.0, y = 27.6, z = 0.0 }, level = 5, chest_drop_id = 403300, isOneoff = true },
	{ config_id = 4183, gadget_id = 70290003, pos = { x = 2535.6, y = 219.0, z = -1111.7 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 4184, gadget_id = 70500000, pos = { x = 2535.6, y = 219.1, z = -1111.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3003, owner = 4183 },
	{ config_id = 4185, gadget_id = 70500000, pos = { x = 2535.6, y = 219.1, z = -1111.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3003, owner = 4183 },
	{ config_id = 4188, gadget_id = 70210011, pos = { x = 2530.7, y = 209.8, z = -1271.5 }, rot = { x = 11.8, y = 323.6, z = 355.1 }, level = 1, chest_drop_id = 403300, isOneoff = true },
	{ config_id = 4189, gadget_id = 70210011, pos = { x = 2530.6, y = 206.6, z = -1159.9 }, rot = { x = 349.8, y = 41.9, z = 6.1 }, level = 1, chest_drop_id = 403300, isOneoff = true },
	{ config_id = 4196, gadget_id = 70210011, pos = { x = 2262.9, y = 204.3, z = -1099.9 }, rot = { x = 354.6, y = 64.2, z = 6.3 }, level = 1, chest_drop_id = 403300, isOneoff = true },
	{ config_id = 4210, gadget_id = 70210011, pos = { x = 2634.5, y = 214.8, z = -2299.8 }, rot = { x = 0.0, y = 97.6, z = 3.6 }, level = 1, chest_drop_id = 403345, isOneoff = true, persistent = true },
	{ config_id = 4211, gadget_id = 70210011, pos = { x = 2610.5, y = 215.2, z = -2300.4 }, rot = { x = 0.0, y = 263.2, z = 0.0 }, level = 1, chest_drop_id = 403345, isOneoff = true, persistent = true },
	{ config_id = 4212, gadget_id = 70210011, pos = { x = 2598.2, y = 200.2, z = -2382.4 }, rot = { x = 0.0, y = 351.8, z = 0.0 }, level = 1, chest_drop_id = 403345, isOneoff = true, persistent = true },
	{ config_id = 4213, gadget_id = 70210011, pos = { x = 2610.6, y = 196.8, z = -2301.8 }, rot = { x = 0.0, y = 103.0, z = 0.0 }, level = 1, chest_drop_id = 403345, isOneoff = true, persistent = true }
}

-- 区域
regions = {
	{ config_id = 294, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2538.7, y = 252.8, z = -1509.2 } }
}

-- 触发器
triggers = {
	{ name = "CLIENT_EXECUTE_294", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_294", trigger_count = 0 }
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
		-- description = suite_1,
		monsters = { },
		gadgets = { 2636, 2637, 2915, 2916, 2917, 2919, 4013, 4183, 4184, 4185, 4188, 4189, 4196, 4210, 4211, 4212, 4213 },
		regions = { 294 },
		triggers = { "CLIENT_EXECUTE_294" },
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
function action_EVENT_CLIENT_EXECUTE_294(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end
