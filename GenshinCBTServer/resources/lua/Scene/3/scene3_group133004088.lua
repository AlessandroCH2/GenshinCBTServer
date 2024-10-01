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
	{ config_id = 341, gadget_id = 70210031, pos = { x = 2258.1, y = 270.4, z = -262.0 }, rot = { x = 0.0, y = 357.2, z = 0.0 }, level = 1, chest_drop_id = 403324, isOneoff = true },
	{ config_id = 342, gadget_id = 70900039, pos = { x = 2257.9, y = 270.4, z = -259.6 }, rot = { x = 0.0, y = 178.7, z = 0.0 }, level = 1, state = GadgetState.GearStop, persistent = true }
}

-- 区域
regions = {
	{ config_id = 118, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2257.8, y = 270.5, z = -256.9 } },
	{ config_id = 153, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2258.0, y = 271.4, z = -246.7 } }
}

-- 触发器
triggers = {
	{ name = "GADGET_STATE_CHANGE_118", event = EventType.EVENT_GADGET_STATE_CHANGE, source = "", condition = "condition_EVENT_GADGET_STATE_CHANGE_118", action = "action_EVENT_GADGET_STATE_CHANGE_118", tlog_tag = "奔狼岭_88_谜题破解_结算" },
	{ name = "TIMER_EVENT_153", event = EventType.EVENT_TIMER_EVENT, source = "num_1", condition = "", action = "action_EVENT_TIMER_EVENT_153", trigger_count = 0 }
}

-- 变量
variables = {
	{ name = "unlock_1", value = 0, persistent = true }
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
		gadgets = { 342 },
		regions = { 118, 153 },
		triggers = { "GADGET_STATE_CHANGE_118", "TIMER_EVENT_153" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_GADGET_STATE_CHANGE_118(context, evt)
	if 342 ~= evt.param2 or GadgetState.GearStart ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_STATE_CHANGE_118(context, evt)
	-- 解锁当前场景中pointid 为%force_id%的 传送点或者地城入口
	if 0 ~= ScriptLib.UnlockScenePoint(context, 50) then
		return -1
	end
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_TIMER_EVENT_153(context, evt)
	local c_unlock_1 = ScriptLib.GetGroupVariableValue(context, "unlock_1")
	local c_unlock = c_unlock_1 +1
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "unlock_1", c_unlock) then
	  return -1
	end
	
	if c_unlock == 4 then
		if 0 ~= ScriptLib.ChangeGroupGadget(context, { config_id = 342, state = GadgetState.Default }) then
			return -1
		end
		local pos = {x=2257, y=270, z=-259}
	    if 0 ~= ScriptLib.BeginCameraSceneLook(context, { look_pos = pos, duration = 5, is_force = true, is_broadcast = false }) then
					return -1
				end 
	end
	return 0
end
