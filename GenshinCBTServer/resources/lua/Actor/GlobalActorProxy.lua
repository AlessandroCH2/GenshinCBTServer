----------------------
-- 这是Lua端GlobalActor，作为全局的代理，负责一些全局的调用。继承自BaseActorProxy
-- @classmod GlobalActorProxy
require('Actor/ActorCommon')
local baseActorProxy = require('Actor/BaseActorProxy')

local GlobalActorProxy = class("GlobalActorProxy", baseActorProxy)

GlobalActorProxy.actorType = ActorType.GLOBAL_ACTOR

local this = nil
local super = nil
local uActor = nil

function GlobalActorProxy:OnPreInit()
	this = self
	super = self.__super
end
function GlobalActorProxy:OnPostInit()
	uActor = self.uActor
end

function GlobalActorProxy:OnInit(alias)
	super:OnInit(alias)
	uActor = self:CreateUActor(alias)
	self.uActor = uActor

	self:Register()
end

--- 是否是白天
GlobalActorProxy.isDay = false
--- 是否是黑夜
GlobalActorProxy.isNight = false
--- 当前的天气类型 WeatherType
GlobalActorProxy.currWeather = 0

local function EnterDay()
	print("enter day")
	this.isDay = true
	this.isNight = false
end

local function EnterNight()
	print("enter night")
	this.isDay = false
	this.isNight = true
end

local function WeatherChange(weatherType)
	print("enter weather " .. weatherType)
	this.currWeather = weatherType
end

function GlobalActorProxy:CreateUActor(alias)
	local uActor = actorUtils.CreateActor(self, ActorType.GLOBAL_ACTOR, alias, self.metaPath)
	uActor = actorUtils.CreateGlobalActor(uActor)
	return uActor
end

function GlobalActorProxy:Register()
	this:RegisterDayCallback(EnterDay)
	this:RegisterNightCallback(EnterNight)
	this:RegisterWeatherCallback(WeatherChange)
end

function GlobalActorProxy:Destroy(isActorOnly)
	this:UnregisterDayCallback(EnterDay)
	this:UnregisterNightCallback(EnterNight)
	this:UnregisterWeatherCallback(WeatherChange)
	uActor:Destroy(isActorOnly)
end

--- GlobalActor昼夜相关方法
-- @section daynight

--- GlobalActor注册到白天了的回调
-- @tparam function dayCallback 到白天了的调用方法
function GlobalActorProxy:RegisterDayCallback(dayCallback)
	uActor:RegisterDayCallback(dayCallback)
end
--- GlobalActor取消注册到白天了的回调
-- @tparam function dayCallback 到白天了的调用方法
function GlobalActorProxy:UnregisterDayCallback(dayCallback)
	uActor:UnregisterDayCallback(dayCallback)
end
--- GlobalActor注册到晚上了的回调
-- @tparam function nightCallback 到晚上了的调用方法
function GlobalActorProxy:RegisterNightCallback(nightCallback)
	uActor:RegisterNightCallback(nightCallback)
end
--- GlobalActor取消注册到晚上了的回调
-- @tparam function nightCallback 到晚上了的调用方法
function GlobalActorProxy:UnregisterNightCallback(nightCallback)
	uActor:UnregisterNightCallback(nightCallback)
end
--- GlobalActor注册小时的回调
-- @tparam function hourCallback 小时回调
function GlobalActorProxy:RegisterHourCallback(hourCallback)
	uActor:RegisterHourCallback(hourCallback)
end
--- GlobalActor取消注册小时的回调
-- @tparam function nightCallback 小时回调
function GlobalActorProxy:UnregisterHourCallback(hourCallback)
	uActor:UnregisterHourCallback(hourCallback)
end

--- GlobalActor天气相关方法
-- @section weather

--- GlobalActor注册天气变化的回调
-- @tparam function weatherCallback 天气变化的回调，回调需接受一个WeathType类型的参数
function GlobalActorProxy:RegisterWeatherCallback(weatherCallback)
	uActor:RegisterWeatherCallback(weatherCallback)
end
--- GlobalActor取消注册天气变化的回调
-- @tparam function weatherCallback 天气变化的回调，回调需接受一个WeathType类型的参数
function GlobalActorProxy:UnregisterWeatherCallback(weatherCallback)
	uActor:UnregisterWeatherCallback(weatherCallback)
end
--- GlobalActor改变默认天气
-- @tparam string weatherName 天气配置的名字
function GlobalActorProxy:ChangeDefaultWeather(weatherName)
	uActor:ChangeDefaultWeahter(weatherName)
