local Console = {}
local loadstring_  = nil
if(loadstring) then
    loadstring_ = loadstring
else
    loadstring_ = load
end
socketMgr = singletonManager:GetSingletonInstance("MoleMole.SocketManager")

function Console:onSocketConnected()
    self.socketCR = nil
    socketMgr:SendString("connected\r\n>")
end

function Console:onSocketData(msg)
    if not self.socketCR then
        self.socketCR = coroutine.create(self.socketCrFunc)
    end
    ret, info = coroutine.resume(self.socketCR, msg)
    if not ret then
        socketMgr:SendString("onSocketData err " .. info)
    end
end

function Console.socketCrFunc(str)
    local syntaxErr = false
    local localindex = { }
    local locals = {}
    local printFmt = "print(inspect(%s, {['depth']=1}))"

    setmetatable(locals, {
        ["__index"] = localindex,
        ["__newindex"] = function(t, k, v)
            localindex[k] = v
        end,
        ["__mode"] = "kv"
    })

    setmetatable(localindex, {
        ["__index"] = setmetatable({}, {["__index"] = _G}),
        ["__mode"] = "kv"
    })

    localindex["__locals"] = locals
    localindex["inspect"] = require("Base/Inspect")

    while true do
        if #str > 1 and string.byte(str, 1, 2) == 61 then
            str = string.format(printFmt, string.sub(str, 2))
        end

        local ret, msg = loadstring_(str)

        if not ret then
            local modstr = string.format(printFmt, str)
            if loadstring_(modstr) then
                str = modstr
            else
                syntaxErr = true
                socketMgr:SendString(msg .. "\r\n")
            end
        end

        if not syntaxErr then
            local line = str .. [[
            local __debug_idx = 1
            while true do
                local name, value = debug.getlocal(1, __debug_idx)
                if not name then break end
                rawset(__locals, name, value)
                __debug_idx = __debug_idx + 1
            end
            ]]

            local oldPrint = _G["print"]
            local function traceback(msg)
                local msg = debug.traceback(msg, 1)
                Console.ConsolePrint(msg)
                return msg
            end

            rawset(_G, "print", Console.ConsolePrint)
            xpcall(function() xpcall(setfenv(loadstring_(line) , locals), traceback) end, traceback)
            rawset(_G, "print", oldPrint)
        end

        socketMgr:SendString(">")
        str = coroutine.yield()
        syntaxErr = false
    end
end

function Console.ConsolePrint(...)
    local outputStr = ""
    for k, v in ipairs({...}) do
        outputStr = outputStr .. tostring(v)
    end
    outputStr = string.gsub(outputStr, "\n", "\r\n")
    socketMgr:SendString(outputStr.."\r\n")
end

return Console