require('Actor/ActorCommon')
local questActorProxy = require('Actor/Quest/QuestActorProxy')

local Quest356 = class("Quest356", questActorProxy)

Quest356.defaultAlias = "Quest356"

local q356Cfg = require('Quest/Client/Q356ClientConfig')
local amborData = q356Cfg.AmborData

-- Generated
function Quest356:OnSubStartHandlerBuild()
	self.subStartHandlers = {}
	self.subStartHandlers["35601"] = self.OnSubStart35601
	self.subStartHandlers["35602"] = self.OnSubStart35602
	self.subStartHandlers["35603"] = self.OnSubStart35603
	self.subStartHandlers["35604"] = self.OnSubStart35604
	self.subStartHandlers["35605"] = self.OnSubStart35605
	self.subStartHandlers["35606"] = self.OnSubStart35606
end

function Quest356:OnSubFinishHandlerBuild()
	self.subFinishHandlers = {}
	self.subFinishHandlers["35601"] = self.OnSubFinish35601
	self.subFinishHandlers["35602"] = self.OnSubFinish35602
	self.subFinishHandlers["35603"] = self.OnSubFinish35603
	self.subFinishHandlers["35604"] = self.OnSubFinish35604
	self.subFinishHandlers["35605"] = self.OnSubFinish35605
	self.subFinishHandlers["35606"] = self.OnSubFinish35606
end

---sub start & finish 内调用的函数
--@region sub start & finish handlers
function Quest356:AmborRoute()
	print("Ambor run to godless")
	local ambor = actorMgr:GetActor(self.clientData.AmborData.Ambor)
	ambor:BeFollowTaskByRoutePoints(self.clientData.AmborRouteData.routeConfig, self.clientData.AmborRouteData.beFollowLen, self.clientData.AmborRouteData.beFollowFailed)
end

function Quest356:Story1()
	--self:NarratorOnlyTask(self.clientData.NarratorData.Story1, nil, "Story")
	local AmborData = self.clientData.AmborData
	--actorMgr:CreateActorWithPos(AmborData.Ambor, AmborData.AmborScript, AmborData.AmborID, 0, AmborData.Pos3, AmborData.Dir3, true, false)
	local ambor = actorMgr:GetActor(self.clientData.AmborData.Ambor)
	ambor:NarratorTaskByData(self.clientData.NarratorData.Story1, nil)
	ambor:ClearFollowTask()
--[[ 	ambor:BeFollowTaskByData(self.clientData.FollowData.Follow1,
		function(ambor, task)
			if ambor.BeFollowState == BeFollowState.FAILED then
				local quest = actorMgr:GetActor(self.clientData.ActorAlias)
				if quest ~= nil then
					quest:FinishQuest(true, nil)
				end
				ambor:StopNarrator()
			elseif ambor.BeFollowState == BeFollowState.SUCCESS then
				ambor:Standby()
				ambor:TurnTo(M.Euler2DirXZ(self.clientData.AmborData.Dir3))
				local quest = actorMgr:GetActor(self.clientData.ActorAlias)
				if quest ~= nil then
					quest:FinishQuest(false, nil)
				end
			end
		end,
		function(ambor, task)
			ambor:Standby()
		end
	) ]]
	--ambor:AddPriorityInter(InterTimingType.BTN, self.clientData.InterData.NoReplyInter)
	ambor:RunToTask(self.clientData.AmborData.born4Pos,
	function(actor, task)
		actor:ClearFollowTask()
		actor:ClearPriorityInter(InterTimingType.BTN)
		actor:TurnTo(M.Euler2DirXZ(self.clientData.AmborData.born4Dir))
	end
	)
--[[ 	local paimon = actorMgr:GetActor(self.clientData.PaimonData.Paimon)
	paimon:DestroyWithDisappear(false) ]]
	local paimon = actorMgr:GetActor("Paimon")
	if paimon ~= nil then
		paimon:DestroyWithDisappear(false)
	end
end

--[[ function Quest356:On35602CutsceneFinish()
	local AmborData = self.clientData.AmborData
	self:RequestInteraction(AmborData.Ambor)
	local StoneData = self.clientData.StoneData
	globalActor:UnSpawn("Stone")
	globalActor:SpawnGadget(StoneData.StoneID, StoneData.StonePos,StoneData.StoneDir,"Stone")
end ]]

function Quest356:OnBright()
	local AmborData = self.clientData.AmborData
	--globalActor:CreateActorWithPos(self.clientData.AmborData.Ambor, self.clientData.AmborData.AmborScript, self.clientData.AmborData.AmborID, 0, self.clientData.AmborData.Pos2, self.clientData.AmborData.Dir2, true, false)
	actorMgr:CreateActorWithPos(AmborData.Ambor, AmborData.AmborScript, AmborData.AmborID, 0, AmborData.Pos2, AmborData.Dir2, true, false)
end

-- function Quest356:On35601CutsceneFinish()
-- 	local AmborData = self.clientData.AmborData
-- 	actorMgr:CreateActorWithPos(AmborData.Ambor, AmborData.AmborScript, AmborData.AmborID, 0, AmborData.Pos2, AmborData.Dir2, true, false)
-- end

function Quest356:OnEnableInput()
	globalActor:EnablePlayerInput(true)
end
--@endregion

--@region sub start & finish handlers
---按流程触发顺序
function Quest356:OnSubStart35601(quest)
	print("35601 Start : ......")
	globalActor:PlayAudioState("StateGroup_musicEmotion", "State_musicNormal")
	-- print("35601 Start : Creat Ambor")
	-- local AmborData = self.clientData.AmborData
	-- actorMgr:CreateActorWithPos(AmborData.Ambor, AmborData.AmborScript, AmborData.AmborID, 0, AmborData.Pos2, AmborData.Dir2, true, false)
