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
	{ config_id = 2559, gadget_id = 70210022, pos = { x = 2341.3, y = 252.4, z = -1332.9 }, rot = { x = 0.0, y = 5.9, z = 0.0 }, level = 1, chest_drop_id = 403322, state = GadgetState.ChestLocked, isOneoff = true, persistent = true },
	{ config_id = 2563, gadget_id = 70310001, pos = { x = 2334.5, y = 253.3, z = -1334.8 }, rot = { x = 0.0, y = 116.9, z = 0.0 }, level = 1 },
	{ config_id = 2631, gadget_id = 70310001, pos = { x = 2334.9, y = 252.5, z = -1329.9 }, rot = { x = 0.0, y = 189.5, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 2632, gadget_id = 70310001, pos = { x = 2340.7, y = 252.9, z = -1339.8 }, rot = { x = 0.0, y = 8.3, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 2633, gadget_id = 70310001, pos = { x = 2345.9, y = 253.0, z = -1339.1 }, rot = { x = 0.0, y = 92.5, z = 0.0 }, level = 1, state = GadgetState.GearStart }
}

-- 区域
regions = {
	{ config_id = 104, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2341.1, y = 252.5, z = -1334.2 } },
	{ config_id = 128, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2343.1, y = 252.9, z = -1338.2 } },
	{ config_id = 310, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2341.4, y = 252.4, z = -1332.7 } },
	{ config_id = 311, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2341.4, y = 252.4, z = -1332.7 } },
	{ config_id = 423, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2341.4, y = 252.4, z = -1332.7 } }
}

-- 触发器
triggers = {
	{ name = "CLIENT_EXECUTE_104", event = EventType.EVENT_CLIENT_EXECUTE, source = "FireSourceChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_104", trigger_count = 0 },
	{ name = "GADGET_STATE_CHANGE_128", event = EventType.EVENT_GADGET_STATE_CHANGE, source = "", condition = "condition_EVENT_GADGET_STATE_CHANGE_128", action = "action_EVENT_GADGET_STATE_CHANGE_128", tlog_tag = "神殿_谜题_火把_完成" },
	{ name = "CLIENT_EXECUTE_310", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_310", trigger_count = 0 },
	{ name = "CLIENT_EXECUTE_311", event = EventType.EVENT_CLIENT_EXECUTE, source = "FireSourceChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_311", trigger_count = 0 },
	{ name = "CLIENT_EXECUTE_423", event = EventType.EVENT_CLIENT_EXECUTE, source = "FireSourceChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_423", trigger_count = 0 }
}

-- 变量
variables = {
	{ name = "unlocked", value = 0, persistent = false }
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
		gadgets = { 2559, 2563, 2631, 2632, 2633 },
		regions = { 104, 128, 310, 311, 423 },
		triggers = { "CLIENT_EXECUTE_104", "GADGET_STATE_CHANGE_128", "CLIENT_EXECUTE_310", "CLIENT_EXECUTE_311", "CLIENT_EXECUTE_423" },
		rand_weight = 100
	},
	{
		-- suite_id = 1,
		-- description = suite_2,
		monsters = { },
		gadgets = { 2559, 2563, 2631, 2632, 2633 },
		regions = { 423 },
		triggers = { "CLIENT_EXECUTE_423" },
		rand_weight = 100
	},
	{
		-- suite_id = 2,
		-- description = suite_3,
		monsters = { },
		gadgets = { },
		regions = { },
		triggers = { },
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
function action_EVENT_CLIENT_EXECUTE_104(context, evt)
	-- 针对groupid为 133003125 中该config对应的物件进行状态改变操作
	local this_gadget = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		--ScriptLib.PrintLog("config_id="..this_gadget)
	
		if evt.param1 == 1 then
			ScriptLib.SetGroupGadgetStateByConfigId(context, 133003125, this_gadget, GadgetState.GearStart )
			return 0
		end
	
		if evt.param1 == 0 then
			ScriptLib.SetGroupGadgetStateByConfigId(context, 133003125, this_gadget, GadgetState.Default )
			return 0
		end
	
	return 0
end

-- 触发条件
function condition_EVENT_GADGET_STATE_CHANGE_128(context, evt)
	if 2563 ~= evt.param2 or GadgetState.GearStart ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_STATE_CHANGE_128(context, evt)
	-- 解锁目标2559
	if 0 ~= ScriptLib.ChangeGroupGadget(context, { config_id = 2559, state = GadgetState.Default }) then
		return -1
	end
	
	-- 将本组内变量名为 "unlocked" 的变量设置为 1
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "unlocked", 1) then
	  return -1
	end
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_310(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_311(context, evt)
	local this_gadget = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
	local this_group = ScriptLib.GetContextGroupId(context)
	if evt.param1 == 1 then
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_gadget, GadgetState.GearStart )
		return 0
	end
	if evt.param1 == 0 then
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_gadget, GadgetState.Defautl )
		return 0
	end
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_423(context, evt)
	local this_gadget = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
	local this_group = ScriptLib.GetContextGroupId(context)
	if evt.param1 == 1 then
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_gadget, GadgetState.GearStart )
		return 0
	end
	if evt.param1 == 0 then
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_gadget, GadgetState.Default )
		return 0
	end
	return 0
end
