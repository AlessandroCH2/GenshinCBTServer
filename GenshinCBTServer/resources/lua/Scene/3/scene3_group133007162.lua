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
	{ config_id = 613, gadget_id = 70360003, pos = { x = 2563.5, y = 180.2, z = 394.1 }, rot = { x = 0.0, y = 359.2, z = 0.0 }, level = 1 },
	{ config_id = 614, gadget_id = 70360003, pos = { x = 2616.2, y = 207.6, z = 338.9 }, rot = { x = 0.0, y = 156.1, z = 0.0 }, level = 1 },
	{ config_id = 615, gadget_id = 70360003, pos = { x = 2512.5, y = 219.8, z = 426.4 }, rot = { x = 0.0, y = 200.0, z = 0.0 }, level = 1 }
}

-- 区域
regions = {
	{ config_id = 131, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2580.7, y = 208.3, z = 350.8 } },
	{ config_id = 132, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2577.0, y = 208.4, z = 347.3 } },
	{ config_id = 133, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2565.6, y = 201.3, z = 364.9 } },
	{ config_id = 134, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2562.4, y = 200.8, z = 362.6 } },
	{ config_id = 135, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2559.7, y = 200.3, z = 361.0 } },
	{ config_id = 136, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2557.8, y = 199.9, z = 365.2 } }
}

-- 触发器
triggers = {
	{ name = "GADGET_CREATE_131", event = EventType.EVENT_GADGET_CREATE, source = "", condition = "condition_EVENT_GADGET_CREATE_131", action = "action_EVENT_GADGET_CREATE_131", trigger_count = 0 },
	{ name = "SELECT_OPTION_132", event = EventType.EVENT_SELECT_OPTION, source = "", condition = "condition_EVENT_SELECT_OPTION_132", action = "action_EVENT_SELECT_OPTION_132", tlog_tag = "风龙_160_Q392线索1_交互" },
	{ name = "GADGET_CREATE_133", event = EventType.EVENT_GADGET_CREATE, source = "", condition = "condition_EVENT_GADGET_CREATE_133", action = "action_EVENT_GADGET_CREATE_133", trigger_count = 0 },
	{ name = "SELECT_OPTION_134", event = EventType.EVENT_SELECT_OPTION, source = "", condition = "condition_EVENT_SELECT_OPTION_134", action = "action_EVENT_SELECT_OPTION_134", tlog_tag = "风龙_160_Q392线索2_交互" },
	{ name = "GADGET_CREATE_135", event = EventType.EVENT_GADGET_CREATE, source = "", condition = "condition_EVENT_GADGET_CREATE_135", action = "action_EVENT_GADGET_CREATE_135", trigger_count = 0 },
	{ name = "SELECT_OPTION_136", event = EventType.EVENT_SELECT_OPTION, source = "", condition = "condition_EVENT_SELECT_OPTION_136", action = "action_EVENT_SELECT_OPTION_136", tlog_tag = "风龙_160_Q392线索3_交互" }
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
		gadgets = { 613, 614, 615 },
		regions = { 131, 132, 133, 134, 135, 136 },
		triggers = { "GADGET_CREATE_131", "SELECT_OPTION_132", "GADGET_CREATE_133", "SELECT_OPTION_134", "GADGET_CREATE_135", "SELECT_OPTION_136" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_GADGET_CREATE_131(context, evt)
	if 613 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_CREATE_131(context, evt)
	-- 设置操作台选项
	if 0 ~= ScriptLib.SetWorktopOptionsByGroupId(context, 133007162, 613, {170}) then
		return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_SELECT_OPTION_132(context, evt)
	-- 判断是gadgetid 613 option_id 170
	if 613 ~= evt.param1 then
		return false	
	end
	
	if 170 ~= evt.param2 then
		return false
	end
	
	
	return true
end

-- 触发操作
function action_EVENT_SELECT_OPTION_132(context, evt)
		-- 杀死Group内指定的monster和gadget
		if 0 ~= ScriptLib.KillGroupEntity(context, { group_id = 133007162, monsters = {}, gadgets = {613} }) then
			return -1
		end
	
	-- 通知任务系统完成条件类型"LUA通知"，复杂参数为quest_param的进度+1
	if 0 ~= ScriptLib.AddQuestProgress(context, "300701201") then
	  return -1
	end
	
		-- 杀死Group内指定的monster和gadget
		if 0 ~= ScriptLib.KillGroupEntity(context, { group_id = 133007159, monsters = {}, gadgets = {597} }) then
			return -1
		end
	
	return 0
end

-- 触发条件
function condition_EVENT_GADGET_CREATE_133(context, evt)
	if 614 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_CREATE_133(context, evt)
	-- 设置操作台选项
	if 0 ~= ScriptLib.SetWorktopOptionsByGroupId(context, 133007162, 614, {170}) then
		return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_SELECT_OPTION_134(context, evt)
	-- 判断是gadgetid 614 option_id 170
	if 614 ~= evt.param1 then
		return false	
	end
	
	if 170 ~= evt.param2 then
		return false
	end
	
	
	return true
end

-- 触发操作
function action_EVENT_SELECT_OPTION_134(context, evt)
		-- 杀死Group内指定的monster和gadget
		if 0 ~= ScriptLib.KillGroupEntity(context, { group_id = 133007162, monsters = {}, gadgets = {614} }) then
			return -1
		end
	
	-- 通知任务系统完成条件类型"LUA通知"，复杂参数为quest_param的进度+1
	if 0 ~= ScriptLib.AddQuestProgress(context, "300701202") then
	  return -1
	end
	
		-- 杀死Group内指定的monster和gadget
		if 0 ~= ScriptLib.KillGroupEntity(context, { group_id = 133007159, monsters = {}, gadgets = {596} }) then
			return -1
		end
	
	return 0
end

-- 触发条件
function condition_EVENT_GADGET_CREATE_135(context, evt)
	if 615 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_CREATE_135(context, evt)
	-- 设置操作台选项
	if 0 ~= ScriptLib.SetWorktopOptionsByGroupId(context, 133007162, 615, {170}) then
		return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_SELECT_OPTION_136(context, evt)
	-- 判断是gadgetid 615 option_id 170
	if 615 ~= evt.param1 then
		return false	
	end
	
	if 170 ~= evt.param2 then
		return false
	end
	
	
	return true
end

-- 触发操作
function action_EVENT_SELECT_OPTION_136(context, evt)
		-- 杀死Group内指定的monster和gadget
		if 0 ~= ScriptLib.KillGroupEntity(context, { group_id = 133007162, monsters = {}, gadgets = {615} }) then
			return -1
		end
	
	-- 通知任务系统完成条件类型"LUA通知"，复杂参数为quest_param的进度+1
	if 0 ~= ScriptLib.AddQuestProgress(context, "300701203") then
	  return -1
	end
	
		-- 杀死Group内指定的monster和gadget
		if 0 ~= ScriptLib.KillGroupEntity(context, { group_id = 133007159, monsters = {}, gadgets = {598} }) then
			return -1
		end
	
	return 0
end
