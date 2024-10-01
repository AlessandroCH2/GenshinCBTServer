require('UAuto/Base/UAutoCommon')



main = {}
main.ModuleDic = {}

main.OnStart = function()

end

main.OnLevelLoad = function(self, sceneID)

end

main.OnRequire = function(self, moduleName)

end

main.OnClearLevel = function()

end



--table.insert(uAutoLuaTestCases,require('UAuto/TestCases/UAutoLuaTestCaseEample'))

--Avatar
table.insert(uAutoLuaTestCases,require('UAuto/TestCases/Avatar/Avatar100Dead'))
table.insert(uAutoLuaTestCases,require('UAuto/TestCases/Avatar/Test'))

table.insert(uAutoLuaTestCases,require('UAuto/TestCases/Avatar/Skill/PlayerGirlSkill'))
table.insert(uAutoLuaTestCases,require('UAuto/TestCases/Avatar/Skill/AmborSkill'))
table.insert(uAutoLuaTestCases,require('UAuto/TestCases/Avatar/Skill/AyakaSkill'))
table.insert(uAutoLuaTestCases,require('UAuto/TestCases/Avatar/Skill/LisaSkill'))
table.insert(uAutoLuaTestCases,require('UAuto/TestCases/Avatar/Skill/BarbaraSkill'))
table.insert(uAutoLuaTestCases,require('UAuto/TestCases/Avatar/Skill/QinSkill'))
table.insert(uAutoLuaTestCases,require('UAuto/TestCases/Avatar/Skill/KaeyaSkill'))
table.insert(uAutoLuaTestCases,require('UAuto/TestCases/Avatar/Skill/PlayerBoySkill'))
table.insert(uAutoLuaTestCases,require('UAuto/TestCases/Avatar/Skill/DilucSkill'))
table.insert(uAutoLuaTestCases,require('UAuto/TestCases/Avatar/Skill/RazorSkill'))
table.insert(uAutoLuaTestCases,require('UAuto/TestCases/Avatar/Skill/XianglingSkill'))
table.insert(uAutoLuaTestCases,require('UAuto/TestCases/Avatar/Skill/VentiSkill'))


--Combat
table.insert(uAutoLuaTestCases,require('UAuto/TestCases/Combat/Avatar/CombatAvatar'))
table.insert(uAutoLuaTestCases,require('UAuto/TestCases/Combat/Avatar/AmborSkillHitMonster'))
table.insert(uAutoLuaTestCases,require('UAuto/TestCases/Combat/Avatar/AyakaSkillHitMonster'))
table.insert(uAutoLuaTestCases,require('UAuto/TestCases/Combat/Avatar/BarbaraSkillHitMonster'))
table.insert(uAutoLuaTestCases,require('UAuto/TestCases/Combat/Avatar/DilucSkillHitMonster'))
table.insert(uAutoLuaTestCases,require('UAuto/TestCases/Combat/Avatar/KaeyaSkillHitMonster'))
table.insert(uAutoLuaTestCases,require('UAuto/TestCases/Combat/Avatar/LisaSkillHitMonster'))
table.insert(uAutoLuaTestCases,require('UAuto/TestCases/Combat/Avatar/PlayerBoySkillHitMonster'))
table.insert(uAutoLuaTestCases,require('UAuto/TestCases/Combat/Avatar/PlayerGirlSkillHitMonster'))
table.insert(uAutoLuaTestCases,require('UAuto/TestCases/Combat/Avatar/QinSkillHitMonster'))
table.insert(uAutoLuaTestCases,require('UAuto/TestCases/Combat/Avatar/RazorSkillHitMonster'))
table.insert(uAutoLuaTestCases,require('UAuto/TestCases/Combat/Avatar/VentiSkillHitMonster'))
table.insert(uAutoLuaTestCases,require('UAuto/TestCases/Combat/Avatar/XianglingSkillHitMonster'))


