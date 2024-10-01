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
	{ config_id = 21, gadget_id = 70900207, pos = { x = 242.3, y = -10.5, z = -112.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 22, gadget_id = 70900208, pos = { x = 242.2, y = -10.5, z = -109.5 }, rot = { x = 0.0, y = 74.6, z = 0.0 }, level = 1 },
	{ config_id = 23, gadget_id = 70900208, pos = { x = 242.2, y = -10.5, z = -106.4 }, rot = { x = 0.0, y = 74.6, z = 0.0 }, level = 1 },
	{ config_id = 24, gadget_id = 70900208, pos = { x = 242.1, y = -10.5, z = -103.3 }, rot = { x = 0.0, y = 74.6, z = 0.0 }, level = 1 },
	{ config_id = 25, gadget_id = 70900208, pos = { x = 242.3, y = -10.5, z = -99.7 }, rot = { x = 0.0, y = 74.6, z = 0.0 }, level = 1 },
	{ config_id = 26, gadget_id = 70900224, pos = { x = 242.4, y = -9.5, z = -97.9 }, rot = { x = 0.0, y = 359.1, z = 0.0 }, level = 1 },
	{ config_id = 27, gadget_id = 70350004, pos = { x = 244.1, y = -10.5, z = -101.7 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 }
}

-- 区域
regions = {
	{ config_id = 2, shape = RegionShape.SPHERE, radius = 5, pos = { x = 244.7, y = -10.5, z = -103.1 } }
}

-- 触发器
triggers = {
	{ name = "CLIENT_EXECUTE_2", event = EventType.EVENT_CLIENT_EXECUTE, source = "ElectricSwitch_Unhit", condition = "condition_EVENT_CLIENT_EXECUTE_2", action = "action_EVENT_CLIENT_EXECUTE_2" }
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
		gadgets = { 21, 22, 23, 24, 25, 26, 27 },
		regions = { 2 },
		triggers = { "CLIENT_EXECUTE_2" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_CLIENT_EXECUTE_2(context, evt)
	-- 判断是gadgetid 57 option_id 0
	if 26 == ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid }) then
	
	return true
	
	end
end

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_2(context, evt)
	-- 将configid为 27 的物件更改为状态 GadgetState.GearStart
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 27, GadgetState.GearStart) then
			return -1
		end 
	
	return 0
end
