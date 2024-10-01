--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 1, monster_id = 29010103, pos = { x = 0.0, y = 0.0, z = 0.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
}

-- 区域
regions = {
	{ config_id = 1, shape = RegionShape.SPHERE, radius = 5, pos = { x = 9.0, y = 3.1, z = 1.7 } }
}

-- 触发器
triggers = {
	{ name = "SPECIFIC_MONSTER_HP_CHANGE_1", event = EventType.EVENT_SPECIFIC_MONSTER_HP_CHANGE, source = "1", condition = "condition_EVENT_SPECIFIC_MONSTER_HP_CHANGE_1", action = "action_EVENT_SPECIFIC_MONSTER_HP_CHANGE_1" }
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
		monsters = { 1 },
		gadgets = { },
		regions = { 1 },
		triggers = { "SPECIFIC_MONSTER_HP_CHANGE_1" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_SPECIFIC_MONSTER_HP_CHANGE_1(context, evt)
	--[[判断指定configid的怪物的血量小于%20时触发指定后续操作]]--
	if evt.type ~= EventType.EVENT_SPECIFIC_MONSTER_HP_CHANGE or evt.param3 > 20 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_SPECIFIC_MONSTER_HP_CHANGE_1(context, evt)
	-- 通知任务系统完成条件类型"LUA通知"，复杂参数为quest_param的进度+1
	if 0 ~= ScriptLib.AddQuestProgress(context, "220020001") then
	  return -1
	end
	
	return 0
end
