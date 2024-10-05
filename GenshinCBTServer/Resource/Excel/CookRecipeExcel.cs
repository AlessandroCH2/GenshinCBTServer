namespace GenshinCBTServer.Excel;
using GenshinCBTServer.Data;

public class CookRecipeExcel
{
    public uint id;
    public uint rankLevel;
    public List<string> effectDesc = new List<string>();
    public bool isDefaultUnlocked;
    public uint maxProficiency;
    public List<IdCountConfig> qualityOutputVec = new List<IdCountConfig>();
    public List<IdCountConfig> inputVec = new List<IdCountConfig>();
    public string qteParam = "";
}