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
	{ config_id = 5, npc_id = 93, pos = { x = 2595.7, y = 225.7, z = -1159.9 }, rot = { x = 0.0, y = 275.8, z = 0.0 } }
}

-- 装置
gadgets = {
	{ config_id = 2966, gadget_id = 70220014, pos = { x = 2598.0, y = 225.8, z = -1159.3 }, rot = { x = 0.0, y = 168.8, z = 0.0 }, level = 1 },
	{ config_id = 2967, gadget_id = 70220014, pos = { x = 2597.1, y = 225.8, z = -1156.4 }, rot = { x = 0.0, y = 224.8, z = 0.0 }, level = 1 },
	{ config_id = 2968, gadget_id = 70500000, pos = { x = 2585.2, y = 223.0, z = -1152.9 }, rot = { x = 0.0, y = 34.6, z = 0.0 }, level = 1, point_type = 2001 },
	{ config_id = 2970, gadget_id = 70500000, pos = { x = 2575.8, y = 220.1, z = -1163.8 }, rot = { x = 0.0, y = 266.5, z = 0.0 }, level = 1, point_type = 1001 },
	{ config_id = 3390, gadget_id = 70210011, pos = { x = 2598.6, y = 225.2, z = -1163.5 }, rot = { x = 0.0, y = 345.7, z = 5.5 }, level = 1, chest_drop_id = 403302, isOneoff = true },
	{ config_id = 3803, gadget_id = 70290002, pos = { x = 2660.3, y = 233.3, z = -1082.5 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 3804, gadget_id = 70500000, pos = { x = 2659.3, y = 234.9, z = -1081.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3001, owner = 3803 },
	{ config_id = 3805, gadget_id = 70500000, pos = { x = 2661.2, y = 235.9, z = -1083.5 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3001, owner = 3803 },
	{ config_id = 3806, gadget_id = 70500000, pos = { x = 2660.4, y = 236.2, z = -1081.1 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3001, owner = 3803 }
}

-- 区域
regions = {
	{ config_id = 340, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2597.8, y = 225.5, z = -1136.7 } },
	{ config_id = 471, shape = RegionShape.SPHERE, radius = 30, pos = { x = 2222.8, y = 210.0, z = -946.7 } }
}

-- 触发器
triggers = {
	{ name = "CLIENT_EXECUTE_340", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_340", trigger_count = 0 },
	{ name = "ENTER_REGION_471", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_471", action = "action_EVENT_ENTER_REGION_471" }
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
	npcs = { 5 }
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
		gadgets = { 2966, 2967, 2968, 2970, 3390, 3803, 3804, 3805, 3806 },
		regions = { 340, 471 },
		triggers = { "CLIENT_EXECUTE_340", "ENTER_REGION_471" },
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
function action_EVENT_CLIENT_EXECUTE_340(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end

-- 触发条件
function condition_EVENT_ENTER_REGION_471(context, evt)
	if evt.param1 ~= 471 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_471(context, evt)
	-- 杀死Group内所有NPC
		if 0 ~= ScriptLib.KillGroupEntity(context, { group_id = 210, kill_policy = GroupKillPolicy.GROUP_KILL_NPC }) then
			return -1
		end
		
	
	return 0
end
