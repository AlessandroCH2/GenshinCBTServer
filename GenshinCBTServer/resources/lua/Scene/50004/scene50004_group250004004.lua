--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 1, monster_id = 20010501, pos = { x = 267.2, y = -10.5, z = -103.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, disableWander = true }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 28, gadget_id = 70900208, pos = { x = 263.9, y = -10.5, z = -112.7 }, rot = { x = 0.0, y = 74.6, z = 0.0 }, level = 1 },
	{ config_id = 29, gadget_id = 70900208, pos = { x = 263.8, y = -10.5, z = -109.6 }, rot = { x = 0.0, y = 74.6, z = 0.0 }, level = 1 },
	{ config_id = 30, gadget_id = 70900208, pos = { x = 263.9, y = -10.5, z = -106.5 }, rot = { x = 0.0, y = 74.6, z = 0.0 }, level = 1 },
	{ config_id = 32, gadget_id = 70900208, pos = { x = 264.0, y = -10.5, z = -99.8 }, rot = { x = 0.0, y = 74.6, z = 0.0 }, level = 1 },
	{ config_id = 33, gadget_id = 70350004, pos = { x = 265.8, y = -10.5, z = -105.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 34, gadget_id = 70900224, pos = { x = 264.0, y = -9.5, z = -98.0 }, rot = { x = 0.0, y = 359.1, z = 0.0 }, level = 1 }
}

-- 区域
regions = {
	{ config_id = 3, shape = RegionShape.SPHERE, radius = 5, pos = { x = 266.3, y = -10.5, z = -103.2 } }
}

-- 触发器
triggers = {
	{ name = "CLIENT_EXECUTE_3", event = EventType.EVENT_CLIENT_EXECUTE, source = "ElectricSwitch_Hit", condition = "", action = "action_EVENT_CLIENT_EXECUTE_3" }
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
		monsters = { 1 },
		gadgets = { 28, 29, 30, 32, 33, 34 },
		regions = { 3 },
		triggers = { "CLIENT_EXECUTE_3" },
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
function action_EVENT_CLIENT_EXECUTE_3(context, evt)
	-- 将configid为 33 的物件更改为状态 GadgetState.GearStart
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 33, GadgetState.GearStart) then
			return -1
		end 
	
	return 0
end
