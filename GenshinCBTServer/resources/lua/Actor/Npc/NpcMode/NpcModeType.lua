local NpcModeType = 
{
--@region ModeType List
    --隐藏自身
    MODE_HIDE = 1,
    MODE_BANDAILY = 2,

--@endregion
}

NpcModeType.ModeScript =
{
    'Actor/Npc/NpcMode/NpcMode_MengdeHide',
    'Actor/Npc/NpcMode/NpcMode_BanDaily',
}

function NpcModeType:GetMode(modeType)
    local modeScript = self.ModeScript[modeType]
    if modeScript ~= nil then
        local mode = require(modeScript)
        return mode
    end
    return nil
end

return NpcModeType