// See https://aka.ms/new-console-template for more information
using GenshinCBTServer;

class Program
{
    static void Main(string[] args)
    {
        StartServer(args);
    }

    private static void StartServer(string[] args)
    {
        bool disableLogs = args.Length > 0 && args[0].ToLower() == "nologs";
        
        new Server().Start(disableLogs);
    }
}