using System.Net;
using System.Net.Security;
using Titanium.Web.Proxy;
using Titanium.Web.Proxy.EventArguments;
using Titanium.Web.Proxy.Models;

namespace SethosImpact.Proxy;
internal class ProxyService
{
    private static readonly string[] s_redirectDomains =
    {
        ".yuanshen.com",
        ".hoyoverse.com",
        ".mihoyo.com"
    };

    private readonly ProxyServer _server;

    public ProxyService()
    {
        _server = new ProxyServer();
        _server.CertificateManager.EnsureRootCertificate();

        _server.BeforeRequest += BeforeRequest;
        _server.ServerCertificateValidationCallback += OnCertValidation;

        ExplicitProxyEndPoint endPoint = new(IPAddress.Any, 8080, true);
        endPoint.BeforeTunnelConnectRequest += BeforeTunnelConnectRequest;

        _server.AddEndPoint(endPoint);
        _server.Start();

        _server.SetAsSystemHttpProxy(endPoint);
        _server.SetAsSystemHttpsProxy(endPoint);
    }

    public void Shutdown()
    {
        _server.Stop();
        _server.Dispose();
    }

    private Task BeforeTunnelConnectRequest(object sender, TunnelConnectSessionEventArgs args)
    {
        string hostname = args.HttpClient.Request.RequestUri.Host;
        args.DecryptSsl = ShouldRedirect(hostname);

        return Task.CompletedTask;
    }

    private Task OnCertValidation(object sender, CertificateValidationEventArgs args)
    {
        if (args.SslPolicyErrors == SslPolicyErrors.None)
            args.IsValid = true;

        return Task.CompletedTask;
    }

    private Task BeforeRequest(object sender, SessionEventArgs args)
    {
        string hostname = args.HttpClient.Request.RequestUri.Host;

        if (ShouldRedirect(hostname))
        {
            string requestUrl = args.HttpClient.Request.Url;
            Uri local = new($"http://127.0.0.1:8099/");// 8888 port

            string replacedUrl = new UriBuilder(requestUrl)
            {
                Scheme = local.Scheme,
                Host = local.Host,
                Port = local.Port
            }.Uri.ToString();

            replacedUrl = replacedUrl.Replace("hk4e_cn", "hk4e_global"); // cn -> global for CN builds
            args.HttpClient.Request.Url = replacedUrl;

            
           // Console.WriteLine(requestUrl);
        }

        return Task.CompletedTask;
    }

    private static bool ShouldRedirect(string hostname)
    {
        foreach (string domain in s_redirectDomains)
        {
            if (hostname.EndsWith(domain))
                return true;
        }

        return false;
    }
}