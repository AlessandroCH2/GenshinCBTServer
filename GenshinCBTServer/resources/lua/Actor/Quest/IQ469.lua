require('Actor/ActorCommon')
local questActorProxy = require('Actor/Quest/QuestActorProxy')

local Quest469 = class("Quest469", questActorProxy)

Quest469.defaultAlias = "Quest469"

local q469Cfg = require('Quest/Client/Q469ClientConfig')
local PaimonData=q469Cfg.PaimonData

-- Generated
function Quest469:OnSubStartHandlerBuild()
	self.subStartHandlers = {}
	self.subStartHandlers["46901"] = self.OnSubStart46901
	self.subStartHandlers["46902"] = self.OnSubStart46902
	self.subStartHandlers["46903"] = self.OnSubStart46903
	self.subStartHandlers["46904"] = self.OnSubStart46904
end

function Quest469:OnSubFinishHandlerBuild()
	self.subFinishHandlers = {}
	self.subFinishHandlers["46901"] = self.OnSubFinish46901
	self.subFinishHandlers["46902"] = self.OnSubFinish46902
	self.subFinishHandlers["46903"] = self.OnSubFinish46903
	self.subFinishHandlers["46904"] = self.OnSubFinish46904
end

---sub start & finish 内调用的函数
function Quest469:PaimonVanish()
end

--@region sub start & finish handlers
---按流程触发顺序
function Quest469:OnSubFinish46904(quest)
    print("46904 Finish : Story")
	self:NarratorOnlyTask(self.clientData.NarratorData.Story2)
end

function Quest469:OnSubStart46901(quest)
end

function Quest469:OnSubFinish46901(quest)
    print("46901 Finish : Story")
	self:NarratorOnlyTask(self.clientData.NarratorData.Story1)
	self:EnterSceneLookCamera(sceneData:GetDummyPoint(3,"Q469Statue").pos, 1, 3, true)
	globalActor:StopLocalAvatar()	
	globalActor:EnablePlayerInput(false)	
	self:CallDelay(3, self.OnEnableInput)
end
function Quest469:OnEnableInput()
	print("469 Finish: Enable Player Input")	
	globalActor:EnablePlayerInput(true)
end

function Quest469:OnSubFinish46902(quest)
	print("46902 Finish : Creat Paimon")
    actorMgr:CreateActorWithPos(PaimonData.Paimon, PaimonData.PaimonScript, PaimonData.PaimonID, 0, PaimonData.Pos1, PaimonData.Dir1, true, false, 3)
end

function Quest469:OnSubFinish46903(quest)
	print("46903 Finish : Paimon Vanish")
    self:ActionSafeCall(self.Finish46903Do)
end
function Quest469:Finish46903Do(quest)
	local paimon = actorMgr:GetActor(self.clientData.PaimonData.Paimon)
	paimon:VanishKeep()
end

--@endregion

function Quest469:Start()
end

function Quest469:OnDestroy()
end

return Quest469