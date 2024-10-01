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
	{ config_id = 1940, gadget_id = 70620002, pos = { x = 1429.5, y = 260.2, z = -1695.1 }, rot = { x = 0.0, y = 253.8, z = 0.0 }, level = 1 },
	{ config_id = 1941, gadget_id = 70210021, pos = { x = 1430.2, y = 260.1, z = -1694.8 }, rot = { x = 0.0, y = 129.9, z = 0.0 }, level = 1, chest_drop_id = 403323, isOneoff = true, persistent = true },
	{ config_id = 1946, gadget_id = 70290001, pos = { x = 1333.3, y = 247.1, z = -1501.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 1947, gadget_id = 70500000, pos = { x = 1333.3, y = 247.6, z = -1501.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3002, owner = 1946 },
	{ config_id = 1948, gadget_id = 70500000, pos = { x = 1333.2, y = 247.9, z = -1501.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3002, owner = 1946 },
	{ config_id = 1949, gadget_id = 70500000, pos = { x = 1333.5, y = 248.3, z = -1501.5 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3002, owner = 1946 },
	{ config_id = 1950, gadget_id = 70290003, pos = { x = 1358.7, y = 242.0, z = -1501.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 1951, gadget_id = 70500000, pos = { x = 1358.7, y = 242.1, z = -1501.1 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3003, owner = 1950 },
	{ config_id = 1952, gadget_id = 70500000, pos = { x = 1358.7, y = 242.1, z = -1500.9 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3003, owner = 1950 },
	{ config_id = 1955, gadget_id = 70290001, pos = { x = 1401.7, y = 267.2, z = -1699.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 1956, gadget_id = 70500000, pos = { x = 1401.7, y = 267.8, z = -1699.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3002, owner = 1955 },
	{ config_id = 1957, gadget_id = 70500000, pos = { x = 1401.6, y = 268.1, z = -1700.2 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3002, owner = 1955 },
	{ config_id = 1958, gadget_id = 70500000, pos = { x = 1402.0, y = 268.5, z = -1699.9 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3002, owner = 1955 },
	{ config_id = 1960, gadget_id = 70290001, pos = { x = 1329.3, y = 275.4, z = -1736.2 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 1961, gadget_id = 70500000, pos = { x = 1329.3, y = 275.9, z = -1735.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3002, owner = 1960 },
	{ config_id = 1962, gadget_id = 70500000, pos = { x = 1329.2, y = 276.2, z = -1736.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3002, owner = 1960 },
	{ config_id = 1963, gadget_id = 70500000, pos = { x = 1329.6, y = 276.6, z = -1736.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3002, owner = 1960 }
}

-- 区域
regions = {
	{ config_id = 303, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1429.7, y = 260.9, z = -1697.8 } }
}

-- 触发器
triggers = {
	{ name = "CLIENT_EXECUTE_303", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_303", trigger_count = 0 }
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
		gadgets = { 1940, 1941, 1946, 1947, 1948, 1949, 1950, 1951, 1952, 1955, 1956, 1957, 1958, 1960, 1961, 1962, 1963 },
		regions = { 303 },
		triggers = { "CLIENT_EXECUTE_303" },
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
function action_EVENT_CLIENT_EXECUTE_303(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end
