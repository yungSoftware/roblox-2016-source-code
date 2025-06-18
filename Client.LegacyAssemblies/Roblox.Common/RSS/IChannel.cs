using System.Collections.Generic;

namespace Roblox.RSS
{
	public interface IChannel
	{
		string Title { get; }
		string Description { get; }
		IEnumerable<IItem> GetItems();
		IImage Image { get; }
		bool Complete { get; }
	}
}
