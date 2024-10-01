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
	{ config_id = 1155, gadget_id = 70380002, pos = { x = 2657.3, y = 280.0, z = -367.7 }, rot = { x = 0.0, y = 26.9, z = 0.0 }, level = 1, route_id = 3004549 },
	{ config_id = 1156, gadget_id = 70380002, pos = { x = 2662.1, y = 280.0, z = -364.1 }, rot = { x = 0.0, y = 264.3, z = 0.0 }, level = 1, route_id = 3004549 },
	{ config_id = 1157, gadget_id = 70210031, pos = { x = 2665.6, y = 263.0, z = -362.7 }, rot = { x = 0.0, y = 234.6, z = 0.0 }, level = 1, chest_drop_id = 403343, showcutscene = true, isOneoff = true, type = GadgetType.GADGET_WORLD_CHECT }
}

-- 区域
regions = {
	{ config_id = 218, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2664.9, y = 273.6, z = -362.5 } }
}

-- 触发器
triggers = {
	{ name = "ANY_GADGET_DIE_218", event = EventType.EVENT_ANY_GADGET_DIE, source = "", condition = "condition_EVENT_ANY_GADGET_DIE_218", action = "action_EVENT_ANY_GADGET_DIE_218", tlog_tag = "奔狼岭_200_射击自然靶标_结算" }
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
		gadgets = { 1155, 1156 },
		regions = { 218 },
		triggers = { "ANY_GADGET_DIE_218" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ANY_GADGET_DIE_218(context, evt)
	-- 判断指定group组剩余gadget数量是否是0 
	if ScriptLib.CheckRemainGadgetCountByGroupId(context, {group_id = 133004200}) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_GADGET_DIE_218(context, evt)
	-- 创建id为1157的gadget
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 1157 }) then
	  return -1
	end
	
	return 0
end
