--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 803, monster_id = 21010301, pos = { x = 2039.6, y = 209.6, z = -1010.8 }, rot = { x = 0.0, y = 169.3, z = 0.0 }, level = 6, drop_id = 303002 },
	{ config_id = 804, monster_id = 21010201, pos = { x = 2035.3, y = 210.7, z = -1011.3 }, rot = { x = 0.0, y = 138.3, z = 0.0 }, level = 6, drop_id = 303002, disableWander = true },
	{ config_id = 806, monster_id = 21010701, pos = { x = 2044.0, y = 207.8, z = -992.7 }, rot = { x = 0.0, y = 169.3, z = 0.0 }, level = 6, drop_id = 303002 },
	{ config_id = 807, monster_id = 21010701, pos = { x = 2037.6, y = 208.2, z = -994.2 }, rot = { x = 0.0, y = 171.0, z = 0.0 }, level = 6, drop_id = 303002 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 2104, gadget_id = 70210032, pos = { x = 2035.9, y = 210.4, z = -1013.2 }, rot = { x = 4.5, y = 21.4, z = 346.8 }, level = 1, chest_drop_id = 403122, state = GadgetState.ChestLocked, isOneoff = true, persistent = true, type = GadgetType.GADGET_WORLD_CHECT }
}

-- 区域
regions = {
	{ config_id = 288, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2039.7, y = 209.5, z = -1010.1 } },
	{ config_id = 289, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2035.9, y = 209.8, z = -1007.0 } }
}

-- 触发器
triggers = {
	{ name = "MONSTER_BATTLE_288", event = EventType.EVENT_MONSTER_BATTLE, source = "", condition = "condition_EVENT_MONSTER_BATTLE_288", action = "action_EVENT_MONSTER_BATTLE_288" },
	{ name = "ANY_MONSTER_DIE_289", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_289", action = "action_EVENT_ANY_MONSTER_DIE_289" }
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
		monsters = { 803, 804 },
		gadgets = { 2104 },
		regions = { 288, 289 },
		triggers = { "MONSTER_BATTLE_288", "ANY_MONSTER_DIE_289" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_MONSTER_BATTLE_288(context, evt)
	if 803 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_MONSTER_BATTLE_288(context, evt)
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 806, delay_time = 0 }) then
	  return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 807, delay_time = 0 }) then
	  return -1
	end
	
	-- play_type含义：1·代表开始播放； 2·代表停止播放
	-- 在指定位置播放或停止音效资源
		local pos = {x=2038, y=210, z=-997}
	    if 0 ~= ScriptLib.ScenePlaySound(context, {play_pos = pos, sound_name = "LevelHornSound001", play_type= 1, is_broadcast = false }) then
					return -1
		end 
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_289(context, evt)
	-- 判断剩余怪物数量是否是0
	if ScriptLib.GetGroupMonsterCount(context) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_289(context, evt)
	-- 解锁目标2104
	if 0 ~= ScriptLib.ChangeGroupGadget(context, { config_id = 2104, state = GadgetState.Default }) then
		return -1
	end
	
	return 0
end
