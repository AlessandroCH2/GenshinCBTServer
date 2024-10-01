--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 25, monster_id = 21020201, pos = { x = 191.7, y = 57.1, z = 382.3 }, rot = { x = 0.0, y = 179.3, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 30, monster_id = 21010501, pos = { x = 186.3, y = 57.1, z = 386.9 }, rot = { x = 0.0, y = 180.0, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 31, monster_id = 21010501, pos = { x = 196.7, y = 57.1, z = 386.9 }, rot = { x = 0.0, y = 180.0, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 32, monster_id = 21010501, pos = { x = 189.9, y = 57.0, z = 388.1 }, rot = { x = 0.0, y = 180.0, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 33, monster_id = 21010501, pos = { x = 194.1, y = 57.0, z = 387.7 }, rot = { x = 0.0, y = 180.0, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 34, monster_id = 23040101, pos = { x = 191.5, y = 58.5, z = 350.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, pose_id = 100 },
	{ config_id = 37, monster_id = 21010501, pos = { x = 194.0, y = 48.6, z = 274.4 }, rot = { x = 0.0, y = 177.2, z = 0.0 }, level = 0, disableWander = true, pose_id = 32 },
	{ config_id = 38, monster_id = 21010501, pos = { x = 187.2, y = 48.6, z = 274.3 }, rot = { x = 0.0, y = 181.9, z = 0.0 }, level = 0, disableWander = true, pose_id = 32 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 28, gadget_id = 70350003, pos = { x = 176.5, y = 56.9, z = 328.5 }, rot = { x = 0.0, y = 90.0, z = 0.0 }, level = 1 },
	{ config_id = 29, gadget_id = 70350002, pos = { x = 191.5, y = 58.5, z = 347.4 }, rot = { x = 0.0, y = 180.0, z = 0.0 }, level = 1 },
	{ config_id = 30, gadget_id = 70350003, pos = { x = 206.9, y = 57.0, z = 328.4 }, rot = { x = 0.0, y = 270.0, z = 0.0 }, level = 1 },
	{ config_id = 31, gadget_id = 70210041, pos = { x = 191.6, y = 57.1, z = 382.3 }, rot = { x = 0.0, y = 180.0, z = 0.0 }, level = 1, chest_drop_id = 1400800, showcutscene = true, type = GadgetType.GADGET_DUNGEON_PASS_CHEST }
}

-- 区域
regions = {
	{ config_id = 7, shape = RegionShape.SPHERE, radius = 5, pos = { x = 191.7, y = 57.0, z = 315.6 } },
	{ config_id = 9, shape = RegionShape.SPHERE, radius = 5, pos = { x = 191.9, y = 57.0, z = 365.4 } },
	{ config_id = 12, shape = RegionShape.CUBIC, size = { x = 33.5, y = 26.2, z = 1.0 }, pos = { x = 191.0, y = 48.5, z = 242.4 } },
	{ config_id = 14, shape = RegionShape.SPHERE, radius = 5, pos = { x = 197.5, y = 57.0, z = 383.9 } },
	{ config_id = 15, shape = RegionShape.SPHERE, radius = 5, pos = { x = 190.1, y = 57.1, z = 381.3 } }
}

-- 触发器
triggers = {
	{ name = "ENTER_REGION_7", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_7", action = "action_EVENT_ENTER_REGION_7", trigger_count = 0 },
	{ name = "ANY_MONSTER_DIE_9", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_9", action = "action_EVENT_ANY_MONSTER_DIE_9" },
	{ name = "ENTER_REGION_12", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_12", action = "action_EVENT_ENTER_REGION_12" },
	{ name = "ANY_MONSTER_DIE_14", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_14", action = "action_EVENT_ANY_MONSTER_DIE_14" },
	{ name = "DUNGEON_SETTLE_15", event = EventType.EVENT_DUNGEON_SETTLE, source = "", condition = "condition_EVENT_DUNGEON_SETTLE_15", action = "action_EVENT_DUNGEON_SETTLE_15" }
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
		-- description = suite_1,
		monsters = { 25, 30, 31, 32, 33, 37, 38 },
		gadgets = { 28, 29, 30 },
		regions = { 7, 9, 12, 14, 15 },
		triggers = { "ENTER_REGION_7", "ANY_MONSTER_DIE_9", "ENTER_REGION_12", "ANY_MONSTER_DIE_14", "DUNGEON_SETTLE_15" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ENTER_REGION_7(context, evt)
	if evt.param1 ~= 7 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_7(context, evt)
	-- 将configid为 29 的物件更改为状态 GadgetState.GearStart
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 29, GadgetState.GearStart) then
			return -1
		end 
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_9(context, evt)
	-- 判断剩余怪物数量是否是0
	if ScriptLib.GetGroupMonsterCount(context) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_9(context, evt)
	-- 创生gadget 31
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 31 }) then
		return -1
	end
	
	-- 杀死Group内所有monster
		if 0 ~= ScriptLib.KillGroupEntity(context, { group_id = 220012001, kill_policy = GroupKillPolicy.GROUP_KILL_MONSTER }) then
			return -1
		end
		
	
	-- 杀死Group内所有monster
		if 0 ~= ScriptLib.KillGroupEntity(context, { group_id = 220012002, kill_policy = GroupKillPolicy.GROUP_KILL_MONSTER }) then
			return -1
		end
		
	
	-- 杀死Group内所有monster
		if 0 ~= ScriptLib.KillGroupEntity(context, { group_id = 220012003, kill_policy = GroupKillPolicy.GROUP_KILL_MONSTER }) then
			return -1
		end
		
	
	-- 杀死Group内所有monster
		if 0 ~= ScriptLib.KillGroupEntity(context, { group_id = 220012004, kill_policy = GroupKillPolicy.GROUP_KILL_MONSTER }) then
			return -1
		end
		
	
	-- 杀死Group内所有monster
		if 0 ~= ScriptLib.KillGroupEntity(context, { group_id = 220012005, kill_policy = GroupKillPolicy.GROUP_KILL_MONSTER }) then
			return -1
		end
		
	
	-- 杀死Group内所有monster
		if 0 ~= ScriptLib.KillGroupEntity(context, { group_id = 220012006, kill_policy = GroupKillPolicy.GROUP_KILL_MONSTER }) then
			return -1
		end
		
	
	-- 杀死Group内所有monster
		if 0 ~= ScriptLib.KillGroupEntity(context, { group_id = 220012007, kill_policy = GroupKillPolicy.GROUP_KILL_MONSTER }) then
			return -1
		end
		
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_12(context, evt)
	if evt.param1 ~= 12 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_12(context, evt)
	-- 通知groupid为220012007中,configid为：37的怪物入战或者脱战，set为1是入战，为0是脱战
	if 0 ~= ScriptLib.SetMonsterBattleByGroup(context, 1, 37, 220012007) then
	  return -1
	end
	
	-- 通知groupid为220012007中,configid为：38的怪物入战或者脱战，set为1是入战，为0是脱战
	if 0 ~= ScriptLib.SetMonsterBattleByGroup(context, 1, 38, 220012007) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_14(context, evt)
	if 25 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_14(context, evt)
		-- 杀死Group内指定的monster和gadget
		if 0 ~= ScriptLib.KillGroupEntity(context, { group_id = 220012007, monsters = {37,38}, gadgets = {} }) then
			return -1
		end
	
	return 0
end

-- 触发条件
function condition_EVENT_DUNGEON_SETTLE_15(context, evt)
	-- 判断副本成功
	if 1 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_DUNGEON_SETTLE_15(context, evt)
	-- 创生gadget 31
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 31 }) then
		return -1
	end
	
	return 0
end
