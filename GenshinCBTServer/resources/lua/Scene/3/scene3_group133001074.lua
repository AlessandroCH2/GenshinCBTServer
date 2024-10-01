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
	{ config_id = 1558, gadget_id = 70210021, pos = { x = 1827.0, y = 198.8, z = -1164.1 }, rot = { x = 0.0, y = 142.9, z = 0.0 }, level = 1, chest_drop_id = 403321, isOneoff = true, persistent = true },
	{ config_id = 1559, gadget_id = 70210011, pos = { x = 1884.2, y = 200.7, z = -1252.8 }, rot = { x = 0.0, y = 278.5, z = 0.0 }, level = 1, chest_drop_id = 403301, isOneoff = true, persistent = true },
	{ config_id = 1563, gadget_id = 70500000, pos = { x = 1826.5, y = 213.6, z = -1225.5 }, rot = { x = 0.0, y = 297.1, z = 0.0 }, level = 1, point_type = 4001001, isOneoff = true }
}

-- 区域
regions = {
	{ config_id = 263, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1843.2, y = 201.8, z = -1205.2 } },
	{ config_id = 275, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2018.7, y = 197.9, z = -1242.6 } }
}

-- 触发器
triggers = {
	{ name = "GATHER_263", event = EventType.EVENT_GATHER, source = "", condition = "condition_EVENT_GATHER_263", action = "action_EVENT_GATHER_263" },
	{ name = "CLIENT_EXECUTE_275", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_275", trigger_count = 0 }
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
		gadgets = { 1558, 1559, 1563 },
		regions = { 263, 275 },
		triggers = { "GATHER_263", "CLIENT_EXECUTE_275" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_GATHER_263(context, evt)
	if 1563 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GATHER_263(context, evt)
		-- 永久关闭CongfigId的Gadget，需要和Groups的RefreshWithBlock标签搭配
		if 0 ~= ScriptLib.KillEntityByConfigId(context, { config_id = 24 }) then
		    return -1
		end
		
	
		-- 永久关闭CongfigId的Gadget，需要和Groups的RefreshWithBlock标签搭配
		if 0 ~= ScriptLib.KillEntityByConfigId(context, { config_id = 28 }) then
		    return -1
		end
		
	
		-- 永久关闭CongfigId的Gadget，需要和Groups的RefreshWithBlock标签搭配
		if 0 ~= ScriptLib.KillEntityByConfigId(context, { config_id = 30 }) then
		    return -1
		end
		
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_275(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end
