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
	{ config_id = 2603, gadget_id = 70620002, pos = { x = 1680.8, y = 278.2, z = -1123.5 }, rot = { x = 0.0, y = 77.9, z = 0.0 }, level = 1 },
	{ config_id = 2604, gadget_id = 70210011, pos = { x = 1681.4, y = 278.1, z = -1122.9 }, rot = { x = 0.0, y = 191.9, z = 0.0 }, level = 1, chest_drop_id = 403302, isOneoff = true, persistent = true }
}

-- 区域
regions = {
	{ config_id = 243, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1681.8, y = 278.1, z = -1123.4 } },
	{ config_id = 313, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1681.3, y = 278.1, z = -1123.3 } }
}

-- 触发器
triggers = {
	{ name = "GADGET_STATE_CHANGE_243", event = EventType.EVENT_GADGET_STATE_CHANGE, source = "", condition = "condition_EVENT_GADGET_STATE_CHANGE_243", action = "action_EVENT_GADGET_STATE_CHANGE_243" },
	{ name = "CLIENT_EXECUTE_313", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_313", trigger_count = 0, tlog_tag = "小平原_斥力风场1_交接山区_结束" }
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
		gadgets = { 2603, 2604 },
		regions = { 243, 313 },
		triggers = { "GADGET_STATE_CHANGE_243", "CLIENT_EXECUTE_313" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_GADGET_STATE_CHANGE_243(context, evt)
	if 2604 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_STATE_CHANGE_243(context, evt)
		-- 永久关闭CongfigId的Gadget，需要和Groups的RefreshWithBlock标签搭配
		if 0 ~= ScriptLib.KillEntityByConfigId(context, { config_id = 2603 }) then
		    return -1
		end
		
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_313(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end
