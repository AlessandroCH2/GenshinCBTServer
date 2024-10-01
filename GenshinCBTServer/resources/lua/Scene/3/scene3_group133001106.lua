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
	{ config_id = 1774, gadget_id = 70210006, pos = { x = 1397.9, y = 233.8, z = -1569.0 }, rot = { x = 0.0, y = 80.6, z = 0.0 }, level = 1, chest_drop_id = 403101, showcutscene = true, isOneoff = true, persistent = true },
	{ config_id = 1817, gadget_id = 70800012, pos = { x = 1564.0, y = 252.1, z = -1641.2 }, rot = { x = 0.0, y = 249.5, z = 0.0 }, level = 1 },
	{ config_id = 3022, gadget_id = 70900009, pos = { x = 1563.3, y = 252.0, z = -1641.4 }, rot = { x = 0.0, y = 119.3, z = 0.0 }, level = 1, state = GadgetState.GearStop, persistent = true },
	{ config_id = 3033, gadget_id = 70210022, pos = { x = 1580.9, y = 252.2, z = -1634.0 }, rot = { x = 0.0, y = 245.7, z = 0.0 }, level = 1, chest_drop_id = 403123, state = GadgetState.ChestLocked, isOneoff = true, persistent = true, type = GadgetType.GADGET_WORLD_CHECT },
	{ config_id = 3034, gadget_id = 70210022, pos = { x = 1559.2, y = 252.0, z = -1624.1 }, rot = { x = 0.0, y = 167.1, z = 0.0 }, level = 1, chest_drop_id = 403123, state = GadgetState.ChestLocked, isOneoff = true, persistent = true, type = GadgetType.GADGET_WORLD_CHECT },
	{ config_id = 3035, gadget_id = 70210022, pos = { x = 1568.7, y = 252.2, z = -1659.6 }, rot = { x = 0.0, y = 348.0, z = 0.0 }, level = 1, chest_drop_id = 403123, state = GadgetState.ChestLocked, isOneoff = true, persistent = true, type = GadgetType.GADGET_WORLD_CHECT },
	{ config_id = 3036, gadget_id = 70210022, pos = { x = 1546.1, y = 252.1, z = -1644.8 }, rot = { x = 0.0, y = 90.3, z = 0.0 }, level = 1, chest_drop_id = 403123, state = GadgetState.ChestLocked, isOneoff = true, persistent = true, type = GadgetType.GADGET_WORLD_CHECT }
}

-- 区域
regions = {
	{ config_id = 103, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1564.4, y = 252.1, z = -1638.3 } },
	{ config_id = 127, shape = RegionShape.SPHERE, radius = 23.4, pos = { x = 1561.9, y = 252.1, z = -1640.2 } },
	{ config_id = 128, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1561.6, y = 252.1, z = -1641.7 } },
	{ config_id = 200, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1563.0, y = 252.1, z = -1637.6 } },
	{ config_id = 292, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1592.4, y = 249.4, z = -1615.2 } },
	{ config_id = 386, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1558.2, y = 252.1, z = -1643.7 } },
	{ config_id = 436, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1557.2, y = 252.1, z = -1640.3 } }
}

-- 触发器
triggers = {
	{ name = "SEAL_BATTLE_END_103", event = EventType.EVENT_SEAL_BATTLE_END, source = "", condition = "condition_EVENT_SEAL_BATTLE_END_103", action = "action_EVENT_SEAL_BATTLE_END_103", trigger_count = 0, tlog_tag = "好肉族封印挑战end" },
	{ name = "GADGET_CREATE_127", event = EventType.EVENT_GADGET_CREATE, source = "", condition = "condition_EVENT_GADGET_CREATE_127", action = "action_EVENT_GADGET_CREATE_127", trigger_count = 0 },
	{ name = "SELECT_OPTION_128", event = EventType.EVENT_SELECT_OPTION, source = "", condition = "condition_EVENT_SELECT_OPTION_128", action = "action_EVENT_SELECT_OPTION_128", trigger_count = 0, tlog_tag = "开启好肉族封印挑战" },
	{ name = "TIMER_EVENT_200", event = EventType.EVENT_TIMER_EVENT, source = "", condition = "condition_EVENT_TIMER_EVENT_200", action = "action_EVENT_TIMER_EVENT_200" },
	{ name = "CLIENT_EXECUTE_292", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_292", trigger_count = 0 },
	{ name = "GADGET_STATE_CHANGE_386", event = EventType.EVENT_GADGET_STATE_CHANGE, source = "", condition = "condition_EVENT_GADGET_STATE_CHANGE_386", action = "action_EVENT_GADGET_STATE_CHANGE_386" },
	{ name = "TIMER_EVENT_436", event = EventType.EVENT_TIMER_EVENT, source = "", condition = "condition_EVENT_TIMER_EVENT_436", action = "action_EVENT_TIMER_EVENT_436", trigger_count = 0 }
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
		gadgets = { 1817, 3022, 3033, 3034, 3035, 3036 },
		regions = { 103, 127, 128, 200, 292, 386, 436 },
		triggers = { "SEAL_BATTLE_END_103", "GADGET_CREATE_127", "SELECT_OPTION_128", "TIMER_EVENT_200", "CLIENT_EXECUTE_292", "GADGET_STATE_CHANGE_386", "TIMER_EVENT_436" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_SEAL_BATTLE_END_103(context, evt)
	--获取战斗结果
	local result = evt.param2
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "SEAL_RESULT", result) then
	
	return false
	
	end
	
	return true
end

-- 触发操作
function action_EVENT_SEAL_BATTLE_END_103(context, evt)
	--失败时重置30秒标记，重置suite_3标记，清理战场，重新添加操作台选项
	if 0 == ScriptLib.GetGroupVariableValue(context, "SEAL_RESULT") then
	
	--delete timer
	if 0 ~= ScriptLib.CancelGroupTimerEvent(context, 133001275, "M1") then
			return -1
		end
	
	-- 重新生成指定group，指定suite
		if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 133001275, suite = 2 }) then
			return -1
		end
	
	-- 延迟2秒后,向groupId为：133001106的对象,请求一次调用,并将string参数："S1" 传递过去
	if 0 ~= ScriptLib.CreateGroupTimerEvent(context, 133001106, "S1", 2) then
	  return -1
	end
	
	end
	
	--成功时标记封印完成，清理战场
	if 1 == ScriptLib.GetGroupVariableValue(context, "SEAL_RESULT") then
	
	-- 将configid为 3022 的物件更改为状态 GadgetState.Default
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 3022, GadgetState.Default) then
			return -1
		end 
	
	-- 触发镜头注目，注目位置为坐标（1562，252，-1640），持续时间为2秒，并且为强制注目形式，不广播其他玩家
		local pos = {x=1562, y=252, z=-1640}
	    if 0 ~= ScriptLib.BeginCameraSceneLook(context, { look_pos = pos, duration = 2, is_force = true, is_broadcast = false }) then
					return -1
				end 
	
	-- 将configid为 0 的物件更改为状态 GadgetState.Default
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 3033, GadgetState.Default) then
			return -1
		end 
	
	-- 将configid为 0 的物件更改为状态 GadgetState.Default
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 3034, GadgetState.Default) then
			return -1
		end 
	
	-- 将configid为 0 的物件更改为状态 GadgetState.Default
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 3035, GadgetState.Default) then
			return -1
		end 
	
	-- 将configid为 0 的物件更改为状态 GadgetState.Default
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 3036, GadgetState.Default) then
			return -1
		end 
	
	
	end
