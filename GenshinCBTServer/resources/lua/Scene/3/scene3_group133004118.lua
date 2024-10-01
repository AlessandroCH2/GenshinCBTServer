--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 324, monster_id = 21010301, pos = { x = 2194.2, y = 211.7, z = -1014.1 }, rot = { x = 0.0, y = 23.7, z = 0.0 }, level = 5, disableWander = true },
	{ config_id = 325, monster_id = 21010301, pos = { x = 2192.0, y = 211.6, z = -1012.7 }, rot = { x = 0.0, y = 23.6, z = 0.0 }, level = 5, disableWander = true },
	{ config_id = 326, monster_id = 21010301, pos = { x = 2189.5, y = 211.7, z = -1012.1 }, rot = { x = 0.0, y = 22.7, z = 0.0 }, level = 5, disableWander = true },
	{ config_id = 327, monster_id = 22010201, pos = { x = 2190.2, y = 211.5, z = -1016.8 }, rot = { x = 0.0, y = 24.3, z = 0.0 }, level = 7, disableWander = true },
	{ config_id = 328, monster_id = 20010901, pos = { x = 2190.0, y = 211.5, z = -1016.8 }, rot = { x = 0.0, y = 29.1, z = 0.0 }, level = 6 },
	{ config_id = 576, monster_id = 20010801, pos = { x = 2192.4, y = 211.6, z = -1015.4 }, rot = { x = 0.0, y = 21.1, z = 0.0 }, level = 5, disableWander = true },
	{ config_id = 577, monster_id = 20010801, pos = { x = 2189.7, y = 211.6, z = -1014.4 }, rot = { x = 0.0, y = 29.9, z = 0.0 }, level = 5, disableWander = true },
	{ config_id = 578, monster_id = 20010801, pos = { x = 2191.0, y = 211.6, z = -1014.9 }, rot = { x = 0.0, y = 16.0, z = 0.0 }, level = 5, disableWander = true }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
}

-- 区域
regions = {
	{ config_id = 160, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2193.3, y = 211.6, z = -1017.9 } },
	{ config_id = 161, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2192.4, y = 211.6, z = -1017.5 } }
}

-- 触发器
triggers = {
	{ name = "SPECIFIC_MONSTER_HP_CHANGE_160", event = EventType.EVENT_SPECIFIC_MONSTER_HP_CHANGE, source = "327", condition = "condition_EVENT_SPECIFIC_MONSTER_HP_CHANGE_160", action = "action_EVENT_SPECIFIC_MONSTER_HP_CHANGE_160" },
	{ name = "ANY_MONSTER_DIE_161", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "", action = "action_EVENT_ANY_MONSTER_DIE_161", trigger_count = 0 }
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
		gadgets = { },
		regions = { },
		triggers = { },
		rand_weight = 100
	},
	{
		-- suite_id = 1,
		-- description = suite_2,
		monsters = { 324, 325, 326, 327, 576, 577, 578 },
		gadgets = { },
		regions = { 160, 161 },
		triggers = { "SPECIFIC_MONSTER_HP_CHANGE_160", "ANY_MONSTER_DIE_161" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_SPECIFIC_MONSTER_HP_CHANGE_160(context, evt)
	--[[判断指定configid的怪物的血量小于%50时触发指定后续操作]]--
	if evt.type ~= EventType.EVENT_SPECIFIC_MONSTER_HP_CHANGE or evt.param3 > 50 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_SPECIFIC_MONSTER_HP_CHANGE_160(context, evt)
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 328, delay_time = 0 }) then
	  return -1
	end
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_161(context, evt)
	-- 通知任务系统完成条件类型"LUA通知"，复杂参数为quest_param的进度+1
	if 0 ~= ScriptLib.AddQuestProgress(context, "133004118") then
	  return -1
	end
	
	return 0
end
