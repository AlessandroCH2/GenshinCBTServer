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
	{ config_id = 2937, gadget_id = 70500000, pos = { x = 1382.8, y = 317.9, z = -1320.1 }, rot = { x = 0.0, y = 339.2, z = 0.0 }, level = 1, point_type = 3007 },
	{ config_id = 2938, gadget_id = 70500000, pos = { x = 1378.3, y = 317.6, z = -1318.0 }, rot = { x = 0.0, y = 339.2, z = 0.0 }, level = 1, point_type = 3007 },
	{ config_id = 2939, gadget_id = 70500000, pos = { x = 1379.6, y = 316.7, z = -1314.0 }, rot = { x = 0.0, y = 339.2, z = 0.0 }, level = 1, point_type = 3007 },
	{ config_id = 2940, gadget_id = 70500000, pos = { x = 1382.8, y = 316.8, z = -1315.6 }, rot = { x = 0.0, y = 339.2, z = 0.0 }, level = 1, point_type = 3007 },
	{ config_id = 2941, gadget_id = 70210021, pos = { x = 1380.4, y = 317.3, z = -1317.2 }, rot = { x = 1.2, y = 113.1, z = 12.6 }, level = 1, chest_drop_id = 403321, isOneoff = true, persistent = true }
}

-- 区域
regions = {
	{ config_id = 356, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1380.2, y = 317.4, z = -1317.2 } },
	{ config_id = 357, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1379.8, y = 317.5, z = -1317.7 } }
}

-- 触发器
triggers = {
	{ name = "GATHER_356", event = EventType.EVENT_GATHER, source = "", condition = "condition_EVENT_GATHER_356", action = "action_EVENT_GATHER_356", trigger_count = 0 },
	{ name = "CLIENT_EXECUTE_357", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_357", trigger_count = 0 }
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
		gadgets = { 2937, 2938, 2939, 2940 },
		regions = { 356, 357 },
		triggers = { "GATHER_356", "CLIENT_EXECUTE_357" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_GATHER_356(context, evt)
	-- 判断指定group组剩余gadget数量是否是0 
	if ScriptLib.CheckRemainGadgetCountByGroupId(context, {group_id = 133001260}) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GATHER_356(context, evt)
	-- 创建id为2936的gadget
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 2936 }) then
	  return -1
	end
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_357(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end
