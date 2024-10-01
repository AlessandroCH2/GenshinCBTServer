local BaseMode = require('Actor/BaseActorMode')
local NpcEventType = require('Actor/Npc/NPCEventType')
local NpcMode_Hide = class("NpcMode_MengdeHide", BaseMode)

--@region Default
NpcMode_Hide.DefaultAction = function(self)
    self:PerformDither(false, 2, self.HideSelf)
    self:RegisterActorEvent(self.OnEvent)
end
--@endregion

--@region StoreKeeper01
NpcMode_Hide["StoreKeeper01"] = function(self)
    local scaredPos = sceneData:GetDummyPoint(3, "NPCScaredPoint05").pos
    self:DoAppear()
    self:SetPos(scaredPos)
    self:DoFreeStyle(362)
end
--@endregion

NpcMode_Hide.OnEvent=function(actor,evt)
    if evt.evtType == NpcEventType.STARTDAILY then
        print("NpcMode_Hide STARTDAILY")
        actor:StartDaily()
    end
end

--@region PatrolInsomnia
-- NpcMode_Hide["MengdeDayPatrol_1"] = function(self)
--     self:PerformDither(false, 2, self.HideSelf)
--     self:RegisterActorEvent(self.OnEvent)
-- end
-- NpcMode_Hide["MengdeDayPatrol_2"] = NpcMode_Hide["MengdeDayPatrol_1"]
-- NpcMode_Hide["MengdeDayPatrol_3"] = NpcMode_Hide["MengdeDayPatrol_1"]
-- NpcMode_Hide["MengdeDayPatrol_4"] = NpcMode_Hide["MengdeDayPatrol_1"]
-- NpcMode_Hide["MengdeDayPatrol_5"] = NpcMode_Hide["MengdeDayPatrol_1"]
-- NpcMode_Hide["MengdeDayStand_1"] = NpcMode_Hide["MengdeDayPatrol_1"]
-- NpcMode_Hide["MengdeDayStand_2"] = NpcMode_Hide["MengdeDayPatrol_1"]
-- NpcMode_Hide["MengdeDayStand_3"] = NpcMode_Hide["MengdeDayPatrol_1"]
-- NpcMode_Hide["MengdeDayStand_4"] = NpcMode_Hide["MengdeDayPatrol_1"]
-- NpcMode_Hide["MengdeDayStand_5"] = NpcMode_Hide["MengdeDayPatrol_1"]
-- NpcMode_Hide["MengdeDayStand_6"] = NpcMode_Hide["MengdeDayPatrol_1"]
-- NpcMode_Hide["MengdeDayStand_7"] = NpcMode_Hide["MengdeDayPatrol_1"]
-- NpcMode_Hide["MengdeDayStand_8"] = NpcMode_Hide["MengdeDayPatrol_1"]
-- NpcMode_Hide["MengdeDayStand_9"] = NpcMode_Hide["MengdeDayPatrol_1"]
-- NpcMode_Hide["MengdeDayStand_10"] = NpcMode_Hide["MengdeDayPatrol_1"]
-- NpcMode_Hide["MengdeInsomniaPatrol_1"] = NpcMode_Hide["MengdeDayPatrol_1"]
-- NpcMode_Hide["MengdeInsomniaPatrol_2"] = NpcMode_Hide["MengdeDayPatrol_1"]
-- NpcMode_Hide["MengdeInsomniaPatrol_3"] = NpcMode_Hide["MengdeDayPatrol_1"]
-- NpcMode_Hide["MengdeInsomniaPatrol_4"] = NpcMode_Hide["MengdeDayPatrol_1"]
-- NpcMode_Hide["MengdeInsomniaStand_1"] = NpcMode_Hide["MengdeDayPatrol_1"]
-- NpcMode_Hide["MengdeInsomniaStand_2"] = NpcMode_Hide["MengdeDayPatrol_1"]
-- NpcMode_Hide["MengdeInsomniaStand_3"] = NpcMode_Hide["MengdeDayPatrol_1"]
-- NpcMode_Hide["MengdeInsomniaStand_4"] = NpcMode_Hide["MengdeDayPatrol_1"]
-- NpcMode_Hide["MengdeInsomniaStand_5"] = NpcMode_Hide["MengdeDayPatrol_1"]
-- NpcMode_Hide["MengdeInsomniaStand_6"] = NpcMode_Hide["MengdeDayPatrol_1"]
-- NpcMode_Hide["MengdeInsomniaStand_7"] = NpcMode_Hide["MengdeDayPatrol_1"]
-- NpcMode_Hide["MengdeInsomniaStand_8"] = NpcMode_Hide["MengdeDayPatrol_1"]
-- NpcMode_Hide["MengdeInsomniaStand_9"] = NpcMode_Hide["MengdeDayPatrol_1"]
-- NpcMode_Hide["MengdeInsomniaStand_10"] = NpcMode_Hide["MengdeDayPatrol_1"]
-- NpcMode_Hide["MengdeInsomniaStand_11"] = NpcMode_Hide["MengdeDayPatrol_1"]
-- NpcMode_Hide["MengdeInsomniaStand_12"] = NpcMode_Hide["MengdeDayPatrol_1"]
-- NpcMode_Hide["MengdeInsomniaStand_13"] = NpcMode_Hide["MengdeDayPatrol_1"]
-- NpcMode_Hide["MengdeInsomniaStand_14"] = NpcMode_Hide["MengdeDayPatrol_1"]
-- NpcMode_Hide["MengdeInsomniaStand_15"] = NpcMode_Hide["MengdeDayPatrol_1"]
-- NpcMode_Hide["MengdeInsomniaStand_16"] = NpcMode_Hide["MengdeDayPatrol_1"]
-- NpcMode_Hide["MengdeInsomniaStand_17"] = NpcMode_Hide["MengdeDayPatrol_1"]
-- NpcMode_Hide["MengdeNightSit_1"] = NpcMode_Hide["MengdeDayPatrol_1"]
-- NpcMode_Hide["MengdeNightSit_2"] = NpcMode_Hide["MengdeDayPatrol_1"]
-- NpcMode_Hide["MengdeNightSit_3"] = NpcMode_Hide["MengdeDayPatrol_1"]
-- NpcMode_Hide["MengdeNightStand_1"] = NpcMode_Hide["MengdeDayPatrol_1"]
-- NpcMode_Hide["MengdeNightStand_2"] = NpcMode_Hide["MengdeDayPatrol_1"]
-- NpcMode_Hide["MengdeNightStand_3"] = NpcMode_Hide["MengdeDayPatrol_1"]
-- NpcMode_Hide["MengdeDaySit_1"] = NpcMode_Hide["MengdeDayPatrol_1"]
-- NpcMode_Hide["MengdeDaySit_2"] = NpcMode_Hide["MengdeDayPatrol_1"]
--@endregion

return NpcMode_Hide