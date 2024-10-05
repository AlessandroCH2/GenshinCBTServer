namespace GenshinCBTServer.Excel;
using GenshinCBTServer.Data;

public class LevelCurve
{
    public uint level;
    public List<CurveInfo> curveInfos = new List<CurveInfo>();
    public CurveInfo getCurveValue(int growcurve)
    {
        for (int i = 0; i < curveInfos.Count; i++)
        {
            CurveInfo curveInfo = curveInfos[i];
            if ((uint)curveInfo.type == growcurve) return curveInfo;
        }
        CurveInfo ret = curveInfos[0];
        ret.type = (GrowCurveType)growcurve;
        ret.arith = ArithType.ARITH_MULTI;
        ret.value = 1;
        return ret;
    }
}