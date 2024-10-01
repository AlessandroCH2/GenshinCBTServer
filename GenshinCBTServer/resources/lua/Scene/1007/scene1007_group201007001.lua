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
	{ config_id = 1, gadget_id = 70350003, pos = { x = -35.0, y = -77.1, z = -174.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 2, gadget_id = 70360002, pos = { x = -35.0, y = -77.0, z = -107.8 }, rot = { x = 0.0, y = 180.0, z = 0.0 }, level = 1 },
	{ config_id = 3, gadget_id = 70690001, pos = { x = -46.1, y = -72.9, z = -52.1 }, rot = { x = 67.6, y = 251.1, z = 0.0 }, level = 1 },
	{ config_id = 4, gadget_id = 70690001, pos = { x = -3.6, y = -61.9, z = -23.1 }, rot = { x = 320.0, y = 309.0, z = 0.0 }, level = 1 },
	{ config_id = 5, gadget_id = 70220013, pos = { x = -47.3, y = -56.8, z = 0.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 6, gadget_id = 70220013, pos = { x = -47.3, y = -54.7, z = 0.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 7, gadget_id = 70220013, pos = { x = -47.2, y = -52.7, z = 0.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 8, gadget_id = 70220013, pos = { x = -47.2, y = -50.7, z = 0.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 9, gadget_id = 70220013, pos = { x = -47.4, y = -48.7, z = 0.5 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 }
}

-- 区域
regions = {
	{ config_id = 1, shape = RegionShape.SPHERE, radius = 5, pos = { x = -34.4, y = -77.6, z = -111.9 } },
	{ config_id = 2, shape = RegionShape.SPHERE, radius = 5, pos = { x = -34.7, y = -77.7, z = -112.1 } }
}

-- 触发器
triggers = {
	{ name = "GADGET_CREATE_1", event = EventType.EVENT_GADGET_CREATE, source = "", condition = "condition_EVENT_GADGET_CREATE_1", action = "action_EVENT_GADGET_CREATE_1" },
	{ name = "SELECT_OPTION_2", event = EventType.EVENT_SELECT_OPTION, source = "", condition = "condition_EVENT_SELECT_OPTION_2", action = "action_EVENT_SELECT_OPTION_2", trigger_count = 0 }
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
		gadgets = { 1, 2, 3, 4, 5, 6, 7, 8, 9 },
		regions = { 1, 2 },
		triggers = { "GADGET_CREATE_1", "SELECT_OPTION_2" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_GADGET_CREATE_1(context, evt)
	if 2 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_CREATE_1(context, evt)
	-- 设置操作台选项
	if 0 ~= ScriptLib.SetWorktopOptions(context, {2}) then
		return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_SELECT_OPTION_2(context, evt)
	-- 判断是gadgetid 2
	if 2 ~= evt.param1 then
			return false
		end
	
	return true
end

-- 触发操作
function action_EVENT_SELECT_OPTION_2(context, evt)
	-- 根据不同的选项解锁风场
	if 2 == evt.param2 then
		if 0 ~= ScriptLib.UnlockForce(context, 1) then
		   return -1
	    end
		
	end
	
	-- 根据不同的选项解锁风场
	if 2 == evt.param2 then
		if 0 ~= ScriptLib.UnlockForce(context, 2) then
		   return -1
	    end
		
	end
	
	-- 根据不同的选项解锁风场
	if 2 == evt.param2 then
		if 0 ~= ScriptLib.UnlockForce(context, 3) then
		   return -1
	    end
		
	end
	
	return 0
end
