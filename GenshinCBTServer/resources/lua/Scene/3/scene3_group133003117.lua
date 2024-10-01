--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 533, monster_id = 20010201, pos = { x = 2509.7, y = 299.8, z = -1800.1 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 12, drop_id = 303143 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 2554, gadget_id = 70310001, pos = { x = 2494.5, y = 299.2, z = -1800.0 }, rot = { x = 0.0, y = 161.6, z = 0.0 }, level = 1 },
	{ config_id = 2555, gadget_id = 70310001, pos = { x = 2494.4, y = 300.1, z = -1805.2 }, rot = { x = 0.0, y = 161.6, z = 0.0 }, level = 1 },
	{ config_id = 2556, gadget_id = 70210042, pos = { x = 2494.9, y = 300.0, z = -1802.8 }, rot = { x = 0.0, y = 276.3, z = 352.3 }, level = 1, chest_drop_id = 403243, state = GadgetState.ChestLocked, isOneoff = true, persistent = true }
}

-- 区域
regions = {
	{ config_id = 94, shape = RegionShape.SPHERE, radius = 14.2, pos = { x = 2492.1, y = 299.3, z = -1802.5 } },
	{ config_id = 95, shape = RegionShape.SPHERE, radius = 10.9, pos = { x = 2489.8, y = 299.3, z = -1802.9 } },
	{ config_id = 96, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2484.1, y = 299.4, z = -1804.1 } },
	{ config_id = 97, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2493.4, y = 299.3, z = -1802.2 } },
	{ config_id = 308, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2482.9, y = 299.4, z = -1804.3 } },
	{ config_id = 309, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2482.9, y = 299.4, z = -1804.3 } },
	{ config_id = 422, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2482.9, y = 299.4, z = -1804.3 } },
	{ config_id = 448, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2494.7, y = 299.8, z = -1802.3 } },
	{ config_id = 449, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2493.4, y = 300.5, z = -1808.6 } },
	{ config_id = 450, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2494.1, y = 298.8, z = -1795.8 } }
}

