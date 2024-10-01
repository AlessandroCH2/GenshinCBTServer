require('Actor/ActorCommon')
local questActorProxy = require('Actor/Quest/QuestActorProxy')

local Quest394 = class("Quest394", questActorProxy)

Quest394.defaultAlias = "Quest394"

local q394Cfg = require('Quest/Client/Q394ClientConfig')
local wendyData = q394Cfg.WendyData
local bbrData = q394Cfg.BarbaraData
local qinData = q394Cfg.QinData

-- Generated
function Quest394:OnSubStartHandlerBuild()
    self.subStartHandlers = {}
    self.subStartHandlers["39401"] = self.OnSubStart39401
    self.subStartHandlers["39402"] = self.OnSubStart39402
    self.subStartHandlers["39403"] = self.OnSubStart39403
end

function Quest394:OnSubFinishHandlerBuild()
    self.subFinishHandlers = {}
    self.subFinishHandlers["39401"] = self.OnSubFinish39401
    self.subFinishHandlers["39402"] = self.OnSubFinish39402
    self.subFinishHandlers["39403"] = self.OnSubFinish39403
end

-- local param begin
--@region sub start handlers
function Quest394:On39403CutSceneFinish()
    local quest = actorMgr:GetActor(q394Cfg.ActorAlias)
    if quest ~= nil then
        quest:FinishQuest(false, nil)
    end

    self:CallDelay(5,
        function(self)
            self:TransmitPlayer(3, sceneData:GetDummyPoint(3,"Q39601TransPos").pos, sceneData:GetDummyPoint(3,"Q39601TransPos").rot,
            function (self)
                globalActor:ChangeWeather ("ClearSky")
                actorMgr:CreateActorWithPos(wendyData.Wendy, wendyData.WendyScript, wendyData.WendyID, 0, wendyData.bornPos, wendyData.bornDir, true, false, 1008)
                actorMgr:CreateActorWithPos(bbrData.Barbara, bbrData.BarbaraScript, bbrData.BarbaraID, 0, bbrData.bornPos, bbrData.bornDir, true, false, 1008)
                actorMgr:CreateActorWithPos(qinData.Qin, qinData.QinScript, qinData.QinID, 0, qinData.bornPos, qinData.bornDir, true, false, 1008)
            end
            )
        end
    )
end
--@endregion
-- local param end

---sub start & finish 内调用的函数
-- end

-- local method begin
--@region sub start handlers
function Quest394:OnSubStart39401(quest)
    print("39401 start ")
end

function Quest394:OnSubStart39402(quest)
    print("39402 start:...")
end

function Quest394:OnSubStart39403(quest)
    print("39403 start:...")
    self:CallDelay(7,
    function (self)
        self:ShowBlackScreen(0.5, 1, 0.5,
        function (self)
            self:TryPlayVideo("Cs_MDAQ071_Davalin.mp4", 300005, true, self.On39403CutSceneFinish)
        end
        )
    end
    )
end
--@endregion

--@region sub finish handlers
function Quest394:OnSubFinish39401(quest)
    print("OnFinished 39401")
end

function Quest394:OnSubFinish39402(quest)
    print("OnFinished 39402")
end

function Quest394:OnSubFinish39403(quest)
    print("OnFinished 39403")
end
--@endregion

function Quest394:Start()
end

function Quest394:OnDestroy()
end

return Quest394