--Quest
--table.insert(uAutoLuaTestCases,require('UAuto/TestCases/Quest/FirstGoddess'))
	 table.insert(uAutoLuaTestCases,require('UAuto/TestCases/Quest/351/Quest351'))
	 table.insert(uAutoLuaTestCases,require('UAuto/TestCases/Quest/352/Quest352'))
	 table.insert(uAutoLuaTestCases,require('UAuto/TestCases/Quest/353/Quest353'))
	 table.insert(uAutoLuaTestCases,require('UAuto/TestCases/Quest/361/Quest361'))
	 table.insert(uAutoLuaTestCases,require('UAuto/TestCases/Quest/355/Quest355'))
	 table.insert(uAutoLuaTestCases,require('UAuto/TestCases/Quest/354/QuestAuto354'))
	 table.insert(uAutoLuaTestCases,require('UAuto/TestCases/Quest/356/Quest356'))
	 table.insert(uAutoLuaTestCases,require('UAuto/TestCases/Quest/358/Quest358'))
	 table.insert(uAutoLuaTestCases,require('UAuto/TestCases/Quest/306/Quest306'))
	
	--404
	table.insert(uAutoLuaTestCases,require('UAuto/TestCases/Quest/404/QuestNormal_404'))
	--405
	table.insert(uAutoLuaTestCases,require('UAuto/TestCases/Quest/405/QuestNormal_405'))
	
	--table.insert(uAutoLuaTestCases,require('UAuto/TestCases/Quest/Ambor_Run'))

	
	--解锁各种女神像
	table.insert(uAutoLuaTestCases,require('UAuto/TestCases/Quest/354/unlockTransPoint'))
	
--UI
table.insert(uAutoLuaTestCases,require('UAuto/TestCases/UI/Character/CharacterEnterReturnTwice'))
table.insert(uAutoLuaTestCases,require('UAuto/TestCases/UI/Character/ChangeCharacter'))
	--Character/Property
	table.insert(uAutoLuaTestCases,require('UAuto/TestCases/UI/Character/Property/OpenAllProperties'))

--table.insert(uAutoLuaTestCases,require('UAuto/TestCases/UI/Map/MapTransPoint'))

--Item/小物件
--table.insert(uAutoLuaTestCases,require('UAuto/TestCases/Item/AllTreasurebox'))
--table.insert(uAutoLuaTestCases,require('UAuto/TestCases/Item/KapokFlower01'))
table.insert(uAutoLuaTestCases,require('UAuto/TestCases/Item/PumpkinBomb01'))

	--Item/Treasurebox 宝箱用例
	--table.insert(uAutoLuaTestCases,require('UAuto/TestCases/Item/Treasurebox/OpenTreasure01'))
	--table.insert(uAutoLuaTestCases,require('UAuto/TestCases/Item/Treasurebox/OpenTreasure02'))
	table.insert(uAutoLuaTestCases,require('UAuto/TestCases/Item/Treasurebox/OpenTreasure03'))
	--table.insert(uAutoLuaTestCases,require('UAuto/TestCases/Item/Treasurebox/OpenTreasure04'))
	--table.insert(uAutoLuaTestCases,require('UAuto/TestCases/Item/Treasurebox/OpenTreasure05'))


--数值测试
table.insert(uAutoLuaTestCases,require('UAuto/TestCases/Number/Avatar/AvatarUpLevel'))
table.insert(uAutoLuaTestCases,require('UAuto/TestCases/Number/Avatar/AvatarWeaponTest'))
table.insert(uAutoLuaTestCases,require('UAuto/TestCases/Number/Avatar/AvatarReliquaryTest'))
table.insert(uAutoLuaTestCases,require('UAuto/TestCases/Number/Avatar/AvatarTalentTest'))
table.insert(uAutoLuaTestCases, require('UAuto/TestCases/Number/Quest/QuestNumberData'))

-- 元素
table.insert(uAutoLuaTestCases, require('UAuto/TestCases/Element/Water/WaterComponent'))
table.insert(uAutoLuaTestCases, require('UAuto/TestCases/Element/Water/WaterIceReaction'))
table.insert(uAutoLuaTestCases, require('UAuto/TestCases/Element/Water/WaterFireReaction'))
table.insert(uAutoLuaTestCases, require('UAuto/TestCases/Element/Water/WaterElectricReaction'))
table.insert(uAutoLuaTestCases, require('UAuto/TestCases/Element/Grass/GrassComponent'))
table.insert(uAutoLuaTestCases, require('UAuto/TestCases/Element/Grass/GrassFireReaction'))
table.insert(uAutoLuaTestCases, require('UAuto/TestCases/Element/Electric/ElectricComponent'))
table.insert(uAutoLuaTestCases, require('UAuto/TestCases/Element/Electric/ElectricFireReaction'))
table.insert(uAutoLuaTestCases, require('UAuto/TestCases/Element/Electric/ElectricReaction'))
table.insert(uAutoLuaTestCases, require('UAuto/TestCases/Element/Fire/FireComponent'))
table.insert(uAutoLuaTestCases, require('UAuto/TestCases/Element/Fire/FireWaterReaction'))
table.insert(uAutoLuaTestCases, require('UAuto/TestCases/Element/Fire/FireElectricReaction'))
table.insert(uAutoLuaTestCases, require('UAuto/TestCases/Element/Fire/FireReaction'))
table.insert(uAutoLuaTestCases, require('UAuto/TestCases/Element/Ice/IceComponent'))
table.insert(uAutoLuaTestCases, require('UAuto/TestCases/Element/Ice/IceFireReaction'))
table.insert(uAutoLuaTestCases, require('UAuto/TestCases/Element/Rock/RockComponent'))

