using Roblox.Grid.Arbiter.Common.Arbiter;

namespace Roblox.Grid.Arbiter.Common
{
	public class ArbiterServiceUtils
	{
        public static ArbiterClient GetService(string Address) => GetService(Address, 64990);
        public static ArbiterClient GetService(string Address, int port)
		{
			if (Address == null) return null;
			return new ArbiterClient("RccServiceMonitor", "http://" + Address + ":" + port.ToString());
		}
	}
}
