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
	{ config_id = 2528, gadget_id = 70500000, pos = { x = 1672.7, y = 266.0, z = -1285.1 }, rot = { x = 0.0, y = 339.2, z = 0.0 }, level = 1, point_type = 3007 },
	{ config_id = 2529, gadget_id = 70500000, pos = { x = 1668.2, y = 266.6, z = -1283.0 }, rot = { x = 0.0, y = 339.2, z = 0.0 }, level = 1, point_type = 3007 },
	{ config_id = 2530, gadget_id = 70500000, pos = { x = 1669.5, y = 266.4, z = -1279.0 }, rot = { x = 0.0, y = 339.2, z = 0.0 }, level = 1, point_type = 3007 },
	{ config_id = 2531, gadget_id = 70500000, pos = { x = 1672.8, y = 265.9, z = -1280.6 }, rot = { x = 0.0, y = 339.2, z = 0.0 }, level = 1, point_type = 3007 },
	{ config_id = 2532, gadget_id = 70210021, pos = { x = 1670.3, y = 266.1, z = -1282.2 }, rot = { x = 0.0, y = 58.4, z = 0.0 }, level = 1, chest_drop_id = 403321, isOneoff = true, persistent = true }
}

-- 区域
regions = {
	{ config_id = 226, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1670.1, y = 266.2, z = -1282.2 } },
	{ config_id = 311, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1669.7, y = 266.3, z = -1282.7 } }
}

-- 触发器
triggers = {
	{ name = "GATHER_226", event = EventType.EVENT_GATHER, source = "", condition = "condition_EVENT_GATHER_226", action = "action_EVENT_GATHER_226", trigger_count = 0, tlog_tag = "小平原_小灯草1_交接山区_结束" },
	{ name = "CLIENT_EXECUTE_311", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_311", trigger_count = 0 }
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
		gadgets = { 2528, 2529, 2530, 2531 },
		regions = { 226, 311 },
		triggers = { "GATHER_226", "CLIENT_EXECUTE_311" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_GATHER_226(context, evt)
	-- 判断指定group组剩余gadget数量是否是0 
	if ScriptLib.CheckRemainGadgetCountByGroupId(context, {group_id = 133001196}) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GATHER_226(context, evt)
	-- 创建id为2532的gadget
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 2532 }) then
	  return -1
	end
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_311(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end