--[[ 	globalActor:StopLocalAvatar()
	globalActor:EnablePlayerInput(false)	
	self:CallDelay(2, self.OnEnableInput)
	self:ShowBlackScreen(1.0, 1.0, 2.0, self.OnBright) ]]
--[[ 	local AmborData = self.clientData.AmborData
	actorMgr:CreateActorWithPos(AmborData.Ambor, AmborData.AmborScript, AmborData.AmborID, 0, AmborData.Pos1, AmborData.Dir1, true, false)
	local ambor = actorMgr:GetActor(self.clientData.AmborData.Ambor)
	ambor:AddPriorityInter(InterTimingType.BTN, self.clientData.InterData.NoReplyInter)
	ambor:RunToTask(self.clientData.AmborData.Pos2,
	function(actor, task)
		actor:ClearFollowTask()
		actor:ClearPriorityInter(InterTimingType.BTN)
		actor:Standby()
		actor:TurnTo(M.Euler2DirXZ(self.clientData.AmborData.Dir2))
	end
	) ]]
end

function Quest356:OnSubStart35602(quest)
	print("35602 Start : Follow Ambor")
	--self:NarratorOnlyTask(self.clientData.NarratorData.Story1, nil, "Story")
	-- globalActor:PlayAudioState("StateGroup_musicEmotion", "State_musicNormal")
	-- self:ActionSafeCall(self.Story1)
--[[ 	local ambor = actorMgr:GetActor(self.clientData.AmborData.Ambor)
	ambor:AddPriorityInter(InterTimingType.BTN, self.clientData.InterData.NoReplyInter)
	ambor:RunToTask(self.clientData.AmborData.Pos3,
	function(actor, task)
		actor:ClearFollowTask()
		actor:ClearPriorityInter(InterTimingType.BTN)
		actor:TurnTo(M.Euler2DirXZ(self.clientData.AmborData.Dir3))
	end
	) ]]
end

function Quest356:OnSubStart35603(quest)
	print("35603 Start : Ambor Route")
end

function Quest356:OnSubStart35604(quest)
	print("35604 Start : ...")	
end

function Quest356:OnSubStart35605(quest)
	print("35605 Start : ...")
	local quest = actorMgr:GetActor(q356Cfg.ActorAlias)
	if quest ~= nil then
		quest:FinishQuest(false, nil)
	end	
end

function Quest356:OnSubStart35606(quest)
	print("35606 Start : ...")
	self:ActionSafeCall(
		function (self)
			self:TransmitPlayer(3, self.clientData.FlyTrainData.StartPos, self.clientData.FlyTrainData.StartDir, function ()
				globalActor:StartGuide("GuideAvatarFly")
				globalActor:StartGuide("GuideAvatarFlyPC")
				globalActor:StartGuide("GuideAvatarFlyWarningInfo")
			end,
			function ()
				local paimon = actorMgr:GetActor("Paimon")
				if paimon ~= nil then
					paimon:Destroy(false)
				end
				
				globalActor:ChangeToHero()
				actorMgr:CreateActorWithPos(amborData.Ambor, amborData.AmborScript, amborData.AmborID, 0, amborData.born5Pos, amborData.born5Dir, true)
			end
		    ) 
		end
	)
end


function Quest356:OnSubFinish35601(quest)
	print("35601 Finish : ...")
    self:ActionSafeCall(
		function (self)
			self:ShowBlackScreen(0.5, 1, 0.5,
				function (self)
					local ambor = actorMgr:GetActor(amborData.Ambor)
					local paimon = actorMgr:GetActor("Paimon")

					if ambor ~= nil then
						ambor:Destroy(false)
					end

					if paimon ~= nil then
						paimon:Destroy(false)
					end
				end
			)

			self:CallDelay(3,
				function (self)
					self:NarratorOnlyTask(q356Cfg.NarratorData.Story1.dialogList,
					function (self)
					    globalActor:StartGuide("GuideQuestGuide")
					end,
					"Story")
				end
			)
		end
	)
end

function Quest356:OnSubFinish35602(quest)
	print("35602 Finish : Play Cutscene & Creat Stone")
	--self:PlayCutscene(self.clientData.InterData.Cutscene1)
	--self:PlayCutscene(self.clientData.InterData.Cutscene1, self.On35602CutsceneFinish)
--[[ 	local StoneData = self.clientData.StoneData
	globalActor:UnSpawn("Stone")
	globalActor:SpawnGadget(StoneData.StoneID, StoneData.StonePos,StoneData.StoneDir,"Stone") ]]
end

function Quest356:OnSubFinish35603(quest)
	print("35603 Finish : ...")
	self:ShowBlackScreen(0.5, 1.0, 0.5,
	function (self)
		actorMgr:CreateActorWithPos(amborData.Ambor, amborData.AmborScript, amborData.AmborID, 0, amborData.born4Pos, amborData.born4Dir, true)
		
		self:CallDelay(0.5,
		function (slef)
			self:RequestInteraction(amborData.Ambor)
		end
		)
	end
    )
end

function Quest356:OnSubFinish35604(quest)
	print("35604 Finish : ...")
end

function Quest356:OnSubFinish35605(quest)
	print("35605 Finish : ...")
end

function Quest356:OnSubFinish35606(quest)
	print("35606 Finish : ...")
end
--@endregion

function Quest356:Start()
end

function Quest356:OnDestroy()
end

return Quest356