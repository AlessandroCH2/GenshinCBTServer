namespace GenshinCBTServer.Data;

public class RoutePointData
{
    public uint waitTime;
    public float speedLevel;
    public Vector pos = new Vector();
    public float targetVelocity;
    public bool hasReachEvent;
}