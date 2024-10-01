----------------------
-- 这是Lua端SubGlobalActorProxy的基类，包含了注册全局回调的方法。继承自BaseActorProxy
-- @classmod SubGlobalActorProxy
require('Actor/ActorCommon')
local baseActorProxy = require('Actor/BaseActorProxy')

local SubGlobalActorProxy = class("SubGlobalActorProxy", baseActorProxy)

SubGlobalActorProxy.actorType = ActorType.SUB_GLOBAL_ACTOR

--- SubGlobalActorProxy alias
SubGlobalActorProxy.defaultAlias = "SubGlobal"

local super = nil

function SubGlobalActorProxy:OnPreInit()
	super = self.__super
	super:OnPreInit()
end

function SubGlobalActorProxy:OnInit(alias)
	super:OnInit(alias)
	self.uActor = self:CreateUActor(alias)
end

function SubGlobalActorProxy:OnPostInit()
	self:Register()
end

function SubGlobalActorProxy:OnDestroy()
	self:Unregister()
end

--- SubGlobalActorProxy
function SubGlobalActorProxy:CreateLimitRegion(name)
	return self.uActor:CreateLimitRegion(name)
end

--- SubGlobalActorProxy
function SubGlobalActorProxy:DestroyLimitRegion(name)
	self.uActor:DestroyLimitRegion(name)
end

--- SubGlobalActorProxy检查是否有超出区域
function SubGlobalActorProxy:CheckNeedTrans(pos, offset)
	return self.uActor:CheckNeedTrans(pos, offset)
end

--- SubGlobalActorProxy检查是否有超出区域
function SubGlobalActorProxy:GetLimitRegionDis(pos, offset)
	return self.uActor:GetLimitRegionDis(pos, offset)
end

function SubGlobalActorProxy:CreateUActor(alias)
	local uActor = actorUtils.CreateActor(self, ActorType.SUB_GLOBAL_ACTOR, alias, self.metaPath)
	uActor = actorUtils.CreateGlobalActor(uActor)
	return uActor
end

function SubGlobalActorProxy:Register()

end

function SubGlobalActorProxy:Unregister()
	
end

--- SubGlobalActor昼夜相关方法
-- @section daynight

--- SubGlobalActor注册到白天了的回调
-- @tparam function dayCallback 到白天了的调用方法
function SubGlobalActorProxy:RegisterDayCallback(dayCallback)
	self.uActor:RegisterDayCallback(dayCallback)
end
--- SubGlobalActor取消注册到白天了的回调
-- @tparam function dayCallback 到白天了的调用方法
function SubGlobalActorProxy:UnregisterDayCallback(dayCallback)
	self.uActor:UnregisterDayCallback(dayCallback)
end
--- SubGlobalActor注册到晚上了的回调
-- @tparam function nightCallback 到晚上了的调用方法
function SubGlobalActorProxy:RegisterNightCallback(nightCallback)
	self.uActor:RegisterNightCallback(nightCallback)
end
--- SubGlobalActor取消注册到晚上了的回调
-- @tparam function nightCallback 到晚上了的调用方法
function SubGlobalActorProxy:UnregisterNightCallback(nightCallback)
	self.uActor:UnregisterNightCallback(nightCallback)
end
--- SubGlobalActor注册小时的回调
-- @tparam function hourCallback 小时回调
function SubGlobalActorProxy:RegisterHourCallback(hourCallback)
	self.uActor:RegisterHourCallback(hourCallback)
end
--- SubGlobalActor取消注册小时的回调
-- @tparam function nightCallback 小时回调
function SubGlobalActorProxy:UnregisterHourCallback(hourCallback)
	self.uActor:UnregisterHourCallback(hourCallback)
end

--- SubGlobalActor天气相关方法
-- @section weather

--- SubGlobalActor注册天气变化的回调
-- @tparam function weatherCallback 天气变化的回调，回调需接受一个WeathType类型的参数
function SubGlobalActorProxy:RegisterWeatherCallback(weatherCallback)
	self.uActor:RegisterWeatherCallback(weatherCallback)
end
--- SubGlobalActor取消注册天气变化的回调
-- @tparam function weatherCallback 天气变化的回调，回调需接受一个WeathType类型的参数
function SubGlobalActorProxy:UnregisterWeatherCallback(weatherCallback)
	self.uActor:UnregisterWeatherCallback(weatherCallback)
end
--- SubGlobalActor改变天气
-- @tparam string weatherName 天气配置的名字
function SubGlobalActorProxy:ChangeWeather(weatherName)
	self.uActor:ChangeWeather(weatherName)
end
--- SubGlobalActor恢复天气到服务器当前
function SubGlobalActorProxy:LeaveWeather()
	self.uActor:LeaveWeather()
end

return SubGlobalActorProxy