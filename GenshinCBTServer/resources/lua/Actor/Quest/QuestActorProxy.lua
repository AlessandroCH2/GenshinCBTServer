----------------------
-- 这是Lua端QuestActor的基类，包含了控制Quest阶段的方法。继承自BaseActorProxy
-- @classmod QuestActorProxy
require('Actor/ActorCommon')
local baseActorProxy = require('Actor/BaseActorProxy')

local QuestActorProxy = class("QuestActorProxy", baseActorProxy)

QuestActorProxy.actorType = ActorType.QUEST_ACTOR

--- QuestActor描述的主任务的ID
QuestActorProxy.mainQuestID = 0
QuestActorProxy.shareData = nil
QuestActorProxy.clientData = nil
QuestActorProxy.subStartHandlers = nil
QuestActorProxy.subFinishHandlers = nil

local this = nil
local super = nil
local uActor = nil

function QuestActorProxy:OnDataLoad()
	local sharePath = "Quest/Share/Q" .. tostring(self.mainQuestID) .. "ShareConfig"
	main_id = self.mainQuestID
	sub_ids = {}
	rewind_data = {}
	quest_data = {}
	util.do_require(sharePath)
	self.shareData = 
	{
		SubIds = sub_ids,
		RewindData = rewind_data,
		QuestData = quest_data,

		GetRewindData = function(self, questID)
			return self.RewindData[tostring(questID)]
		end,

		GetQuestData = function(self, questID)
			return self.QuestData[tostring(questID)]
		end,
	}

	local clientPath = "Quest/Client/Q" .. tostring(self.mainQuestID) .. "ClientConfig"
	self.clientData = require(clientPath)
	util.unrequire(sharePath)
	util.unrequire(clientPath)
	main_id = nil
	sub_ids = nil
	rewind_data = nil
	quest_data = nil
end

function QuestActorProxy:OnHandlerBuild()
	self:OnSubStartHandlerBuild()
	self:OnSubFinishHandlerBuild()
end

function QuestActorProxy:OnSubStartHandlerBuild()
	self.subStartHandlers = {}
end

function QuestActorProxy:OnSubFinishHandlerBuild()
	self.subFinishHandlers = {}
end

--- Sub Start Handlers Begin
--- Sub Start Handlers End

function QuestActorProxy:OnPreInit()
	this = self
	super = self.__super
end

function QuestActorProxy:OnPostInit()
	uActor = self.uActor
	if uActor ~= nil then
		uActor:TryStartActor()
	end
end

function QuestActorProxy:OnInit(alias)
	self.alias = alias
	local uActor = self:CreateUActor(alias)
	self.uActor = uActor

	self:Register()
end

-- local param begin
-- local param end

function QuestActorProxy:CreateUActor(alias)
	local uActor = actorUtils.CreateActor(self, ActorType.QUEST_ACTOR, alias)
	uActor = actorUtils.CreateQuestActor(self.mainQuestID, uActor)
	return uActor
end

--- QuestActor当主任务开始时的回调
-- @tparam QuestProxy quest c#端quest的对象
function QuestActorProxy:OnMainStart(quest)
	print("main start " .. tostring(quest.QuestMainId))
end

--- QuestActor当子任务开始时的回调
-- @tparam QuestProxy quest c#端quest的对象
function QuestActorProxy:OnSubStart(quest)
	local questID = tostring(quest.QuestId)
	print("sub start " .. questID)
	if self.subStartHandlers == nil then
		return
	end

	local handler = self.subStartHandlers[questID]
	if handler ~= nil then
		handler(self, quest)
	end
end

--- QuestActor当子任务结束时的回调
-- @tparam QuestProxy quest c#端quest的对象
function QuestActorProxy:OnSubFinished(quest)
	local questID = tostring(quest.QuestId)
	print("sub finished " .. questID)
	if self.subFinishHandlers == nil then
	end

	local handler = self.subFinishHandlers[questID]
	if handler ~= nil then
		handler(self, quest)
	end
end

--- QuestActor当主任务结束时的回调
-- @tparam QuestProxy quest c#端quest的对象
function QuestActorProxy:OnMainFinished(quest)
	print("main finished " .. tostring(quest.QuestMainId))
end

