local QuestClientData = {}

QuestClientData.MainID = 421
QuestClientData.ActorAlias = "421"
QuestClientData.SubIDs = 
{
	q42101 = 42101,
    q42102 = 42102,
    q42103 = 42103,
    q42104 = 42104,

}

QuestClientData.GuardData = 
{
	Guard = "Guard",
	GuardScript = "Actor/Quest/Q375/Guard",
	GuardID = 1164,
    bornPos = sceneData:GetDummyPoint(1008,"Q374Guard").pos,
	bornDir = sceneData:GetDummyPoint(1008,"Q374Guard").rot,	
	transPos = sceneData:GetDummyPoint(1008,"Q375Player").pos,
	transDir = sceneData:GetDummyPoint(1008,"Q375Player").rot,		

}

return QuestClientData