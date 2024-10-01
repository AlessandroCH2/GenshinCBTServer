local QuestClientData = {}

QuestClientData.MainID = 427
QuestClientData.ActorAlias = "427"
QuestClientData.SubIDs = 
{
	q42701 = 42701,
	q42702 = 42702,
	q42703 = 42703,
	q42704 = 42704,
	q42705 = 42705,
}

QuestClientData.WindData = {
	Wind1 = "Wind1",
	Wind2 = "Wind2",
	Wind3 = "Wind3",
	Wind4 = "Wind4",
	Wind5 = "Wind5",
	Wind6 = "Wind6",
	Wind7 = "Wind7",
	Wind8 = "Wind8",

    WindID = 40200020,
    
	Pos1 = sceneData:GetDummyPoint(3,"Q427Wind1").pos,
	Pos2 = sceneData:GetDummyPoint(3,"Q427Wind2").pos,
	Pos3 = sceneData:GetDummyPoint(3,"Q427Wind3").pos,
	Pos4 = sceneData:GetDummyPoint(3,"Q427Wind4").pos,

	Pos5 = sceneData:GetDummyPoint(3,"Q427Wind11").pos,
	Pos6 = sceneData:GetDummyPoint(3,"Q427Wind12").pos,
	Pos7 = sceneData:GetDummyPoint(3,"Q427Wind13").pos,
	Pos8 = sceneData:GetDummyPoint(3,"Q427Wind14").pos,

}

QuestClientData.AmborData = 
{
	Ambor = "Ambor",
	AmborScript = "Actor/Quest/Q301/Ambor301",
	AmborID = 1002,

	bornPos = sceneData:GetDummyPoint(3,"Ambor_FlyBegin").pos,
	bornDir = sceneData:GetDummyPoint(3,"Ambor_FlyBegin").rot,	
	bornPos2 = sceneData:GetDummyPoint(3,"Knight_Roof_Ambor").pos,
	bornDir2 = sceneData:GetDummyPoint(3,"Knight_Roof_Ambor").rot,	

}

QuestClientData.CoinNum = 11
QuestClientData.BatchNum = 4
QuestClientData.MAXCoinsNum = 3

QuestClientData.TotalGetNum = 0
QuestClientData.EachGetNum = 0
QuestClientData.NowBatchNum = 1

QuestClientData.FlyCoins = 
{
	{
		sceneData:GetDummyPoint(3,"FlyCoin101"),
		sceneData:GetDummyPoint(3,"FlyCoin102"),
		sceneData:GetDummyPoint(3,"FlyCoin103")
	},
	{
		sceneData:GetDummyPoint(3,"FlyCoin111"),
		sceneData:GetDummyPoint(3,"FlyCoin112"),
		sceneData:GetDummyPoint(3,"FlyCoin113")
	},
	{
		sceneData:GetDummyPoint(3,"FlyCoin121"),
		sceneData:GetDummyPoint(3,"FlyCoin122")
	},
	{
		sceneData:GetDummyPoint(3,"FlyCoin131"),
		sceneData:GetDummyPoint(3,"FlyCoin132"),
		sceneData:GetDummyPoint(3,"FlyCoin133")
	},
}

------------------

QuestClientData.CoinNum2 = 21
QuestClientData.BatchNum2 = 7
QuestClientData.MAXCoinsNum2 = 6

QuestClientData.TotalGetNum2 = 0
QuestClientData.EachGetNum2 = 0
QuestClientData.NowBatchNum2 = 1

QuestClientData.FlyCoins2 = 
{
	{
		sceneData:GetDummyPoint(3,"FlyCoin201"),
		sceneData:GetDummyPoint(3,"FlyCoin202"),
		sceneData:GetDummyPoint(3,"FlyCoin203")
	},
	{
		sceneData:GetDummyPoint(3,"FlyCoin211"),
		sceneData:GetDummyPoint(3,"FlyCoin212")
	},
	{
		sceneData:GetDummyPoint(3,"FlyCoin222"),
		sceneData:GetDummyPoint(3,"FlyCoin223"),
		sceneData:GetDummyPoint(3,"FlyCoin224"),
		sceneData:GetDummyPoint(3,"FlyCoin225")		
	},
	{
		-- sceneData:GetDummyPoint(3,"FlyCoin235"),
		-- sceneData:GetDummyPoint(3,"FlyCoin236"),
		sceneData:GetDummyPoint(3,"FlyCoin237"),
		sceneData:GetDummyPoint(3,"FlyCoin239"),
		sceneData:GetDummyPoint(3,"FlyCoin238")
	},
	{
		sceneData:GetDummyPoint(3,"FlyCoin231"),
		sceneData:GetDummyPoint(3,"FlyCoin232"),
		sceneData:GetDummyPoint(3,"FlyCoin233"),
		sceneData:GetDummyPoint(3,"FlyCoin234"),
	},
	{
		sceneData:GetDummyPoint(3,"FlyCoin241"),
		sceneData:GetDummyPoint(3,"FlyCoin242")
	},
	{
		sceneData:GetDummyPoint(3,"FlyCoin251"),
		sceneData:GetDummyPoint(3,"FlyCoin252"),
		sceneData:GetDummyPoint(3,"FlyCoin253")
	},
}

------------------


