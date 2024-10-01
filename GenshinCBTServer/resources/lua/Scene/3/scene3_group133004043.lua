--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 112, monster_id = 21010501, pos = { x = 2647.6, y = 223.1, z = -482.0 }, rot = { x = 0.0, y = 251.8, z = 0.0 }, level = 12, drop_id = 303003, disableWander = true },
	{ config_id = 113, monster_id = 21010501, pos = { x = 2636.4, y = 219.6, z = -487.2 }, rot = { x = 0.0, y = 139.9, z = 0.0 }, level = 12, drop_id = 303003, disableWander = true },
	{ config_id = 114, monster_id = 21010401, pos = { x = 2644.8, y = 221.7, z = -484.7 }, rot = { x = 0.0, y = 17.5, z = 0.0 }, level = 12, drop_id = 303003, disableWander = true },
	{ config_id = 370, monster_id = 21030301, pos = { x = 2645.2, y = 223.0, z = -481.7 }, rot = { x = 0.0, y = 153.8, z = 0.0 }, level = 12, drop_id = 303003, disableWander = true },
	{ config_id = 371, monster_id = 20010301, pos = { x = 2643.3, y = 222.3, z = -482.3 }, rot = { x = 0.0, y = 113.0, z = 0.0 }, level = 12, drop_id = 303003, disableWander = true }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 171, gadget_id = 70210032, pos = { x = 2642.9, y = 222.8, z = -479.9 }, rot = { x = 3.3, y = 140.4, z = 342.0 }, level = 1, chest_drop_id = 403344, state = GadgetState.ChestLocked, isOneoff = true },
	{ config_id = 831, gadget_id = 70220013, pos = { x = 2648.6, y = 223.9, z = -479.9 }, rot = { x = 0.0, y = 117.4, z = 344.9 }, level = 1 },
	{ config_id = 832, gadget_id = 70310003, pos = { x = 2636.5, y = 220.5, z = -484.5 }, rot = { x = 0.0, y = 233.7, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 833, gadget_id = 70220014, pos = { x = 2646.6, y = 223.6, z = -479.4 }, rot = { x = 0.0, y = 358.7, z = 0.0 }, level = 1 },
	{ config_id = 834, gadget_id = 70220014, pos = { x = 2645.7, y = 223.5, z = -478.6 }, rot = { x = 0.0, y = 77.2, z = 0.0 }, level = 1 },
	{ config_id = 836, gadget_id = 70310004, pos = { x = 2645.5, y = 222.6, z = -483.1 }, rot = { x = 0.0, y = 256.8, z = 0.0 }, level = 1 },
	{ config_id = 1374, gadget_id = 70310003, pos = { x = 2647.9, y = 222.5, z = -483.6 }, rot = { x = 0.0, y = 233.7, z = 0.0 }, level = 1, state = GadgetState.GearStart }
}

-- 区域
regions = {
	{ config_id = 103, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2643.9, y = 220.7, z = -488.8 } },
	{ config_id = 226, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2646.3, y = 221.1, z = -487.6 } }
}

-- 触发器
triggers = {
	{ name = "CLIENT_EXECUTE_103", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_103", trigger_count = 0 },
	{ name = "ANY_MONSTER_DIE_226", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_226", action = "action_EVENT_ANY_MONSTER_DIE_226", tlog_tag = "奔狼岭_43_怪物营地_结算" }
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
		monsters = { 112, 113, 114, 370, 371 },
		gadgets = { 171, 831, 832, 833, 834, 836, 1374 },
		regions = { 103, 226 },
		triggers = { "CLIENT_EXECUTE_103", "ANY_MONSTER_DIE_226" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_103(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_226(context, evt)
	-- 判断剩余怪物数量是否是0
	if ScriptLib.GetGroupMonsterCount(context) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_226(context, evt)
	-- 解锁目标171
	if 0 ~= ScriptLib.ChangeGroupGadget(context, { config_id = 171, state = GadgetState.Default }) then
		return -1
	end
	
	return 0
end
