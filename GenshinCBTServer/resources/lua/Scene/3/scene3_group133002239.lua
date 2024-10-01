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
	{ config_id = 2073, gadget_id = 70900007, pos = { x = 2052.5, y = 266.2, z = -374.8 }, rot = { x = 0.0, y = 357.8, z = 0.0 }, level = 1, persistent = true },
	{ config_id = 2074, gadget_id = 70900007, pos = { x = 2001.4, y = 260.6, z = -362.2 }, rot = { x = 0.0, y = 357.8, z = 0.0 }, level = 1, persistent = true },
	{ config_id = 2075, gadget_id = 70900007, pos = { x = 2031.2, y = 259.5, z = -388.4 }, rot = { x = 0.0, y = 357.8, z = 0.0 }, level = 1, persistent = true },
	{ config_id = 2076, gadget_id = 70210031, pos = { x = 2031.5, y = 261.8, z = -368.8 }, rot = { x = 0.0, y = 180.7, z = 0.0 }, level = 1, chest_drop_id = 403223, showcutscene = true, isOneoff = true, persistent = true, type = GadgetType.GADGET_WORLD_CHECT },
	{ config_id = 2083, gadget_id = 70220021, pos = { x = 2000.4, y = 259.3, z = -362.3 }, rot = { x = 0.0, y = 111.7, z = 0.0 }, level = 1 }
}

-- 区域
regions = {
	{ config_id = 283, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2042.5, y = 262.8, z = -370.3 } },
	{ config_id = 284, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2010.8, y = 259.8, z = -364.6 } },
	{ config_id = 285, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2028.5, y = 259.6, z = -384.4 } }
}

-- 触发器
triggers = {
	{ name = "GADGET_STATE_CHANGE_283", event = EventType.EVENT_GADGET_STATE_CHANGE, source = "", condition = "condition_EVENT_GADGET_STATE_CHANGE_283", action = "action_EVENT_GADGET_STATE_CHANGE_283" },
	{ name = "GADGET_STATE_CHANGE_284", event = EventType.EVENT_GADGET_STATE_CHANGE, source = "", condition = "condition_EVENT_GADGET_STATE_CHANGE_284", action = "action_EVENT_GADGET_STATE_CHANGE_284" },
	{ name = "GADGET_STATE_CHANGE_285", event = EventType.EVENT_GADGET_STATE_CHANGE, source = "", condition = "condition_EVENT_GADGET_STATE_CHANGE_285", action = "action_EVENT_GADGET_STATE_CHANGE_285" }
}

-- 变量
variables = {
	{ name = "v2073", value = 0, persistent = true },
	{ name = "v2074", value = 0, persistent = true },
	{ name = "v2075", value = 0, persistent = false }
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
		gadgets = { 2073, 2074, 2075 },
		regions = { 283, 284, 285 },
		triggers = { "GADGET_STATE_CHANGE_283", "GADGET_STATE_CHANGE_284", "GADGET_STATE_CHANGE_285" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_GADGET_STATE_CHANGE_283(context, evt)
	if 2073 ~= evt.param2 or GadgetState.GearStart ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_STATE_CHANGE_283(context, evt)
	-- 将本组内变量名为 "v2073" 的变量设置为 1
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "v2073", 1) then
	  return -1
	end
	
	-- 获取本组内变量名为 "v2073" 的变量值
	if ScriptLib.GetGroupVariableValue(context, "v2073") + ScriptLib.GetGroupVariableValue(context, "v2074") + ScriptLib.GetGroupVariableValue(context, "v2075") == 3  then
	
	
	-- 创生gadget 2076
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 2076 }) then
		return -1
	end
	
	end
	
	
	return 0
end

-- 触发条件
function condition_EVENT_GADGET_STATE_CHANGE_284(context, evt)
	if 2074 ~= evt.param2 or GadgetState.GearStart ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_STATE_CHANGE_284(context, evt)
	-- 将本组内变量名为 "v2073" 的变量设置为 1
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "v2074", 1) then
	  return -1
	end
	
	-- 获取本组内变量名为 "v2073" 的变量值
	if ScriptLib.GetGroupVariableValue(context, "v2073") + ScriptLib.GetGroupVariableValue(context, "v2074") + ScriptLib.GetGroupVariableValue(context, "v2075") == 3  then
	
	
	-- 创生gadget 2076
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 2076 }) then
		return -1
	end
	
	end
	
	
	return 0
end

-- 触发条件
function condition_EVENT_GADGET_STATE_CHANGE_285(context, evt)
	if 2075 ~= evt.param2 or GadgetState.GearStart ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_STATE_CHANGE_285(context, evt)
	-- 将本组内变量名为 "v2073" 的变量设置为 1
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "v2075", 1) then
	  return -1
	end
	
	-- 获取本组内变量名为 "v2073" 的变量值
	if ScriptLib.GetGroupVariableValue(context, "v2073") + ScriptLib.GetGroupVariableValue(context, "v2074") + ScriptLib.GetGroupVariableValue(context, "v2075") == 3  then
	
	
	-- 创生gadget 2076
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 2076 }) then
		return -1
	end
	
	end
	
	
	return 0
end
