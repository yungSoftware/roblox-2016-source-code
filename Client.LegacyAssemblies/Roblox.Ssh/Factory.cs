using WeOnlyDo.Client;

namespace Roblox.Ssh
{
    public static class Factory
    {
        public static SSH Create(string host, int port, string username, string password)
        {
            return new SSH()
            {
                Hostname = host,
                Port = port,
                Authentication = SSH.Authentications.Password,
                Login = username,
                Password = password
            };
        }
    }
}
