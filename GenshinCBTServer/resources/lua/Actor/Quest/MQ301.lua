require('Actor/ActorCommon')
local questActorProxy = require('Actor/Quest/QuestActorProxy')

local Quest301 = class("Quest301", questActorProxy)

Quest301.defaultAlias = "Quest301"

local this = nil
local super = nil
local uActor = nil
local questID = 0

function Quest301:OnPreInit()
	this = self
	super = self.__super
	questID = this.mainQuestID
	super:OnPreInit()
end
function Quest301:OnPostInit()
	uActor = self.uActor
	super:OnPostInit()
end

-- local config begin
local q301Cfg = require('Actor/Quest/Q301/Config/Q301Config')
local subIDs = q301Cfg.SubIDs
local wendyData = q301Cfg.WendyData
local gaiaData = q301Cfg.GaiaData
local robamData = q301Cfg.RobamData
local amborData = q301Cfg.AmborData
local extrasData = q301Cfg.ExtrasData
local monsterData = q301Cfg.MonsterData
local meiData = q301Cfg.MeiData
local testData = q301Cfg.TestData
-- local config end

function Quest301:CreateUActor(alias)
	local uActor = actorUtils.CreateActor(self, ActorType.QUEST_ACTOR, alias)
	uActor = actorUtils.CreateQuestActor(questID, uActor)
	return uActor
end

-- local param begin
-- local param end

-- local method begin
local function OnStart30100()
	--print("30101 start: show begin")
	local wendy = actorMgr:CreateActorWithPos(wendyData.Wendy, wendyData.WendyScript, wendyData.WendyID, 0, wendyData.bornPos, wendyData.bornDir, true, false)
	local robam = actorMgr:CreateActorWithPos(robamData.Robam, robamData.RobamScript, robamData.RobamID, 0, robamData.arguePos, robamData.argueDir, true, false)
	robam:UnregisterSelfDayTime(robam.StartDay)
	robam:UnregisterSelfNightTime(robam.StartNight)
	for i=1, #extrasData.ExtrasIDs do
		local extras = actorMgr:CreateActorWithPos(extrasData.Extras .. tostring(i), extrasData.ExtrasAudience, extrasData.ExtrasIDs[i], i, extrasData.ExtrasSeatPos[i], extrasData.ExtrasSeatDir[i], true, false)
		extras:UnregisterSelfDayTime(extras.StartDay)
		extras:UnregisterSelfNightTime(extras.StartNight)
		extras:UnregisterSelfWeatherChange(extras.OnWeather)
		-- extras.seatPos = extrasData.ExtrasSeatPos[i]
		-- extras.seatDir = extrasData.ExtrasSeatDir[i]
		-- extras.bornPos = extrasData.ExtrasOriginPos[i]
		-- extras.bornDir = extrasData.ExtrasOriginDir[i]
		-- extras.returnCallback = extrasData.ExtrasReturnCallback[i]
		-- extras.extrasIndex = i
	end
end
local function OnFinished30100()
	-- globalActor:StopLocalAvatar()
	-- this:PlayCutscene(q301Cfg.Mq1TimeCfg)
end

