--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 727, monster_id = 20010801, pos = { x = 1824.1, y = 218.0, z = -387.1 }, rot = { x = 0.0, y = 215.9, z = 0.0 }, level = 7 },
	{ config_id = 728, monster_id = 20010801, pos = { x = 1819.4, y = 218.2, z = -386.7 }, rot = { x = 0.0, y = 191.9, z = 0.0 }, level = 7 },
	{ config_id = 729, monster_id = 20010801, pos = { x = 1823.1, y = 218.4, z = -394.9 }, rot = { x = 0.0, y = 256.6, z = 0.0 }, level = 7 },
	{ config_id = 730, monster_id = 20011401, pos = { x = 1812.5, y = 218.4, z = -409.4 }, rot = { x = 0.0, y = 106.1, z = 0.0 }, level = 7 },
	{ config_id = 731, monster_id = 20011401, pos = { x = 1813.5, y = 218.1, z = -419.7 }, rot = { x = 0.0, y = 317.5, z = 0.0 }, level = 7 },
	{ config_id = 732, monster_id = 20011401, pos = { x = 1806.8, y = 219.6, z = -415.9 }, rot = { x = 0.0, y = 96.9, z = 0.0 }, level = 7 },
	{ config_id = 733, monster_id = 20011501, pos = { x = 1814.6, y = 218.1, z = -413.7 }, rot = { x = 0.0, y = 95.5, z = 0.0 }, level = 7, isElite = true },
	{ config_id = 734, monster_id = 20010901, pos = { x = 1820.6, y = 218.2, z = -392.7 }, rot = { x = 0.0, y = 264.6, z = 0.0 }, level = 7, isElite = true }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
}

-- 区域
regions = {
	{ config_id = 238, shape = RegionShape.SPHERE, radius = 2, pos = { x = 1813.5, y = 218.8, z = -397.2 } },
	{ config_id = 239, shape = RegionShape.SPHERE, radius = 2, pos = { x = 1812.9, y = 218.9, z = -397.8 } },
	{ config_id = 240, shape = RegionShape.SPHERE, radius = 2, pos = { x = 1813.4, y = 218.8, z = -396.5 } }
}

-- 触发器
triggers = {
	{ name = "ANY_MONSTER_DIE_238", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_238", action = "action_EVENT_ANY_MONSTER_DIE_238" },
	{ name = "ANY_MONSTER_DIE_239", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_239", action = "action_EVENT_ANY_MONSTER_DIE_239" },
	{ name = "ANY_MONSTER_DIE_240", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_240", action = "action_EVENT_ANY_MONSTER_DIE_240" }
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
		-- description = suite_1,
		monsters = { },
		gadgets = { },
		regions = { },
		triggers = { },
		rand_weight = 100
	},
	{
		-- suite_id = 1,
		-- description = suite_2,
		monsters = { 727, 728, 729 },
		gadgets = { },
		regions = { 238 },
		triggers = { "ANY_MONSTER_DIE_238" },
		rand_weight = 100
	},
	{
		-- suite_id = 2,
		-- description = suite_3,
		monsters = { 730, 731, 732 },
		gadgets = { },
		regions = { 239 },
		triggers = { "ANY_MONSTER_DIE_239" },
		rand_weight = 100
	},
	{
		-- suite_id = 3,
		-- description = suite_4,
		monsters = { 733, 734 },
		gadgets = { },
		regions = { 240 },
		triggers = { "ANY_MONSTER_DIE_240" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_238(context, evt)
	-- 判断剩余怪物数量是否是0
	if ScriptLib.GetGroupMonsterCount(context) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_238(context, evt)
		-- 重新生成指定group，指定suite
		if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 133002035, suite = 3 }) then
			return -1
		end
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_239(context, evt)
	-- 判断剩余怪物数量是否是0
	if ScriptLib.GetGroupMonsterCount(context) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_239(context, evt)
		-- 重新生成指定group，指定suite
		if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 133002035, suite = 4 }) then
			return -1
		end
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_240(context, evt)
	-- 判断剩余怪物数量是否是0
	if ScriptLib.GetGroupMonsterCount(context) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_240(context, evt)
	-- 通知任务系统完成条件类型"LUA通知"，复杂参数为quest_param的进度+1
	if 0 ~= ScriptLib.AddQuestProgress(context, "3002035") then
	  return -1
	end
	
	return 0
end
