namespace GenshinCBTServer.Excel;
using GenshinCBTServer.Data;

public class ShopGoodsData
{
    public uint goodsId;
    public uint itemId;
    public uint itemCount;
    public uint costScoin;
    public uint costHcoin;
    public List<CostItems> costItems = new List<CostItems>();
}