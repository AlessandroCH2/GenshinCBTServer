require('Actor/ActorCommon')
local npcActorProxy = require('Actor/Npc/NpcActorProxy')

local SneakAdvAI = class("SneakAdvAI", npcActorProxy)

SneakAdvAI.defaultAlias = "SneakAdvAI"
SneakAdvAI.PatrolPosNum = 0
SneakAdvAI.PatrolPos = nil
SneakAdvAI.PatrolDir = nil
SneakAdvAI.PatrolNext = 1

local q424Cfg = require('Quest/Client/Q424ClientConfig')

function SneakAdvAI:StartPatrol()
    if self.uActor == nil then
        return
    end

    if self.PatrolPosNum == 1 then
        self:Standby()
        self:TurnTo(M.Euler2DirXZ(self.PatrolDir[1]))
    elseif self.PatrolPosNum > 1 then
        self.PatrolNext = self.PatrolNext + 1
        if self.PatrolNext > self.PatrolPosNum then
            self.PatrolNext = 1
        end
        self:WalkToTask(self.PatrolPos[self.PatrolNext], self.Behave)
    end
end

function SneakAdvAI:Behave()
    if self.uActor == nil then
        return
    end

    self:Standby()
    self:CallDelay(3, self.StartPatrol)
end

function SneakAdvAI:ReturnToPatrol()
    self:DoFreeStateTrigger()
    self:WalkToTask(self.PatrolPos[self.PatrolNext], self.StartPatrol)
end

function SneakAdvAI:Aware()
    self:ClearFollowTask()
    self:Standby()
    self:NarratorOnlyTask(q424Cfg.AwareReminder)
    local avatarPos = actorUtils.GetAvatarPos()
    local selfPos = self:GetPos()
    local TurnDir = { x = avatarPos.x-selfPos.x, y = avatarPos.y-selfPos.y, z = avatarPos.z-selfPos.z} 
    self:TurnTo(TurnDir)
    self:DoFreeStyle(1)
end

function SneakAdvAI:CheckLure()
    print("********************CheckLure")
    self:Standby()
    self:DoFreeStyle(3)
    self:CallDelay(6, self.ReturnToPatrol)
end

function SneakAdvAI:OnLure(task, info)
    if info.hasSound == true then
        print("********************MoveToLure")
        local selfPos = self:GetPos()
        local TurnDir = { x = info.soundPos.x-selfPos.x, y = info.soundPos.y-selfPos.y, z = info.soundPos.z-selfPos.z} 
        print("TurnDir")
        print(TurnDir.x)
        self:TurnTo(TurnDir)
        self:DoFreeStyle(0)
        self:CallDelay(3,
            function(self, task)
                self:Standby()
                self:DoFreeStateTrigger()
                self:WalkToTask(info.soundPos, self.CheckLure)
            end
        )
    end
end

function SneakAdvAI:Discover()
    print("********************Discover")
    self:Standby()
    self:DoFreeStateTrigger()
    self:NarratorOnlyTask(q424Cfg.DiscoverReminder)
    self:DoFreeStyle(2)
    local quest = actorMgr:GetActor(q424Cfg.ActorAlias)
    if quest ~= nil then
        print("Sneak Failed")
        quest:FinishQuestID(true, 42403)            
    end
    local targetPos = self:GetPos()
    self:EnterSceneLookCamera(targetPos, 0, 2, true)
end

function SneakAdvAI:Stun()
    print("********************Stun")
    self:DoFreeStyle(5)
    self:EnableAI(false)
    self:EnableInteraction(false)
    self:CallDelay(30,
        function(self, task)  
            self:EnableAI(true)
            self:EnableInteraction(true)
            self:DoFreeStateTrigger()
            self:Standby()
            self:ReturnToPatrol()
            -- local avatarPos = actorUtils.GetAvatarPos()
            -- self:RunToTask(avatarPos, self.CheckLure)
        end
    )
end

function SneakAdvAI:Start() 
    self:ThreatTask(self.Discover, self.Aware, self.ReturnToPatrol, self.OnLure)  
    self:StartPatrol()
end

return SneakAdvAI