require('Actor/ActorCommon')
local npcActorProxy = require('Actor/Npc/NpcActorProxy')

local Guard = class("Guard", npcActorProxy)

Guard.defaultAlias = "Guard"

local GuardData =
{
	StayPos = sceneData:GetDummyPoint(1008, "Q374Guard").pos,
	StayDir = sceneData:GetDummyPoint(1008, "Q374Guard").rot,
	DisPos = sceneData:GetDummyPoint(1008, "Q374GuardDis").pos,
	DisDir = sceneData:GetDummyPoint(1008, "Q374GuardDis").rot,
	AprPos = sceneData:GetDummyPoint(1008, "Q374GuardApr").pos,
	AprDir = sceneData:GetDummyPoint(1008, "Q374GuardApr").rot,
}

function Guard:Start()
	self:StartDaily()
end

function Guard:StartDaily()    
    self:BornOnce()
    self:RegisterSelfHour(self.HourBehave)
    print("Guard StartDaily")
	-- self:RegisterSelfDayTime(self.StartDay)
    -- self:RegisterSelfNightTime(self.StartNight)
	-- if globalActor.isDay then
	-- 	self:StartDay()
	-- else
	-- 	self:StartNight()
	-- end
end

function Guard:BornOnce()
    local mHour = self:GetLevelTime()
    print("Now Time is", mHour)
    if mHour >= 5.985 and mHour < 17.985 then
        self:StartDayNow()
    else 
        self:StartNightNow()
    end
end



function Guard:StartDay()
	self:ClearFollowTask()
	self:ShowSelf()
	-- self:TurnTo(M.Euler2DirXZ(GuardData.AprDir))
	self:PerformDither(true, 0.1, self.GoWork)
end

function Guard:GoWork()
        self:WalkToTask(GuardData.StayPos,
        function(Guard, task)
            self:Standby()
            self:TurnTo(M.Euler2DirXZ(GuardData.StayDir))
            print("GoWork")
        end
     )
end
--=======
function Guard:StartNight()
	self:ClearFollowTask()
    self:GoHome()  
end

function Guard:GoHome()
    self:WalkToTask(GuardData.DisPos,
    function(Guard, task)
        self:Standby()
        self:TurnTo(M.Euler2DirXZ(GuardData.DisDir))
        self:PerformDither(false, 0.1, self.HideSelf)
        print("GoHome")
    end
)
end
--========
function Guard:HourBehave(Hour)
    print("Each Time is", Hour)
    if Hour == 6 then
        self:StartDay()
        print("StartDay")    
    elseif Hour == 18 then
        self:StartNight()
        print("StartNight")  
    end
end

function Guard:StartNightNow()
	self:ClearFollowTask()
    self:PerformDither(false, 0.1, self.HideSelf)
    print("StartNightNow")
end

function Guard:StartDayNow()
    self:Standby()
    self:TurnTo(M.Euler2DirXZ(GuardData.StayDir))
    print("StartDayNow")
end

return Guard