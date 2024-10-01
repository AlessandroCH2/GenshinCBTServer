--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 787, monster_id = 20010401, pos = { x = 1474.1, y = 267.2, z = -1749.9 }, rot = { x = 0.0, y = 115.7, z = 0.0 }, level = 12, drop_id = 303043 },
	{ config_id = 788, monster_id = 20010302, pos = { x = 1508.4, y = 266.4, z = -1753.7 }, rot = { x = 0.0, y = 95.5, z = 0.0 }, level = 12, drop_id = 303043 },
	{ config_id = 789, monster_id = 20010302, pos = { x = 1508.5, y = 266.0, z = -1750.9 }, rot = { x = 0.0, y = 111.8, z = 0.0 }, level = 12, drop_id = 303043 },
	{ config_id = 790, monster_id = 20010302, pos = { x = 1502.3, y = 266.1, z = -1749.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 12, drop_id = 303043 },
	{ config_id = 1137, monster_id = 28020201, pos = { x = 1446.5, y = 272.1, z = -1779.9 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 2949, gadget_id = 70290001, pos = { x = 1433.7, y = 279.7, z = -1819.2 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 2950, gadget_id = 70500000, pos = { x = 1433.7, y = 280.3, z = -1818.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3002, owner = 2949 },
	{ config_id = 2951, gadget_id = 70500000, pos = { x = 1433.6, y = 280.6, z = -1819.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3002, owner = 2949 },
	{ config_id = 2952, gadget_id = 70500000, pos = { x = 1434.0, y = 281.0, z = -1819.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3002, owner = 2949 }
}

-- 区域
regions = {
	{ config_id = 223, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1475.7, y = 268.3, z = -1748.7 } }
}

-- 触发器
triggers = {
	{ name = "MONSTER_BATTLE_223", event = EventType.EVENT_MONSTER_BATTLE, source = "", condition = "condition_EVENT_MONSTER_BATTLE_223", action = "action_EVENT_MONSTER_BATTLE_223" }
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
		monsters = { 787, 1137 },
		gadgets = { 2949, 2950, 2951, 2952 },
		regions = { 223 },
		triggers = { "MONSTER_BATTLE_223" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_MONSTER_BATTLE_223(context, evt)
	if 787 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_MONSTER_BATTLE_223(context, evt)
	-- 在0面前， 5 到 8 范围里，20 角度内，刷{788,789,790}的怪物
	
	local ret = ScriptLib.CreateMonsterFaceAvatar(context, { entity_id = 0, monsters = {788,789,790}, ranges = { 5, 8 }, angle = 20 })
	ScriptLib.PrintLog(tostring(ret))
	
	return 0
end
