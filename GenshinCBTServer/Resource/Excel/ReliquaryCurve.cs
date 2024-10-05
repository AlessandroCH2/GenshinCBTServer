namespace GenshinCBTServer.Excel;
using GenshinCBTServer.Data;

public class ReliquaryCurve
{
    public uint level;
    public uint rank;
    public List<ReliquaryProp> addProps = new List<ReliquaryProp>();
    public ReliquaryProp getCurveValue(int growcurve)
    {
        for (int i = 0; i < addProps.Count; i++)
        {
            ReliquaryProp curveInfo = addProps[i];
            if (curveInfo.propType == growcurve) return curveInfo;
        }
        return addProps[0];
    }
}