require('Actor/ActorCommon')
local cutsceneActorProxy = require('Actor/Cutscene/CutsceneActorProxy')

local TestCutsceneActor = class("TestCutsceneActor", cutsceneActorProxy)

function TestCutsceneActor:Start()
	print("***********************************")
	self:SpawnLocalMonster("show102", 21010301, 1, M.Pos(371.25, 205.46, -258.35), 0, 0, 1.0)
end

function TestCutsceneActor:OnDestroy()
	print("###################################")
	self:UnSpawn("show102")
end

return TestCutsceneActor