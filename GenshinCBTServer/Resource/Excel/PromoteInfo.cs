using GenshinCBTServer.Data;
using GenshinCBTServer.Protocol;

namespace GenshinCBTServer.Excel;

public class PromoteInfo
{
    public uint coinCost;
    public uint weaponPromoteId;
    public uint promoteLevel;
    public List<PromoteProp> addProps = new List<PromoteProp>();

    public PromoteProp getPropByType(FightPropType type)
    {
        for (int i = 0; i < addProps.Count; i++)
        {
            PromoteProp curveInfo = addProps[i];
            if (curveInfo.propType == (int)type) return curveInfo;
        }
        return addProps[0];
    }
}