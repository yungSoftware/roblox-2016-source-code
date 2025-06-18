using System.Collections.Generic;

namespace Roblox.Common
{
	public static class XMLUtil
	{
		public static string GenerateXMLTable(ICollection<KeyValuePair<object, object>> entries)
		{
			string text = "<Value><Table>";
			foreach (var entry in entries) 
				text += string.Format("<Entry><Key>{0}</Key><Value>{1}</Value></Entry>", entry.Key.ToString(), entry.Value.ToString());
			text += "</Table></Value>";
			return text;
		}
		public static string GenerateXMLBool(bool value)
		{
			return string.Format("<List><Value>{0}</Value></List>", value.ToString());
		}
	}
}