--Online联机
	table.insert(uAutoLuaTestCases,require('UAuto/TestCases/Online/OnlineAddClient'))
	--移动
	table.insert(uAutoLuaTestCases,require('UAuto/TestCases/Online/Move/OnlineMove'))

	--角色
	table.insert(uAutoLuaTestCases,require('UAuto/TestCases/Online/Avatar/OnlineChangeAvatar'))

	--技能
	table.insert(uAutoLuaTestCases,require('UAuto/TestCases/Online/Skill/OnlineAyakaSkill'))
	table.insert(uAutoLuaTestCases,require('UAuto/TestCases/Online/Skill/OnlineLisaSkill'))
	table.insert(uAutoLuaTestCases,require('UAuto/TestCases/Online/Skill/OnlineKaeyaSkill'))
	table.insert(uAutoLuaTestCases,require('UAuto/TestCases/Online/Skill/OnlineAmborSkill'))
	table.insert(uAutoLuaTestCases,require('UAuto/TestCases/Online/Skill/OnlineQinSkill'))
	table.insert(uAutoLuaTestCases,require('UAuto/TestCases/Online/Skill/OnlineBarbaraSkill'))
	table.insert(uAutoLuaTestCases,require('UAuto/TestCases/Online/Skill/OnlineGirlSkill'))

	--怪物
	table.insert(uAutoLuaTestCases,require('UAuto/TestCases/Online/Monster/HiliNone'))
	table.insert(uAutoLuaTestCases,require('UAuto/TestCases/Online/Monster/HiliNoneClub'))
	table.insert(uAutoLuaTestCases,require('UAuto/TestCases/Online/Monster/HiliNoneShield'))
	table.insert(uAutoLuaTestCases,require('UAuto/TestCases/Online/Monster/HiliNoneRange'))
	table.insert(uAutoLuaTestCases,require('UAuto/TestCases/Online/Monster/SlimeFire'))
	table.insert(uAutoLuaTestCases,require('UAuto/TestCases/Online/Monster/SlimeFireBig'))
	table.insert(uAutoLuaTestCases,require('UAuto/TestCases/Online/Monster/SlimeRock'))
	table.insert(uAutoLuaTestCases,require('UAuto/TestCases/Online/Monster/SlimeRockBig'))
	table.insert(uAutoLuaTestCases,require('UAuto/TestCases/Online/Monster/AbyssFire'))
	table.insert(uAutoLuaTestCases,require('UAuto/TestCases/Online/Monster/AbyssIce'))
	table.insert(uAutoLuaTestCases,require('UAuto/TestCases/Online/Monster/AbyssWater'))
	table.insert(uAutoLuaTestCases,require('UAuto/TestCases/Online/Monster/DefenderNone'))
	table.insert(uAutoLuaTestCases,require('UAuto/TestCases/Online/Monster/SlimeElectric'))
	table.insert(uAutoLuaTestCases,require('UAuto/TestCases/Online/Monster/SlimeElectricBig'))
	table.insert(uAutoLuaTestCases,require('UAuto/TestCases/Online/Monster/SlimeElectricBigPositive'))
	table.insert(uAutoLuaTestCases,require('UAuto/TestCases/Online/Monster/SlimeIce'))
	table.insert(uAutoLuaTestCases,require('UAuto/TestCases/Online/Monster/SlimeIceBig'))
	table.insert(uAutoLuaTestCases,require('UAuto/TestCases/Online/Monster/SlimeWater'))
	table.insert(uAutoLuaTestCases,require('UAuto/TestCases/Online/Monster/SlimeWaterBig'))
	table.insert(uAutoLuaTestCases,require('UAuto/TestCases/Online/Monster/ElementalWind'))
	table.insert(uAutoLuaTestCases, require('UAuto/TestCases/Online/Monster/SlimeGrass'))
	table.insert(uAutoLuaTestCases, require('UAuto/TestCases/Online/Monster/SlimeGrassBig'))
	table.insert(uAutoLuaTestCases, require('UAuto/TestCases/Online/Monster/BruteNoneShield'))
	table.insert(uAutoLuaTestCases, require('UAuto/TestCases/Online/Monster/SlimeWind'))
	table.insert(uAutoLuaTestCases, require('UAuto/TestCases/Online/Monster/SlimeWindBig'))
	table.insert(uAutoLuaTestCases, require('UAuto/TestCases/Online/Monster/ShamanWater'))
	table.insert(uAutoLuaTestCases, require('UAuto/TestCases/Online/Monster/ShamanGrass'))
	table.insert(uAutoLuaTestCases, require('UAuto/TestCases/Online/Monster/ShamanWind'))

	-- 联机元素
	table.insert(uAutoLuaTestCases, require('UAuto/TestCases/Online/Element/Monster/OnlineElementGrass'))
	table.insert(uAutoLuaTestCases, require('UAuto/TestCases/Online/Element/Monster/OnlineElementWater'))
	table.insert(uAutoLuaTestCases, require('UAuto/TestCases/Online/Element/Monster/OnlineElementIce'))
	table.insert(uAutoLuaTestCases, require('UAuto/TestCases/Online/Element/Monster/OnlineElementFire'))
	table.insert(uAutoLuaTestCases, require('UAuto/TestCases/Online/Element/Monster/OnlineElementElectric'))




