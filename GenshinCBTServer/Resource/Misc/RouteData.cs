namespace GenshinCBTServer.Data;

public class RouteData
{
    public uint localId;
    public string type = "";
    public string name = "";
    public List<RoutePointData> points = new List<RoutePointData>();
}