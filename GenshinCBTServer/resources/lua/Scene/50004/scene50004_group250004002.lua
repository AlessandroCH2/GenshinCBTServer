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
	{ config_id = 13, gadget_id = 70900208, pos = { x = 220.9, y = -10.5, z = -112.5 }, rot = { x = 0.0, y = 74.6, z = 0.0 }, level = 1 },
	{ config_id = 14, gadget_id = 70900208, pos = { x = 220.8, y = -10.5, z = -109.4 }, rot = { x = 0.0, y = 74.6, z = 0.0 }, level = 1 },
	{ config_id = 15, gadget_id = 70900208, pos = { x = 220.9, y = -10.5, z = -106.3 }, rot = { x = 0.0, y = 74.6, z = 0.0 }, level = 1 },
	{ config_id = 16, gadget_id = 70900208, pos = { x = 220.8, y = -10.5, z = -103.2 }, rot = { x = 0.0, y = 74.6, z = 0.0 }, level = 1 },
	{ config_id = 17, gadget_id = 70900208, pos = { x = 221.0, y = -10.5, z = -99.6 }, rot = { x = 0.0, y = 74.6, z = 0.0 }, level = 1 },
	{ config_id = 19, gadget_id = 70350004, pos = { x = 222.8, y = -10.5, z = -101.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 20, gadget_id = 70900224, pos = { x = 221.0, y = -9.5, z = -97.8 }, rot = { x = 0.0, y = 359.1, z = 0.0 }, level = 1 }
}

-- 区域
regions = {
	{ config_id = 1, shape = RegionShape.SPHERE, radius = 5, pos = { x = 223.3, y = -10.5, z = -103.0 } }
}

-- 触发器
triggers = {
	{ name = "CLIENT_EXECUTE_1", event = EventType.EVENT_CLIENT_EXECUTE, source = "ElectricSwitch_Hit", condition = "", action = "action_EVENT_CLIENT_EXECUTE_1" }
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
		gadgets = { 13, 14, 15, 16, 17, 19, 20 },
		regions = { 1 },
		triggers = { "CLIENT_EXECUTE_1" },
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
function action_EVENT_CLIENT_EXECUTE_1(context, evt)
	-- 将configid为 19 的物件更改为状态 GadgetState.GearStart
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 19, GadgetState.GearStart) then
			return -1
		end 
	
	return 0
end
