namespace GenshinCBTServer.Excel;
using GenshinCBTServer.Data;
    
public class AvatarPromoteExcel
{
    public uint promoteLevel;
    public ElementType elementType;
    public List<CostItems> costItems = new List<CostItems>();
    public uint unlockMaxLevel;
    public List<PropValConfig> addProps = new List<PropValConfig>();
    public uint playerExp;
}