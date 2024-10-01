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
	{ config_id = 2984, gadget_id = 70310001, pos = { x = 2731.0, y = 259.9, z = -1211.0 }, rot = { x = 0.0, y = 257.0, z = 0.0 }, level = 1, state = GadgetState.GearStart, persistent = true },
	{ config_id = 2985, gadget_id = 70310001, pos = { x = 2728.3, y = 260.1, z = -1208.6 }, rot = { x = 0.0, y = 42.2, z = 0.0 }, level = 1, state = GadgetState.GearStart, persistent = true },
	{ config_id = 2986, gadget_id = 70310001, pos = { x = 2725.6, y = 260.3, z = -1206.2 }, rot = { x = 0.0, y = 228.5, z = 0.0 }, level = 1, persistent = true },
	{ config_id = 2987, gadget_id = 70210031, pos = { x = 2726.3, y = 260.1, z = -1210.8 }, rot = { x = 0.0, y = 41.1, z = 0.0 }, level = 1, chest_drop_id = 403222, isOneoff = true }
}

-- 区域
regions = {
	{ config_id = 179, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2728.5, y = 260.1, z = -1208.5 } },
	{ config_id = 256, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2727.8, y = 260.2, z = -1207.8 } },
	{ config_id = 350, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2729.7, y = 260.1, z = -1206.7 } },
	{ config_id = 351, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2729.7, y = 260.1, z = -1206.7 } },
	{ config_id = 431, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2729.7, y = 260.1, z = -1206.7 } }
}

-- 触发器
triggers = {
	{ name = "GADGET_STATE_CHANGE_179", event = EventType.EVENT_GADGET_STATE_CHANGE, source = "", condition = "condition_EVENT_GADGET_STATE_CHANGE_179", action = "action_EVENT_GADGET_STATE_CHANGE_179", trigger_count = 0, tlog_tag = "望风山地_220_谜题破解_结算" },
	{ name = "CLIENT_EXECUTE_256", event = EventType.EVENT_CLIENT_EXECUTE, source = "FireSourceChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_256", trigger_count = 0 },
	{ name = "CLIENT_EXECUTE_350", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_350", trigger_count = 0 },
	{ name = "CLIENT_EXECUTE_351", event = EventType.EVENT_CLIENT_EXECUTE, source = "FireSourceChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_351", trigger_count = 0 },
	{ name = "CLIENT_EXECUTE_431", event = EventType.EVENT_CLIENT_EXECUTE, source = "FireSourceChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_431", trigger_count = 0 }
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
		gadgets = { 2984, 2985, 2986 },
		regions = { 179, 256, 350, 351, 431 },
		triggers = { "GADGET_STATE_CHANGE_179", "CLIENT_EXECUTE_256", "CLIENT_EXECUTE_350", "CLIENT_EXECUTE_351", "CLIENT_EXECUTE_431" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_GADGET_STATE_CHANGE_179(context, evt)
	if 2986 ~= evt.param2 or GadgetState.GearStart ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_STATE_CHANGE_179(context, evt)
	-- 创建id为2987的gadget
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 2987 }) then
	  return -1
	end
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_256(context, evt)
	-- 针对groupid为 133003220 中该config对应的物件进行状态改变操作
	local this_gadget = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		--ScriptLib.PrintLog("config_id="..this_gadget)
	
		if evt.param1 == 1 then
			ScriptLib.SetGroupGadgetStateByConfigId(context, 133003220, this_gadget, GadgetState.GearStart )
			return 0
		end
	
		if evt.param1 == 0 then
			ScriptLib.SetGroupGadgetStateByConfigId(context, 133003220, this_gadget, GadgetState.Default )
			return 0
		end
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_350(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_351(context, evt)
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
function action_EVENT_CLIENT_EXECUTE_431(context, evt)
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
