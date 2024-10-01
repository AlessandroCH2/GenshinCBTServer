---Actor全局通用参数
-- @module ActorCommon
common = common or require('Base/Common')
require('Config/DefineCommon')

sceneData = sceneData or require('Base/SceneData')
currSceneData = nil

actorData = actorData or require('Actor/ActorData')

actorMgr = actorMgr or require('Actor/ActorManager')

actorUtils = CS.MoleMole.ActorUtils

luaTaskUtils = CS.MoleMole.LuaTaskUtils

curtainUtils = CS.MoleMole.CurtainUtils

campHelper = CS.MoleMole.CampHelper

gadgetFactory = gadgetFactory or require('Actor/Gadget/GadgetFactory')

globalActor = nil

globalCfg = globalCfg or require('Actor/GlobalActorConfig')

npcMode = npcMode or require('Actor/Npc/NpcMode/NpcModeType')
