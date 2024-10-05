namespace GenshinCBTServer.Excel;
using GenshinCBTServer.Data;

public class CompoundExcel
{
	public uint id;
	public uint rankLevel;
	public CompoundType type;
	public bool isDefaultUnlocked;
	public uint costTime;
	public uint queueSize;
	public List<IdCountConfig> inputVec;
	public List<IdCountConfig> outputVec;
}