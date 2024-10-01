--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 78, monster_id = 21011001, pos = { x = 493.5, y = -23.1, z = 111.4 }, rot = { x = 0.0, y = 303.0, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 79, monster_id = 21011001, pos = { x = 493.2, y = -23.4, z = 131.0 }, rot = { x = 0.0, y = 245.3, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 87, monster_id = 22010201, pos = { x = 495.9, y = -23.2, z = 121.6 }, rot = { x = 0.0, y = 276.9, z = 0.0 }, level = 0, disableWander = true, affix = { 1001 }, isElite = true }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 79, gadget_id = 70350002, pos = { x = 500.7, y = -23.1, z = 121.6 }, rot = { x = 0.0, y = 90.0, z = 0.0 }, level = 1 },
	{ config_id = 162, gadget_id = 70210042, pos = { x = 496.2, y = -23.1, z = 110.2 }, rot = { x = 0.0, y = 305.5, z = 0.0 }, level = 1, chest_drop_id = 1400300, state = GadgetState.ChestLocked, type = GadgetType.GADGET_DUNGEON_PASS_CHEST },
	{ config_id = 163, gadget_id = 70210022, pos = { x = 496.3, y = -23.2, z = 133.4 }, rot = { x = 0.0, y = 276.0, z = 0.0 }, level = 1, chest_drop_id = 1400301, state = GadgetState.ChestLocked, type = GadgetType.GADGET_DUNGEON_SECRET_CHEST }
}

-- 区域
regions = {
	{ config_id = 44, shape = RegionShape.SPHERE, radius = 5, pos = { x = 494.3, y = -23.1, z = 110.9 } },
	{ config_id = 72, shape = RegionShape.SPHERE, radius = 5, pos = { x = 494.7, y = -23.7, z = 121.7 } }
}

-- 触发器
triggers = {
	{ name = "ANY_MONSTER_DIE_44", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_44", action = "action_EVENT_ANY_MONSTER_DIE_44" },
	{ name = "CLIENT_EXECUTE_72", event = EventType.EVENT_CLIENT_EXECUTE, source = "FireSourceChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_72", trigger_count = 0 }
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
		monsters = { 78, 79, 87 },
		gadgets = { 79, 162, 163 },
		regions = { 44, 72 },
		triggers = { "ANY_MONSTER_DIE_44", "CLIENT_EXECUTE_72" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_44(context, evt)
	-- 判断剩余怪物数量是否是0
	if ScriptLib.GetGroupMonsterCount(context) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_44(context, evt)
	-- 将configid为 162 的物件更改为状态 GadgetState.Default
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 162, GadgetState.Default) then
			return -1
		end 
	
	-- 将configid为 163 的物件更改为状态 GadgetState.Default
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 163, GadgetState.Default) then
			return -1
		end 
	
	-- 将configid为 79 的物件更改为状态 GadgetState.GearStart
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 79, GadgetState.GearStart) then
			return -1
		end 
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_72(context, evt)
	-- 针对groupid为 220010009 中该config对应的物件进行状态改变操作
	local this_gadget = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		--ScriptLib.PrintLog("config_id="..this_gadget)
	
		if evt.param1 == 1 then
			ScriptLib.SetGroupGadgetStateByConfigId(context, 220010009, this_gadget, GadgetState.GearStart )
			return 0
		end
	
		if evt.param1 == 0 then
			ScriptLib.SetGroupGadgetStateByConfigId(context, 220010009, this_gadget, GadgetState.Default )
			return 0
		end
	
	return 0
end
