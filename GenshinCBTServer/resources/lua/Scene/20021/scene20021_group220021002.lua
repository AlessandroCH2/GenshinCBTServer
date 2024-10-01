--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 2, monster_id = 21010101, pos = { x = 189.7, y = 37.5, z = -4.2 }, rot = { x = 0.0, y = 311.0, z = 0.0 }, level = 0, pose_id = 9003 },
	{ config_id = 3, monster_id = 21010101, pos = { x = 190.2, y = 37.5, z = 1.6 }, rot = { x = 0.0, y = 274.7, z = 0.0 }, level = 0, pose_id = 9003 },
	{ config_id = 4, monster_id = 20011202, pos = { x = 186.7, y = 37.5, z = 2.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 5, monster_id = 20011202, pos = { x = 186.5, y = 37.5, z = -0.7 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 6, monster_id = 20011202, pos = { x = 187.7, y = 37.5, z = 4.7 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 5, gadget_id = 70220010, pos = { x = 177.3, y = 37.5, z = -5.1 }, rot = { x = 0.0, y = 148.1, z = 0.0 }, level = 1 },
	{ config_id = 6, gadget_id = 70220010, pos = { x = 176.9, y = 37.5, z = 0.9 }, rot = { x = 0.0, y = 155.7, z = 0.0 }, level = 1 },
	{ config_id = 7, gadget_id = 70350006, pos = { x = 183.6, y = 37.5, z = 8.9 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 8, gadget_id = 70210034, pos = { x = 177.0, y = 30.3, z = 18.9 }, rot = { x = 0.0, y = 171.0, z = 0.0 }, level = 1, chest_drop_id = 1000104, type = GadgetType.GADGET_DUNGEON_SECRET_CHEST }
}

-- 区域
regions = {
	{ config_id = 4, shape = RegionShape.SPHERE, radius = 5, pos = { x = 179.8, y = 37.5, z = 1.5 } }
}

-- 触发器
triggers = {
	{ name = "ANY_MONSTER_DIE_4", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_4", action = "action_EVENT_ANY_MONSTER_DIE_4" }
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
		monsters = { 2, 3, 4, 5, 6 },
		gadgets = { 5, 6, 7 },
		regions = { 4 },
		triggers = { "ANY_MONSTER_DIE_4" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_4(context, evt)
	-- 判断剩余怪物数量是否是0
	if ScriptLib.GetGroupMonsterCount(context) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_4(context, evt)
	-- 将configid为 7 的物件更改为状态 GadgetState.GearAction1
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 7, GadgetState.GearAction1) then
			return -1
		end 
	
	return 0
end
