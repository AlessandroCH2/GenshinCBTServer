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
	{ config_id = 29, gadget_id = 70380002, pos = { x = 1816.6, y = 194.6, z = -1516.7 }, rot = { x = 0.0, y = 103.3, z = 0.0 }, level = 1, route_id = 3005005 },
	{ config_id = 30, gadget_id = 70380002, pos = { x = 1832.4, y = 197.8, z = -1481.5 }, rot = { x = 0.0, y = 64.3, z = 0.0 }, level = 1, route_id = 3005006 },
	{ config_id = 31, gadget_id = 70380002, pos = { x = 1847.6, y = 194.6, z = -1501.4 }, rot = { x = 0.0, y = 142.9, z = 0.0 }, level = 1, route_id = 3005007 },
	{ config_id = 32, gadget_id = 70210031, pos = { x = 1839.5, y = 195.2, z = -1490.4 }, rot = { x = 0.0, y = 215.5, z = 0.0 }, level = 1, chest_drop_id = 403221, showcutscene = true, isOneoff = true, persistent = true }
}

-- 区域
regions = {
	{ config_id = 23, shape = RegionShape.SPHERE, radius = 5.6, pos = { x = 1840.3, y = 195.3, z = -1490.4 } },
	{ config_id = 24, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1841.7, y = 196.0, z = -1481.1 } },
	{ config_id = 25, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1842.3, y = 195.7, z = -1483.6 } },
	{ config_id = 31, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1843.6, y = 195.0, z = -1490.4 } }
}

-- 触发器
triggers = {
	{ name = "ANY_GADGET_DIE_23", event = EventType.EVENT_ANY_GADGET_DIE, source = "", condition = "condition_EVENT_ANY_GADGET_DIE_23", action = "action_EVENT_ANY_GADGET_DIE_23" },
	{ name = "ANY_GADGET_DIE_24", event = EventType.EVENT_ANY_GADGET_DIE, source = "", condition = "condition_EVENT_ANY_GADGET_DIE_24", action = "action_EVENT_ANY_GADGET_DIE_24" },
	{ name = "ANY_GADGET_DIE_25", event = EventType.EVENT_ANY_GADGET_DIE, source = "", condition = "condition_EVENT_ANY_GADGET_DIE_25", action = "action_EVENT_ANY_GADGET_DIE_25" },
	{ name = "GADGET_CREATE_31", event = EventType.EVENT_GADGET_CREATE, source = "", condition = "condition_EVENT_GADGET_CREATE_31", action = "", tlog_tag = "小平原_移动靶_海边_结束" }
}

-- 变量
variables = {
	{ name = "target29", value = 0, persistent = false },
	{ name = "target30", value = 0, persistent = false },
	{ name = "target31", value = 0, persistent = false }
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
		gadgets = { 29, 30, 31 },
		regions = { 23, 24, 25, 31 },
		triggers = { "ANY_GADGET_DIE_23", "ANY_GADGET_DIE_24", "ANY_GADGET_DIE_25", "GADGET_CREATE_31" },
		rand_weight = 100
	},
	{
		-- suite_id = 1,
		-- description = suite_2,
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
function condition_EVENT_ANY_GADGET_DIE_23(context, evt)
	if 29 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_GADGET_DIE_23(context, evt)
	-- 将本组内变量名为 "target29" 的变量设置为 1
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "target29", 1) then
	  return -1
	end
	
	local c_target29 = ScriptLib.GetGroupVariableValue(context, "target29")
		local c_target30 = ScriptLib.GetGroupVariableValue(context, "target30")
		local c_target31 = ScriptLib.GetGroupVariableValue(context, "target31")
		local c_target = c_target29 + c_target30 + c_target31
		if c_target == 3 then
		if 0 ~= ScriptLib.CreateGadget(context, { config_id = 32 }) then
			return -1
		end
		end
		
	return 0
end

-- 触发条件
function condition_EVENT_ANY_GADGET_DIE_24(context, evt)
	if 30 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_GADGET_DIE_24(context, evt)
	-- 将本组内变量名为 "target30" 的变量设置为 1
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "target30", 1) then
	  return -1
	end
	
	                local c_target29 = ScriptLib.GetGroupVariableValue(context, "target29")
		local c_target30 = ScriptLib.GetGroupVariableValue(context, "target30")
		local c_target31 = ScriptLib.GetGroupVariableValue(context, "target31")
		local c_target = c_target29 + c_target30 + c_target31
		if c_target == 3 then
		if 0 ~= ScriptLib.CreateGadget(context, { config_id = 32 }) then
			return -1
		end
		end
	
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_GADGET_DIE_25(context, evt)
	if 31 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_GADGET_DIE_25(context, evt)
	-- 将本组内变量名为 "target31" 的变量设置为 1
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "target31", 1) then
	  return -1
	end
	
	                local c_target29 = ScriptLib.GetGroupVariableValue(context, "target29")
		local c_target30 = ScriptLib.GetGroupVariableValue(context, "target30")
		local c_target31 = ScriptLib.GetGroupVariableValue(context, "target31")
		local c_target = c_target29 + c_target30 + c_target31
		if c_target == 3 then
		if 0 ~= ScriptLib.CreateGadget(context, { config_id = 32 }) then
			return -1
		end
		end
	
	
	return 0
	
end

-- 触发条件
function condition_EVENT_GADGET_CREATE_31(context, evt)
	if 32 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
