--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 698, monster_id = 20010801, pos = { x = 1806.2, y = 233.2, z = -894.2 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 9, drop_id = 303042 },
	{ config_id = 699, monster_id = 20010801, pos = { x = 1798.4, y = 233.2, z = -899.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 9, drop_id = 303042 },
	{ config_id = 700, monster_id = 20010801, pos = { x = 1794.1, y = 233.2, z = -890.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 9, drop_id = 303042 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 898, gadget_id = 70210006, pos = { x = 1792.5, y = 236.1, z = -914.0 }, rot = { x = 0.0, y = 17.7, z = 355.9 }, level = 1, chest_drop_id = 403222 },
	{ config_id = 1427, gadget_id = 70900201, pos = { x = 1793.6, y = 237.8, z = -914.9 }, rot = { x = 0.0, y = 336.9, z = 0.0 }, level = 1 }
}

-- 区域
regions = {
	{ config_id = 117, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1799.0, y = 233.2, z = -898.0 } },
	{ config_id = 118, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1796.0, y = 235.5, z = -913.0 } },
	{ config_id = 119, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1798.1, y = 233.2, z = -909.3 } },
	{ config_id = 120, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1799.5, y = 233.2, z = -904.2 } },
	{ config_id = 251, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1794.3, y = 236.4, z = -913.4 } }
}

-- 触发器
triggers = {
	{ name = "GADGET_CREATE_117", event = EventType.EVENT_GADGET_CREATE, source = "", condition = "condition_EVENT_GADGET_CREATE_117", action = "action_EVENT_GADGET_CREATE_117", tlog_tag = "酒庄_50_限时到达_开始" },
	{ name = "GADGET_STATE_CHANGE_118", event = EventType.EVENT_GADGET_STATE_CHANGE, source = "", condition = "condition_EVENT_GADGET_STATE_CHANGE_118", action = "", tag = "1001" },
	{ name = "CHALLENGE_FAIL_119", event = EventType.EVENT_CHALLENGE_FAIL, source = "1", condition = "", action = "action_EVENT_CHALLENGE_FAIL_119", tlog_tag = "酒庄_50_限时到达_失败" },
	{ name = "CHALLENGE_SUCCESS_120", event = EventType.EVENT_CHALLENGE_SUCCESS, source = "1", condition = "", action = "action_EVENT_CHALLENGE_SUCCESS_120", tlog_tag = "酒庄_50_限时到达_成功" },
	{ name = "CLIENT_EXECUTE_251", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_251", trigger_count = 0 }
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
	rand_suite = false,
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
		gadgets = { },
		regions = { 251 },
		triggers = { "CLIENT_EXECUTE_251" },
		rand_weight = 100
	},
	{
		-- suite_id = 1,
		-- description = suite_2,
		monsters = { 698, 699, 700 },
		gadgets = { 898, 1427 },
		regions = { 117, 118, 119, 120 },
		triggers = { "GADGET_CREATE_117", "GADGET_STATE_CHANGE_118", "CHALLENGE_FAIL_119", "CHALLENGE_SUCCESS_120" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_GADGET_CREATE_117(context, evt)
	if 898 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_CREATE_117(context, evt)
	-- 创建编号为0,挑战内容为122的区域挑战
	ScriptLib.PrintLog("Enter here")
	if 0 ~= ScriptLib.ActiveChallenge(context, 1, 122, 30, 7, 1001, 1) then
	ScriptLib.PrintLog("ActiveChallenge fail")
		return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_GADGET_STATE_CHANGE_118(context, evt)
	if 898 ~= evt.param2 or GadgetState.ChestOpened ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作

-- 触发条件

-- 触发操作
function action_EVENT_CHALLENGE_FAIL_119(context, evt)
		-- 重新生成指定group，指定suite
		if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 133002050, suite = 1 }) then
			return -1
		end
	
	-- 改变指定group组133002049中， configid为897的gadget的state
	if 0 ~= ScriptLib.SetGroupGadgetStateByConfigId(context, 133002049, 897, GadgetState.Default) then
			return -1
		end 
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CHALLENGE_SUCCESS_120(context, evt)
		-- 重新生成指定group，指定suite
	ScriptLib.PrintLog("Challenge success")
		if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 133002050, suite = 1 }) then
			return -1
		end
	if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 133002130, suite = 2 }) then
			return -1
		end
	
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_251(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end
