require('Actor/ActorCommon')

local Q304Config = {}

Q304Config.MainID = 304
Q304Config.ActorAlias = "304"

Q304Config.SubIDs = 
{
	q30400 = 30400,
	q30401 = 30401,
	q30402 = 30402,
	q30403 = 30403,
	q30404 = 30404,
	q30405 = 30405,
	q30406 = 30406,
	q30407 = 30407,
	q30408 = 30408,
	q30409 = 30409,
	q30410 = 30410,
}
Q304Config.AmborData = 
{
	Ambor = "Ambor",
	AmborScript = "Actor/Quest/Q301/Ambor301",
    AmborID = 1002,
    
	hiddenPos = sceneData:GetDummyPoint(3,"Q301Hidden").pos,
	hiddenDir = sceneData:GetDummyPoint(3,"Q301Hidden").rot,
	bornPos = sceneData:GetDummyPoint(3,"Q301AmborBorn").pos,
	bornDir = sceneData:GetDummyPoint(3,"Q301AmborBorn").rot,	
	arguePos = sceneData:GetDummyPoint(3,"Q301AmborArgue").pos,
    argueDir = sceneData:GetDummyPoint(3,"Q301AmborArgue").rot,
    feather1Pos = sceneData:GetDummyPoint(3,"Q304Ambor1").pos,
    feather1Dir = sceneData:GetDummyPoint(3,"Q304Ambor1").rot,
    feather2Pos = sceneData:GetDummyPoint(3,"Q304Ambor2").pos,
    feather2Dir = sceneData:GetDummyPoint(3,"Q304Ambor2").rot,
    feather3Pos = sceneData:GetDummyPoint(3,"Q304Ambor3").pos,
    feather3Dir = sceneData:GetDummyPoint(3,"Q304Ambor3").rot,
    feather4Pos = sceneData:GetDummyPoint(3,"Q304Ambor4").pos,
    feather4Dir = sceneData:GetDummyPoint(3,"Q304Ambor4").rot,
}

Q304Config.FeatherData = 
{
	Feather = "Feather",
	FeatherGadgetID = 70300013,
    feather1Pos = sceneData:GetDummyPoint(3,"Q304Feather1").pos,
    feather1Dir = sceneData:GetDummyPoint(3,"Q304Feather1").rot,
    feather2Pos = sceneData:GetDummyPoint(3,"Q304Feather2").pos,
    feather2Dir = sceneData:GetDummyPoint(3,"Q304Feather2").rot,
    feather3Pos = sceneData:GetDummyPoint(3,"Q304Feather3").pos,
    feather3Dir = sceneData:GetDummyPoint(3,"Q304Feather3").rot,
    feather4Pos = sceneData:GetDummyPoint(3,"Q304Feather4").pos,
    feather4Dir = sceneData:GetDummyPoint(3,"Q304Feather4").rot,
}

