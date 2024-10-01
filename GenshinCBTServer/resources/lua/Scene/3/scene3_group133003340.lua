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
	{ config_id = 3384, gadget_id = 70380002, pos = { x = 2845.0, y = 272.3, z = -1848.3 }, rot = { x = 0.0, y = 138.3, z = 0.0 }, level = 1, route_id = 3003196 },
	{ config_id = 3385, gadget_id = 70380002, pos = { x = 2848.0, y = 272.3, z = -1848.3 }, rot = { x = 0.0, y = 168.7, z = 0.0 }, level = 1, route_id = 3003196 },
	{ config_id = 3386, gadget_id = 70380002, pos = { x = 2851.0, y = 272.3, z = -1848.3 }, rot = { x = 0.0, y = 327.9, z = 0.0 }, level = 1, route_id = 3003196 },
	{ config_id = 3387, gadget_id = 70380002, pos = { x = 2854.0, y = 272.3, z = -1848.3 }, rot = { x = 0.0, y = 158.1, z = 0.0 }, level = 1, route_id = 3003196 },
	{ config_id = 3388, gadget_id = 70210031, pos = { x = 2847.1, y = 260.4, z = -1865.3 }, rot = { x = 0.0, y = 32.2, z = 358.3 }, level = 1, chest_drop_id = 403224, showcutscene = true, isOneoff = true }
}

-- 区域
regions = {
	{ config_id = 259, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2844.8, y = 259.2, z = -1851.7 } },
	{ config_id = 407, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2845.4, y = 258.9, z = -1850.5 } }
}

-- 触发器
triggers = {
	{ name = "ANY_GADGET_DIE_259", event = EventType.EVENT_ANY_GADGET_DIE, source = "", condition = "condition_EVENT_ANY_GADGET_DIE_259", action = "action_EVENT_ANY_GADGET_DIE_259", tlog_tag = "望风山地_340_射击自然靶标_结算" },
	{ name = "CLIENT_EXECUTE_407", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_407", trigger_count = 0 }
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
		gadgets = { 3384, 3385, 3386, 3387 },
		regions = { 259, 407 },
		triggers = { "ANY_GADGET_DIE_259", "CLIENT_EXECUTE_407" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ANY_GADGET_DIE_259(context, evt)
	-- 判断指定group组剩余gadget数量是否是0 
	if ScriptLib.CheckRemainGadgetCountByGroupId(context, {group_id = 133003340}) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_GADGET_DIE_259(context, evt)
	-- 创建id为3388的gadget
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 3388 }) then
	  return -1
	end
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_407(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end
