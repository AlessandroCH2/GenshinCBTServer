namespace GenshinCBTServer.Excel;
using GenshinCBTServer.Data;

public class MonsterData
{
    public uint id;
    public bool canSwim;
    public uint type;
    public int killExp; // exp gained when killed
    public float hp_base;
    public float attack_base;
    public float defense_base;
    public uint campId;
    public List<PropGrowCurve> propGrowCurves = new List<PropGrowCurve>();
}