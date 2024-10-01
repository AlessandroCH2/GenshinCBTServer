--baseClass提供基础接口
local baseClass = require('UAuto/TestCases/Number/NumberBase')
--所有testcase继承baseClass
local UAutoLuaTestCase = class("AvatarReliquaryTest",baseClass)
local self = UAutoLuaTestCase
self.TestFixture = "AvatarReliquaryTest"
self.Category = "数值"
self.Description="圣遗物升级角色数值验证"


local avatarLevel=90
local avatarPromoteLevel = 4
local step=2

--装备id列表  --沙，羽，冠，花，杯
--绿装+1， 蓝装+2，紫装+3，橙装+4。
--2阶+100，3阶+200，4阶+300。
local ReliquaryList_base = {51100,51110,51120,51130,51140} 
--生命套装 +0
--攻击套装+1000
--防御套装+2000
--强击套装+3000
--激怒套装+4000
--制裁套装+5000
--护佑套装+6000
--稳固套装+7000
--吸血套装+8000
--反击套装+9000
--颂歌套装+10000
--热血套装+11000
--激昂套装+12000
--暴走套装+13000
--治愈套装+14000


--天空套装id列表 --沙，羽，冠，花，杯
--只有5阶，绿装+1， 蓝装+2，紫装+3，橙装+4。
local ReliquaryList_sky = {97400,97410,97420,97430,97440}



function self:CheckReliqueryInRange(idAppend)
    local levelMax = 10
    local upLevelStep = 3
    
    for i = 1, #ReliquaryList_base do  
        local id = ReliquaryList_base[i] + idAppend
        yield_return(CS.UnityEngine.WaitForEndOfFrame())
        for level=1,levelMax,upLevelStep do
            yield_return(CS.UnityEngine.WaitForSeconds(1))
            self.base:SetUpEquipedReliquery()
            local combatPropertyBefore = self.base:GetEntityCombatProperty()
            local rank = math.random(0,4)
            local breakLevel = math.random(0,3)
            yield_return(CS.UnityEngine.WaitForSeconds(1))
            yield_return(self.base:RunGM("equip add "..tostring(id+rank) .." ".. level .. " "..breakLevel))
            yield_return(CS.UnityEngine.WaitForSeconds(1))
            self.base:CheckAvatarReliqueryProp(combatPropertyBefore,i-1)
        end
    end
end



self.ReliquaryLife = {
	Order = 1,
	Type = CaseType.MonoTest,
	Description="生命套，白，绿，蓝，紫，橙升级突破数值（随机抽查）验证测试",
    Action = UAutoCoroutine(function()
        --yield_return(self:FinishAllNoob())
		yield_return(self:ChangeAvatar("Ayaka"))
		yield_return(self.base:RunGM("Player Level 70"))
		yield_return(self.base:RunGM("break "..avatarPromoteLevel))
		yield_return(self.base:RunGM("level "..avatarLevel))
        yield_return(self.base:RunGM("equip add 10011 90 4"))
        local baseHP = self.base:GetFloatPropertyValue("maxHP")
        self.base:SetAvatarHpBase(baseHP)
        yield_return(CS.UnityEngine.WaitForSeconds(1))
        self:CheckReliqueryInRange(0)


	end)
}




-- self.ReliquaryAttack = {
-- 	Order = 2,
-- 	Type = CaseType.MonoTest,
-- 	Description="攻击套，白，绿，蓝，紫，橙升级突破数值（随机抽查）验证测试",
--     Action = UAutoCoroutine(function()
--         self:CheckReliqueryInRange(1000)
-- 	end)
-- }

-- self.ReliquaryDefense = {
-- 	Order = 3,
-- 	Type = CaseType.MonoTest,
-- 	Description="防御套，白，绿，蓝，紫，橙升级突破数值（随机抽查）验证测试",
--     Action = UAutoCoroutine(function()
--         self:CheckReliqueryInRange(2000)
-- 	end)
-- }


-- self.ReliquaryCritical = {
-- 	Order = 4,
-- 	Type = CaseType.MonoTest,
-- 	Description="强击套，白，绿，蓝，紫，橙升级突破数值（随机抽查）验证测试",
--     Action = UAutoCoroutine(function()
--         self:CheckReliqueryInRange(3000)
-- 	end)
-- }


