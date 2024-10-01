require('Actor/ActorCommon')
local questActorProxy = require('Actor/Quest/QuestActorProxy')

local Quest360 = class("Quest360", questActorProxy)

Quest360.defaultAlias = "Quest360"

local q360Cfg = require('Quest/Client/Q360ClientConfig')

-- Generated
function Quest360:OnSubStartHandlerBuild()
	self.subStartHandlers = {}
	self.subStartHandlers["36001"] = self.OnSubStart36001
	--self.subStartHandlers["36002"] = self.OnSubStart36002
	self.subStartHandlers["36003"] = self.OnSubStart36003
	self.subStartHandlers["36004"] = self.OnSubStart36004
	self.subStartHandlers["36005"] = self.OnSubStart36005
end

function Quest360:OnSubFinishHandlerBuild()
	self.subFinishHandlers = {}
	self.subFinishHandlers["36001"] = self.OnSubFinish36001
	--self.subFinishHandlers["36002"] = self.OnSubFinish36002
	self.subFinishHandlers["36003"] = self.OnSubFinish36003
	self.subFinishHandlers["36004"] = self.OnSubFinish36004
	self.subFinishHandlers["36005"] = self.OnSubFinish36005
end

---sub start & finish 内调用的函数
function Quest360:OnEnableInput()
	print("360 Finish: Enable Player Input")	
	globalActor:EnablePlayerInput(true)
end

--@region sub start & finish handlers
---按流程触发顺序
---当OnSubFinish当前环和OnSubStart下一环等效时，写在OnSubFinish内，否则断线重连流程可能和OnSubStart流程重复执行
function Quest360:OnSubStart36001(quest)
    print("36001 Start : Story1")
	-- self:NarratorOnlyTask(self.clientData.NarratorData.Story1)
	-- self:EnterSceneLookCamera(sceneData:GetDummyPoint(3,"Q360qqLook1").pos, 1, 2, true)
	-- globalActor:StopLocalAvatar()	
	-- globalActor:EnablePlayerInput(false)	
	-- self:CallDelay(2, self.OnEnableInput)
end

function Quest360:OnSubFinish36001(quest)
    print("36001 Finish : Story2")
	self:NarratorOnlyTask(self.clientData.NarratorData.Story2)
	--self:EnterSceneLookCamera(sceneData:GetDummyPoint(3,"Q360qq2").pos, 7, 3, true)
	-- globalActor:StopLocalAvatar()	
	-- globalActor:EnablePlayerInput(false)	
	-- self:CallDelay(3, self.OnEnableInput)
end

--[[ function Quest360:OnSubFinish36002(quest)
    print("36002 Finish : Story3")
    self:NarratorOnlyTask(self.clientData.NarratorData.Story3)
end ]]

function Quest360:OnSubFinish36003(quest)
	print("36003 Finish : Creat NPC")
end
function Quest360:Interact()
	local AmborData = self.clientData.AmborData
	actorMgr:CreateActorWithPos(AmborData.Ambor, AmborData.AmborScript, AmborData.AmborID, 0, AmborData.Pos1, AmborData.Dir1, true, false)
	self:RequestInteraction(AmborData.Ambor)
end

function Quest360:OnSubStart36004(quest)
	print("36004 Start : interact")
	self:ShowBlackScreen(0.5, 1.0, 0.5, self.Interact)
end

function Quest360:OnSubFinish36004(quest)
	print("36004 Finish : Ambor Vanish")
	self:ActionPreSafeCall(self.Finish36004Do)
end

function Quest360:Finish36004Do(quest)
    local AmborData = self.clientData.AmborData
    actorMgr:CreateActorWithPos(AmborData.Ambor, AmborData.AmborScript, AmborData.AmborID, 0, AmborData.Pos2, AmborData.Dir2, true, false)
	local paimon = actorMgr:GetActor(self.clientData.PaimonData.Paimon)
	paimon:VanishKeep()
end

function Quest360:OnSubFinish36005(quest)
	print("36005 Finish : Cs_AM_FirstArrive_CutScene2")
    globalActor:StopLocalAvatar()
    globalActor:FinishAllNarrator()
    self:PlayCutscene(self.clientData.InterData.Cutscene1, self.On36005CutsceneFinish)
end
function Quest360:On36005CutsceneFinish()
    local AmborData = self.clientData.AmborData
    actorMgr:CreateActorWithPos(AmborData.Ambor, AmborData.AmborScript, AmborData.AmborID, 0, AmborData.Pos3, AmborData.Dir3, true, false)
end

--@endregion

function Quest360:Start()
end

function Quest360:OnDestroy()
end

return Quest360