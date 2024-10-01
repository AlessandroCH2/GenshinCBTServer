require('Actor/ActorCommon')
local cutsceneActorProxy = require('Actor/Cutscene/CutsceneActorProxy')

local CutsceneActor_Goddess1201 = class("CutsceneActor_Goddess1201", cutsceneActorProxy)

function CutsceneActor_Goddess1201:Start()
	print("spawn local monster for goddess 1201")
	self:SpawnLocalMonster("show101", 21010201, 1, M.Pos(2404, 206, -5385), 0, 0, 1.0)
	self:SpawnLocalMonster("show102", 21010201, 1, M.Pos(2406, 206, -5386), 0, 0, 1.0)
	self:SpawnLocalMonster("show103", 21010301, 1, M.Pos(2406, 206, -5388), 0, 0, 1.0)	
end

function CutsceneActor_Goddess1201:OnDestroy()
	print("unspawn local mosnter for goddess 1201")
	self:UnSpawn("show101")
	self:UnSpawn("show102")
	self:UnSpawn("show103")
end

return CutsceneActor_Goddess1201