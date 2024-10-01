require('Actor/ActorCommon')
local questActorProxy = require('Actor/Quest/QuestActorProxy')

local Quest470 = class("Quest470", questActorProxy)

Quest470.defaultAlias = "Quest470"

local q470Cfg = require('Quest/Client/Q470ClientConfig')
local SaraData = q470Cfg.SaraData

-- Generated
function Quest470:OnSubStartHandlerBuild()
	self.subStartHandlers = {}
	self.subStartHandlers["47001"] = self.OnSubStart47001
	self.subStartHandlers["47002"] = self.OnSubStart47002
    self.subStartHandlers["47003"] = self.OnSubStart47003
    self.subStartHandlers["47004"] = self.OnSubStart47004
end

function Quest470:OnSubFinishHandlerBuild()
	self.subFinishHandlers = {}
	self.subFinishHandlers["47001"] = self.OnSubFinish47001
	self.subFinishHandlers["47002"] = self.OnSubFinish47002
    self.subFinishHandlers["47003"] = self.OnSubFinish47003
    self.subFinishHandlers["47004"] = self.OnSubFinish47004
end

---sub start & finish 内调用的函数
function Quest470:PaimonVanish()
    self:ActionSafeCall(
        function(self)
            local paimon = actorMgr:GetActor("Paimon")
            if paimon ~= nil then
                paimon:DestroyWithDisappear(false)
            end
        end
    )
end

function Quest470:PaimonAppearTalk()
	local PaimonData = self.clientData.PaimonData
    local paimonPos = actorUtils.GetAvatarPos()
    paimonPos.z = paimonPos.z+1.2
    local paimonRot = {x=0,y=0,z=-1}
	actorMgr:CreateActorWithPos(PaimonData.Paimon, PaimonData.PaimonScript, PaimonData.PaimonID, 0, paimonPos, M.Dir2Euler(paimonRot), true, false)
    self:RequestInteraction(PaimonData.Paimon)
end

function Quest470:PaimonAppearTalkAfterBuy()
	local PaimonData = self.clientData.PaimonData
    local paimonPos = actorUtils.GetAvatarPos()
    -- paimonPos.z = paimonPos.z+0.8
    paimonPos.x = paimonPos.x+1.2
    local paimonRot = {x=-1,y=0,z=0}
	actorMgr:CreateActorWithPos(PaimonData.Paimon, PaimonData.PaimonScript, PaimonData.PaimonID, 0, paimonPos, M.Dir2Euler(paimonRot), true, false)
    self:RequestInteraction(PaimonData.Paimon)
end

--@region sub start & finish handlers
---按流程触发顺序
function Quest470:OnSubStart47002(quest)
    print("47002 Start : Creat Paimon and Talk")
    self:EnterSceneLookCamera(sceneData:GetDummyPoint(3,"Q470ShopLookAt").pos, 0.2, 1.5, true)
    self:CallDelay(2, self.PaimonAppearTalk)
end

function Quest470:OnSubFinish47002(quest)
    print("47002 Finish : PaimonVanish")
	self:PaimonVanish()
end

function Quest470:OnSubStart47004(quest)
    print("47004 Start : Creat Paimon and Talk")  
    self:ActionSafeCall(
        function(self)
            self:CallDelay(2, self.PaimonAppearTalk)
        end
    )
end

function Quest470:OnSubFinish47004(quest)
    print("47004 Finish : PaimonVanish")
	self:PaimonVanish()
end

--@endregion

function Quest470:Start()
end

function Quest470:OnDestroy()
end

return Quest470