using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GenshinCBTServer.Commands
{
    public static class BaseCommands
    {
        [Server.Command("account", "Account management")]
        public static void onDispatchCmd(string cmd, string[] args)
        {
            if (args.Length > 0)
            {
                if (args[0].ToLower() == "new")
                {
                    if (args.Length > 1)
                    {
                        Server.dispatch.NewAccount(args[1], args[2]);
                    }
                    else
                    {
                        Server.Print("Usage: account new (name) (password)");
                    }
                }
            }
            else
            {
                Server.Print("Usage: account new (name) (password)");
            }
        }
    }
}