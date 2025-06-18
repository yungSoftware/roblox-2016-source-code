using System.Collections.Generic;

namespace Roblox.Common
{
	public class EntityCollectionItem
	{
		public string id { get; private set; }
		public string __stamp { get; private set; }

		public EntityCollectionItem(string id, string stamp)
		{
			this.id = id;
			__stamp = stamp;
		}

		public static int ApiVersion = 1;
	}

	public class EntityCollectionJson : Json
	{
		public IEnumerable<EntityCollectionItem> data { get; private set; }

		public EntityCollectionJson(IEnumerable<EntityCollectionItem> data)
		{
			this.data = data;
		}

		public static int ApiVersion = 1;
	}

	public class EntityCountJson : Json
	{
		public string count { get; private set; }

		public EntityCountJson(string count)
		{
			this.count = count;
		}

		public static int ApiVersion = 1;
	}
}
