local DailyNpcManager={}

local NpcEventTypeLua = require('Actor/Npc/NPCEventType')
local NpcModeType = require('Actor/Npc/NpcMode/NpcModeType')
local CfgMengdeDayPatrol = require('Actor/Npc/Config/CfgMengdeDayPatrol')
local CfgMengdeInsomniaPatrol = require('Actor/Npc/Config/CfgMengdeInsomniaPatrol')
local CfgMengdeDayStand = require('Actor/Npc/Config/CfgMengdeDayStand')
local CfgMengdeNightStand = require('Actor/Npc/Config/CfgMengdeNightStand')
local CfgMengdeNightSit = require('Actor/Npc/Config/CfgMengdeNightSit')
local CfgMengdeInsomniaStand = require('Actor/Npc/Config/CfgMengdeInsomniaStand')
local CfgMengdeDaySit = require('Actor/Npc/Config/CfgMengdeDaySit')

DailyNpcManager.NpcEventType = NpcEventTypeLua.DailyNpcEventType

--得到蒙德城所有NPC信息，返回值为一个table
DailyNpcManager.GetMengdeNpcList= function()
    local list={}
    for i=1, #CfgMengdeDayPatrol.DummyPointData.NpcID do
        table.insert(list,"MengdeDayPatrol" .. '_' .. tostring(i))
    end
    for i=1, #CfgMengdeInsomniaPatrol.DummyPointData.NpcID do
        table.insert(list,"MengdeInsomniaPatrol" .. '_' .. tostring(i))
    end
    for i=1, #CfgMengdeDayStand.DummyPointData.NpcID do        
        table.insert(list,"MengdeDayStand" .. '_' .. tostring(i))
    end
    for i=1, #CfgMengdeNightStand.DummyPointData.NpcID do
        table.insert(list,"MengdeNightStand" .. '_' .. tostring(i))
    end
    for i=1, #CfgMengdeNightSit.DummyPointData.NpcID do
        table.insert(list,"MengdeNightSit" .. '_' .. tostring(i))
    end
    for i=1, #CfgMengdeInsomniaStand.DummyPointData.NpcID do
        table.insert(list,"MengdeInsomniaStand" .. '_' .. tostring(i))
    end
    for i=1, #CfgMengdeDaySit.DummyPointData.NpcID do
        table.insert(list,"MengdeDaySit" .. '_' .. tostring(i))
    end
    return list
end

--得到蒙德城所有NPC信息（除去个别），返回值为一个table
DailyNpcManager.GetMengdeNpcListSpecial= function()
    local list={}
    for i=1, #CfgMengdeDayPatrol.DummyPointData.NpcID do
        table.insert(list,"MengdeDayPatrol" .. '_' .. tostring(i))
    end
    for i=1, #CfgMengdeInsomniaPatrol.DummyPointData.NpcID do        
            table.insert(list,"MengdeInsomniaPatrol" .. '_' .. tostring(i))        
    end
    for i=1, #CfgMengdeDayStand.DummyPointData.NpcID do        
        table.insert(list,"MengdeDayStand" .. '_' .. tostring(i))
    end
    for i=1, #CfgMengdeNightStand.DummyPointData.NpcID do
        table.insert(list,"MengdeNightStand" .. '_' .. tostring(i))
    end
    for i=1, #CfgMengdeNightSit.DummyPointData.NpcID do
        table.insert(list,"MengdeNightSit" .. '_' .. tostring(i))
    end
    for i=1, #CfgMengdeInsomniaStand.DummyPointData.NpcID do
        if i~=15 and i~=18 then
            table.insert(list,"MengdeInsomniaStand" .. '_' .. tostring(i))        
        end        
    end
    for i=1, #CfgMengdeDaySit.DummyPointData.NpcID do
        table.insert(list,"MengdeDaySit" .. '_' .. tostring(i))
    end
    return list
end



return DailyNpcManager