local util = require ('Base/util')

local cs_coroutine_runner = nil
if AutoTestObject ~= nil then
    cs_coroutine_runner = CS.UnityEngine.GameObject.Find("AutoTestObject"):GetComponent("AutoTestDriver")
end

if AutoTestObject == nil then
	cs_coroutine_runner = CS.UnityEngine.GameObject.Find("GameManager"):GetComponent("AutoTestDriver")
end

local function async_yield_return(to_yield, cb)
    print(to_yield)
    cs_coroutine_runner:YieldAndCallback(to_yield, cb)
end


return {
    yield_return = util.async_to_sync(async_yield_return)
}
