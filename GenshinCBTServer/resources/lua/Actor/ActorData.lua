----------------------
-- 这是Lua端ActorData，包含了创建和管理Actor所使用的数据的接口
-- @module ActorData
local ActorData = {}

function ActorData:GetByNpcRewindData(data)
	local sceneID = data.scene_id
	if sceneID == nil then
		sceneID = sceneData.DefaultSceneID
	end

	local roomID = data.room_id or 0

	local dummyPoint = sceneData:GetDummyPoint(sceneID, data.pos)
	if dummyPoint == nil then
		print("Dummy Point " .. data.pos .. " is nil")
		return
	end

	local actorData = {
		alias = data.alias,
		metaPath = data.script,
		configID = data.id,
		dataIndex = data.data_index,
		bornPos = dummyPoint.pos,
		bornEuler = dummyPoint.rot,
		isNetwork = true,
		isAutoStart = true,
		sceneID = sceneID,
		roomID = roomID,
		noPerform = false,
	}

	return actorData
end

function ActorData:GetByGadgetRewindData(data)
	local sceneID = data.scene_id
	if sceneID == nil then
		sceneID = sceneData.DefaultSceneID
	end

	local roomID = data.room_id or 0

	local dummyPoint = sceneData:GetDummyPoint(sceneID, data.pos)
	if dummyPoint == nil then
		print("Dummy Point " .. data.pos .. " is nil")
		return
	end

	local actorData = {
		alias = data.alias,
		metaPath = data.script,
		configID = data.id,
		dataIndex = data.data_index,
		bornPos = dummyPoint.pos,
		bornEuler = dummyPoint.rot,
		isNetwork = false,
		isAutoStart = false,
		sceneID = sceneID,
		roomID = roomID,
		noPerform = false,
	}

	return actorData
end

return ActorData