--- QuestActor当子任务失败时候的回调
-- @tparam QuestProxy quest c#端quest的对象
function QuestActorProxy:OnSubFailed(quest)
	print("sub failed " .. tostring(quest.QuestId))
end

--- QuestActor主任务回溯
-- @tparam QuestProxy quest c#端quest的对象
function QuestActorProxy:OnRewind(quest)
	print("quest rewind " .. tostring(quest.QuestId) .. tostring(quest.state))
	self:DoRewind(self.shareData:GetRewindData(quest.QuestId))
end

function QuestActorProxy:OnSoftRewind(quest)
	print("quest soft rewind " .. tostring(quest.QuestId) .. tostring(quest.state))
	return self:DoSoftRewind(self.shareData:GetRewindData(quest.QuestId))
end

function QuestActorProxy:DoRewind(rewindData)
	print(rewindData)

	if rewindData == nil then
		return
	end

	--self:DoRewindAvatar(rewindData.avatar, false)
	self:DoRewindNpc(rewindData.npcs)
	self:DoRewindGadget(rewindData.gadgets)
	self:DoRewindItem(rewindData.items)
end

function QuestActorProxy:DoSoftRewind(rewindData)
	print(rewindData)

	if rewindData == nil then
		return
	end

	return false--self:DoRewindNpc(rewindData.npcs, true)
end

function QuestActorProxy:DoRewindAvatar(avatarRewindData, sceneCheck)
	if avatarRewindData == nil then
		return false
	end

	if sceneCheck == nil then
		sceneCheck = true
	end

	local sceneID = avatarRewindData.scene_id
	if sceneID == nil then
		sceneID = sceneData.DefaultSceneID
	end
	if sceneCheck and sceneID ~= sceneData.currSceneID and sceneData.currSceneID ~= 1001 then
		return false
	end

	local dummyPoint = sceneData:GetDummyPoint(sceneID, avatarRewindData.pos)
	if dummyPoint == nil then
		return
	end

	this:TransmitPlayer(0,dummyPoint.pos, dummyPoint.rot)
	
	-- actorUtils.SetAvatarPos(dummyPoint.pos)
	-- actorUtils.SetAvatarEuler(dummyPoint.rot)
	actorUtils.SyncAvatarMotion()
	return true
end

function QuestActorProxy:DoRewindNpc(npcRewindList, sceneCheck)
	if npcRewindList == nil then
		return false
	end

	if sceneCheck == nil then
		sceneCheck = false
	end

	local needRewind = false
	for i = 1 , #npcRewindList do
		local npcRewindData = npcRewindList[i]
		if npcRewindData ~= nil then
			if npcRewindData.alias ~= nil then
				print("Lua want to create npc " .. npcRewindData.alias)
			else
				print("Lua want to create npc " .. npcRewindData.id)
			end

			local sceneID = npcRewindData.scene_id
			if sceneID == nil then
				sceneID = sceneData.DefaultSceneID
			end

			repeat
				if sceneCheck and sceneID ~= sceneData.currSceneID and sceneData.currSceneID ~= 1001 then
					break
				end

				local data = actorData:GetByNpcRewindData(npcRewindData)
				if data ~= nil then
					actorMgr:CreateActorWithData(data)
				end
				needRewind = true
			until true
		end
	end

	return needRewind
end

function QuestActorProxy:DoRewindGadget(gadgetRewindList, sceneCheck)
	if gadgetRewindList == nil then
		return
	end

	if sceneCheck == nil then
		sceneCheck = false
	end

	local needRewind = false
	for i = 1, #gadgetRewindList do
		local gadgetRewindData = gadgetRewindList[i]
		if gadgetRewindData ~= nil then
			if gadgetRewindData.alias ~= nil then
				print("Lua want to create gadget " .. gadgetRewindData.alias)
			else
				print("Lua want to create gadget " .. gadgetRewindData.id)
			end

			local sceneID = gadgetRewindData.scene_id
			if sceneID == nil then
				sceneID = sceneData.DefaultSceneID
			end

			repeat
				if sceneCheck and sceneID ~= sceneData.currSceneID and sceneData.currSceneID ~= 1001 then
					break
				end

				local dummyPoint = sceneData:GetDummyPoint(sceneID, gadgetRewindData.pos)
				if dummyPoint == nil then
					print("Dummy Point " .. gadgetRewindData.pos .. " is nil")
					break
				end

				if gadgetRewindData.script ~= nil then
					local data = actorData:GetByGadgetRewindData(gadgetRewindData)
					if data ~= nil then
						actorMgr:CreateActorWithData(data)
					end
				else
					self:SpawnGadget(gadgetRewindData.id, dummyPoint.pos, dummyPoint.rot, gadgetRewindData.alias, sceneID)
				end
				needRewind = true
			until true
		end
	end
