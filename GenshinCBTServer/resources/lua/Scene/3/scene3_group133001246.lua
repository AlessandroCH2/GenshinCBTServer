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
	{ config_id = 2702, gadget_id = 70360001, pos = { x = 1812.8, y = 195.0, z = -1414.7 }, rot = { x = 0.0, y = 175.4, z = 0.0 }, level = 1 },
	{ config_id = 2703, gadget_id = 70210021, pos = { x = 1812.8, y = 195.0, z = -1414.9 }, rot = { x = 0.0, y = 80.3, z = 0.0 }, level = 1, chest_drop_id = 403321, isOneoff = true, persistent = true }
}

-- 区域
regions = {
	{ config_id = 321, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1812.7, y = 195.1, z = -1413.7 } },
	{ config_id = 322, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1812.6, y = 195.0, z = -1413.0 } },
	{ config_id = 326, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1812.7, y = 195.0, z = -1413.7 } }
}

-- 触发器
triggers = {
	{ name = "GADGET_CREATE_321", event = EventType.EVENT_GADGET_CREATE, source = "", condition = "condition_EVENT_GADGET_CREATE_321", action = "action_EVENT_GADGET_CREATE_321" },
	{ name = "SELECT_OPTION_322", event = EventType.EVENT_SELECT_OPTION, source = "", condition = "condition_EVENT_SELECT_OPTION_322", action = "action_EVENT_SELECT_OPTION_322" },
	{ name = "CLIENT_EXECUTE_326", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_326", trigger_count = 0 }
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
		gadgets = { 2702 },
		regions = { 321, 322, 326 },
		triggers = { "GADGET_CREATE_321", "SELECT_OPTION_322", "CLIENT_EXECUTE_326" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_GADGET_CREATE_321(context, evt)
	-- 判断是gadgetid 2702
	if 2702 ~= evt.param1 then
			return false
		end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_CREATE_321(context, evt)
	-- 设置操作台选项
	if 0 ~= ScriptLib.SetWorktopOptions(context, {169}) then
		return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_SELECT_OPTION_322(context, evt)
	if 2702 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_SELECT_OPTION_322(context, evt)
	-- 创建id为2703的gadget
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 2703 }) then
	  return -1
	end
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_326(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end
