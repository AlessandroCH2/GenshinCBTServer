----------------------
-- 这是Lua端ActorMode的基类，包含了一些Actor在特殊情况下的模式定义.
-- @classmod BaseActorMode
require('Base/Class')

local BaseActorMode = class("BaseActorMode", nil)

--- 切换Mode
function BaseActorMode:SwitchMode(alias)
    local actor = actorMgr:GetActorInternal(alias)
    if actor == nil then
        return
    end

    local modeFunc = self[alias]
    if modeFunc == nil then
        return
    end

    modeFunc(actor)
end

return BaseActorMode