--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 537, monster_id = 21010301, pos = { x = 2433.2, y = 250.2, z = -373.2 }, rot = { x = 0.0, y = 327.4, z = 0.0 }, level = 12, drop_id = 303003, disableWander = true },
	{ config_id = 538, monster_id = 21010301, pos = { x = 2434.1, y = 250.0, z = -370.4 }, rot = { x = 0.0, y = 235.9, z = 0.0 }, level = 12, drop_id = 303003, disableWander = true },
	{ config_id = 539, monster_id = 21010201, pos = { x = 2430.5, y = 249.4, z = -372.2 }, rot = { x = 0.0, y = 45.0, z = 0.0 }, level = 12, drop_id = 303003, disableWander = true },
	{ config_id = 540, monster_id = 21010301, pos = { x = 2432.0, y = 249.4, z = -369.4 }, rot = { x = 0.0, y = 154.8, z = 0.0 }, level = 12, drop_id = 303003, disableWander = true }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 1171, gadget_id = 70310001, pos = { x = 2428.5, y = 248.8, z = -371.5 }, rot = { x = 0.0, y = 208.5, z = 0.0 }, level = 1 },
	{ config_id = 1172, gadget_id = 70220014, pos = { x = 2428.8, y = 249.3, z = -374.7 }, rot = { x = 0.0, y = 68.3, z = 0.0 }, level = 1 },
	{ config_id = 1173, gadget_id = 70220014, pos = { x = 2429.2, y = 249.3, z = -373.7 }, rot = { x = 0.0, y = 321.5, z = 0.0 }, level = 1 },
	{ config_id = 1174, gadget_id = 70310001, pos = { x = 2430.9, y = 248.9, z = -368.0 }, rot = { x = 0.0, y = 79.8, z = 0.0 }, level = 1 },
	{ config_id = 1175, gadget_id = 70210032, pos = { x = 2429.7, y = 248.9, z = -369.7 }, rot = { x = 345.3, y = 121.7, z = 359.5 }, level = 1, chest_drop_id = 403123, state = GadgetState.ChestLocked, isOneoff = true, type = GadgetType.GADGET_WORLD_CHECT },
	{ config_id = 1176, gadget_id = 70220014, pos = { x = 2428.2, y = 249.1, z = -373.7 }, rot = { x = 0.0, y = 117.9, z = 0.0 }, level = 1 },
	{ config_id = 1177, gadget_id = 70310004, pos = { x = 2432.5, y = 249.7, z = -371.3 }, rot = { x = 0.0, y = 186.6, z = 0.0 }, level = 1 }
}

-- 区域
regions = {
	{ config_id = 224, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2432.0, y = 250.0, z = -374.4 } }
}

-- 触发器
triggers = {
	{ name = "ANY_MONSTER_DIE_224", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_224", action = "action_EVENT_ANY_MONSTER_DIE_224", tlog_tag = "奔狼岭_224_怪物营地_结算" }
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
		monsters = { 537, 538, 539, 540 },
		gadgets = { 1171, 1172, 1173, 1174, 1175, 1176, 1177 },
		regions = { 224 },
		triggers = { "ANY_MONSTER_DIE_224" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_224(context, evt)
	-- 判断剩余怪物数量是否是0
	if ScriptLib.GetGroupMonsterCount(context) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_224(context, evt)
	-- 解锁目标1175
	if 0 ~= ScriptLib.ChangeGroupGadget(context, { config_id = 1175, state = GadgetState.Default }) then
		return -1
	end
	
	return 0
end