end

function QuestActorProxy:DoRewindItem(itemRewindList, sceneCheck)
	if itemRewindList == nil then
		return
	end

	if sceneCheck == nil then
		sceneCheck = false
	end

	local needRewind = false
	for i = 1 , #itemRewindList do
		local itemRewindData = itemRewindList[i]
		if itemRewindData ~= nil then
			if itemRewindData.alias ~= nil then
				print("Lua want to create item " .. itemRewindData.alias)
			else
				print("Lua want to create item " .. itemRewindData.id)
			end

			local sceneID = itemRewindData.scene_id
			if sceneID == nil then
				sceneID = sceneData.DefaultSceneID
			end

			repeat
				if sceneCheck and sceneID ~= sceneData.currSceneID and sceneData.currSceneID ~= 1001 then
					break
				end

				local dummyPoint = sceneData:GetDummyPoint(sceneID, itemRewindData.pos)
				if dummyPoint == nil then
					print("Dummy Point " .. itemRewindData.pos .. " is nil")
					break
				end

				self:SpawnItem(itemRewindData.id, dummyPoint.pos, dummyPoint.rot.y, itemRewindData.alias, sceneID)
				needRewind = true
			until true
		end
	end
end

--- QuestActor结束一个子任务
-- @tparam bool isFailed 是否失败
-- @tparam QuestProxy quest c#端quest的对象，如果quest为nil，则结束当前任务
function QuestActorProxy:FinishQuest(isFailed, quest)
	self.uActor:TryFinishCurrQuest(isFailed, quest)
end

--- QuestActor结束一个子任务
-- @tparam bool isFailed 是否失败
-- @tparam uint questId 想要结束的questId
function QuestActorProxy:FinishQuestID(isFailed, questId)
	self.uActor:TryFinishCurrQuestID(isFailed, questId)
end

--- QuestActor结束一个子任务
-- @tparam bool isFailed 是否失败
-- @tparam QuestProxy quest c#端quest的对象，如果quest为nil，则结束当前任务
function QuestActorProxy:UnFinishQuest(isFailed, quest)
	self.uActor:TryUnFinishCurrQuest(isFailed, quest)
end

QuestActorProxy.TaskOnPauseReminder = 1001
QuestActorProxy.TaskOnResumeReminder = 1002

function QuestActorProxy:Register()
	self.uActor:StartQuest('+', self.OnMainStart)
	self.uActor:StartSubQuest('+', self.OnSubStart)
	self.uActor:FinishSubQuest('+', self.OnSubFinished)
	self.uActor:FinishQuest('+', self.OnMainFinished)
	self.uActor:FailedSubQuest('+', self.OnSubFailed)
	self.uActor:RewindQuest('+', self.OnRewind)
	self.uActor:RegisterSoftRewindQuest(self.OnSoftRewind)
	self:RegisterTaskCB()
end

function QuestActorProxy:Start()
	print("here quest start")
end

function QuestActorProxy:Destroy(isActorOnly)
	self:UnregisterTaskCB()
	self.uActor:StartQuest('-', self.OnMainStart)
	self.uActor:StartSubQuest('-', self.OnSubStart)
	self.uActor:FinishSubQuest('-', self.OnSubFinished)
	self.uActor:FinishQuest('-', self.OnMainFinished)
	self.uActor:FailedSubQuest('-', self.OnSubFailed)
	self.uActor:RewindQuest('-', self.OnRewind)
	self.uActor:UnregisterSoftRewindQuest(self.OnSoftRewind)
	self:OnDestroy()
	QuestActorProxy.DestroyActor(self.uActor, isActorOnly)
	self.uActor = nil
	self.shareData = nil
	self.clientData = nil
	self.mainQuestID = nil
	self.subStartHandlers = nil
	self.subFinishHandlers = nil
end

--Method

--Method End

return QuestActorProxy