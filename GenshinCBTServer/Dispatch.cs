using Google.Protobuf.WellKnownTypes;
using HttpServerLite;
using SQLite;
using SQLiteNetExtensions.Extensions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GenshinCBTServer
{
    public class Dispatch
    {
        public class Account()
        {
            [Column("account")]
            public string account { get; set; }
            [Column("password")]
            public string md5password { get; set; }
            [Column("token")]
            public string token { get; set; }
        }
        public Webserver server;
        public static void Print(string text)
        {
            Console.WriteLine($"[{Server.ColoredText("Dispatch", "0307fc")}] " + text);
        }
        public void Start()
        {
            server = new Webserver("127.0.0.1", 8099, false, null, null, DefaultRoute);
            server.Settings.Headers.Host = "https://localhost:8099";
            server.Events.ResponseSent += Events_ResponseSent;
            server.Events.RequestReceived += Events_RequestReceived;
            server.Events.RequestDenied += Events_RequestDenied;
            server.Start();
            Print("Dispatch started on port :8099");
        }

        private void Events_RequestDenied(object? sender, RequestEventArgs e)
        {
            Print("Denied " + e.Url);
        }

        private void Events_RequestReceived(object? sender, RequestEventArgs e)
        {
            Print("Requested " + e.Url);
        }

        private void Events_ResponseSent(object? sender, ResponseEventArgs e)
        {
            Print("Sent " + e.Url + " status: " + e.StatusCode);
        }

        static async Task DefaultRoute(HttpContext ctx)
        {
            byte[] resp;
            string curVer = "138541";
            resp = System.Text.Encoding.UTF8.GetBytes(curVer);
            if (ctx.Request.Url.Full.Contains("cur_version.txt"))
            {
                ctx.Response.StatusCode = 200;
                ctx.Response.ContentLength = resp.Length;
                ctx.Response.SendAsync(resp);
            }
            else
            {
                ctx.Response.StatusCode = 200;
                ctx.Response.ContentLength = 0;
                ctx.Response.SendAsync("");
            }


            // await ctx.Response.SendAsync(resp);
        }
        [StaticRoute(HttpServerLite.HttpMethod.GET, "/query_region_list")]
        public static async Task query_region_list(HttpContext ctx)
        {
            string resp = "{}";
            QueryRegionListHttpRsp queryRegionListHttpRsp = new QueryRegionListHttpRsp()
            {
                Retcode = 0,
                ClientCustomConfig = "{ \"sdkenv\": \"2\", \"visitor\": False, \"devicelist\": None }",
                RegionList = {
                    new RegionSimpleInfo() {
                        DispatchUrl="http://localhost:8099/query_cur_region",
                        Name="cbtServer",
                        Title="Closed Beta 1 Server",
                        Type="DEV_PUBLIC"
                    }
                }
            };
            resp = queryRegionListHttpRsp.ToString();
            ctx.Response.StatusCode = 200;
            ctx.Response.ContentLength = resp.Length;
            ctx.Response.ContentType = "application/json";

            await ctx.Response.SendAsync(resp);
        }
        [StaticRoute(HttpServerLite.HttpMethod.GET, "/query_cur_region")]
        public static async Task query_cur_region(HttpContext ctx)
        {
            string resp = "{}";
            QueryCurrRegionHttpRsp rsp = new QueryCurrRegionHttpRsp()
            {
                Retcode = 0,
                RegionInfo = new()
                {
                    ResourceUrl = "http://localhost:8099/game_res",
                    DataUrl = "http://localhost:8099/design_data",
                    GateserverIp = Server.config.LocalIp,
                    GateserverPort = (uint)Server.config.LocalPort,
                    ResVersion = 138541,
                    DataVersion = 138541,
                    RegionCustomConfig = "{}",
                    ClientCustomConfig = "{}",
                    HandbookUrl = "https://cdn.discordapp.com/attachments/441109559004889098/1043690740397641748/unknown.png",
                    BulletinUrl = "https://cdn.discordapp.com/attachments/441109559004889098/1043690740397641748/unknown.png",
                    FeedbackUrl = "https://cdn.discordapp.com/attachments/441109559004889098/1043690740397641748/unknown.png",
                }
            };
            resp = rsp.ToString();
            ctx.Response.StatusCode = 200;
            ctx.Response.ContentLength = resp.Length;
            ctx.Response.ContentType = "application/json";

            await ctx.Response.SendAsync(resp);
        }

        [StaticRoute(HttpServerLite.HttpMethod.GET, "/game_res/cur_version.txt")]
        public static async Task cur_version(HttpContext ctx)
        {
            byte[] resp;

            string curVer = "138541";
            resp = System.Text.Encoding.UTF8.GetBytes(curVer);
            ctx.Response.StatusCode = 200;
            ctx.Response.ContentLength = resp.Length;
            await ctx.Response.SendAsync(resp);

        }

        [StaticRoute(HttpServerLite.HttpMethod.GET, "/design_data/cur_version.txt")]
        public static async Task design_data_cur_version(HttpContext ctx)
        {
            byte[] resp;

            string curVer = "138541";
            resp = System.Text.Encoding.UTF8.GetBytes(curVer);
            ctx.Response.StatusCode = 200;
            ctx.Response.ContentLength = resp.Length;

            await ctx.Response.SendAsync(resp);
        }
        [StaticRoute(HttpServerLite.HttpMethod.GET, "/sdk/login")]
        public static async Task sdk_login(HttpContext ctx)
        {
            string resp = "{\"retcode\": 2003}";
            try
            {
                List<Account> accounts = Server.GetDatabase().GetAllWithChildren<Account>();
                foreach (Account account in accounts)
                {
                    if (account.account == ctx.Request.Query.Elements[0] && account.md5password == ctx.Request.Query.Elements[1])
                    {
                        resp = "{\"retcode\": 0,\"data\": { \"uid\": \"1\", \"token\": \"" + account.token + "\",\"email\": \"" + account.account + "\"}}";
                    }
                }
            }
            catch (Exception e)
            {
                Print(e.Message);
            }
            ctx.Response.StatusCode = 200;
            ctx.Response.ContentLength = resp.Length;
            ctx.Response.ContentType = "application/json";

            await ctx.Response.SendAsync(resp);
        }
        [StaticRoute(HttpServerLite.HttpMethod.GET, "/sdk/token_login")]
        public static async Task sdk_token_login(HttpContext ctx)
        {
            string resp = "{\"retcode\": 2003}";
            try
            {
                List<Account> accounts = Server.GetDatabase().GetAllWithChildren<Account>();
                foreach (Account account in accounts)
                {
                    if (account.token == ctx.Request.Query.Elements[1])
                    {
                        resp = "{\"retcode\": 0,\"data\": { \"uid\": \"1\", \"token\": \"" + account.token + "\",\"email\": \"" + account.account + "\"}}";
                    }
                }
            }
            catch (Exception e)
            {
                Print(e.Message);
            }
            ctx.Response.StatusCode = 200;
            ctx.Response.ContentLength = resp.Length;
            ctx.Response.ContentType = "application/json";

            await ctx.Response.SendAsync(resp);
        }
        internal void NewAccount(string name, string password)
        {
            try
            {
                Account account = new Account()
                {
                    account = name,
                    md5password = password,
                    token = RandomString(40)
                };

                Server.GetDatabase().Insert(account);
                Print($"New Account created with name: {name}");
            }
            catch (Exception e)
            {
                Print(e.Message);
            }

        }

        private static Random random = new Random();

        public static string RandomString(int length)
        {
            const string chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-";
            return new string(Enumerable.Repeat(chars, length)
                .Select(s => s[random.Next(s.Length)]).ToArray());
        }
    }
}
