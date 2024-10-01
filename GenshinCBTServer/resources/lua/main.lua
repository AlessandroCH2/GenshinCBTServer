local breakSocketHandle, debugXpCall
if NG_HSOD_DEBUG then
	breakSocketHandle,debugXpCall = require("LuaDebug")("localhost",7003)
end
common = require('Base/Common')
require('Actor/ActorCommon')
console = nil
testGod = nil

console = require('Console')
if NG_HSOD_DEBUG then
	testGod = require('Actor/TestActorProxy')
end

main = {}
main.ModuleDic = {}

main.OnStart = function()
	print("On Main Started!")

	if NG_HSOD_DEBUG then
		testGod:Init()
	end
end

main.OnLevelLoad = function(self, sceneID)
	currSceneData = sceneData:LoadScene(sceneID)

	if NG_HSOD_DEBUG then
		testGod:OnSceneLoaded()
	end
end

main.OnRequire = function(self, moduleName)
	--print(moduleName)
	--actorMgr:CreateActor("test", moduleName)
end

main.OnClearLevel = function()
	actorMgr:DestroySoft()
end