--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 5, monster_id = 21010101, pos = { x = 52.0, y = -0.5, z = -115.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 6, monster_id = 21010101, pos = { x = 62.3, y = -0.5, z = -109.0 }, rot = { x = 0.0, y = 254.4, z = 0.0 }, level = 0 },
	{ config_id = 7, monster_id = 21010101, pos = { x = 55.7, y = -0.5, z = -101.5 }, rot = { x = 0.0, y = 201.9, z = 0.0 }, level = 0 },
	{ config_id = 70, monster_id = 21010201, pos = { x = 53.5, y = -0.5, z = -114.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 71, monster_id = 21010201, pos = { x = 62.1, y = -0.5, z = -108.9 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 72, monster_id = 21010201, pos = { x = 54.5, y = -0.5, z = -102.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 73, monster_id = 21010101, pos = { x = 54.9, y = -0.5, z = -113.7 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 74, monster_id = 21010101, pos = { x = 61.3, y = -0.5, z = -107.9 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 75, monster_id = 21010101, pos = { x = 54.3, y = -0.5, z = -101.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 76, monster_id = 21010201, pos = { x = 50.8, y = -0.5, z = -111.2 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 77, monster_id = 21010201, pos = { x = 51.2, y = -0.5, z = -106.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 7, gadget_id = 70210022, pos = { x = 54.9, y = -0.5, z = -108.8 }, rot = { x = 0.0, y = 87.7, z = 0.0 }, level = 1, chest_drop_id = 1300101, state = GadgetState.ChestLocked }
}

-- 区域
regions = {
	{ config_id = 20, shape = RegionShape.SPHERE, radius = 5, pos = { x = 55.3, y = -0.5, z = -109.1 } }
}

-- 触发器
triggers = {
	{ name = "ANY_MONSTER_DIE_20", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_20", action = "action_EVENT_ANY_MONSTER_DIE_20" }
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
		monsters = { 5, 6, 7 },
		gadgets = { 7 },
		regions = { 20 },
		triggers = { "ANY_MONSTER_DIE_20" },
		rand_weight = 100
	},
	{
		-- suite_id = 1,
		-- description = suite_2,
		monsters = { 70, 71, 72 },
		gadgets = { 7 },
		regions = { 20 },
		triggers = { "ANY_MONSTER_DIE_20" },
		rand_weight = 100
	},
	{
		-- suite_id = 2,
		-- description = suite_3,
		monsters = { 73, 74, 75, 76, 77 },
		gadgets = { 7 },
		regions = { 20 },
		triggers = { "ANY_MONSTER_DIE_20" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_20(context, evt)
	-- 判断剩余怪物数量是否是0
	if ScriptLib.GetGroupMonsterCount(context) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_20(context, evt)
	-- 解锁目标7
	if 0 ~= ScriptLib.ChangeGroupGadget(context, { config_id = 7, state = GadgetState.Default }) then
		return -1
	end
	
	-- 调用提示id为 20010301 的提示UI，会显示在屏幕中央偏下位置，id索引自 ReminderData表格
	if 0 ~= ScriptLib.ShowReminder(context, 20010301) then
		return -1
	end
	
	return 0
end
