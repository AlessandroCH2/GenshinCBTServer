require('Actor/ActorCommon')
local questActorProxy = require('Actor/Quest/QuestActorProxy')

local Quest426 = class("Quest426", questActorProxy)

Quest426.defaultAlias = "Quest426"

local q426Cfg = require('Quest/Client/Q426ClientConfig')
local subIDs = q426Cfg.SubIDs
local PaimonData = q426Cfg.PaimonData

-- Generated
function Quest426:OnSubStartHandlerBuild()
    self.subStartHandlers = {}
    self.subStartHandlers["42601"] = self.OnSubStart42601
    self.subStartHandlers["42602"] = self.OnSubStart42602
end

function Quest426:OnSubFinishHandlerBuild()
    self.subFinishHandlers = {}
    self.subFinishHandlers["42601"] = self.OnSubFinish42601
	self.subFinishHandlers["42602"] = self.OnSubFinish42602
end

-- local param begin
-- local param end

-- local method begin
--@region sub start handlers
function Quest426:OnPlayerSit(quest)
    print("42601 PlayerSit:...")
    local quest = actorMgr:GetActor(q426Cfg.ActorAlias)
	if quest ~= nil then
		quest:FinishQuest(false, nil)
	end
    local paimonPos = actorUtils.GetAvatarPos()
    paimonPos.z = paimonPos.z+1
    local paimonRot = {x=0,y=0,z=-1}
    local sceneID = sceneData.currSceneID
    actorMgr:CreateActorWithPos(PaimonData.Paimon, PaimonData.PaimonScript, PaimonData.PaimonID, 0, paimonPos, M.Dir2Euler(paimonRot), true, false, sceneID)
	if quest ~= nil then
		quest:RequestInteraction(PaimonData.Paimon)
	end
end

function Quest426:OnPlayerStand(quest)
    print("42601 PlayerStand:...")
end

function Quest426:OnSubStart42601(quest)
    print("42601 start:...")
    self:CallOnAvatarSit(self.OnPlayerSit)
    self:CallOnAvatarStand(self.OnPlayerStand)
end

function Quest426:OnSubStart42602(quest)
    print("42602 start:...")
end

--@endregion

--@region sub finish handlers
function Quest426:OnSubFinish42601(quest)
    print("OnFinished 42601")
end

function Quest426:OnSubFinish42602(quest)
    print("OnFinished 42602")
end

function Quest426:InvokeOnInteraction(param)
    print("*****INVOKE**********" .. param .."*********")
    if param == 1 then
        self:ActionSafeCall(
            function(self)
                local paimon = actorMgr:GetActor("Paimon")
                if paimon ~= nil then
                    paimon:DestroyWithDisappear(false)
                end
            end
        )
        print("*************try fail quest************")
        local quest = actorMgr:GetActor(q426Cfg.ActorAlias)
        if quest ~= nil then
            quest:FinishQuest(true, nil)
        end
    end
end

--@endregion

function Quest426:Start()
end

function Quest426:OnDestroy()
end

return Quest426