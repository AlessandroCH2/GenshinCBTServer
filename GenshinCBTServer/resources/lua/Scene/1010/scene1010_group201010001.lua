--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 1, monster_id = 21010501, pos = { x = 1467.8, y = 255.0, z = -5676.6 }, rot = { x = 0.0, y = 285.1, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 2, monster_id = 21010501, pos = { x = 1480.9, y = 255.5, z = -5694.6 }, rot = { x = 0.0, y = 294.5, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 3, monster_id = 21010501, pos = { x = 1527.1, y = 249.0, z = -5681.6 }, rot = { x = 0.0, y = 203.4, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 4, monster_id = 21020201, pos = { x = 1591.5, y = 247.2, z = -5736.5 }, rot = { x = 0.0, y = 144.2, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 5, monster_id = 21010301, pos = { x = 1532.5, y = 241.5, z = -5727.3 }, rot = { x = 0.0, y = 187.5, z = 0.0 }, level = 0 },
	{ config_id = 9, monster_id = 21010201, pos = { x = 1491.8, y = 243.1, z = -5711.2 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 10, monster_id = 21010201, pos = { x = 1583.7, y = 243.8, z = -5733.9 }, rot = { x = 0.0, y = 114.1, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 12, monster_id = 21010201, pos = { x = 1589.1, y = 243.5, z = -5728.5 }, rot = { x = 0.0, y = 167.5, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 52, monster_id = 21020101, pos = { x = 1584.9, y = 243.7, z = -5654.4 }, rot = { x = 0.0, y = 209.6, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 53, monster_id = 21010301, pos = { x = 1218.5, y = 256.3, z = -5610.8 }, rot = { x = 0.0, y = 52.4, z = 0.0 }, level = 0, disableWander = true }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 4, gadget_id = 70210032, pos = { x = 1577.7, y = 244.1, z = -5666.5 }, rot = { x = 0.0, y = 227.8, z = 0.0 }, level = 1, chest_drop_id = 303122, state = GadgetState.ChestLocked }
}

-- 区域
regions = {
	{ config_id = 2, shape = RegionShape.SPHERE, radius = 15, pos = { x = 1577.6, y = 245.7, z = -5667.7 } },
	{ config_id = 3, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1564.1, y = 244.8, z = -5656.4 } }
}

-- 触发器
triggers = {
	{ name = "ENTER_REGION_2", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_2", action = "action_EVENT_ENTER_REGION_2" },
	{ name = "CHALLENGE_SUCCESS_3", event = EventType.EVENT_CHALLENGE_SUCCESS, source = "1", condition = "", action = "action_EVENT_CHALLENGE_SUCCESS_3" }
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
		monsters = { 1, 4, 5, 9, 10, 12, 53 },
		gadgets = { 4 },
		regions = { 2, 3 },
		triggers = { "ENTER_REGION_2", "CHALLENGE_SUCCESS_3" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ENTER_REGION_2(context, evt)
	if evt.param1 ~= 2 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_2(context, evt)
	-- 创建编号为1（该挑战的识别id),挑战内容为110的区域挑战，具体参数填写方式，见DungeonChallengeData表中的注释，所有填写的值都必须是int类型
	if 0 ~= ScriptLib.ActiveChallenge(context, 1, 110, 30, 201010001, 52, 0) then
		return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 52, delay_time = 0 }) then
	  return -1
	end
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CHALLENGE_SUCCESS_3(context, evt)
	-- 将configid为 4 的物件更改为状态 GadgetState.Default
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 4, GadgetState.Default) then
			return -1
		end 
	
	return 0
end
