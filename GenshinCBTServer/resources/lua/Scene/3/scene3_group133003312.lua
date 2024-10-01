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
	{ config_id = 3267, gadget_id = 70500000, pos = { x = 2977.3, y = 236.1, z = -1802.9 }, rot = { x = 0.0, y = 44.1, z = 0.0 }, level = 1, point_type = 2004001 },
	{ config_id = 3268, gadget_id = 70500000, pos = { x = 2974.3, y = 236.0, z = -1799.9 }, rot = { x = 0.0, y = 201.0, z = 0.0 }, level = 1, point_type = 2004001 },
	{ config_id = 3269, gadget_id = 70500000, pos = { x = 2977.3, y = 235.9, z = -1796.9 }, rot = { x = 0.0, y = 220.7, z = 0.0 }, level = 1, point_type = 2004001 },
	{ config_id = 3270, gadget_id = 70500000, pos = { x = 2980.3, y = 236.0, z = -1799.9 }, rot = { x = 0.0, y = 47.0, z = 0.0 }, level = 1, point_type = 2004001 },
	{ config_id = 3405, gadget_id = 70210031, pos = { x = 2977.3, y = 236.0, z = -1799.8 }, rot = { x = 0.0, y = 133.7, z = 0.0 }, level = 1, chest_drop_id = 403224, isOneoff = true },
	{ config_id = 3406, gadget_id = 70500000, pos = { x = 2979.3, y = 236.0, z = -1801.9 }, rot = { x = 0.0, y = 243.1, z = 0.0 }, level = 1, point_type = 2004001 },
	{ config_id = 3407, gadget_id = 70500000, pos = { x = 2975.3, y = 236.1, z = -1801.9 }, rot = { x = 0.0, y = 354.9, z = 0.0 }, level = 1, point_type = 2004001 },
	{ config_id = 3408, gadget_id = 70500000, pos = { x = 2979.3, y = 235.9, z = -1797.9 }, rot = { x = 0.0, y = 268.1, z = 0.0 }, level = 1, point_type = 2004001 },
	{ config_id = 3409, gadget_id = 70500000, pos = { x = 2975.3, y = 235.9, z = -1797.9 }, rot = { x = 0.0, y = 61.7, z = 0.0 }, level = 1, point_type = 2004001 }
}

-- 区域
regions = {
	{ config_id = 269, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2976.9, y = 236.3, z = -1799.7 } },
	{ config_id = 387, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2977.2, y = 236.0, z = -1799.9 } }
}

-- 触发器
triggers = {
	{ name = "GATHER_269", event = EventType.EVENT_GATHER, source = "", condition = "condition_EVENT_GATHER_269", action = "action_EVENT_GATHER_269" },
	{ name = "CLIENT_EXECUTE_387", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_387", trigger_count = 0 }
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
		gadgets = { },
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
function condition_EVENT_GATHER_269(context, evt)
	-- 判断指定group组剩余gadget数量是否是0 
	if ScriptLib.CheckRemainGadgetCountByGroupId(context, {group_id = 133003312}) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GATHER_269(context, evt)
	-- 创建id为3405的gadget
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 3405 }) then
	  return -1
	end
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_387(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end