Q304Config.WindData = 
{
	Wind = "Wind",
	WindGadgetID = 40200020,
    wind1Pos = sceneData:GetDummyPoint(3,"Q304WindRise1").pos,
    wind1Dir = sceneData:GetDummyPoint(3,"Q304WindRise1").rot,
    wind2Pos = sceneData:GetDummyPoint(3,"Q304WindRise2").pos,
    wind2Dir = sceneData:GetDummyPoint(3,"Q304WindRise2").rot,
    wind3Pos = sceneData:GetDummyPoint(3,"Q304WindRise3").pos,
    wind3Dir = sceneData:GetDummyPoint(3,"Q304WindRise3").rot,
    wind4Pos = sceneData:GetDummyPoint(3,"Q304WindRise4").pos,
    wind4Dir = sceneData:GetDummyPoint(3,"Q304WindRise4").rot,
    wind5Pos = sceneData:GetDummyPoint(3,"Q304WindRise5").pos,
    wind5Dir = sceneData:GetDummyPoint(3,"Q304WindRise5").rot,
    wind6Pos = sceneData:GetDummyPoint(3,"Q304WindRise6").pos,
    wind6Dir = sceneData:GetDummyPoint(3,"Q304WindRise6").rot,
    wind7Pos = sceneData:GetDummyPoint(3,"Q304WindRise7").pos,
    wind7Dir = sceneData:GetDummyPoint(3,"Q304WindRise7").rot,
    wind8Pos = sceneData:GetDummyPoint(3,"Q304WindRise8").pos,
    wind8Dir = sceneData:GetDummyPoint(3,"Q304WindRise8").rot,
    wind9Pos = sceneData:GetDummyPoint(3,"Q304WindRise9").pos,
    wind9Dir = sceneData:GetDummyPoint(3,"Q304WindRise9").rot,
    wind10Pos = sceneData:GetDummyPoint(3,"Q304WindRise10").pos,
    wind10Dir = sceneData:GetDummyPoint(3,"Q304WindRise10").rot,
    wind11Pos = sceneData:GetDummyPoint(3,"Q304WindRise11").pos,
    wind11Dir = sceneData:GetDummyPoint(3,"Q304WindRise11").rot,
    wind12Pos = sceneData:GetDummyPoint(3,"Q304WindRise12").pos,
    wind12Dir = sceneData:GetDummyPoint(3,"Q304WindRise12").rot,
    wind13Pos = sceneData:GetDummyPoint(3,"Q304WindRise13").pos,
    wind13Dir = sceneData:GetDummyPoint(3,"Q304WindRise13").rot,
    Wall = "Wall",
    WallGadgetID = 70700001,
    WallPos = { x = 2288, y = 220, z = -4970 },
    WallDir = { x = 0.0, y = 0.0, z = 0.0 },

    Skybox = "Skybox",
    SkyboxGadgetID = 70700002,
    SkyboxPos = { x = 2252, y = 209, z = -5002 },
    -- SkyboxPos = { x = 0.0, y = 0.0, z = 0.0 },
    SkyboxDir = { x = 0.0, y = 0.0, z = 0.0 },

}

Q304Config.DragonData = 
{
	Dragon = "Dragon",
	DragonScript = "Actor/Quest/Q304/Dragon",
    DragonID = 1010,

    CircleNum = 6,
    DragonPos =
    {
        sceneData:GetDummyPoint(3,"Q304Dragon1").pos,
        sceneData:GetDummyPoint(3,"Q304Dragon2").pos,
        sceneData:GetDummyPoint(3,"Q304Dragon3").pos,
        sceneData:GetDummyPoint(3,"Q304Dragon4").pos,
        sceneData:GetDummyPoint(3,"Q304Dragon5").pos,
        sceneData:GetDummyPoint(3,"Q304Dragon6").pos,	
    },
    
    DragonDir =
    {
        sceneData:GetDummyPoint(3,"Q304Dragon1").rot,
        sceneData:GetDummyPoint(3,"Q304Dragon2").rot,
        sceneData:GetDummyPoint(3,"Q304Dragon3").rot,
        sceneData:GetDummyPoint(3,"Q304Dragon4").rot,
        sceneData:GetDummyPoint(3,"Q304Dragon5").rot,
        sceneData:GetDummyPoint(3,"Q304Dragon6").rot,	
    }
}

Q304Config.AmborNarratorFlow1 =
{
	{dialogID = 3040201, audioEvtName = "", duration = 3},
	{dialogID = 3040202, audioEvtName = "", duration = 3},
	{dialogID = 3040203, audioEvtName = "", duration = 3},
}

Q304Config.AmborNarratorFlow2 =
{
	{dialogID = 3040301, audioEvtName = "", duration = 3},
	{dialogID = 3040302, audioEvtName = "", duration = 3},
	{dialogID = 3040303, audioEvtName = "", duration = 3},
}

Q304Config.AmborNarratorFlow3 =
{
	{dialogID = 3040401, audioEvtName = "", duration = 3},
	{dialogID = 3040402, audioEvtName = "", duration = 3},
}

Q304Config.DragonCircleCutScene =
{
    type = CutsceneType.TIME_LINE_PREFAB,
    roleSheetPath = "",
    resPath = "ART/CameraAni/Quest/Ca_DragonFly",
    startPosType = CutsceneInitPosType.FREE,
    startOffset = {x = 0, y = 0, z = 0}
}

Q304Config.AmborNoReplyInter = 
{
	{
		{
			type = InteractionType.DIALOG,
			dialogType = DialogType.LOCK_FRAME,
			talkerName = "安柏",
			content = "快点跟上来"
		}
	},
}


return Q304Config