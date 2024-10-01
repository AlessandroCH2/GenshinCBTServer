--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 5, gadget_id = 70900008, pos = { x = 343.3, y = -29.0, z = 430.7 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, state = GadgetState.GearStop },
	{ config_id = 6, gadget_id = 70350003, pos = { x = 343.1, y = -28.0, z = 404.7 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 7, gadget_id = 70350003, pos = { x = 333.2, y = -27.9, z = 404.5 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 8, gadget_id = 70350003, pos = { x = 353.2, y = -28.0, z = 404.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 20, gadget_id = 70320002, pos = { x = 338.3, y = -29.1, z = 435.6 }, rot = { x = 0.0, y = 174.6, z = 0.0 }, level = 1 },
	{ config_id = 21, gadget_id = 70320002, pos = { x = 348.5, y = -29.0, z = 425.4 }, rot = { x = 0.0, y = 358.1, z = 0.0 }, level = 1 },
	{ config_id = 43, gadget_id = 70800001, pos = { x = 343.2, y = -29.0, z = 430.9 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 }
}

-- 区域
regions = {
	{ config_id = 13, shape = RegionShape.SPHERE, radius = 5, pos = { x = 344.3, y = -28.9, z = 430.5 } },
	{ config_id = 14, shape = RegionShape.SPHERE, radius = 5, pos = { x = 339.9, y = -29.0, z = 430.7 } },
	{ config_id = 15, shape = RegionShape.SPHERE, radius = 5, pos = { x = 343.0, y = -29.0, z = 433.4 } },
	{ config_id = 16, shape = RegionShape.SPHERE, radius = 5, pos = { x = 339.8, y = -29.0, z = 432.1 } }
}

-- 触发器
triggers = {
	{ name = "GADGET_STATE_CHANGE_13", event = EventType.EVENT_GADGET_STATE_CHANGE, source = "", condition = "condition_EVENT_GADGET_STATE_CHANGE_13", action = "action_EVENT_GADGET_STATE_CHANGE_13", trigger_count = 0 },
	{ name = "GADGET_CREATE_14", event = EventType.EVENT_GADGET_CREATE, source = "", condition = "condition_EVENT_GADGET_CREATE_14", action = "action_EVENT_GADGET_CREATE_14" },
	{ name = "SELECT_OPTION_15", event = EventType.EVENT_SELECT_OPTION, source = "", condition = "condition_EVENT_SELECT_OPTION_15", action = "action_EVENT_SELECT_OPTION_15", trigger_count = 0 },
	{ name = "SEAL_BATTLE_END_16", event = EventType.EVENT_SEAL_BATTLE_END, source = "", condition = "condition_EVENT_SEAL_BATTLE_END_16", action = "action_EVENT_SEAL_BATTLE_END_16", trigger_count = 0 }
}

-- 变量
variables = {
	{ name = "SEAL_RESULT", value = 0, persistent = false }
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
		monsters = { },
		gadgets = { 6, 7, 8, 20, 21, 43 },
		regions = { 13, 14, 15, 16 },
		triggers = { "GADGET_STATE_CHANGE_13", "GADGET_CREATE_14", "SELECT_OPTION_15", "SEAL_BATTLE_END_16" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_GADGET_STATE_CHANGE_13(context, evt)
	if 5 ~= evt.param2 or GadgetState.GearStart ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_STATE_CHANGE_13(context, evt)
		-- 重新生成指定group，指定suite
		if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 220016007, suite = 1 }) then
			return -1
		end
	
	return 0
end

-- 触发条件
function condition_EVENT_GADGET_CREATE_14(context, evt)
	if 43 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_CREATE_14(context, evt)
	-- 设置操作台选项
	if 0 ~= ScriptLib.SetWorktopOptions(context, {24}) then
		return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_SELECT_OPTION_15(context, evt)
	-- 判断是gadgetid 43 option_id 24
	if 43 ~= evt.param1 then
		if 24 == evt.param2 then
			return false
		end
	end
	
	return true
end

-- 触发操作
function action_EVENT_SELECT_OPTION_15(context, evt)
	-- 当option_id为24时，开启类型为""限时杀怪""的封印战斗，战斗区域半径为15，限定时长为60秒，220016007 group内每有1个怪物死亡，获得1点进度，进度达到6时判定为战斗成功。
	    if 24 == evt.param2 then
	        local ret = ScriptLib.StartSealBattle(context, {radius = 15, kill_time = 60, monster_group_id = 220016007, max_progress = 6, battle_type = SealBattleType.KILL_MONSTER})
	        --ScriptLib.PrintLog("StartSealBattle ret: " ..ret)
	    end
	
		-- 重新生成指定group，指定suite
		if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 220016007, suite = 1 }) then
			return -1
		end
	
	-- 删除指定group： 220016002 ；指定config：43；物件身上指定option：24；
	if 0 ~= ScriptLib.DelWorktopOptionByGroupId(context, 220016002, 43, 24) then
		return -1
	end
	
	-- 将configid为 43 的物件更改为状态 GadgetState.GearStart
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 43, GadgetState.GearStart) then
			return -1
		end 
	
	-- 将configid为 20 的物件更改为状态 GadgetState.GearStart
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 20, GadgetState.GearStart) then
			return -1
		end 
	
	-- 将configid为 21 的物件更改为状态 GadgetState.GearStart
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 21, GadgetState.GearStart) then
			return -1
		end 
	
	return 0
end

-- 触发条件
function condition_EVENT_SEAL_BATTLE_END_16(context, evt)
	--获取战斗结果
	local result = evt.param2
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "SEAL_RESULT", result) then
	
	return false
	
	end
	
	return true
end

-- 触发操作
function action_EVENT_SEAL_BATTLE_END_16(context, evt)
	--失败时重置30秒标记，重置suite_3标记，清理战场，重新添加操作台选项
	if 0 == ScriptLib.GetGroupVariableValue(context, "SEAL_RESULT") then
	
	-- 将configid为 3022 的物件更改为状态 GadgetState.Default
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 43, GadgetState.Default) then
			return -1
		end 
	
	
	-- 将configid为 3022 的物件更改为状态 GadgetState.Default
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 20, GadgetState.Default) then
			return -1
		end 
	
	
	-- 将configid为 3022 的物件更改为状态 GadgetState.Default
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 21, GadgetState.Default) then
			return -1
		end 
	
	
	-- 重新生成指定group，指定suite
		if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 220016007, suite = 2 }) then
			return -1
		end
	
	-- 设置操作台选项
	if 0 ~= ScriptLib.SetWorktopOptionsByGroupId(context, 220016002, 43, {24}) then
		return -1
	end
	
	end
	
	--成功时标记封印完成，清理战场
	if 1 == ScriptLib.GetGroupVariableValue(context, "SEAL_RESULT") then
	
	-- 将configid为 3022 的物件更改为状态 GadgetState.Default
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 6, GadgetState.GearStart) then
			return -1
		end 
	
	-- 将configid为 3022 的物件更改为状态 GadgetState.Default
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 20, GadgetState.Default) then
			return -1
		end 
	
	
	-- 将configid为 3022 的物件更改为状态 GadgetState.Default
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 21, GadgetState.Default) then
			return -1
		end 
	
	
		
	end
end
