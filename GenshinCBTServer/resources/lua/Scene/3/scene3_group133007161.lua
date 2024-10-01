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
	{ config_id = 610, gadget_id = 70360003, pos = { x = 2947.9, y = 216.0, z = 298.8 }, rot = { x = 0.0, y = 322.4, z = 0.0 }, level = 1 },
	{ config_id = 611, gadget_id = 70360003, pos = { x = 2999.7, y = 233.6, z = 270.5 }, rot = { x = 0.0, y = 238.2, z = 0.0 }, level = 1 },
	{ config_id = 612, gadget_id = 70360003, pos = { x = 2988.2, y = 235.4, z = 185.6 }, rot = { x = 0.0, y = 304.9, z = 0.0 }, level = 1 }
}

-- 区域
regions = {
	{ config_id = 124, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2920.8, y = 207.7, z = 239.8 } },
	{ config_id = 125, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2921.8, y = 208.5, z = 235.3 } },
	{ config_id = 126, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2926.6, y = 209.3, z = 236.2 } },
	{ config_id = 127, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2924.6, y = 208.1, z = 240.8 } },
	{ config_id = 128, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2920.7, y = 207.7, z = 239.0 } },
	{ config_id = 129, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2923.6, y = 208.9, z = 235.5 } }
}

-- 触发器
triggers = {
	{ name = "GADGET_CREATE_124", event = EventType.EVENT_GADGET_CREATE, source = "", condition = "condition_EVENT_GADGET_CREATE_124", action = "action_EVENT_GADGET_CREATE_124", trigger_count = 0 },
	{ name = "SELECT_OPTION_125", event = EventType.EVENT_SELECT_OPTION, source = "", condition = "condition_EVENT_SELECT_OPTION_125", action = "action_EVENT_SELECT_OPTION_125" },
	{ name = "GADGET_CREATE_126", event = EventType.EVENT_GADGET_CREATE, source = "", condition = "condition_EVENT_GADGET_CREATE_126", action = "action_EVENT_GADGET_CREATE_126", trigger_count = 0 },
	{ name = "SELECT_OPTION_127", event = EventType.EVENT_SELECT_OPTION, source = "", condition = "condition_EVENT_SELECT_OPTION_127", action = "action_EVENT_SELECT_OPTION_127", tlog_tag = "风龙_160_Q391线索1_交互" },
	{ name = "GADGET_CREATE_128", event = EventType.EVENT_GADGET_CREATE, source = "", condition = "condition_EVENT_GADGET_CREATE_128", action = "action_EVENT_GADGET_CREATE_128", trigger_count = 0, tlog_tag = "风龙_160_Q391线索2_交互" },
	{ name = "SELECT_OPTION_129", event = EventType.EVENT_SELECT_OPTION, source = "", condition = "condition_EVENT_SELECT_OPTION_129", action = "action_EVENT_SELECT_OPTION_129", tlog_tag = "风龙_160_Q391线索3_交互" }
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
		regions = { },
		triggers = { },
		rand_weight = 100
	},
	{
		-- suite_id = 1,
		-- description = suite_2,
		monsters = { },
		gadgets = { 610, 611, 612 },
		regions = { 124, 125, 126, 127, 128, 129 },
		triggers = { "GADGET_CREATE_124", "SELECT_OPTION_125", "GADGET_CREATE_126", "SELECT_OPTION_127", "GADGET_CREATE_128", "SELECT_OPTION_129" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_GADGET_CREATE_124(context, evt)
	if 610 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_CREATE_124(context, evt)
	-- 设置操作台选项
	if 0 ~= ScriptLib.SetWorktopOptionsByGroupId(context, 133007161, 610, {170}) then
		return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_SELECT_OPTION_125(context, evt)
	-- 判断是gadgetid 610 option_id 170
	if 610 ~= evt.param1 then
		return false	
	end
	
	if 170 ~= evt.param2 then
		return false
	end
	
	
	return true
end

-- 触发操作
function action_EVENT_SELECT_OPTION_125(context, evt)
		-- 杀死Group内指定的monster和gadget
		if 0 ~= ScriptLib.KillGroupEntity(context, { group_id = 133007161, monsters = {}, gadgets = {610} }) then
			return -1
		end
	
	-- 通知任务系统完成条件类型"LUA通知"，复杂参数为quest_param的进度+1
	if 0 ~= ScriptLib.AddQuestProgress(context, "300700901") then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_GADGET_CREATE_126(context, evt)
	if 611 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_CREATE_126(context, evt)
	-- 设置操作台选项
	if 0 ~= ScriptLib.SetWorktopOptionsByGroupId(context, 133007161, 611, {170}) then
		return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_SELECT_OPTION_127(context, evt)
	-- 判断是gadgetid 611 option_id 170
	if 611 ~= evt.param1 then
		return false	
	end
	
	if 170 ~= evt.param2 then
		return false
	end
	
	
	return true
end

-- 触发操作
function action_EVENT_SELECT_OPTION_127(context, evt)
		-- 杀死Group内指定的monster和gadget
		if 0 ~= ScriptLib.KillGroupEntity(context, { group_id = 133007161, monsters = {}, gadgets = {611} }) then
			return -1
		end
	
	-- 通知任务系统完成条件类型"LUA通知"，复杂参数为quest_param的进度+1
	if 0 ~= ScriptLib.AddQuestProgress(context, "300700902") then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_GADGET_CREATE_128(context, evt)
	if 612 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_CREATE_128(context, evt)
	-- 设置操作台选项
	if 0 ~= ScriptLib.SetWorktopOptionsByGroupId(context, 133007161, 612, {170}) then
		return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_SELECT_OPTION_129(context, evt)
	-- 判断是gadgetid 612 option_id 170
	if 612 ~= evt.param1 then
		return false	
	end
	
	if 170 ~= evt.param2 then
		return false
	end
	
	
	return true
end

-- 触发操作
function action_EVENT_SELECT_OPTION_129(context, evt)
		-- 杀死Group内指定的monster和gadget
		if 0 ~= ScriptLib.KillGroupEntity(context, { group_id = 133007161, monsters = {}, gadgets = {612} }) then
			return -1
		end
	
	-- 通知任务系统完成条件类型"LUA通知"，复杂参数为quest_param的进度+1
	if 0 ~= ScriptLib.AddQuestProgress(context, "300700903") then
	  return -1
	end
	
	return 0
end
