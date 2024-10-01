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
	{ config_id = 3834, gadget_id = 70380002, pos = { x = 2288.8, y = 213.0, z = -1126.6 }, rot = { x = 0.0, y = 130.5, z = 0.0 }, level = 1, drop_id = 180002, route_id = 3003233, save_route = true },
	{ config_id = 4115, gadget_id = 70210021, pos = { x = 2292.7, y = 209.8, z = -1122.8 }, rot = { x = 359.4, y = 142.3, z = 354.7 }, level = 1, chest_drop_id = 181001, showcutscene = true, isOneoff = true, persistent = true, type = GadgetType.GADGET_WORLD_CHECT }
}

-- 区域
regions = {
	{ config_id = 510, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2273.1, y = 209.2, z = -1125.1 } },
	{ config_id = 539, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2293.0, y = 209.7, z = -1124.1 } },
	{ config_id = 542, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2295.1, y = 210.0, z = -1121.7 } }
}

-- 触发器
triggers = {
	{ name = "ANY_GADGET_DIE_510", event = EventType.EVENT_ANY_GADGET_DIE, source = "", condition = "condition_EVENT_ANY_GADGET_DIE_510", action = "action_EVENT_ANY_GADGET_DIE_510" },
	{ name = "QUEST_START_539", event = EventType.EVENT_QUEST_START, source = "35404", condition = "condition_EVENT_QUEST_START_539", action = "action_EVENT_QUEST_START_539", trigger_count = 0 },
	{ name = "TIMER_EVENT_542", event = EventType.EVENT_TIMER_EVENT, source = "born", condition = "", action = "action_EVENT_TIMER_EVENT_542" }
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
		regions = { 510, 539, 542 },
		triggers = { "ANY_GADGET_DIE_510", "QUEST_START_539", "TIMER_EVENT_542" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ANY_GADGET_DIE_510(context, evt)
	if 3834 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_GADGET_DIE_510(context, evt)
	-- 通知任务系统完成条件类型"LUA通知"，复杂参数为quest_param的进度+1
	if 0 ~= ScriptLib.AddQuestProgress(context, "133003079") then
	  return -1
	end
	
	-- 创生gadget 4115
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 4115 }) then
		return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_QUEST_START_539(context, evt)
	if 35404 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_QUEST_START_539(context, evt)
	-- 延迟4秒后,向groupId为：133003439的对象,请求一次调用,并将string参数："born" 传递过去
	if 0 ~= ScriptLib.CreateGroupTimerEvent(context, 133003439, "born", 4) then
	  return -1
	end
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_TIMER_EVENT_542(context, evt)
	-- 创生gadget 3834
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 3834 }) then
		return -1
	end
	
	return 0
end
