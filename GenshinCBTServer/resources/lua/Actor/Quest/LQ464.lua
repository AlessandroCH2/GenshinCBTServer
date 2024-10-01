require('Actor/ActorCommon')
local questActorProxy = require('Actor/Quest/QuestActorProxy')

local Quest464 = class("Quest464", questActorProxy)

Quest464.defaultAlias = "Quest464"

local q464Cfg = require('Quest/Client/Q464ClientConfig')
local subIDs = q464Cfg.SubIDs
local dilucData = q464Cfg.DilucData
local hoffmanData = q464Cfg.HoffmanData
local PaimonData=q464Cfg.PaimonData


-- Generated
function Quest464:OnSubStartHandlerBuild()
    self.subStartHandlers = {}
	self.subStartHandlers["46401"] = self.OnSubStart46401
    self.subStartHandlers["46402"] = self.OnSubStart46402
    self.subStartHandlers["46403"] = self.OnSubStart46403
    self.subStartHandlers["46404"] = self.OnSubStart46404
    self.subStartHandlers["46405"] = self.OnSubStart46405
    self.subStartHandlers["46406"] = self.OnSubStart46406
    self.subStartHandlers["46407"] = self.OnSubStart46407
end

function Quest464:OnSubFinishHandlerBuild()
    self.subFinishHandlers = {}
	self.subFinishHandlers["46401"] = self.OnSubFinish46401
    self.subFinishHandlers["46402"] = self.OnSubFinish46402
    self.subFinishHandlers["46403"] = self.OnSubFinish46403
    self.subFinishHandlers["46404"] = self.OnSubFinish46404
    self.subFinishHandlers["46405"] = self.OnSubFinish46405
    self.subFinishHandlers["46406"] = self.OnSubFinish46406
    self.subFinishHandlers["46407"] = self.OnSubFinish46407
end

-- local param begin
-- local param end

-- local method begin
--@region sub start handlers
function Quest464:OnSubFinish46406(quest)
    print("46406 Finish:Cutscene & Creat NPC")
    self:NarratorOnlyTask(self.clientData.NarratorData.CutsceneTemp)
    --actorMgr:CreateActorWithPos(PaimonData.Paimon, PaimonData.PaimonScript, PaimonData.PaimonID, 0, PaimonData.Pos1, PaimonData.Dir1, true, false)
    actorMgr:CreateActorWithPos(dilucData.Diluc, dilucData.DilucScript, dilucData.DilucID, 0, dilucData.Pos1, dilucData.Dir1, true)
    actorMgr:CreateActorWithPos(hoffmanData.Hoffman, hoffmanData.HoffmanScript, hoffmanData.HoffmanID, 0, hoffmanData.Pos1, hoffmanData.Dir1, true)
end

function Quest464:OnSubFinish46407(quest)
    print("46407 Finish:Cutscene & Creat NPC")
    self:ActionSafeCall(self.Finish46407Do)
    --actorMgr:CreateActorWithPos(dilucData.Diluc, dilucData.DilucScript, dilucData.DilucID, 0, dilucData.hiddenPos, dilucData.hiddenDir, true)
    --actorMgr:CreateActorWithPos(hoffmanData.Hoffman, hoffmanData.HoffmanScript, hoffmanData.HoffmanID, 0, hoffmanData.hiddenPos, hoffmanData.hiddenDir, true)
end
function Quest464:Finish46407Do(quest)
    actorMgr:CreateActorWithPos(dilucData.Diluc, dilucData.DilucScript, dilucData.DilucID, 0, dilucData.hiddenPos, dilucData.hiddenDir, true)
    actorMgr:CreateActorWithPos(hoffmanData.Hoffman, hoffmanData.HoffmanScript, hoffmanData.HoffmanID, 0, hoffmanData.hiddenPos, hoffmanData.hiddenDir, true)
--[[     local paimon = actorMgr:GetActor("Paimon")
    if paimon ~= nil then
        paimon:DestroyWithDisappear(false)
    end ]]
end

--@endregion

function Quest464:Start()
end

function Quest464:OnDestroy()
end

return Quest464