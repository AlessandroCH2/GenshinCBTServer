--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 178, monster_id = 21011001, pos = { x = 1712.7, y = 257.4, z = -757.7 }, rot = { x = 0.0, y = 158.1, z = 0.0 }, level = 8, drop_id = 303003, disableWander = true },
	{ config_id = 179, monster_id = 21010201, pos = { x = 1705.0, y = 255.3, z = -792.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 8, drop_id = 303003, disableWander = true },
	{ config_id = 180, monster_id = 21010201, pos = { x = 1713.9, y = 254.2, z = -770.0 }, rot = { x = 0.0, y = 175.3, z = 0.0 }, level = 8, drop_id = 303003, disableWander = true },
	{ config_id = 181, monster_id = 21030101, pos = { x = 1705.1, y = 255.2, z = -761.1 }, rot = { x = 0.0, y = 144.4, z = 0.0 }, level = 8, drop_id = 303003 },
	{ config_id = 494, monster_id = 21010301, pos = { x = 1705.2, y = 255.2, z = -791.5 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 7, drop_id = 303042, disableWander = true },
	{ config_id = 495, monster_id = 21010301, pos = { x = 1714.3, y = 254.1, z = -770.5 }, rot = { x = 0.0, y = 175.3, z = 0.0 }, level = 7, drop_id = 303042, disableWander = true },
	{ config_id = 496, monster_id = 21010901, pos = { x = 1713.7, y = 257.1, z = -758.2 }, rot = { x = 0.0, y = 158.1, z = 0.0 }, level = 7, drop_id = 303042, disableWander = true },
	{ config_id = 497, monster_id = 21030101, pos = { x = 1706.4, y = 255.3, z = -760.0 }, rot = { x = 0.0, y = 144.4, z = 0.0 }, level = 7, drop_id = 303003 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 1047, gadget_id = 70210032, pos = { x = 1702.0, y = 255.9, z = -743.3 }, rot = { x = 0.2, y = 167.1, z = 0.2 }, level = 1, chest_drop_id = 403122, state = GadgetState.ChestLocked, isOneoff = true, persistent = true },
	{ config_id = 1461, gadget_id = 70290001, pos = { x = 2015.2, y = 210.8, z = -943.4 }, rot = { x = 0.0, y = 261.1, z = 0.0 }, level = 1 },
	{ config_id = 1462, gadget_id = 70500000, pos = { x = 2014.8, y = 211.4, z = -943.5 }, rot = { x = 0.0, y = 261.1, z = 0.0 }, level = 1, point_type = 3002, owner = 1461 },
	{ config_id = 1463, gadget_id = 70500000, pos = { x = 2015.6, y = 211.6, z = -943.4 }, rot = { x = 0.0, y = 261.1, z = 0.0 }, level = 1, point_type = 3002, owner = 1461 },
	{ config_id = 1464, gadget_id = 70500000, pos = { x = 2015.3, y = 212.1, z = -943.1 }, rot = { x = 0.0, y = 261.1, z = 0.0 }, level = 1, point_type = 3002, owner = 1461 },
	{ config_id = 1469, gadget_id = 70290001, pos = { x = 1797.7, y = 245.8, z = -602.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 1470, gadget_id = 70500000, pos = { x = 1797.7, y = 246.4, z = -602.2 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3002, owner = 1469 },
	{ config_id = 1471, gadget_id = 70500000, pos = { x = 1797.6, y = 246.7, z = -603.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3002, owner = 1469 },
	{ config_id = 1472, gadget_id = 70500000, pos = { x = 1797.9, y = 247.1, z = -602.7 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3002, owner = 1469 }
}

-- 区域
regions = {
	{ config_id = 93, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1705.3, y = 258.2, z = -768.4 } },
	{ config_id = 253, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1704.6, y = 259.1, z = -753.9 } }
}

-- 触发器
triggers = {
	{ name = "ANY_MONSTER_DIE_93", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_93", action = "action_EVENT_ANY_MONSTER_DIE_93", tlog_tag = "酒庄_84_清泉镇后山营地小_挑战成功" },
	{ name = "CLIENT_EXECUTE_253", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_253", trigger_count = 0 }
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
		monsters = { 178, 179, 180, 181 },
		gadgets = { 1047, 1461, 1462, 1463, 1464, 1469, 1470, 1471, 1472 },
		regions = { 93, 253 },
		triggers = { "ANY_MONSTER_DIE_93", "CLIENT_EXECUTE_253" },
		rand_weight = 100
	},
	{
		-- suite_id = 1,
		-- description = suite_2,
		monsters = { 494, 495, 496, 497 },
		gadgets = { 1047, 1461, 1462, 1463, 1464, 1469, 1470, 1471, 1472 },
		regions = { 93 },
		triggers = { "ANY_MONSTER_DIE_93" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_93(context, evt)
	-- 判断剩余怪物数量是否是0
	if ScriptLib.GetGroupMonsterCount(context) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_93(context, evt)
	-- 解锁目标1047
	if 0 ~= ScriptLib.ChangeGroupGadget(context, { config_id = 1047, state = GadgetState.Default }) then
		return -1
	end
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_253(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end