local function OnStart30101()
	--print("30101 start: show begin")
	local wendy = actorMgr:CreateActorWithPos(wendyData.Wendy, wendyData.WendyScript, wendyData.WendyID, 0, wendyData.bornPos, wendyData.bornDir, true, false)
	wendy:StartDance()
	wendy:CallDelay(10, wendy.FinishDance)
	-- local robam = actorMgr:CreateActorWithPos(robamData.Robam, robamData.RobamScript, robamData.RobamID, 0, robamData.arguePos, robamData.argueDir, true, false)
	-- robam:ShowStart()
	local ambor = actorMgr:CreateActorWithPos(amborData.Ambor, amborData.AmborScript, amborData.AmborID, 0, amborData.bornPos, amborData.bornDir, true, false)
	ambor:ShowStart()
	-- for i=1, #extrasData.ExtrasIDs do
	-- 	local extras = actorMgr:CreateActorWithPos(extrasData.Extras .. tostring(i), extrasData.ExtrasAudience, extrasData.ExtrasIDs[i], i, extrasData.ExtrasOriginPos[i], extrasData.ExtrasOriginDir[i], true, false)
	-- 	extras:ShowStart()
	-- 	-- extras.seatPos = extrasData.ExtrasSeatPos[i]
	-- 	-- extras.seatDir = extrasData.ExtrasSeatDir[i]
	-- 	-- extras.bornPos = extrasData.ExtrasOriginPos[i]
	-- 	-- extras.bornDir = extrasData.ExtrasOriginDir[i]
	-- 	-- extras.returnCallback = extrasData.ExtrasReturnCallback[i]
	-- 	-- extras.extrasIndex = i
	-- end
end

local function OnFinished30101()
	--print("30101 finish: show begin")
	for i=1, #extrasData.ExtrasIDs do
		local extras = actorMgr:GetActor(extrasData.Extras .. tostring(i))
		extras:StartDaily()
	end
end

local function OnStart30105()
	--print("30105 start: Wendy escape")
	local wendy = actorMgr:GetActor(wendyData.Wendy)
	wendy:Escape()
end

local function OnStart30107()
	--print("30107 start: Gaia appear")
	local gaia = actorMgr:CreateActorWithPos(gaiaData.Gaia, gaiaData.GaiaScript, gaiaData.GaiaID, 0, gaiaData.bornPos, gaiaData.bornDir, true, false)
	gaia:Show()
	-- globalActor:ChangeWeather ("Storm")	
end
local function OnStart30109()
	--print("30109 start: Gaia follow")
	local gaia = actorMgr:GetActor(gaiaData.Gaia)
	gaia:StartBeFollow1()
	local robam = actorMgr:GetActor(robamData.Robam)
	robam:StartDaily()
end
local function OnStart30111()
	--print("30111 start: Gaia follow")
	local gaia = actorMgr:GetActor(gaiaData.Gaia)
	gaia:StartBeFollow2()
end
local function OnStart30113()
	--print("30113 start: Gaia follow")
	local gaia = actorMgr:GetActor(gaiaData.Gaia)
	gaia:StartBeFollow5()
end
local function OnStart30115()
	--print("30115 start: Spawn Monsters")
	local avatarPos = actorUtils.GetAvatarPos()
	for i=1, #monsterData.MonsterIDs do
		local monsterID = monsterData.MonsterIDs[i]
		local xRand = math.random(-2, 2)
		local zRand = math.random(-2, 2)
		local bornPos = avatarPos
		bornPos.x = bornPos.x + xRand;
		bornPos.z = bornPos.z + zRand;
		this:SpawnMonster(monsterID, 1, bornPos)
	end
end
local function OnStart30117()
	--print("30117 start: Gaia follow")
	local gaia = actorMgr:GetActor(gaiaData.Gaia)
	gaia:StartBeFollow6()
end

local function OnRewind30101()
	print("30104 rewind: Show Start")
	local wendy = actorMgr:CreateActorWithPos(wendyData.Wendy, wendyData.WendyScript, wendyData.WendyID, 0, wendyData.bornPos, wendyData.bornDir, true, false)
	local robam = actorMgr:CreateActorWithPos(robamData.Robam, robamData.RobamScript, robamData.RobamID, 0, robamData.arguePos, robamData.argueDir, true, false)
	robam:UnregisterSelfDayTime(robam.StartDay)
	robam:UnregisterSelfNightTime(robam.StartNight)
	for i=1, #extrasData.ExtrasIDs do
		local extras = actorMgr:CreateActorWithPos(extrasData.Extras .. tostring(i), extrasData.ExtrasAudience, extrasData.ExtrasIDs[i], i, extrasData.ExtrasSeatPos[i], extrasData.ExtrasSeatDir[i], true, false)
		extras:UnregisterSelfDayTime(extras.StartDay)
		extras:UnregisterSelfNightTime(extras.StartNight)
		extras:UnregisterSelfWeatherChange(extras.OnWeather)
	end
