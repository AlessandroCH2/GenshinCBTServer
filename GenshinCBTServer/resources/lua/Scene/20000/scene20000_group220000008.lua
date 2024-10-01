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
	{ config_id = 27, gadget_id = 70900014, pos = { x = 30.0, y = 0.2, z = -86.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, arguments = { 0, 0, 0 } },
	{ config_id = 28, gadget_id = 70900014, pos = { x = 13.6, y = 0.1, z = -86.7 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, arguments = { 0, 0, 0 } },
	{ config_id = 29, gadget_id = 70310001, pos = { x = 30.1, y = 1.1, z = -86.4 }, rot = { x = 0.0, y = 109.3, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 30, gadget_id = 70310001, pos = { x = 13.6, y = 1.1, z = -86.8 }, rot = { x = 0.0, y = 311.0, z = 0.0 }, level = 1 },
	{ config_id = 31, gadget_id = 70210031, pos = { x = 21.5, y = 0.5, z = -83.7 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, chest_drop_id = 1100302, showcutscene = true },
	{ config_id = 32, gadget_id = 70320001, pos = { x = 30.1, y = 0.5, z = -94.0 }, rot = { x = 0.0, y = 19.9, z = 0.0 }, level = 1 }
}

-- 区域
regions = {
	{ config_id = 26, shape = RegionShape.SPHERE, radius = 5, pos = { x = 13.4, y = 0.5, z = -83.8 } },
	{ config_id = 27, shape = RegionShape.SPHERE, radius = 5, pos = { x = 24.0, y = 0.5, z = -69.1 } }
}

-- 触发器
triggers = {
	{ name = "GADGET_STATE_CHANGE_26", event = EventType.EVENT_GADGET_STATE_CHANGE, source = "", condition = "condition_EVENT_GADGET_STATE_CHANGE_26", action = "action_EVENT_GADGET_STATE_CHANGE_26", trigger_count = 0 },
	{ name = "CLIENT_EXECUTE_27", event = EventType.EVENT_CLIENT_EXECUTE, source = "FireSourceChange", condition = "condition_EVENT_CLIENT_EXECUTE_27", action = "action_EVENT_CLIENT_EXECUTE_27", trigger_count = 0 }
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
		gadgets = { 27, 28, 29, 30, 32 },
		regions = { 26, 27 },
		triggers = { "GADGET_STATE_CHANGE_26", "CLIENT_EXECUTE_27" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_GADGET_STATE_CHANGE_26(context, evt)
	ScriptLib.PrintLog("enter firebox condition")
	if 30 ~= evt.param2 or GadgetState.GearStart ~= evt.param1 then
	ScriptLib.PrintLog("fire box not match")
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_STATE_CHANGE_26(context, evt)
	-- 创生gadget 31
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 31 }) then
		return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_CLIENT_EXECUTE_27(context, evt)
	ScriptLib.PrintLog("enter fire condition")
	return true
end

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_27(context, evt)
	-- 针对groupid为 220000008 中该config对应的物件进行状态改变操作
	ScriptLib.PrintLog("enter fire action")
	local this_gadget = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		--ScriptLib.PrintLog("config_id="..this_gadget)
	
		if evt.param1 == 1 then
			ScriptLib.SetGroupGadgetStateByConfigId(context, 220000008, this_gadget, GadgetState.GearStart )
	ScriptLib.PrintLog("fire success")
			return 0
		end
	
		if evt.param1 == 0 then
			ScriptLib.SetGroupGadgetStateByConfigId(context, 220000008, this_gadget, GadgetState.Default )
	ScriptLib.PrintLog("fire put off")
			return 0
		end
	
	return 0
end
