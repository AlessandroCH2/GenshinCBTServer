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
	{ config_id = 2607, gadget_id = 70620002, pos = { x = 1467.8, y = 274.7, z = -1381.0 }, rot = { x = 0.0, y = 77.9, z = 0.0 }, level = 1 },
	{ config_id = 2608, gadget_id = 70210011, pos = { x = 1468.4, y = 274.6, z = -1380.4 }, rot = { x = 0.0, y = 191.9, z = 8.3 }, level = 1, chest_drop_id = 403302, isOneoff = true, persistent = true }
}

-- 区域
regions = {
	{ config_id = 245, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1468.8, y = 274.5, z = -1380.9 } },
	{ config_id = 315, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1468.3, y = 274.6, z = -1380.8 } }
}

-- 触发器
triggers = {
	{ name = "GADGET_STATE_CHANGE_245", event = EventType.EVENT_GADGET_STATE_CHANGE, source = "", condition = "condition_EVENT_GADGET_STATE_CHANGE_245", action = "action_EVENT_GADGET_STATE_CHANGE_245", tlog_tag = "小平原_斥力风场4_交接山区_结束" },
	{ name = "CLIENT_EXECUTE_315", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_315", trigger_count = 0 }
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
		gadgets = { 2607, 2608 },
		regions = { 245, 315 },
		triggers = { "GADGET_STATE_CHANGE_245", "CLIENT_EXECUTE_315" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_GADGET_STATE_CHANGE_245(context, evt)
	if 2608 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_STATE_CHANGE_245(context, evt)
		-- 永久关闭CongfigId的Gadget，需要和Groups的RefreshWithBlock标签搭配
		if 0 ~= ScriptLib.KillEntityByConfigId(context, { config_id = 2607 }) then
		    return -1
		end
		
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_315(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end
