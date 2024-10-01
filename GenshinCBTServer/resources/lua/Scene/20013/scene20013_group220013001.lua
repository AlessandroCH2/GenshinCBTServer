--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 1, monster_id = 20011301, pos = { x = 343.1, y = -28.9, z = 429.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 2, monster_id = 20011201, pos = { x = 348.4, y = -29.0, z = 426.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 3, monster_id = 20011201, pos = { x = 348.3, y = -29.0, z = 435.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 4, monster_id = 20011201, pos = { x = 338.3, y = -29.0, z = 425.7 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 5, monster_id = 20011201, pos = { x = 338.3, y = -29.0, z = 435.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 6, monster_id = 21010701, pos = { x = 350.6, y = -28.0, z = 414.5 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 7, monster_id = 21010701, pos = { x = 343.8, y = -28.0, z = 414.7 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 8, monster_id = 21010701, pos = { x = 335.2, y = -28.0, z = 414.5 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 9, monster_id = 21010201, pos = { x = 349.7, y = -29.0, z = 426.1 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 10, monster_id = 21010201, pos = { x = 338.2, y = -28.8, z = 435.2 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 11, monster_id = 20020101, pos = { x = 343.2, y = -28.9, z = 431.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 12, monster_id = 21010301, pos = { x = 347.9, y = -28.9, z = 428.1 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 13, monster_id = 21010301, pos = { x = 343.4, y = -28.9, z = 430.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 14, monster_id = 21010301, pos = { x = 338.4, y = -28.9, z = 428.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 15, monster_id = 21010601, pos = { x = 343.2, y = -27.9, z = 415.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, disableWander = true }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 1, gadget_id = 70350003, pos = { x = 333.2, y = -28.1, z = 404.5 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 2, gadget_id = 70350003, pos = { x = 343.0, y = -28.1, z = 404.7 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 3, gadget_id = 70350003, pos = { x = 353.1, y = -28.0, z = 404.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 4, gadget_id = 70220010, pos = { x = 348.3, y = -28.8, z = 435.7 }, rot = { x = 0.0, y = 101.8, z = 0.0 }, level = 1 },
	{ config_id = 5, gadget_id = 70220010, pos = { x = 348.4, y = -28.8, z = 425.6 }, rot = { x = 0.0, y = 0.6, z = 0.0 }, level = 1 },
	{ config_id = 6, gadget_id = 70220010, pos = { x = 338.2, y = -28.8, z = 425.8 }, rot = { x = 0.0, y = 177.5, z = 0.0 }, level = 1 },
	{ config_id = 7, gadget_id = 70220010, pos = { x = 338.3, y = -28.8, z = 435.8 }, rot = { x = 0.0, y = 88.9, z = 0.0 }, level = 1 },
	{ config_id = 247, gadget_id = 70310001, pos = { x = 350.3, y = -29.0, z = 423.7 }, rot = { x = 0.0, y = 128.7, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 248, gadget_id = 70310001, pos = { x = 336.9, y = -29.0, z = 423.7 }, rot = { x = 0.0, y = 347.0, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 249, gadget_id = 70310001, pos = { x = 337.2, y = -29.0, z = 437.5 }, rot = { x = 0.0, y = 184.2, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 250, gadget_id = 70310001, pos = { x = 349.4, y = -29.0, z = 437.1 }, rot = { x = 0.0, y = 242.7, z = 0.0 }, level = 1, state = GadgetState.GearStart }
}

-- 区域
regions = {
	{ config_id = 1, shape = RegionShape.SPHERE, radius = 5, pos = { x = 343.3, y = -28.9, z = 430.6 } },
	{ config_id = 65, shape = RegionShape.SPHERE, radius = 5, pos = { x = 343.0, y = -29.0, z = 432.6 } }
}

-- 触发器
triggers = {
	{ name = "ANY_MONSTER_DIE_1", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_1", action = "action_EVENT_ANY_MONSTER_DIE_1" },
	{ name = "CLIENT_EXECUTE_65", event = EventType.EVENT_CLIENT_EXECUTE, source = "FireSourceChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_65", trigger_count = 0 }
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
		monsters = { 1, 2, 3, 4, 5 },
		gadgets = { 1, 2, 3 },
		regions = { 1 },
		triggers = { "ANY_MONSTER_DIE_1" },
		rand_weight = 50
	},
	{
		-- suite_id = 1,
		-- description = suite_2,
		monsters = { 6, 7, 8, 9, 10 },
		gadgets = { 1, 2, 3 },
		regions = { 1 },
		triggers = { "ANY_MONSTER_DIE_1" },
		rand_weight = 50
	},
	{
		-- suite_id = 2,
		-- description = suite_3,
		monsters = { 11 },
		gadgets = { 1, 2, 3, 4, 5, 6, 7, 247, 248, 249, 250 },
		regions = { 1, 65 },
		triggers = { "ANY_MONSTER_DIE_1", "CLIENT_EXECUTE_65" },
		rand_weight = 40
	},
	{
		-- suite_id = 3,
		-- description = suite_4,
		monsters = { 12, 13, 14, 15 },
		gadgets = { 1, 2, 3 },
		regions = { 1 },
		triggers = { "ANY_MONSTER_DIE_1" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_1(context, evt)
	-- 判断剩余怪物数量是否是0
	if ScriptLib.GetGroupMonsterCount(context) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_1(context, evt)
	-- 将configid为 1 的物件更改为状态 GadgetState.GearStart
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 1, GadgetState.GearStart) then
			return -1
		end 
	
	-- 将configid为 2 的物件更改为状态 GadgetState.GearStart
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 2, GadgetState.GearStart) then
			return -1
		end 
	
	-- 将configid为 3 的物件更改为状态 GadgetState.GearStart
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 3, GadgetState.GearStart) then
			return -1
		end 
	
	-- 调用提示id为 10050301 的提示UI，会显示在屏幕中央偏下位置，id索引自 ReminderData表格
	if 0 ~= ScriptLib.ShowReminder(context, 10050301) then
		return -1
	end
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_65(context, evt)
	-- 针对groupid为 220013001 中该config对应的物件进行状态改变操作
	local this_gadget = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		--ScriptLib.PrintLog("config_id="..this_gadget)
	
		if evt.param1 == 1 then
			ScriptLib.SetGroupGadgetStateByConfigId(context, 220013001, this_gadget, GadgetState.GearStart )
			return 0
		end
	
		if evt.param1 == 0 then
			ScriptLib.SetGroupGadgetStateByConfigId(context, 220013001, this_gadget, GadgetState.Default )
			return 0
		end
	
	return 0
end
