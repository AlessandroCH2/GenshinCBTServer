// See https://aka.ms/new-console-template for more information
using GenshinCBTServer;
using GenshinCBTServer.Excel;
using Newtonsoft.Json;
using SethosImpact.Proxy;

class Program
{
    static void Main(string[] args)
    {
        StartServer(args);
    }

    private static void StartServer(string[] args)
    {
        Console.Title = "Initializing...";
       
        
        bool disableLogs = args.Length > 0 && args[0].ToLower() == "nologs";
        
        ConfigFile config = new ConfigFile();
        if (File.Exists("server_config.json"))
        {
            config = JsonConvert.DeserializeObject<ConfigFile>(File.ReadAllText("server_config.json"))!;
        }
        else
        {
            File.WriteAllText("server_config.json",JsonConvert.SerializeObject(config, Formatting.Indented));
        }
        ProxyService service = null;
        if (config.InternalProxy) service = new();
        
        new Thread(() =>
        {
            new Server().Start(disableLogs, config);
        }).Start();
        AppDomain.CurrentDomain.ProcessExit += (_, _) =>
        {
            Console.WriteLine("Shutting down...");
            if(service != null)service.Shutdown();
            Server.Shutdown(); //TODO
        };
        while (Server.Initialized == false)
        {

        }
        Console.Title = $"Genshin CBT 1 Server v{Server.ServerVersion}";
    }
}