--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 747, monster_id = 21020101, pos = { x = 2078.3, y = 236.5, z = -597.1 }, rot = { x = 0.0, y = 87.2, z = 0.0 }, level = 11, drop_id = 303103, affix = { 1001 }, isElite = true, pose_id = 401 },
	{ config_id = 748, monster_id = 21030101, pos = { x = 2086.1, y = 236.9, z = -593.7 }, rot = { x = 0.0, y = 221.3, z = 0.0 }, level = 11, drop_id = 303003, disableWander = true },
	{ config_id = 749, monster_id = 21010301, pos = { x = 2083.0, y = 236.0, z = -594.0 }, rot = { x = 0.0, y = 230.6, z = 0.0 }, level = 11, drop_id = 303003, disableWander = true, pose_id = 9003 },
	{ config_id = 750, monster_id = 21010301, pos = { x = 2082.8, y = 235.6, z = -597.2 }, rot = { x = 0.0, y = 330.4, z = 0.0 }, level = 11, drop_id = 303003, disableWander = true, pose_id = 9003 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 1985, gadget_id = 70310006, pos = { x = 2080.4, y = 236.0, z = -596.2 }, rot = { x = 0.0, y = 19.6, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 1986, gadget_id = 70220013, pos = { x = 2078.4, y = 236.8, z = -592.1 }, rot = { x = 6.7, y = 46.9, z = 355.3 }, level = 1 },
	{ config_id = 1988, gadget_id = 70220013, pos = { x = 2080.5, y = 236.6, z = -591.5 }, rot = { x = 3.6, y = 18.8, z = 352.7 }, level = 1 },
	{ config_id = 1989, gadget_id = 70220014, pos = { x = 2075.9, y = 236.5, z = -598.7 }, rot = { x = 0.0, y = 297.2, z = 0.0 }, level = 1 },
	{ config_id = 1990, gadget_id = 70220014, pos = { x = 2075.9, y = 236.3, z = -600.3 }, rot = { x = 0.0, y = 297.2, z = 0.0 }, level = 1 },
	{ config_id = 1991, gadget_id = 70210032, pos = { x = 2086.5, y = 235.1, z = -596.6 }, rot = { x = 344.7, y = 271.0, z = 7.0 }, level = 1, chest_drop_id = 403122, state = GadgetState.ChestLocked, isOneoff = true, persistent = true, type = GadgetType.GADGET_WORLD_CHECT },
	{ config_id = 1992, gadget_id = 70290001, pos = { x = 2060.4, y = 236.6, z = -624.2 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 1993, gadget_id = 70500000, pos = { x = 2060.4, y = 237.2, z = -623.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3002, owner = 1992 },
	{ config_id = 1994, gadget_id = 70500000, pos = { x = 2060.3, y = 237.4, z = -624.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3002, owner = 1992 },
	{ config_id = 1995, gadget_id = 70500000, pos = { x = 2060.6, y = 237.9, z = -624.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3002, owner = 1992 }
}

-- 区域
regions = {
	{ config_id = 281, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2081.7, y = 235.5, z = -598.8 } }
}

-- 触发器
triggers = {
	{ name = "ANY_MONSTER_DIE_281", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_281", action = "action_EVENT_ANY_MONSTER_DIE_281", tlog_tag = "酒庄_230_醉汉峡右侧营地清剿_清剿完成" }
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
		monsters = { 747, 748, 749, 750 },
		gadgets = { 1985, 1986, 1988, 1989, 1990, 1991, 1992, 1993, 1994, 1995 },
		regions = { 281 },
		triggers = { "ANY_MONSTER_DIE_281" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_281(context, evt)
	-- 判断剩余怪物数量是否是0
	if ScriptLib.GetGroupMonsterCount(context) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_281(context, evt)
	-- 解锁目标1991
	if 0 ~= ScriptLib.ChangeGroupGadget(context, { config_id = 1991, state = GadgetState.Default }) then
		return -1
	end
	
	return 0
end
