local BaseMode = require('Actor/BaseActorMode')
local NpcEventType = require('Actor/Npc/NPCEventType')
local NpcMode_Hide = class("NpcMode_MengdeHide", BaseMode)

--@region Default
NpcMode_Hide.DefaultAction = function(self)
    self:RegisterActorEvent(self.OnEvent)
    self:StartDay()
end
--@endregion


NpcMode_Hide.OnEvent=function(actor,evt)
    if evt.evtType == NpcEventType.STARTDAILY then
        print("NpcMode_Hide STARTDAILY")
        actor:StartDaily()
    end
end

--@region PatrolInsomnia
NpcMode_Hide["MengdeDayPatrol_1"] = function(self)    
    self:RegisterActorEvent(self.OnEvent)    
end



return NpcMode_Hide