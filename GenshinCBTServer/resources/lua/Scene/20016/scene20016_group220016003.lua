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
	{ config_id = 10, gadget_id = 70350003, pos = { x = 353.2, y = -18.4, z = 322.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 11, gadget_id = 70350003, pos = { x = 333.3, y = -18.3, z = 322.5 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 12, gadget_id = 70350003, pos = { x = 343.3, y = -18.4, z = 322.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 26, gadget_id = 70350003, pos = { x = 343.3, y = -11.4, z = 291.5 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 27, gadget_id = 70350003, pos = { x = 353.3, y = -19.0, z = 368.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 28, gadget_id = 70350003, pos = { x = 333.2, y = -19.0, z = 368.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 29, gadget_id = 70350003, pos = { x = 343.4, y = -19.0, z = 368.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 38, gadget_id = 70350003, pos = { x = 333.3, y = -11.4, z = 291.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 39, gadget_id = 70350003, pos = { x = 353.2, y = -11.4, z = 291.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 40, gadget_id = 70210051, pos = { x = 342.6, y = -19.3, z = 335.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, chest_drop_id = 403244, type = GadgetType.GADGET_DUNGEON_PASS_CHEST }
}

-- 区域
regions = {
	{ config_id = 8, shape = RegionShape.SPHERE, radius = 5, pos = { x = 343.6, y = -19.3, z = 340.3 } },
	{ config_id = 9, shape = RegionShape.SPHERE, radius = 5, pos = { x = 342.5, y = -19.3, z = 330.7 } },
	{ config_id = 10, shape = RegionShape.SPHERE, radius = 7.3, pos = { x = 342.8, y = -23.7, z = 384.2 } }
}

-- 触发器
triggers = {
	{ name = "QUEST_FINISH_8", event = EventType.EVENT_QUEST_FINISH, source = "", condition = "condition_EVENT_QUEST_FINISH_8", action = "action_EVENT_QUEST_FINISH_8", trigger_count = 0 },
	{ name = "TIMER_EVENT_9", event = EventType.EVENT_TIMER_EVENT, source = "", condition = "condition_EVENT_TIMER_EVENT_9", action = "action_EVENT_TIMER_EVENT_9" },
	{ name = "ENTER_REGION_10", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_10", action = "action_EVENT_ENTER_REGION_10" }
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
		monsters = { },
		gadgets = { 10, 11, 12, 26, 27, 28, 29, 38, 39 },
		regions = { 8, 9, 10 },
		triggers = { "QUEST_FINISH_8", "TIMER_EVENT_9", "ENTER_REGION_10" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_QUEST_FINISH_8(context, evt)
	--检查ID为46306的任务的完成状态是否为1（1=完成，0=失败）
	--此事件需要配合Quest表使用，在Quest表里的完成执行中配置“通知group脚本”，则该任务完成后服务端会向对应的group发送通知，参数1填写场景ID，参数2填写group ID（如果不填则会通知所有group）
	
	--检查任务ID
	if 46306 ~= evt.param1 then
		return false
	end
	
	--检查任务成功状态
	if 1 ~= evt.param2 then
		return false
	end
	
	ScriptLib.PrintLog("quest 46306 finish")
	return true
end

-- 触发操作
function action_EVENT_QUEST_FINISH_8(context, evt)
	-- 将configid为 12 的物件更改为状态 GadgetState.GearStart
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 12, GadgetState.GearStart) then
			return -1
		end 
	-- 延迟3秒后,向groupId为：220016003的对象,请求一次调用,并将string参数："Power" 传递过去
	if 0 ~= ScriptLib.CreateGroupTimerEvent(context, 220016003, "Power", 0) then
	  return -1
	end
	
	-- 调用提示id为 0 的提示UI，会显示在屏幕中央偏下位置，id索引自 ReminderData表格
	if 0 ~= ScriptLib.ShowReminder(context, 1001001) then
		return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_TIMER_EVENT_9(context, evt)
	if  "Power" ~= evt.source_name then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_TIMER_EVENT_9(context, evt)
	-- 通知groupid为220016008中,configid为：9的怪物入战或者脱战，set为1是入战，为0是脱战
	if 0 ~= ScriptLib.SetMonsterBattleByGroup(context, 1, 9, 220016008) then
	  return -1
	end
	
	-- 将configid为 29 的物件更改为状态 GadgetState.Default
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 29, GadgetState.Default) then
			return -1
		end 
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_10(context, evt)
	if evt.param1 ~= 10 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_10(context, evt)
	-- 将configid为 29 的物件更改为状态 GadgetState.GearStart
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 29, GadgetState.GearStart) then
			return -1
		end 
	
	return 0
end