end

-- 触发条件
function condition_EVENT_GADGET_CREATE_127(context, evt)
	if 1817 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_CREATE_127(context, evt)
	-- 设置操作台选项
	if 0 ~= ScriptLib.SetWorktopOptionsByGroupId(context, 133001106, 1817, {25}) then
		return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_SELECT_OPTION_128(context, evt)
	-- 判断是gadgetid 1817
	if 1817 ~= evt.param1 then
			return false
		end
	
	return true
end

-- 触发操作
function action_EVENT_SELECT_OPTION_128(context, evt)
	-- 当option_id为25时，开启封印战斗，战斗区域半径为18，圈内进度每秒增长1，圈外进度每秒衰减5，进度达到100时判定为战斗成功（填0则取默认值100），进度衰减到0后5秒判定为战斗失败
	    if 25 == evt.param2 then
	        local ret = ScriptLib.StartSealBattle(context, {radius = 18, kill_time = 100, monster_group_id = 133001275, max_progress = 10, battle_type = SealBattleType.KILL_MONSTER})
	        --ScriptLib.PrintLog("StartSealBattle ret: " ..ret)
	    end
	
		-- 重新生成指定group，指定suite
		if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 133001275, suite = 1 }) then
			return -1
		end
	
	
	-- 将configid为 0 的物件更改为状态 GadgetState.Default
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 1817, GadgetState.GearStart) then
			return -1
		end 
	
	-- 删除指定group： 133001106 ；指定config：1817；物件身上指定option：25；
	if 0 ~= ScriptLib.DelWorktopOptionByGroupId(context, 133001106, 1817, 25) then
		return -1
	end
	
	
	return 0
end

-- 触发条件
function condition_EVENT_TIMER_EVENT_200(context, evt)
	if "KillPZ2" ~= evt.source_name then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_TIMER_EVENT_200(context, evt)
		-- 杀死Group内指定的monster和gadget
		if 0 ~= ScriptLib.KillGroupEntity(context, { group_id = 133001088, monsters = {}, gadgets = {1715} }) then
			return -1
		end
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_292(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end

-- 触发条件
function condition_EVENT_GADGET_STATE_CHANGE_386(context, evt)
	if 3022 ~= evt.param2 or GadgetState.GearStart ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_STATE_CHANGE_386(context, evt)
	-- 通知场景上的所有玩家播放名字为9 的cutscene
	if 0 ~= ScriptLib.PlayCutScene(context, 9, 0) then
			return -1
		end 
	
	-- 延迟2秒后,向groupId为：133001106的对象,请求一次调用,并将string参数："KillPZ2" 传递过去
	if 0 ~= ScriptLib.CreateGroupTimerEvent(context, 133001106, "KillPZ2", 2) then
	  return -1
	end
	
		-- 杀死Group内指定的monster和gadget
		if 0 ~= ScriptLib.KillGroupEntity(context, { group_id = 133001106, monsters = {}, gadgets = {1817} }) then
			return -1
		end
	
	return 0
end

-- 触发条件
function condition_EVENT_TIMER_EVENT_436(context, evt)
	if "S1" ~= evt.source_name then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_TIMER_EVENT_436(context, evt)
	-- 设置操作台选项
	if 0 ~= ScriptLib.SetWorktopOptionsByGroupId(context, 133001106, 1817, {25}) then
		return -1
	end
	
	return 0
end
