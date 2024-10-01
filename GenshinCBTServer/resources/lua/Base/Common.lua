inspect = require('Base/Inspect')
util = require('Base/util')
M = require('Base/uMath')

local common = {}
common.lua_manager = singletonManager:GetSingletonInstance("MoleMole.LuaManager")

local function async_immediate_return(obj, cb)
	common.lua_manager:ImmediateCallback(obj, cb)
end
common.do_immediate = util.async_to_sync(async_immediate_return)

local function async_yield_return(to_yield, cb)
	common.lua_manager:YieldCallback(to_yield, cb)
end
common.do_yield = util.async_to_sync(async_yield_return)

local function async_call(to_yield, cb)
	local co = common.lua_manager:CoroutineCall(to_yield, cb)
	return co
end
common.coroutine_call = async_call;

local function async_stop(coroutine)
	common.lua_manager:CoroutineStop(coroutine)
end
common.coroutine_stop = async_stop;

local function async_do_ldevent(ldevent, cb)
	common.lua_manager:StartLDEvent(ldevent, cb)
end
common.do_ldevent = util.async_to_sync(async_do_ldevent)

common.do_listen_ldEvent = function(ldevent, cb)
	common.lua_manager:StartLDEvent(ldevent, util.coroutine_call(cb))
end

--xlua.private_accessible(CS.MoleMole.EntityManager)

--print("common in common2 "..inspect(common).." "..common.entity_manager._entityMap:ToString().." "..tostring(common.entity_manager:GetEntity(0)))
return common