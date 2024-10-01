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
	{ config_id = 3703, gadget_id = 70220014, pos = { x = 2404.5, y = 251.1, z = -1418.0 }, rot = { x = 0.0, y = 297.5, z = 0.0 }, level = 1 },
	{ config_id = 3704, gadget_id = 70220014, pos = { x = 2400.7, y = 251.2, z = -1417.4 }, rot = { x = 0.0, y = 297.5, z = 0.0 }, level = 1 },
	{ config_id = 3876, gadget_id = 70210101, pos = { x = 2401.0, y = 251.7, z = -1416.9 }, rot = { x = 0.0, y = 17.4, z = 0.0 }, level = 1, chest_drop_id = 400101, type = GadgetType.GADGET_WORLD_CHECT },
	{ config_id = 3877, gadget_id = 70210101, pos = { x = 2404.5, y = 251.7, z = -1417.4 }, rot = { x = 0.0, y = 17.4, z = 0.0 }, level = 1, chest_drop_id = 400101, type = GadgetType.GADGET_WORLD_CHECT },
	{ config_id = 4163, gadget_id = 70220016, pos = { x = 2406.3, y = 250.9, z = -1416.3 }, rot = { x = 0.0, y = 22.1, z = 0.0 }, level = 1 }
}

-- 区域
regions = {
	{ config_id = 480, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2400.1, y = 253.2, z = -1416.6 } },
	{ config_id = 481, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2399.3, y = 251.5, z = -1417.3 } }
}

-- 触发器
triggers = {
	{ name = "ANY_GADGET_DIE_480", event = EventType.EVENT_ANY_GADGET_DIE, source = "", condition = "condition_EVENT_ANY_GADGET_DIE_480", action = "action_EVENT_ANY_GADGET_DIE_480" },
	{ name = "ANY_GADGET_DIE_481", event = EventType.EVENT_ANY_GADGET_DIE, source = "", condition = "condition_EVENT_ANY_GADGET_DIE_481", action = "action_EVENT_ANY_GADGET_DIE_481" }
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
		gadgets = { 3703, 3704, 3876, 3877, 4163 },
		regions = { 480, 481 },
		triggers = { "ANY_GADGET_DIE_480", "ANY_GADGET_DIE_481" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ANY_GADGET_DIE_480(context, evt)
	if 3703 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_GADGET_DIE_480(context, evt)
		-- 永久关闭CongfigId的Gadget，需要和Groups的RefreshWithBlock标签搭配
		if 0 ~= ScriptLib.KillEntityByConfigId(context, { config_id = 3877 }) then
		    return -1
		end
		
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_GADGET_DIE_481(context, evt)
	if 3704 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_GADGET_DIE_481(context, evt)
		-- 永久关闭CongfigId的Gadget，需要和Groups的RefreshWithBlock标签搭配
		if 0 ~= ScriptLib.KillEntityByConfigId(context, { config_id = 3876 }) then
		    return -1
		end
		
	
	return 0
end
