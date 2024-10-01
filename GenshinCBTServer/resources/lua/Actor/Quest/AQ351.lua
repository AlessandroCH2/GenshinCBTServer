require('Actor/ActorCommon')
local questActorProxy = require('Actor/Quest/QuestActorProxy')

local Quest351 = class("Quest351", questActorProxy)

Quest351.defaultAlias = "Quest351"

local q351Cfg = require('Quest/Client/Q351ClientConfig')
local warningTask = nil
local stayWarningTask = nil

-- Generated
function Quest351:OnSubStartHandlerBuild()
    self.subStartHandlers = {}
    self.subStartHandlers["35100"] = self.OnSubStart35100
	self.subStartHandlers["35101"] = self.OnSubStart35101
    self.subStartHandlers["35102"] = self.OnSubStart35102
    self.subStartHandlers["35103"] = self.OnSubStart35103
    self.subStartHandlers["35104"] = self.OnSubStart35104
	self.subStartHandlers["35105"] = self.OnSubStart35105
	self.subStartHandlers["35106"] = self.OnSubStart35106
	self.subStartHandlers["35107"] = self.OnSubStart35107
end

function Quest351:OnSubFinishHandlerBuild()
    self.subFinishHandlers = {}
    self.subFinishHandlers["35100"] = self.OnSubFinish35100
	self.subFinishHandlers["35101"] = self.OnSubFinish35101
    self.subFinishHandlers["35102"] = self.OnSubFinish35102
    self.subFinishHandlers["35103"] = self.OnSubFinish35103
    self.subFinishHandlers["35104"] = self.OnSubFinish35104
	self.subFinishHandlers["35105"] = self.OnSubFinish35105
	self.subFinishHandlers["35106"] = self.OnSubFinish35106
	self.subFinishHandlers["35107"] = self.OnSubFinish35107
end

---sub start & finish 内调用的函数
function Quest351:PaimonVanish()
    local paimon = actorMgr:GetActor(self.clientData.PaimonData.Paimon)
	paimon:StopPerformNarrator()
	paimon:VanishKeep(
	function(actor)
		self.uActor:AvatarPaimonAppear()
	end)
end

--@region sub start & finish handlers
---按流程触发顺序
function Quest351:OnSubStart35104(quest)
    print("35104 Start : Play mp4 and Cs_Opening_CutScene1")
    local PaimonData = self.clientData.PaimonData
	actorMgr:CreateActorWithPos(PaimonData.Paimon, PaimonData.PaimonScript, PaimonData.PaimonID, 0, PaimonData.Pos1, PaimonData.Dir1, true, false)
	local HeroSex = globalActor:IsHeroMale()

	if HeroSex == true then
		print("Play Boy mp4")
		self:TryPlayVideo("OpeningSequence_Rough_Boy_batch.mp4", 300003, true, self.PlayAwakeCutscene)
	else
		print("Play Girl mp4")
		self:TryPlayVideo("OpeningSequence_Rough_Girl_batch.mp4", 300004, true, self.PlayAwakeCutscene)
	end

  globalActor:EndGuide("GuideCameraMove")
  globalActor:EndGuide("GuideCameraScale")
  globalActor:EndGuide("GuideAvatarMove")
  globalActor:EndGuide("GuideAvatarSprint")
  globalActor:EndGuide("GuideAvatarJump")
  globalActor:EndGuide("GuideCameraMovePC")
  globalActor:EndGuide("GuideCameraScalePC")
  globalActor:EndGuide("GuideAvatarMovePC")
  globalActor:EndGuide("GuideAvatarSprintPC")
  globalActor:EndGuide("GuideAvatarJumpPC")

end

function Quest351:PlayAwakeCutscene()
	self:PlayCutscene(self.clientData.InterData.Cutscene1, self.On35104CutsceneFinish)
end

function Quest351:StartAllTutorial()
	globalActor:StartGuide("GuideCameraMove")
end

function Quest351:On35104CutsceneFinish()
    print("35104 Finish : Tutorial1")
    self:StartAllTutorial()
	--教程：镜头+移动
	local quest = actorMgr:GetActor(q351Cfg.ActorAlias)
	if quest ~= nil then
		quest:FinishQuest(false, nil)
	end
end
--[[ function Quest351:OnSubFinish35104(quest)
    print("35104 Finish : Tutorial1")
	--教程：镜头+移动
end ]]

function Quest351:OnSubStart35101(quest)
	print("35101 Start : To Trans")
	--开车提示
	--self:NarratorOnlyTask(self.clientData.NarratorData.Story2)
	--派蒙移动
	local paimon = actorMgr:GetActor(self.clientData.PaimonData.Paimon)
	paimon:Standby()
	paimon:RunToRouteTask(q351Cfg.RoutePoints2,
	function(actor, task)
		actor:ClearFollowTask()
        actor:ClearPriorityInter(InterTimingType.BTN)
        actor:Standby()
		actor:TurnTo(M.Euler2DirXZ(sceneData:GetDummyPoint(3,"Q351Trans").rot))
	end
    )
	--临时传送点
	local TempTransData = self.clientData.TempTransData
	--globalActor:SpawnItem(TempTransData.TempTransID, TempTransData.TempTransPos,nil,"TempTrans")
	--creat trigger
	--local avatarPos = actorUtils.GetAvatarPos()
	--actorMgr:CreateActorWithPos("Q351Trigger1", "Actor/Gadget/Q351Trigger1", 70900002, 0, avatarPos, sceneData:GetDummyPoint(3,"Q361DragonTriggerCenter").rot, true, false)