-- 触发器
triggers = {
	{ name = "ENTER_REGION_94", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_94", action = "action_EVENT_ENTER_REGION_94" },
	{ name = "GADGET_STATE_CHANGE_95", event = EventType.EVENT_GADGET_STATE_CHANGE, source = "", condition = "", action = "action_EVENT_GADGET_STATE_CHANGE_95" },
	{ name = "CHALLENGE_SUCCESS_96", event = EventType.EVENT_CHALLENGE_SUCCESS, source = "117", condition = "", action = "action_EVENT_CHALLENGE_SUCCESS_96", tlog_tag = "神殿_挑战_草史莱姆_结算" },
	{ name = "CHALLENGE_FAIL_97", event = EventType.EVENT_CHALLENGE_FAIL, source = "117", condition = "", action = "action_EVENT_CHALLENGE_FAIL_97", tlog_tag = "神殿_挑战_草史莱姆_失败" },
	{ name = "CLIENT_EXECUTE_308", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_308", trigger_count = 0 },
	{ name = "CLIENT_EXECUTE_309", event = EventType.EVENT_CLIENT_EXECUTE, source = "FireSourceChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_309", trigger_count = 0 },
	{ name = "CLIENT_EXECUTE_422", event = EventType.EVENT_CLIENT_EXECUTE, source = "FireSourceChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_422", trigger_count = 0 },
	{ name = "CLIENT_EXECUTE_448", event = EventType.EVENT_CLIENT_EXECUTE, source = "FireSourceChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_448", trigger_count = 0 },
	{ name = "GADGET_STATE_CHANGE_449", event = EventType.EVENT_GADGET_STATE_CHANGE, source = "", condition = "condition_EVENT_GADGET_STATE_CHANGE_449", action = "action_EVENT_GADGET_STATE_CHANGE_449", tlog_tag = "神殿_挑战_草史莱姆_开始" },
	{ name = "GADGET_STATE_CHANGE_450", event = EventType.EVENT_GADGET_STATE_CHANGE, source = "", condition = "condition_EVENT_GADGET_STATE_CHANGE_450", action = "action_EVENT_GADGET_STATE_CHANGE_450" }
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
		gadgets = { 2554, 2555, 2556 },
		regions = { 95, 96, 97, 308, 309, 422, 448, 449, 450 },
		triggers = { "GADGET_STATE_CHANGE_95", "CHALLENGE_SUCCESS_96", "CHALLENGE_FAIL_97", "CLIENT_EXECUTE_308", "CLIENT_EXECUTE_309", "CLIENT_EXECUTE_422", "CLIENT_EXECUTE_448", "GADGET_STATE_CHANGE_449", "GADGET_STATE_CHANGE_450" },
		rand_weight = 100
	},
	{
		-- suite_id = 1,
		-- description = suite_2,
		monsters = { },
		gadgets = { 2554, 2555, 2556 },
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
function condition_EVENT_ENTER_REGION_94(context, evt)
	if evt.param1 ~= 94 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_94(context, evt)
	-- 将configid为 2554 的物件更改为状态 GadgetState.GearStart
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 2554, GadgetState.GearStart) then
			return -1
		end 
	
	-- 将configid为 2555 的物件更改为状态 GadgetState.GearStart
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 2555, GadgetState.GearStart) then
			return -1
		end 
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_GADGET_STATE_CHANGE_95(context, evt)
	-- 创建编号为117（该挑战的识别id),挑战内容为125的区域挑战，具体参数填写方式，见DungeonChallengeData表中的注释，所有填写的值都必须是int类型
	if 0 ~= ScriptLib.ActiveChallenge(context, 117, 125, 60, 133003117, 1, 0) then
		return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 533, delay_time = 0 }) then
	  return -1
	end
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CHALLENGE_SUCCESS_96(context, evt)
	-- 解锁目标2556
	if 0 ~= ScriptLib.ChangeGroupGadget(context, { config_id = 2556, state = GadgetState.Default }) then
		return -1
	end
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CHALLENGE_FAIL_97(context, evt)
	-- 将configid为 2554 的物件更改为状态 GadgetState.Default
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 2554, GadgetState.Default) then
			return -1
		end 
	
	-- 将configid为 2555 的物件更改为状态 GadgetState.Default
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 2555, GadgetState.Default) then
			return -1
		end 
	
		-- 杀死Group内所有gadget
		if 0 ~= ScriptLib.KillGroupEntity(context, { group_id = 133003117, kill_policy = GroupKillPolicy.GROUP_KILL_GADGET }) then
			return -1
		end
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_308(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_309(context, evt)
	local this_gadget = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
	local this_group = ScriptLib.GetContextGroupId(context)
	if evt.param1 == 1 then
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_gadget, GadgetState.GearStart )
		return 0
	end
	if evt.param1 == 0 then
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_gadget, GadgetState.Defautl )
		return 0
	end
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_422(context, evt)
	local this_gadget = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
	local this_group = ScriptLib.GetContextGroupId(context)
	if evt.param1 == 1 then
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_gadget, GadgetState.GearStart )
		return 0
	end
	if evt.param1 == 0 then
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_gadget, GadgetState.Default )
		return 0
	end
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_448(context, evt)
	-- 针对groupid为 133003117 中该config对应的物件进行状态改变操作
	local this_gadget = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		--ScriptLib.PrintLog("config_id="..this_gadget)
	
		if evt.param1 == 1 then
			ScriptLib.SetGroupGadgetStateByConfigId(context, 133003117, this_gadget, GadgetState.GearStart )
			return 0
		end
	
		if evt.param1 == 0 then
			ScriptLib.SetGroupGadgetStateByConfigId(context, 133003117, this_gadget, GadgetState.Default )
			return 0
		end
	
	return 0
end

-- 触发条件
function condition_EVENT_GADGET_STATE_CHANGE_449(context, evt)
	if 2554 ~= evt.param2 or GadgetState.GearStart ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_STATE_CHANGE_449(context, evt)
	-- 将configid为 2555 的物件更改为状态 GadgetState.GearStart
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 2555, GadgetState.GearStart) then
			return -1
		end 
	
	return 0
end

-- 触发条件
function condition_EVENT_GADGET_STATE_CHANGE_450(context, evt)
	if 2555 ~= evt.param2 or GadgetState.GearStart ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_STATE_CHANGE_450(context, evt)
	-- 将configid为 2554 的物件更改为状态 GadgetState.GearStart
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 2554, GadgetState.GearStart) then
			return -1
		end 
	
	return 0
end
