require('Actor/ActorCommon')
local questActorProxy = require('Actor/Quest/QuestActorProxy')

local Quest374 = class("Quest374", questActorProxy)

Quest374.defaultAlias = "Quest374"

local q374Cfg = require('Quest/Client/Q374ClientConfig')
local subIDs = q374Cfg.SubIDs
local paimonData = q374Cfg.PaimonData
local wendyData = q374Cfg.WendyData
local maidData = q374Cfg.MaidData
local guardData = q374Cfg.GuardData


-- Generated
function Quest374:OnSubStartHandlerBuild()
    self.subStartHandlers = {}
    self.subStartHandlers["37401"] = self.OnSubStart37401
    self.subStartHandlers["37402"] = self.OnSubStart37402
    self.subStartHandlers["37403"] = self.OnSubStart37403    
    self.subStartHandlers["37404"] = self.OnSubStart37404 
    self.subStartHandlers["37405"] = self.OnSubStart37405 
    self.subStartHandlers["37406"] = self.OnSubStart37406         
end

function Quest374:OnSubFinishHandlerBuild()
    self.subFinishHandlers = {}
    self.subFinishHandlers["37401"] = self.OnSubFinish37401
    self.subFinishHandlers["37402"] = self.OnSubFinish37402
    self.subFinishHandlers["37403"] = self.OnSubFinish37403
    self.subFinishHandlers["37404"] = self.OnSubFinish37404
    self.subFinishHandlers["37405"] = self.OnSubFinish37405
    self.subFinishHandlers["37406"] = self.OnSubFinish37406
end

-- local param begin
-- local param end

-- local method begin
--@region sub start handlers


function Quest374:OnSubStart37401(quest)  
    print("37401 start ")
    actorMgr:CreateActorWithPos(guardData.Guard, guardData.GuardScript, guardData.GuardID, 0, guardData.bornPos, guardData.bornDir, true, true,1008)    
    actorMgr:CreateActorWithPos(maidData.Maid, maidData.MaidScript, maidData.MaidID, 0, maidData.bornPos1, maidData.bornDir1, true, false,1008)
    actorMgr:CreateActorWithPos(wendyData.Wendy, wendyData.WendyScript, wendyData.WendyID, 0, wendyData.bornPos2, wendyData.bornDir2, true, false,1008) 
    -- wendy:ClearFollowTask()
    -- wendy:RunToTask(wendyData.bornPos2,
    --     function(wendy, task)
	-- 		local quest = actorMgr:GetActor(q374Cfg.ActorAlias)
	-- 		if quest ~= nil then
	-- 			quest:FinishQuest(false, nil)
    --         end
    --         wendy:Standby()
	-- 		wendy:TurnTo(M.Euler2DirXZ(wendyData.bornDir2))
    --     end
    -- )

end

function Quest374:OnSubStart37402(quest)
    print("37402 start:...")
    -- actorMgr:CreateActorWithPos(paimonData.Paimon, paimonData.PaimonScript, paimonData.PaimonID, 0, paimonData.bornPos1, paimonData.bornDir1, true, false,1008)
end

function Quest374:OnSubStart37403(quest)
    print("37403 start:...")
    local maid = actorMgr:GetActor(maidData.Maid)
    if maid ~= nil then
        maid:ClearFollowTask()
        maid:WalkToTask(maidData.bornPos2,
            function(maid, task)
                local quest = actorMgr:GetActor(q374Cfg.ActorAlias)
                if quest ~= nil then
                    quest:FinishQuest(false, nil)
                end
                maid:Standby()
                maid:TurnTo(M.Euler2DirXZ(maidData.bornDir2))
            end
        )
    end

    self:ActionSafeCall(
        function(self)
            local paimon = actorMgr:GetActor("Paimon")
            if paimon ~= nil then
                paimon:DestroyWithDisappear(false)
            end
        end
    )
end

function Quest374:OnSubStart37404(quest)
    print("37404 start:...")
end

function Quest374:OnSubStart37405(quest)
    print("37405 start:...")
    local quest = actorMgr:GetActor(q374Cfg.ActorAlias)
    if quest ~= nil then
        quest:FinishQuest(false, nil)
    end
end

function Quest374:OnSubStart37406(quest)
    print("37406 start:...")
    -- actorMgr:CreateActorWithPos(paimonData.Paimon, paimonData.PaimonScript, paimonData.PaimonID, 0, paimonData.bornPos2, paimonData.bornDir2, true, false,1008)
    local wendy = actorMgr:GetActor(wendyData.Wendy)
    wendy:Standby()
	wendy:TurnTo(M.Euler2DirXZ(paimonData.bornDir1))
end

--@endregion

--@region sub finish handlers
function Quest374:OnSubFinish37401(quest)
    print("OnFinished 37401")
end

function Quest374:OnSubFinish37402(quest)
    print("OnFinished 37402")
end

function Quest374:OnSubFinish37403(quest)
    print("OnFinished 37403")
end

function Quest374:OnSubFinish37404(quest)
    print("OnFinished 37404")
end

function Quest374:OnSubFinish37405(quest)
    print("OnFinished 37405")
end

function Quest374:OnSubFinish37406(quest)
    print("OnFinished 37406")
    self:ActionSafeCall(
        function(self)
            local paimon = actorMgr:GetActor("Paimon")
            if paimon ~= nil then
                paimon:DestroyWithDisappear(false)
            end
        end
    )
    -- self:ActionSafeCall(
    --     function(self)
    --         local maid = actorMgr:GetActor(maidData.Maid)
    --         if maid ~= nil then
    --             maid:ClearFollowTask()
    --             maid:WalkToTask(maidData.missPos,
    --                 function(maid, task)
    --                     maid:Destroy(false)
    --                 end
    --             )
    --         end  
    --     end
    -- )


end

--@endregion

function Quest374:Start()
end

function Quest374:OnDestroy()
end

return Quest374