end

function Quest351:OnSubStart35106(quest)
  print("StartGuideInteraction")
  globalActor:StartGuide("GuideInteraction")
end

function Quest351:OnSubFinish35106(quest)
	print("35105 Finish : To Climb")
	--教程：传送点
	--派蒙移动
	local paimon = actorMgr:GetActor(self.clientData.PaimonData.Paimon)
	paimon:Standby()
	paimon:RunToRouteTask(q351Cfg.RoutePoints,
	function(actor, task)
		actor:ClearFollowTask()
        actor:ClearPriorityInter(InterTimingType.BTN)
        actor:Standby()
		actor:TurnTo(M.Euler2DirXZ(sceneData:GetDummyPoint(3,"Q351FirstClimb").rot))
	end
	)
	self:CallDelay(3, self.AfterAni)
	--self:ShowTutorialDialog(232, self.TotorialContent)
	--self:ShowTutorialDialog(232)
--[[ 	self:CallDelay(3,
		function()
			globalActor:StartGuide("GuideRadar")
		end
	) ]]
end
function Quest351:AfterAni()
	self:ShowTutorialDialog(232, self.TotorialContent)
end
function Quest351:TotorialContent(quest)
	globalActor:CallDelay(3,
		function()
			globalActor:StartGuide("GuideRadar")
		end
	)
end

function Quest351:OnSubFinish35107(quest)
    print("35103 Finish : Tutorial1")
    globalActor:StartGuide("GuideAvatarAttack")
	--教程：普攻
end

--[[ function Quest351:OnSubStart35101(quest)
	local paimon = actorMgr:GetActor(self.clientData.PaimonData.Paimon)
	paimon:Standby()
	paimon:NarratorTask(q351Cfg.NarratorFlow, q351Cfg.FollowLen, q351Cfg.FollowLen, nil, "Story")
	paimon:BeFollowTaskByRoutePoints(q351Cfg.RoutePoints, q351Cfg.FollowLen, -1,
	function(paimon, task)
		if paimon.BeFollowState == BeFollowState.FAILED then
			local quest = actorMgr:GetActor(q351Cfg.ActorAlias)
			if quest ~= nil then
				quest:FinishQuest(true, nil)
			end
			paimon:StopPerformNarrator()
		elseif paimon.BeFollowState == BeFollowState.SUCCESS then
			paimon:DoFreeStyle(0)
			paimon:TurnTo(M.Euler2DirXZ(q351Cfg.PaimonData.Dir2))
			paimon:ClearBeLockTask()
			local quest = actorMgr:GetActor(q351Cfg.ActorAlias)
			if quest ~= nil then
				quest:FinishQuest(false, nil)
				--quest:FinishQuestID(false, 35101)
			end
		end
	end,
	function(paimon, task)
		paimon:Standby()
	end
    )
	paimon:BeLockTask(q351Cfg.FollowTransLen, 1,
		function(paimon)
			paimon:TransFinishCallBack(q351Cfg)
		end,
		function(paimon)
			paimon:TransPreCallBack(q351Cfg)
		end
	)
    stayWarningTask = paimon:WarningNarratorTask(0, q351Cfg.NarratorStayWarning, function(paimon)
        local selfPos = paimon:GetPos()
        local avatarPos = actorUtils.GetAvatarPos()
        local currLen = M.Dist(selfPos, avatarPos)
        return currLen > q351Cfg.FollowLen + 5 and currLen <= q351Cfg.FollowLen + 15 and paimon:IsInIdle()
    end, nil, "StoryWarning")
    warningTask = paimon:WarningNarratorTask(1, q351Cfg.NarratorWarning, function(paimon)
        local selfPos = paimon:GetPos()
        local avatarPos = actorUtils.GetAvatarPos()
        local currLen = M.Dist(selfPos, avatarPos)
        return currLen > q351Cfg.FollowLen + 15 and currLen <= q351Cfg.FollowLen + 1000
    end, nil, "StoryWarning")
end ]]



function Quest351:OnSubFinish35101(quest)
--[[     print("35101 Finish : Warning Off")
	if warningTask ~= nil then
		warningTask:FinishTask()
	end
	if stayWarningTask ~= nil then
		stayWarningTask:FinishTask()
	end
	local Paimon = actorMgr:GetActor(self.clientData.PaimonData.Paimon)
	Paimon:ClearBeLockTask() ]]
end

function Quest351:OnSubStart35103(quest)
--[[     print("35103 Start : Lock Off")
	local Paimon = actorMgr:GetActor(self.clientData.PaimonData.Paimon)
	Paimon:ClearBeLockTask() ]]
end

function Quest351:OnSubFinish35103(quest)
--[[     print("35103 Finish : Lock Off")
	local Paimon = actorMgr:GetActor(self.clientData.PaimonData.Paimon)
	Paimon:ClearBeLockTask() ]]
end

function Quest351:OnSubStart35102(quest)
    print("35102 Start : Paimon NPC to Shimo")
    self:CallDelay(1, self.PaimonVanish)
	self:NarratorOnlyTask(self.clientData.NarratorData.Story1, nil, "Story")
end

function Quest351:OnSubFinish35102(quest)
    print("35102 Finish : Warning Off")
	if warningTask ~= nil then
		warningTask:FinishTask()
	end
	if stayWarningTask ~= nil then
		stayWarningTask:FinishTask()
	end
	--self:NarratorOnlyTask(self.clientData.NarratorData.Story2)
end
--@endregion

function Quest351:Start()
end

function Quest351:OnDestroy()
end

return Quest351
