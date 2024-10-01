require('Actor/ActorCommon')
local questActorProxy = require('Actor/Quest/QuestActorProxy')

local Quest451 = class("Quest451", questActorProxy)

Quest451.defaultAlias = "Quest451"

local q451Cfg = require('Quest/Client/Q451ClientConfig')
local subIDs = q451Cfg.SubIDs
local paimonData = q451Cfg.PaimonData
local razorData = q451Cfg.RazorData


-- Generated
function Quest451:OnSubStartHandlerBuild()
    self.subStartHandlers = {}
    self.subStartHandlers["45101"] = self.OnSubStart45101
    self.subStartHandlers["45102"] = self.OnSubStart45102
    self.subStartHandlers["45103"] = self.OnSubStart45103
    self.subStartHandlers["45104"] = self.OnSubStart45104
end

function Quest451:OnSubFinishHandlerBuild()
    self.subFinishHandlers = {}
    self.subFinishHandlers["45101"] = self.OnSubFinish45101
    self.subFinishHandlers["45102"] = self.OnSubFinish45102
    self.subFinishHandlers["45103"] = self.OnSubFinish45103
    self.subFinishHandlers["45104"] = self.OnSubFinish45104
end

-- local param begin
-- local param end

-- local method begin
--@region sub start handlers
function Quest451:PaimonDis()
   local paimon = actorMgr:GetActor(paimonData.Alias)
    if paimon ~= nil then
        paimon:Destroy(false)
    end
end

function Quest451:PaimonDelay()
    self:CallDelay(3, self.PaimonDis)
end

function Quest451:OnSubStart45101(quest)
    -- self:NarratorOnlyTask(q451Cfg.NarratorFlow1)
end

function Quest451:OnSubStart45102(quest)
    print("45102 start:...")
    actorMgr:CreateActorWithPos(paimonData.Alias, paimonData.Script, paimonData.ID, 0, paimonData.BornPos, paimonData.BornDir, true, false)
end

function Quest451:OnSubStart45103(quest)
end

function Quest451:OnSubStart45104(quest)
    print("45104 start:...")
    self.uActor:AvatarPaimonAppear()
    actorMgr:CreateActorWithPos(razorData.Alias, razorData.Script, razorData.ID, 0, razorData.BornPos, razorData.BornDir, true, false)
end



--@endregion

--@region sub finish handlers
function Quest451:OnSubFinish45101(quest)
    print("OnFinished 45101")
end

function Quest451:OnSubFinish45102(quest)
    print("OnFinished 45102")
    self:ActionSafeCall(self.PaimonDelay)
end

function Quest451:OnSubFinish45103(quest)
    print("OnFinished 45103")
    self:NarratorOnlyTask(q451Cfg.NarratorFlow2)
end

function Quest451:OnSubFinish45104(quest)
    local razor = actorMgr:GetActor(razorData.Alias)
    if razor ~= nil then
        self:ActionSafeCall(
            function(self)
                razor:Destroy(false)
            end
        )
    end
end


--@endregion

function Quest451:Start()
end

function Quest451:OnDestroy()
end

return Quest451