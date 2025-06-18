using System;
using System.Xml;
using System.ServiceModel;
using Roblox.Grid.Rcc;

namespace Roblox.Grid.Common
{
	public class GridServiceUtils
	{
		static GridServiceUtils()
		{
			binding.MaxReceivedMessageSize = int.MaxValue;
			binding.SendTimeout = TimeSpan.FromMinutes(5);
			binding.ReceiveTimeout = TimeSpan.FromMinutes(5);
			binding.ReaderQuotas = new XmlDictionaryReaderQuotas();
			binding.ReaderQuotas.MaxStringContentLength = int.MaxValue;
		}

        public static RCCServiceSoap GetService(string Address) => GetService(Address, 64989);
        public static RCCServiceSoap GetService(string Address, int port)
		{
			if (Address == null) return null;
            
			return new RCCServiceSoap
			{
				Url = "http://" + Address + ":" + port.ToString()
			};
		}

		private static readonly BasicHttpBinding binding = new BasicHttpBinding();
	}
}