end
--- GlobalActor改变天气
-- @tparam string weatherName 天气配置的名字
function GlobalActorProxy:ChangeWeather(weatherName)
	uActor:ChangeWeather(weatherName)
end
--- GlobalActor恢复天气到服务器当前
function GlobalActorProxy:LeaveWeather()
	uActor:LeaveWeather()
end
--- GlobalActor获取当前是黑天还是白天
function GlobalActorProxy:GetIsNight()
	local isNight = uActor:GetIsNight()
	this.isDay = (not isNight)
	this.isNight = isNight
end

--- GlobalActor修改时间的函数
-- @tparam float daytime24 小时数
function GlobalActorProxy:ChangeDay24Time(daytime24, force)
	uActor:ChangeDay24Time(daytime24, force)
end

--- 开始某个引导
-- @tparam string name 引导的名称
function GlobalActorProxy:StartGuide(name)
	uActor:StartGuide(name)
end
--- 结束某个引导
-- @tparam string name 引导的名称
function GlobalActorProxy:EndGuide(name)
	uActor:EndGuide(name)
end

--- GlobalActor控制角色
-- @section avatar ctrl

--- 停止当前控制角色移动
function GlobalActorProxy:StopLocalAvatar()
	uActor:StopLocalAvatar()
end

--- 开始某个引导
-- @tparam string name 引导的名称
function GlobalActorProxy:LoadSectorByPos(pos, callbak)
	uActor:LoadSectorByPos(pos, callbak)
end

--- 设置当前角色坐标
-- @tparam Vector3 pos 
function GlobalActorProxy:SetAvatarPos(pos)
	actorUtils.SetAvatarPos(pos)
end

--- 设置当前角色欧拉角
-- @tparam Vector3 euler
function GlobalActorProxy:SetAvatarEuler(euler)
	actorUtils.SetAvatarEuler(euler)
end

--- 切换回主角
function GlobalActorProxy:ChangeToHero()
	uActor:ChangeToHero()
end

--- 判断是否是男的主角
function GlobalActorProxy:IsHeroMale()
	return uActor:IsHeroMale()
end

--- 控制全局task
-- @section task

--- 停止所有旁白
function GlobalActorProxy:FinishAllNarrator()
	uActor:FinishAllNarratorTask()
end

GlobalActorProxy.BtnTransmitData =
{
	btnTransId = 0,
	btnTransSceneId = 0,
	btnTransDummyPos = nil,
	btnTransDummyEuler = nil,
	btnTransRange = 0.0,
	btnTransPriority = 0
}

--- 弹出传送到任务的按钮
-- @tparam int id 用于区分不同的sub task
-- @tparam uint sceneId 点了以后传送到sceneId
-- @tparam string dummyPoint dummyPoint的名字
-- @tparam float range 触发按钮的范围
-- @tparam int priority 优先级
function GlobalActorProxy:PlayerBackButtonOn(id, sceneId, dummyPoint, range, priority)
	if priority == nil then
		priority = 0
	end

	local dummyPoint = sceneData:GetDummyPoint(sceneId, dummyPoint)
	if dummyPoint == nil then
		print("dummy point " .. dummyPoint .. " invalid")
		return
	end

	local dummyPos = dummyPoint.pos
	local dummyEuler = dummyPoint.rot

	local btnTransmitData = self.BtnTransmitData
	btnTransmitData.btnTransId = id
	btnTransmitData.btnTransSceneId = sceneId
	btnTransmitData.btnTransDummyPos = dummyPos
	btnTransmitData.btnTransDummyEuler = dummyEuler
	btnTransmitData.btnTransRange = range
	btnTransmitData.btnTransPriority = priority

	self.uActor:PlayerBackButtonOn(btnTransmitData)
end

--- 隐藏传送到任务的按钮
-- @tparam int id 用于区分不同的sub task
function GlobalActorProxy:PlayerBackButtonOff(id)
	local btnTransmitData = self.BtnTransmitData
	btnTransmitData.btnTransId = id

	self.uActor:PlayerBackButtonOff(btnTransmitData)
end

--- 进入一个副本
-- @tparam uint pointId 入口点id
-- @tparam uint dungeonId 副本id
function GlobalActorProxy:PlayerEnterDungeon(pointId, dungeonId)
	self.uActor:PlayerEnterDungeon(pointId, dungeonId)
end


function GlobalActorProxy:Start()
	this:GetIsNight()
end

return GlobalActorProxy