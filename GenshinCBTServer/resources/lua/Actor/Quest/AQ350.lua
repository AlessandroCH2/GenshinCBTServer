require('Actor/ActorCommon')
local questActorProxy = require('Actor/Quest/QuestActorProxy')

local Quest350 = class("Quest350", questActorProxy)

Quest350.defaultAlias = "Quest350"

local q350Cfg = require('Quest/Client/Q350ClientConfig')

-- Generated
function Quest350:OnSubStartHandlerBuild()
    self.subStartHandlers = {}
	self.subStartHandlers["35001"] = self.OnSubStart35001
end

function Quest350:OnSubFinishHandlerBuild()
    self.subFinishHandlers = {}
	self.subFinishHandlers["35001"] = self.OnSubFinish35001
end

---sub start & finish 内调用的函数

--@region sub start & finish handlers
---按流程触发顺序
function Quest350:OnSubStart35001(quest)
    print("35001 Start : Creat Limit Region")
    local limitRegionGlobal = actorMgr:GetActor("LimitRegionGlobal")
    limitRegionGlobal:UseFreshmeatRegion()
    --actorMgr:RegisteSubGlobal("LimitRegionGlobal", "Actor/SubGlobal/LimitRegionGlobalActor")
end

function Quest350:OnSubFinish35001(quest)
    print("35001 Finish : Destroy Limit Region")
    self:ActionSafeCall(
        function(self)
            local regionActor = actorMgr:GetActorInternal("LimitRegionGlobal")
            if regionActor == nil then
               return
            end
            regionActor:FinishLimitRegion() 
            actorMgr:UnregisteSubGlobal("LimitRegionGlobal")
        end
    )
end

--@endregion

function Quest350:Start()
end

function Quest350:OnDestroy()
end

return Quest350