end

local function OnRewind30104()
	print("30104 rewind: before Wendy run")
	actorMgr:CreateActorWithPos(wendyData.Wendy, wendyData.WendyScript, wendyData.WendyID, 0, wendyData.bornPos, wendyData.bornDir, true, false)
	actorMgr:CreateActorWithPos(robamData.Robam, robamData.RobamScript, robamData.RobamID, 0, robamData.arguePos, robamData.argueDir, true, false)
	actorMgr:CreateActorWithPos(amborData.Ambor, amborData.AmborScript, amborData.AmborID, 0, amborData.arguePos, amborData.argueDir, true,false)
end

local function OnRewind30108()
	print("30108 rewind: before follow Gaia")
	actorMgr:CreateActorWithPos(robamData.Robam, robamData.RobamScript, robamData.RobamID, 0, robamData.arguePos, robamData.argueDir, true, false)
	actorMgr:CreateActorWithPos(gaiaData.Gaia, gaiaData.GaiaScript, gaiaData.GaiaID, 0, gaiaData.showPos, gaiaData.showDir, true, false)
	-- globalActor:ChangeWeather ("Storm")
end
-- local method end
function Quest301:OnMainStart(quest)
end

function Quest301:OnSubStart(quest)
	--print("sub start 301 " .. tostring(quest.QuestId))
	local questID = quest.QuestId
	if questID == subIDs.q30101 then
		OnStart30101()
	elseif questID == subIDs.q30105 then
		OnStart30105()
	elseif questID == subIDs.q30107 then
		OnStart30107()
	elseif questID == subIDs.q30109 then
		OnStart30109()
	elseif questID == subIDs.q30111 then
		OnStart30111()
	elseif questID == subIDs.q30113 then
		OnStart30113()
	elseif questID == subIDs.q30115 then
		OnStart30115()
	elseif questID == subIDs.q30117 then
		OnStart30117()
	elseif questID == subIDs.q30119 then
		OnStart30119()
	elseif questID == subIDs.q30100 then
		OnStart30100()
	end
end

function Quest301:OnSubFinished(quest)
	--print("sub finished 31 " .. tostring(quest.QuestId))
	local questID = quest.QuestId
	if questID == subIDs.q30100 then
		OnFinished30100()
	elseif questID == subIDs.q30101 then
		OnFinished30101()
	end
end

function Quest301:OnRewind(quest)
	--print("sub rewind 301 " .. tostring(quest.QuestId))
	local questID = quest.QuestId
	if questID == subIDs.q30104 then
		OnRewind30104()
	elseif questID == subIDs.q30108 then
		OnRewind30108()
	elseif questID == subIDs.q30101 then
		OnRewind30101()
	end
end

function Quest301:OnMainFinished(quest)
	--print("main finished 301 " .. tostring(quest.QuestMainId))
end

function Quest301:Start()
	--print("here 301 quest start")
end

function Quest301:OnDestroy()
	-- local wendy = actorMgr:GetActor(wendyData.Wendy)
	-- if wendy ~= nil then
	-- 	wendy:Destroy(false)
	-- end
	-- local gaia = actorMgr:GetActor(gaiaData.Gaia)
	-- if gaia ~= nil then
	-- 	gaia:Destroy(false)
	-- end
	-- local robam = actorMgr:GetActor(robamData.Robam)
	-- if robam ~= nil then
	-- 	robam:Destroy(false)
	-- end
	-- local amber = actorMgr:GetActor(amborData.Ambor)
	-- if amber ~= nil then
	-- 	amber:Destroy(false)
	-- end
end

return Quest301