QuestClientData.Flyline1 = 
{	
	sceneData:GetDummyPoint(3,"Md_Fly_101").pos,
	{
		x = sceneData:GetDummyPoint(3,"Md_Fly_101").pos.x + (sceneData:GetDummyPoint(3,"Md_Fly_102").pos.x - sceneData:GetDummyPoint(3,"Md_Fly_101").pos.x)/3,
		y = sceneData:GetDummyPoint(3,"Md_Fly_101").pos.y + (sceneData:GetDummyPoint(3,"Md_Fly_102").pos.y - sceneData:GetDummyPoint(3,"Md_Fly_101").pos.y)/3,
		z = sceneData:GetDummyPoint(3,"Md_Fly_101").pos.z + (sceneData:GetDummyPoint(3,"Md_Fly_102").pos.z - sceneData:GetDummyPoint(3,"Md_Fly_101").pos.z)/3
	},
	{
		x = sceneData:GetDummyPoint(3,"Md_Fly_101").pos.x + (sceneData:GetDummyPoint(3,"Md_Fly_102").pos.x - sceneData:GetDummyPoint(3,"Md_Fly_101").pos.x)/3*2,
		y = sceneData:GetDummyPoint(3,"Md_Fly_101").pos.y + (sceneData:GetDummyPoint(3,"Md_Fly_102").pos.y - sceneData:GetDummyPoint(3,"Md_Fly_101").pos.y)/3*2,
		z = sceneData:GetDummyPoint(3,"Md_Fly_101").pos.z + (sceneData:GetDummyPoint(3,"Md_Fly_102").pos.z - sceneData:GetDummyPoint(3,"Md_Fly_101").pos.z)/3*2
	},
	sceneData:GetDummyPoint(3,"Md_Fly_102").pos,
}

QuestClientData.Flyline2 = 
{	
	sceneData:GetDummyPoint(3,"Md_Fly_201").pos,
	{
		x = sceneData:GetDummyPoint(3,"Md_Fly_201").pos.x + (sceneData:GetDummyPoint(3,"Md_Fly_202").pos.x - sceneData:GetDummyPoint(3,"Md_Fly_201").pos.x)/4,
		y = sceneData:GetDummyPoint(3,"Md_Fly_201").pos.y + (sceneData:GetDummyPoint(3,"Md_Fly_202").pos.y - sceneData:GetDummyPoint(3,"Md_Fly_201").pos.y)/4,
		z = sceneData:GetDummyPoint(3,"Md_Fly_201").pos.z + (sceneData:GetDummyPoint(3,"Md_Fly_202").pos.z - sceneData:GetDummyPoint(3,"Md_Fly_201").pos.z)/4
	},
	{
		x = sceneData:GetDummyPoint(3,"Md_Fly_201").pos.x + (sceneData:GetDummyPoint(3,"Md_Fly_202").pos.x - sceneData:GetDummyPoint(3,"Md_Fly_201").pos.x)/2,
		y = sceneData:GetDummyPoint(3,"Md_Fly_201").pos.y + (sceneData:GetDummyPoint(3,"Md_Fly_202").pos.y - sceneData:GetDummyPoint(3,"Md_Fly_201").pos.y)/2,
		z = sceneData:GetDummyPoint(3,"Md_Fly_201").pos.z + (sceneData:GetDummyPoint(3,"Md_Fly_202").pos.z - sceneData:GetDummyPoint(3,"Md_Fly_201").pos.z)/2
	},
	{
		x = sceneData:GetDummyPoint(3,"Md_Fly_201").pos.x + (sceneData:GetDummyPoint(3,"Md_Fly_202").pos.x - sceneData:GetDummyPoint(3,"Md_Fly_201").pos.x)/4*3,
		y = sceneData:GetDummyPoint(3,"Md_Fly_201").pos.y + (sceneData:GetDummyPoint(3,"Md_Fly_202").pos.y - sceneData:GetDummyPoint(3,"Md_Fly_201").pos.y)/4*3,
		z = sceneData:GetDummyPoint(3,"Md_Fly_201").pos.z + (sceneData:GetDummyPoint(3,"Md_Fly_202").pos.z - sceneData:GetDummyPoint(3,"Md_Fly_201").pos.z)/4*3
	},
	sceneData:GetDummyPoint(3,"Md_Fly_202").pos,
}

QuestClientData.Flyline3 = 
{	
	sceneData:GetDummyPoint(3,"Md_Fly_301").pos,
	{
		x = sceneData:GetDummyPoint(3,"Md_Fly_301").pos.x + (sceneData:GetDummyPoint(3,"Md_Fly_302").pos.x - sceneData:GetDummyPoint(3,"Md_Fly_301").pos.x)/3,
		y = sceneData:GetDummyPoint(3,"Md_Fly_301").pos.y + (sceneData:GetDummyPoint(3,"Md_Fly_302").pos.y - sceneData:GetDummyPoint(3,"Md_Fly_301").pos.y)/3,
		z = sceneData:GetDummyPoint(3,"Md_Fly_301").pos.z + (sceneData:GetDummyPoint(3,"Md_Fly_302").pos.z - sceneData:GetDummyPoint(3,"Md_Fly_301").pos.z)/3
	},
	{
		x = sceneData:GetDummyPoint(3,"Md_Fly_301").pos.x + (sceneData:GetDummyPoint(3,"Md_Fly_302").pos.x - sceneData:GetDummyPoint(3,"Md_Fly_301").pos.x)/3*2,
		y = sceneData:GetDummyPoint(3,"Md_Fly_301").pos.y + (sceneData:GetDummyPoint(3,"Md_Fly_302").pos.y - sceneData:GetDummyPoint(3,"Md_Fly_301").pos.y)/3*2,
		z = sceneData:GetDummyPoint(3,"Md_Fly_301").pos.z + (sceneData:GetDummyPoint(3,"Md_Fly_302").pos.z - sceneData:GetDummyPoint(3,"Md_Fly_301").pos.z)/3*2
	},
	sceneData:GetDummyPoint(3,"Md_Fly_302").pos,
}


return QuestClientData