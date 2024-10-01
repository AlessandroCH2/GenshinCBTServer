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
	{ config_id = 88, gadget_id = 70210011, pos = { x = 1883.7, y = 243.8, z = -867.5 }, rot = { x = 0.0, y = 107.6, z = 0.0 }, level = 8, chest_drop_id = 403302, isOneoff = true },
	{ config_id = 93, gadget_id = 70210011, pos = { x = 1685.3, y = 212.5, z = -380.9 }, rot = { x = 0.0, y = 298.6, z = 0.0 }, level = 8, chest_drop_id = 403302, isOneoff = true },
	{ config_id = 99, gadget_id = 70210011, pos = { x = 1933.8, y = 226.4, z = -907.9 }, rot = { x = 0.0, y = 218.5, z = 0.0 }, level = 8, chest_drop_id = 403302, isOneoff = true },
	{ config_id = 110, gadget_id = 70210011, pos = { x = 1551.4, y = 203.7, z = -467.1 }, rot = { x = 3.2, y = 320.6, z = 360.0 }, level = 8, chest_drop_id = 403302, isOneoff = true },
	{ config_id = 115, gadget_id = 70210011, pos = { x = 1766.3, y = 224.5, z = -415.9 }, rot = { x = 0.0, y = 120.0, z = 0.0 }, level = 8, chest_drop_id = 403302, isOneoff = true },
	{ config_id = 552, gadget_id = 70210011, pos = { x = 1682.6, y = 222.8, z = -528.1 }, rot = { x = 346.5, y = 35.9, z = 23.6 }, level = 9, chest_drop_id = 403302, isOneoff = true },
	{ config_id = 963, gadget_id = 70500000, pos = { x = 1777.0, y = 238.2, z = -403.2 }, rot = { x = 0.0, y = 236.5, z = 0.0 }, level = 1, point_type = 4001001, isOneoff = true },
	{ config_id = 1016, gadget_id = 70900007, pos = { x = 1614.9, y = 229.2, z = -506.9 }, rot = { x = 4.2, y = 27.1, z = 0.0 }, level = 1 }
}

-- 区域
regions = {
	{ config_id = 65, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1611.7, y = 228.4, z = -520.1 } },
	{ config_id = 250, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1874.7, y = 230.1, z = -787.3 } }
}

-- 触发器
triggers = {
	{ name = "GADGET_STATE_CHANGE_65", event = EventType.EVENT_GADGET_STATE_CHANGE, source = "", condition = "condition_EVENT_GADGET_STATE_CHANGE_65", action = "action_EVENT_GADGET_STATE_CHANGE_65", trigger_count = 0 },
	{ name = "CLIENT_EXECUTE_250", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_250", trigger_count = 0 }
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
		gadgets = { 88, 93, 99, 110, 115, 552, 963, 1016 },
		regions = { 65, 250 },
		triggers = { "GADGET_STATE_CHANGE_65", "CLIENT_EXECUTE_250" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_GADGET_STATE_CHANGE_65(context, evt)
	if 1016 ~= evt.param2 or GadgetState.GearStart ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_STATE_CHANGE_65(context, evt)
		-- 重新生成指定group，指定suite
		if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 133002074, suite = 2 }) then
			return -1
		end
	
	-- 触发镜头注目，注目位置为坐标（1627，266，-440），持续时间为4秒，并且为强制注目形式，不广播其他玩家
		local pos = {x=1627, y=266, z=-440}
	    if 0 ~= ScriptLib.BeginCameraSceneLook(context, { look_pos = pos, duration = 4, is_force = true, is_broadcast = false }) then
					return -1
				end 
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_250(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end