-- self.ReliquaryCriticalHurt = {
-- 	Order = 5,
-- 	Type = CaseType.MonoTest,
-- 	Description="激怒套，白，绿，蓝，紫，橙升级突破数值（随机抽查）验证测试",
--     Action = UAutoCoroutine(function()
--         self:CheckReliqueryInRange(4000)
-- 	end)
-- }

-- self.ReliquaryAddHurt = {
-- 	Order = 6,
-- 	Type = CaseType.MonoTest,
-- 	Description="制裁套，白，绿，蓝，紫，橙升级突破数值（随机抽查）验证测试",
--     Action = UAutoCoroutine(function()
--         self:CheckReliqueryInRange(5000)
--     end)
-- }

-- self.ReliquaryMinusHurt = {
-- 	Order = 7,
-- 	Type = CaseType.MonoTest,
-- 	Description="护佑套，白，绿，蓝，紫，橙升级突破数值（随机抽查）验证测试",
--     Action = UAutoCoroutine(function()
--         self:CheckReliqueryInRange(6000)
--     end)
-- }


-- self.ReliquaryANTI_CRITICAL = {
-- 	Order = 7,
-- 	Type = CaseType.MonoTest,
-- 	Description="稳固套，白，绿，蓝，紫，橙升级突破数值（随机抽查）验证测试",
--     Action = UAutoCoroutine(function()
--         self:CheckReliqueryInRange(7000)
-- 	end)
-- }






-- self.ReliquarySong = {
-- 	Order = 10,
-- 	Type = CaseType.MonoTest,
-- 	Description="颂歌套，白，绿，蓝，紫，橙升级突破数值（随机抽查）验证测试",
--     Action = UAutoCoroutine(function()
--         self:CheckReliqueryInRange(10000)
-- 	end)
-- }




-- self.ReliquaryRexue = {
-- 	Order = 11,
-- 	Type = CaseType.MonoTest,
-- 	Description="热血套，白，绿，蓝，紫，橙升级突破数值（随机抽查）验证测试",
--     Action = UAutoCoroutine(function()
--         self:CheckReliqueryInRange(11000)
-- 	end)
-- }


-- self.ReliquaryJiHang = {
-- 	Order = 12,
-- 	Type = CaseType.MonoTest,
-- 	Description="激昂套，白，绿，蓝，紫，橙升级突破数值（随机抽查）验证测试",
--     Action = UAutoCoroutine(function()
--         self:CheckReliqueryInRange(12000)
-- 	end)
-- }


-- self.ReliquaryBaozou = {
-- 	Order = 13,
-- 	Type = CaseType.MonoTest,
-- 	Description="暴走套，白，绿，蓝，紫，橙升级突破数值（随机抽查）验证测试",
--     Action = UAutoCoroutine(function()
--         self:CheckReliqueryInRange(13000)
-- 	end)
-- }


-- self.ReliquaryHeal = {
-- 	Order = 14,
-- 	Type = CaseType.MonoTest,
-- 	Description="治愈套，白，绿，蓝，紫，橙升级突破数值（随机抽查）验证测试",
--     Action = UAutoCoroutine(function()
--         self:CheckReliqueryInRange(14000)
--     end)
-- }


-- self.ReliquarySky = {
-- 	Order = 15,
-- 	Type = CaseType.MonoTest,
-- 	Description="天空套，白，绿，蓝，紫，橙升级突破数值（随机抽查）验证测试",
--     Action = UAutoCoroutine(function()
--         local levelMax = 10
--         local upLevelStep = 3
        
--         for i = 1, #ReliquaryList_sky do  
--             local id = ReliquaryList_sky[i]
--             yield_return(CS.UnityEngine.WaitForEndOfFrame())
--             for level=1,levelMax,upLevelStep do
--                 self.base:SetUpEquipedReliquery()
--                 local combatPropertyBefore = self.base:GetEntityCombatProperty()
--                 yield_return(CS.UnityEngine.WaitForSeconds(1))
--                 local rank = math.random(0,4)
--                 local breakLevel = math.random(0,3)
--                 yield_return(self.base:RunGM("equip add "..tostring(id+rank) .." ".. level .. " "..breakLevel))
--                 yield_return(CS.UnityEngine.WaitForSeconds(1))
--                 self.base:CheckAvatarReliqueryProp(combatPropertyBefore,i-1)
--                 yield_return(CS.UnityEngine.WaitForSeconds(1))
--             end
--         end
-- 	end)
-- }



return self