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
	{ config_id = 606, gadget_id = 70360003, pos = { x = 2829.0, y = 232.2, z = -41.4 }, rot = { x = 0.0, y = 351.6, z = 0.0 }, level = 1 },
	{ config_id = 607, gadget_id = 70360003, pos = { x = 2792.6, y = 249.6, z = -69.8 }, rot = { x = 0.0, y = 18.9, z = 0.0 }, level = 1 },
	{ config_id = 608, gadget_id = 70360003, pos = { x = 2821.0, y = 258.6, z = -23.3 }, rot = { x = 0.0, y = 154.6, z = 0.0 }, level = 1 }
}

-- 区域
regions = {
	{ config_id = 112, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2793.1, y = 210.8, z = -48.0 } },
	{ config_id = 113, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2803.4, y = 209.9, z = -43.4 } },
	{ config_id = 114, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2803.2, y = 208.7, z = -35.6 } },
	{ config_id = 115, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2803.4, y = 209.4, z = -40.5 } },
	{ config_id = 116, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2799.3, y = 210.0, z = -44.7 } },
	{ config_id = 117, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2800.4, y = 209.5, z = -40.9 } }
}

-- 触发器
triggers = {
	{ name = "GADGET_CREATE_112", event = EventType.EVENT_GADGET_CREATE, source = "", condition = "condition_EVENT_GADGET_CREATE_112", action = "action_EVENT_GADGET_CREATE_112", trigger_count = 0 },
	{ name = "SELECT_OPTION_113", event = EventType.EVENT_SELECT_OPTION, source = "", condition = "condition_EVENT_SELECT_OPTION_113", action = "action_EVENT_SELECT_OPTION_113" },
	{ name = "GADGET_CREATE_114", event = EventType.EVENT_GADGET_CREATE, source = "", condition = "condition_EVENT_GADGET_CREATE_114", action = "action_EVENT_GADGET_CREATE_114", trigger_count = 0 },
	{ name = "SELECT_OPTION_115", event = EventType.EVENT_SELECT_OPTION, source = "", condition = "condition_EVENT_SELECT_OPTION_115", action = "action_EVENT_SELECT_OPTION_115", tlog_tag = "风龙_160_Q390线索1_交互" },
	{ name = "GADGET_CREATE_116", event = EventType.EVENT_GADGET_CREATE, source = "", condition = "condition_EVENT_GADGET_CREATE_116", action = "action_EVENT_GADGET_CREATE_116", trigger_count = 0, tlog_tag = "风龙_160_Q390线索2_交互" },
	{ name = "SELECT_OPTION_117", event = EventType.EVENT_SELECT_OPTION, source = "", condition = "condition_EVENT_SELECT_OPTION_117", action = "action_EVENT_SELECT_OPTION_117", tlog_tag = "风龙_160_Q390线索3_交互" }
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
		gadgets = { 606, 607, 608 },
		regions = { 112, 113, 114, 115, 116, 117 },
		triggers = { "GADGET_CREATE_112", "SELECT_OPTION_113", "GADGET_CREATE_114", "SELECT_OPTION_115", "GADGET_CREATE_116", "SELECT_OPTION_117" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_GADGET_CREATE_112(context, evt)
	if 606 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_CREATE_112(context, evt)
	-- 设置操作台选项
	if 0 ~= ScriptLib.SetWorktopOptionsByGroupId(context, 133007160, 606, {170}) then
		return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_SELECT_OPTION_113(context, evt)
	-- 判断是gadgetid 606 option_id 170
	if 606 ~= evt.param1 then
		return false	
	end
	
	if 170 ~= evt.param2 then
		return false
	end
	
	
	return true
end

-- 触发操作
function action_EVENT_SELECT_OPTION_113(context, evt)
		-- 杀死Group内指定的monster和gadget
		if 0 ~= ScriptLib.KillGroupEntity(context, { group_id = 133007160, monsters = {}, gadgets = {606} }) then
			return -1
		end
	
	-- 通知任务系统完成条件类型"LUA通知"，复杂参数为quest_param的进度+1
	if 0 ~= ScriptLib.AddQuestProgress(context, "300701101") then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_GADGET_CREATE_114(context, evt)
	if 607 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_CREATE_114(context, evt)
	-- 设置操作台选项
	if 0 ~= ScriptLib.SetWorktopOptionsByGroupId(context, 133007160, 607, {170}) then
		return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_SELECT_OPTION_115(context, evt)
	-- 判断是gadgetid 607 option_id 170
	if 607 ~= evt.param1 then
		return false	
	end
	
	if 170 ~= evt.param2 then
		return false
	end
	
	
	return true
end

-- 触发操作
function action_EVENT_SELECT_OPTION_115(context, evt)
		-- 杀死Group内指定的monster和gadget
		if 0 ~= ScriptLib.KillGroupEntity(context, { group_id = 133007160, monsters = {}, gadgets = {607} }) then
			return -1
		end
	
	-- 通知任务系统完成条件类型"LUA通知"，复杂参数为quest_param的进度+1
	if 0 ~= ScriptLib.AddQuestProgress(context, "300701102") then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_GADGET_CREATE_116(context, evt)
	if 608 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_CREATE_116(context, evt)
	-- 设置操作台选项
	if 0 ~= ScriptLib.SetWorktopOptionsByGroupId(context, 133007160, 608, {170}) then
		return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_SELECT_OPTION_117(context, evt)
	-- 判断是gadgetid 608 option_id 170
	if 608 ~= evt.param1 then
		return false	
	end
	
	if 170 ~= evt.param2 then
		return false
	end
	
	
	return true
end

-- 触发操作
function action_EVENT_SELECT_OPTION_117(context, evt)
		-- 杀死Group内指定的monster和gadget
		if 0 ~= ScriptLib.KillGroupEntity(context, { group_id = 133007160, monsters = {}, gadgets = {608} }) then
			return -1
		end
	
	-- 通知任务系统完成条件类型"LUA通知"，复杂参数为quest_param的进度+1
	if 0 ~= ScriptLib.AddQuestProgress(context, "300701103") then
	  return -1
	end
	
	return 0
end
