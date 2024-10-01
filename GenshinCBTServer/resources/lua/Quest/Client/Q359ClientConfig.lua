local QuestClientData = {}

QuestClientData.MainID = 359
QuestClientData.ActorAlias = "359"
QuestClientData.SubIDs = 
{
	q35901 = 35901,
	q35902 = 35902,
	q35903 = 35903,
	q35904 = 35904,
}

QuestClientData.Q359NPC1Data = 
{
	Q359NPC1 = "Q357NPC1",
	Q359NPC1Script = "Actor/Quest/Q376/Soldier",
    Q359NPC1ID = 10001,        
    Pos1 = sceneData:GetDummyPoint(3,"Q357NPC1").pos,
    Dir1 = sceneData:GetDummyPoint(3,"Q357NPC1").rot, 
}

QuestClientData.Q359NPC2Data = 
{
	Q359NPC2 = "Q357NPC2",
	Q359NPC2Script = "Actor/Quest/Q376/Soldier",
    Q359NPC2ID = 10002,        
    Pos1 = sceneData:GetDummyPoint(3,"Q357NPC2").pos,
    Dir1 = sceneData:GetDummyPoint(3,"Q357NPC2").rot, 
}

QuestClientData.Q359NPC3Data = 
{
	Q359NPC3 = "Q357NPC3",
	Q359NPC3Script = "Actor/Quest/Q376/Soldier",
    Q359NPC3ID = 10003,        
    Pos1 = sceneData:GetDummyPoint(3,"Q357NPC3").pos,
    Dir1 = sceneData:GetDummyPoint(3,"Q357NPC3").rot, 
}

QuestClientData.Q359NPC4Data = 
{
	Q359NPC4 = "Q357NPC4",
	Q359NPC4Script = "Actor/Quest/Q376/Soldier",
    Q359NPC4ID = 10004,        
    Pos1 = sceneData:GetDummyPoint(3,"Q357NPC4").pos,
    Dir1 = sceneData:GetDummyPoint(3,"Q357NPC4").rot, 
}

QuestClientData.Q359NPC5Data = 
{
	Q359NPC5 = "Q357NPC5",
	Q359NPC5Script = "Actor/Quest/Q376/Soldier",
    Q359NPC5ID = 10005,        
    Pos1 = sceneData:GetDummyPoint(3,"Q357NPC5").pos,
    Dir1 = sceneData:GetDummyPoint(3,"Q357NPC5").rot, 
}

QuestClientData.Q359NPC6Data = 
{
	Q359NPC6 = "Q357NPC6",
	Q359NPC6Script = "Actor/Quest/Q376/Soldier",
    Q359NPC6ID = 10006,        
    Pos1 = sceneData:GetDummyPoint(3,"Q357NPC6").pos,
    Dir1 = sceneData:GetDummyPoint(3,"Q357NPC6").rot, 
}

QuestClientData.DungEffectData = 
{
    AmborDungeon = "AmborDungeon",
    GaiaDungeon = "GaiaDungeon",
    LisaDungeon = "LisaDungeon",
    EffectID = 70700003,
    
    BornPos1 = sceneData:GetDummyPoint(3,"Q359AmborDung").pos,
    BornDir1 = sceneData:GetDummyPoint(3,"Q359AmborDung").rot,
    BornPos2 = sceneData:GetDummyPoint(3,"Q359GaiaDung").pos,
    BornDir2 = sceneData:GetDummyPoint(3,"Q359GaiaDung").rot,
    BornPos3 = sceneData:GetDummyPoint(3,"Q359LisaDung").pos,
    BornDir3 = sceneData:GetDummyPoint(3,"Q359LisaDung").rot,
}
return QuestClientData