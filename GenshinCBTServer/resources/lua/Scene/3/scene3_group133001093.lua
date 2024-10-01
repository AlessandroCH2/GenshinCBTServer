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
	{ config_id = 1720, gadget_id = 70690001, pos = { x = 1994.7, y = 213.5, z = -1116.7 }, rot = { x = 0.0, y = 182.1, z = 0.0 }, level = 1 },
	{ config_id = 1722, gadget_id = 70690001, pos = { x = 1991.7, y = 205.0, z = -1162.4 }, rot = { x = 0.0, y = 203.5, z = 0.0 }, level = 1 },
	{ config_id = 1724, gadget_id = 70680001, pos = { x = 2002.9, y = 195.9, z = -1187.5 }, rot = { x = 0.0, y = 340.7, z = 0.0 }, level = 1, arguments = { 0, 0, 0 } },
	{ config_id = 1725, gadget_id = 70900039, pos = { x = 1995.4, y = 216.2, z = -1106.3 }, rot = { x = 0.0, y = 281.8, z = 0.0 }, level = 1, persistent = true },
	{ config_id = 2076, gadget_id = 70500000, pos = { x = 1629.3, y = 261.5, z = -1420.4 }, rot = { x = 0.0, y = 354.5, z = 0.0 }, level = 1, point_type = 4001001, isOneoff = true },
	{ config_id = 2219, gadget_id = 70290001, pos = { x = 1933.9, y = 201.3, z = -1491.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 2220, gadget_id = 70500000, pos = { x = 1934.0, y = 201.8, z = -1491.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3002, owner = 2219 },
	{ config_id = 2221, gadget_id = 70500000, pos = { x = 1933.9, y = 202.1, z = -1492.2 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3002, owner = 2219 },
	{ config_id = 2222, gadget_id = 70500000, pos = { x = 1934.2, y = 202.5, z = -1491.9 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3002, owner = 2219 },
	{ config_id = 2223, gadget_id = 70290001, pos = { x = 1937.0, y = 201.4, z = -1467.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 2224, gadget_id = 70500000, pos = { x = 1937.0, y = 202.0, z = -1466.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3002, owner = 2223 },
	{ config_id = 2225, gadget_id = 70500000, pos = { x = 1936.9, y = 202.2, z = -1467.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3002, owner = 2223 },
	{ config_id = 2226, gadget_id = 70500000, pos = { x = 1937.2, y = 202.6, z = -1467.1 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3002, owner = 2223 }
}

-- 区域
regions = {
	{ config_id = 73, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1995.6, y = 216.1, z = -1106.3 } },
	{ config_id = 74, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1995.3, y = 216.1, z = -1106.7 } }
}

-- 触发器
triggers = {
	{ name = "GADGET_STATE_CHANGE_73", event = EventType.EVENT_GADGET_STATE_CHANGE, source = "", condition = "condition_EVENT_GADGET_STATE_CHANGE_73", action = "action_EVENT_GADGET_STATE_CHANGE_73", trigger_count = 0 },
	{ name = "TIMER_EVENT_74", event = EventType.EVENT_TIMER_EVENT, source = "stop2029", condition = "", action = "action_EVENT_TIMER_EVENT_74", trigger_count = 0 }
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
		gadgets = { 2076, 2219, 2220, 2221, 2222, 2223, 2224, 2225, 2226 },
		regions = { },
		triggers = { },
		rand_weight = 100
	},
	{
		-- suite_id = 1,
		-- description = suite_2,
		monsters = { },
		gadgets = { 2076, 2219, 2220, 2221, 2222, 2223, 2224, 2225, 2226 },
		regions = { },
		triggers = { },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_GADGET_STATE_CHANGE_73(context, evt)
	if 1725 ~= evt.param2 or GadgetState.GearStart ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_STATE_CHANGE_73(context, evt)
	-- 创建id为2026的gadget
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 2026 }) then
	  return -1
	end
	
	-- 创建id为2027的gadget
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 2027 }) then
	  return -1
	end
	
	-- 延迟20秒后,向groupId为：133001093的对象,请求一次调用,并将string参数："stop2029" 传递过去
	if 0 ~= ScriptLib.CreateGroupTimerEvent(context, 133001093, "stop2029", 20) then
	  return -1
	end
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_TIMER_EVENT_74(context, evt)
	-- 将configid为 2029 的物件更改为状态 GadgetState.Default
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 2029, GadgetState.Default) then
			return -1
		end 
	
		-- 重新生成指定group，指定suite
		if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 133001093, suite = 2 }) then
			return -1
		end
	
	return 0
end
