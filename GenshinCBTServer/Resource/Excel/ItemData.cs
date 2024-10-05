namespace GenshinCBTServer.Excel;
using GenshinCBTServer.Data;

public class ItemData
{
    public uint id;
    public uint gadgetId;
    public ItemType itemType;
    public EquipType equipType;
    public List<WeaponPropValue> weaponProp = new List<WeaponPropValue>();
    
    public uint mainPropDepotId;
    public uint rankLevel;
    public uint appendPropDepotId;
    public EquipType GetEquipType()
    {
        return equipType;
    }
    public PromoteInfo getPromoteInfo(uint asc)
    {
        return Server.getResources().weaponsPromote[asc]!;
    }
    public new ItemType GetType()
    {
        return itemType;
    }
}