--单机场景测试
	table.insert(uAutoLuaTestCases,require('UAuto/TestCases/LocalTest/CreateMonster'))
	
--场景
	table.insert(uAutoLuaTestCases,require('UAuto/TestCases/Scene/CheckStreaming'))

--性能测试
	table.insert(uAutoLuaTestCases,require('UAuto/TestCases/Perf/RunScene'))
	table.insert(uAutoLuaTestCases,require('UAuto/TestCases/Perf/RunSceneSetPos'))
	table.insert(uAutoLuaTestCases,require('UAuto/TestCases/Perf/RunSceneMengde'))
	table.insert(uAutoLuaTestCases,require('UAuto/TestCases/Perf/RunSceneBenlangling'))
	table.insert(uAutoLuaTestCases,require('UAuto/TestCases/Perf/RunSceneMengdeEast'))
	table.insert(uAutoLuaTestCases,require('UAuto/TestCases/Perf/RunSceneWangfengshandi'))
	table.insert(uAutoLuaTestCases,require('UAuto/TestCases/Perf/RunSceneChenxijiuzhuang'))
	table.insert(uAutoLuaTestCases,require('UAuto/TestCases/Perf/RunSceneFengqidi'))
	table.insert(uAutoLuaTestCases,require('UAuto/TestCases/Perf/RunSceneQingquanzhen'))
	table.insert(uAutoLuaTestCases,require('UAuto/TestCases/Perf/RunSceneShiyanjia'))
	table.insert(uAutoLuaTestCases,require('UAuto/TestCases/Perf/RunSceneManualPoint'))
	table.insert(uAutoLuaTestCases,require('UAuto/TestCases/Perf/TestMem'))
	-- 进出副本测内存
	table.insert(uAutoLuaTestCases,require('UAuto/TestCases/Perf/TestMemDungeonInOut'))
	table.insert(uAutoLuaTestCases,require('UAuto/TestCases/Perf/TestMemRoundFenglong'))
	table.insert(uAutoLuaTestCases,require('UAuto/TestCases/Perf/TestMemRoundMengde'))
	table.insert(uAutoLuaTestCases,require('UAuto/TestCases/Perf/TestCutscene'))
	table.insert(uAutoLuaTestCases,require('UAuto/TestCases/Perf/TestMemReLogin'))
	-- 少一半点的风龙
	table.insert(uAutoLuaTestCases,require('UAuto/TestCases/Perf/RunSceneSetPosMini'))
	-- 少一半点的蒙德城
	table.insert(uAutoLuaTestCases,require('UAuto/TestCases/Perf/RunSceneMengdeMini'))
	-- 新手区跑到蒙得(路点方式)
	table.insert(uAutoLuaTestCases,require('UAuto/TestCases/Perf/RunXinshouToMengde'))

	
	

