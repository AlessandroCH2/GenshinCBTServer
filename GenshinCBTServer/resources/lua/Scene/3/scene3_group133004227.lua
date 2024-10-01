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
	{ config_id = 1287, gadget_id = 70310001, pos = { x = 2714.2, y = 295.9, z = -404.0 }, rot = { x = 0.0, y = 161.9, z = 0.0 }, level = 1, state = GadgetState.GearStart, persistent = true },
	{ config_id = 1288, gadget_id = 70310001, pos = { x = 2715.1, y = 296.5, z = -406.3 }, rot = { x = 0.0, y = 159.3, z = 0.0 }, level = 1, persistent = true },
	{ config_id = 1289, gadget_id = 70310001, pos = { x = 2713.4, y = 295.2, z = -401.8 }, rot = { x = 0.0, y = 246.2, z = 0.0 }, level = 1, persistent = true },
	{ config_id = 1291, gadget_id = 70210031, pos = { x = 2711.5, y = 295.2, z = -405.1 }, rot = { x = 16.6, y = 264.6, z = 351.7 }, level = 1, chest_drop_id = 403343, isOneoff = true, type = GadgetType.GADGET_WORLD_CHECT }
}

-- 区域
regions = {
	{ config_id = 246, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2708.2, y = 293.8, z = -401.4 } },
	{ config_id = 247, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2707.3, y = 293.6, z = -401.6 } },
	{ config_id = 248, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2707.4, y = 293.7, z = -402.0 } }
}

-- 触发器
triggers = {
	{ name = "GADGET_STATE_CHANGE_246", event = EventType.EVENT_GADGET_STATE_CHANGE, source = "", condition = "condition_EVENT_GADGET_STATE_CHANGE_246", action = "action_EVENT_GADGET_STATE_CHANGE_246", trigger_count = 0 },
	{ name = "GADGET_STATE_CHANGE_247", event = EventType.EVENT_GADGET_STATE_CHANGE, source = "", condition = "condition_EVENT_GADGET_STATE_CHANGE_247", action = "action_EVENT_GADGET_STATE_CHANGE_247", trigger_count = 0 },
	{ name = "VARIABLE_CHANGE_248", event = EventType.EVENT_VARIABLE_CHANGE, source = "", condition = "condition_EVENT_VARIABLE_CHANGE_248", action = "action_EVENT_VARIABLE_CHANGE_248", tlog_tag = "奔狼岭_227_谜题破解_结算" }
}

-- 变量
variables = {
	{ name = "num_1", value = 1, persistent = true }
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
		gadgets = { 1287, 1288, 1289 },
		regions = { 246, 247, 248 },
		triggers = { "GADGET_STATE_CHANGE_246", "GADGET_STATE_CHANGE_247", "VARIABLE_CHANGE_248" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_GADGET_STATE_CHANGE_246(context, evt)
	if GadgetState.GearStart ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_STATE_CHANGE_246(context, evt)
	local c_num_1 = ScriptLib.GetGroupVariableValue(context, "num_1") + 1
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "num_1", c_num_1) then
	  return -1
	end
	return 0
end

-- 触发条件
function condition_EVENT_GADGET_STATE_CHANGE_247(context, evt)
	if GadgetState.Default ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_STATE_CHANGE_247(context, evt)
	local c_num_1 = ScriptLib.GetGroupVariableValue(context, "num_1") - 1
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "num_1", c_num_1) then
	  return -1
	end
	return 0
end

-- 触发条件
function condition_EVENT_VARIABLE_CHANGE_248(context, evt)
	-- 判断变量"num_1"为3
	if ScriptLib.GetGroupVariableValue(context, "num_1") ~= 3 then
			return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_VARIABLE_CHANGE_248(context, evt)
	-- 创建id为1291的gadget
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 1291 }) then
	  return -1
	end
	
	return 0
end
