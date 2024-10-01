--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 185, monster_id = 21020201, pos = { x = 1648.2, y = 265.5, z = -765.2 }, rot = { x = 0.0, y = 165.9, z = 0.0 }, level = 9, drop_id = 303103, disableWander = true, affix = { 1001 }, isElite = true },
	{ config_id = 187, monster_id = 21010201, pos = { x = 1644.8, y = 265.8, z = -770.2 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 9, drop_id = 303003, disableWander = true },
	{ config_id = 188, monster_id = 21010201, pos = { x = 1652.2, y = 265.5, z = -769.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 9, drop_id = 303003, disableWander = true },
	{ config_id = 189, monster_id = 21030201, pos = { x = 1652.8, y = 265.9, z = -762.2 }, rot = { x = 0.0, y = 167.2, z = 0.0 }, level = 9, drop_id = 303003, disableWander = true },
	{ config_id = 190, monster_id = 21010701, pos = { x = 1639.4, y = 266.7, z = -742.0 }, rot = { x = 0.0, y = 173.5, z = 0.0 }, level = 9, drop_id = 303003 },
	{ config_id = 191, monster_id = 21010701, pos = { x = 1639.3, y = 266.7, z = -744.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 9, drop_id = 303003 },
	{ config_id = 192, monster_id = 21010701, pos = { x = 1627.8, y = 266.5, z = -778.3 }, rot = { x = 0.0, y = 69.6, z = 0.0 }, level = 9, drop_id = 303003 },
	{ config_id = 193, monster_id = 21010701, pos = { x = 1626.1, y = 266.6, z = -780.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 9, drop_id = 303003 },
	{ config_id = 194, monster_id = 21010701, pos = { x = 1681.5, y = 256.4, z = -748.9 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 9, drop_id = 303003, disableWander = true },
	{ config_id = 195, monster_id = 21010701, pos = { x = 1679.7, y = 256.4, z = -745.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 9, drop_id = 303003, disableWander = true },
	{ config_id = 196, monster_id = 21010701, pos = { x = 1685.2, y = 256.4, z = -747.7 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 9, drop_id = 303003, disableWander = true }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 1048, gadget_id = 70210042, pos = { x = 1632.8, y = 266.5, z = -755.8 }, rot = { x = 0.0, y = 118.6, z = 0.0 }, level = 1, chest_drop_id = 403143, state = GadgetState.ChestLocked, isOneoff = true, persistent = true }
}

-- 区域
regions = {
	{ config_id = 92, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1653.9, y = 267.1, z = -758.5 } },
	{ config_id = 94, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1652.5, y = 267.1, z = -757.7 } },
	{ config_id = 254, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1652.0, y = 267.1, z = -769.2 } }
}

-- 触发器
triggers = {
	{ name = "ANY_MONSTER_DIE_92", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_92", action = "action_EVENT_ANY_MONSTER_DIE_92" },
	{ name = "ANY_MONSTER_DIE_94", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_94", action = "action_EVENT_ANY_MONSTER_DIE_94", tlog_tag = "酒庄_85_清泉镇后山营地大_挑战成功" },
	{ name = "CLIENT_EXECUTE_254", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_254", trigger_count = 0 }
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
		monsters = { 185, 187, 188, 189 },
		gadgets = { 1048 },
		regions = { 92, 94, 254 },
		triggers = { "ANY_MONSTER_DIE_92", "ANY_MONSTER_DIE_94", "CLIENT_EXECUTE_254" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_92(context, evt)
	-- 判断指定group组剩余怪物数量是否是0 
	if ScriptLib.GetGroupMonsterCountByGroupId(context, 133002084) == 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_92(context, evt)
	-- play_type含义：1·代表开始播放； 2·代表停止播放
	-- 在指定位置播放或停止音效资源
		local pos = {x=1653, y=267, z=-758}
	    if 0 ~= ScriptLib.ScenePlaySound(context, {play_pos = pos, sound_name = "LevelHornSound001", play_type= 1, is_broadcast = false }) then
					return -1
		end 
	
	if 0 ~= ScriptLib.ShowReminder(context, 1005) then
		return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 192, delay_time = 0 }) then
	  return -1
	end
	
	-- 延迟0.5秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 190, delay_time = 0.5 }) then
	  return -1
	end
	
	
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_94(context, evt)
	-- 判断剩余怪物数量是否是0
	if ScriptLib.GetGroupMonsterCount(context) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_94(context, evt)
	-- 解锁目标1048
	if 0 ~= ScriptLib.ChangeGroupGadget(context, { config_id = 1048, state = GadgetState.Default }) then
		return -1
	end
	
	-- 触发镜头注目，注目位置为坐标（1632，266，-755），持续时间为3秒，并且为强制注目形式，不广播其他玩家
		local pos = {x=1632, y=266, z=-755}
	    if 0 ~= ScriptLib.BeginCameraSceneLook(context, { look_pos = pos, duration = 3, is_force = true, is_broadcast = false }) then
					return -1
				end 
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_254(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end
