--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 444, monster_id = 20010301, pos = { x = 1826.2, y = 245.5, z = -723.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 7 },
	{ config_id = 445, monster_id = 20010301, pos = { x = 1828.9, y = 245.5, z = -722.0 }, rot = { x = 0.0, y = 163.7, z = 0.0 }, level = 7 },
	{ config_id = 446, monster_id = 20010301, pos = { x = 1826.4, y = 245.4, z = -721.3 }, rot = { x = 0.0, y = 127.3, z = 0.0 }, level = 7 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 1422, gadget_id = 70210032, pos = { x = 1829.3, y = 245.8, z = -725.3 }, rot = { x = 2.6, y = 331.7, z = 0.7 }, level = 1, chest_drop_id = 403343, isOneoff = true, persistent = true }
}

-- 区域
regions = {
	{ config_id = 156, shape = RegionShape.SPHERE, radius = 3.4, pos = { x = 1829.5, y = 246.5, z = -725.7 } },
	{ config_id = 157, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1829.5, y = 245.7, z = -723.8 } },
	{ config_id = 263, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1828.3, y = 245.7, z = -724.2 } },
	{ config_id = 298, shape = RegionShape.SPHERE, radius = 2.3, pos = { x = 1846.8, y = 228.9, z = -722.5 } },
	{ config_id = 299, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1827.5, y = 245.6, z = -725.9 } }
}

-- 触发器
triggers = {
	{ name = "ENTER_REGION_156", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_156", action = "action_EVENT_ENTER_REGION_156" },
	{ name = "ANY_MONSTER_DIE_157", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_157", action = "action_EVENT_ANY_MONSTER_DIE_157" },
	{ name = "CLIENT_EXECUTE_263", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_263", trigger_count = 0 },
	{ name = "GADGET_STATE_CHANGE_298", event = EventType.EVENT_GADGET_STATE_CHANGE, source = "", condition = "condition_EVENT_GADGET_STATE_CHANGE_298", action = "action_EVENT_GADGET_STATE_CHANGE_298", trigger_count = 0 },
	{ name = "GADGET_STATE_CHANGE_299", event = EventType.EVENT_GADGET_STATE_CHANGE, source = "", condition = "condition_EVENT_GADGET_STATE_CHANGE_299", action = "action_EVENT_GADGET_STATE_CHANGE_299" }
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
	suite = 2,
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
		gadgets = { 1422 },
		regions = { 156, 157, 263, 298 },
		triggers = { "ENTER_REGION_156", "ANY_MONSTER_DIE_157", "CLIENT_EXECUTE_263", "GADGET_STATE_CHANGE_298" },
		rand_weight = 100
	},
	{
		-- suite_id = 1,
		-- description = suite_2,
		monsters = { },
		gadgets = { },
		regions = { 298 },
		triggers = { "GADGET_STATE_CHANGE_298" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ENTER_REGION_156(context, evt)
	if evt.param1 ~= 156 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_156(context, evt)
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 444, delay_time = 0 }) then
	  return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 445, delay_time = 0 }) then
	  return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 446, delay_time = 0 }) then
	  return -1
	end
	
	-- 将configid为 1422 的物件更改为状态 GadgetState.ChestLocked
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 1422, GadgetState.ChestLocked) then
			return -1
		end 
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_157(context, evt)
	-- 判断剩余怪物数量是否是0
	if ScriptLib.GetGroupMonsterCount(context) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_157(context, evt)
	-- 解锁目标1422
	if 0 ~= ScriptLib.ChangeGroupGadget(context, { config_id = 1422, state = GadgetState.Default }) then
		return -1
	end
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_263(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end

-- 触发条件
function condition_EVENT_GADGET_STATE_CHANGE_298(context, evt)
	if 1422 ~= evt.param2 or GadgetState.ChestOpened ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_STATE_CHANGE_298(context, evt)
	-- 通知任务系统完成条件类型"LUA通知"，复杂参数为quest_param的进度+1
	if 0 ~= ScriptLib.AddQuestProgress(context, "133002105") then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_GADGET_STATE_CHANGE_299(context, evt)
	if 1422 ~= evt.param2 or GadgetState.ChestOpened ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_STATE_CHANGE_299(context, evt)
	-- 通知任务系统完成条件类型"LUA通知"，复杂参数为quest_param的进度+1
	if 0 ~= ScriptLib.AddQuestProgress(context, "133002105") then
	  return -1
	end
	
	return 0
end
