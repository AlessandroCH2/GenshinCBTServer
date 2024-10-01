require('Actor/ActorCommon')
local questActorProxy = require('Actor/Quest/QuestActorProxy')

local Quest361 = class("Quest361", questActorProxy)

Quest361.defaultAlias = "Quest361"

local q361Cfg = require('Quest/Client/Q361ClientConfig')

-- Generated
function Quest361:OnSubStartHandlerBuild()
	self.subStartHandlers = {}
    self.subStartHandlers["36100"] = self.OnSubStart36100
    self.subStartHandlers["36101"] = self.OnSubStart36101
end

function Quest361:OnSubFinishHandlerBuild()
	self.subFinishHandlers = {}
    self.subFinishHandlers["36100"] = self.OnSubFinish36100
    self.subFinishHandlers["36101"] = self.OnSubFinish36101
end

---sub start & finish 内调用的函数
function Quest361:CameraMove()
	self:EnterSceneLookCameraByAlias("LookAt_Dragon", 0, 3, true, false)
	globalActor:StopLocalAvatar()	
	globalActor:EnablePlayerInput(false)	
	self:CallDelay(2, self.OnEnableInput)
end

function Quest361:OnEnableInput()
	print("361 Finish: Enable Player Input")	
	globalActor:EnablePlayerInput(true)
end

function Quest361:PaimonQ361Narrator()
	self:NarratorOnlyTask(q361Cfg.PaimonNarrator, nil, "Story")
end

function Quest361:AutoFinishQuest()
	local quest = actorMgr:GetActor(q361Cfg.ActorAlias)
	if quest ~= nil then
		quest:FinishQuest(false, nil)
    end
end

--@region sub start & finish handlers
---按流程触发顺序
function Quest361:OnSubStart36100(quest)
    print("36100 Start: Trigger Create")
	actorMgr:CreateActorWithPos("DragonTrigger", "Actor/Gadget/DragonTrigger", 70900002, 0, sceneData:GetDummyPoint(3,"Q361DragonTriggerCenter").pos, sceneData:GetDummyPoint(3,"Q361DragonTriggerCenter").rot, true, false)
end

function Quest361:OnSubFinish36100(quest)
    print("36100 Finish: Ca_Quest_MQ361_DragonFlyT_Test")
	local avatarPos = actorUtils.GetAvatarPos()
	self:PlayFreeCutscene(
		{
			type = CutsceneType.TIME_LINE_PREFAB,
			roleSheetPath = "",
			resPath = "ART/CameraAni/Quest/Ca_Quest_MQ361_DragonFlyT_Test",
			startPosType = CutsceneInitPosType.FREE,
			--startOffset = {0, 0, 0}
			startOffset = { x = avatarPos.x , y = avatarPos.y + 15, z = avatarPos.z + 10},
			useTargetPos = true,
			--大世界平移后修正坐标
			targetPos = {2450, 200, -1174},
			syncLoad = true
		},
		self,
		function(self)
			self:ExitSceneLookCamera()
		end
	)
	self:CallDelay(6, self.CameraMove)
	self:CallDelay(8, self.PaimonQ361Narrator)
end

function Quest361:OnSubStart36101(quest)
	print("36101 Start: Auto Finish Quest After Period")
	self:CallDelay(10, self.AutoFinishQuest)
end

--@endregion

function Quest361:Start()
end

function Quest361:OnDestroy()
end

return Quest361